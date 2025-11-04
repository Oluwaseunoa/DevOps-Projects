#!/bin/bash
# WordPress on AWS – Steps 1-5 (VPC, Subnets, SGs, RDS, EFS)
# Aligned with Capstone Project Architecture
# Usage: ./setup_wordpress_infra.sh testing <region>
# Example: ./setup_wordpress_infra.sh testing us-east-1

set -e  # Exit on any error

ENVIRONMENT=$1
REGION=$2

# Generate a random password for better security
generate_db_password() {
    # RDS-compliant password: alphanumeric only, 16 characters
    local password=$(openssl rand -base64 32 2>/dev/null | tr -dc 'a-zA-Z0-9' | head -c 16)
    if [ -z "$password" ]; then
        # Fallback method
        password=$(date +%s | sha256sum | base64 | tr -dc 'a-zA-Z0-9' | head -c 16)
    fi
    echo "$password"
}

DB_PASSWORD=$(generate_db_password)
echo "Generated RDS password: $DB_PASSWORD"

check_num_of_args() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <environment> <region>"
        exit 1
    fi
}

activate_infra_environment() {
    if [ "$ENVIRONMENT" != "testing" ]; then
        echo "Only 'testing' environment is supported."
        exit 2
    fi
    echo "Running script for Testing Environment..."
}

check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed."
        exit 1
    fi
}

check_aws_profile() {
    if [ -z "$AWS_PROFILE" ] && [ -z "$AWS_ACCESS_KEY_ID" ]; then
        echo "AWS credentials not configured. Set AWS_PROFILE or AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY."
        exit 1
    fi
}

validate_region() {
    echo "Validating region: $REGION"
    
    # Simple check - try to describe availability zones in the region
    if aws ec2 describe-availability-zones --region "$REGION" --output text >/dev/null 2>&1; then
        echo "✓ Region $REGION is valid and accessible"
        return 0
    else
        echo "Error: Region $REGION is not valid or not accessible with current credentials"
        echo "Available regions you can use:"
        echo "  us-east-1 (N. Virginia), us-east-2 (Ohio), us-west-1 (N. California), us-west-2 (Oregon)"
        echo "  eu-west-1 (Ireland), eu-central-1 (Frankfurt)"
        echo "  ap-south-1 (Mumbai), ap-southeast-1 (Singapore)"
        exit 1
    fi
}

cleanup_on_error() {
    echo "Error occurred. Cleaning up resources..."
    exit 1
}

trap cleanup_on_error ERR

create_vpc_resources() {
    echo "Starting VPC creation in region: $REGION"
    VPC_NAME="WordPressVPC"
    VPC_CIDR="10.0.0.0/16"  # As per project specification

    # ---------- Step 1: VPC ----------
    echo "Creating VPC: $VPC_NAME ($VPC_CIDR)"
    VPC_ID=$(aws ec2 create-vpc \
        --cidr-block "$VPC_CIDR" \
        --region "$REGION" \
        --tag-specifications "ResourceType=vpc,Tags=[{Key=Name,Value=${VPC_NAME}},{Key=Environment,Value=$ENVIRONMENT}]" \
        --query 'Vpc.VpcId' --output text)
    [ -z "$VPC_ID" ] && { echo "Failed to create VPC"; exit 1; }
    echo "VPC created: $VPC_ID"

    aws ec2 modify-vpc-attribute --vpc-id "$VPC_ID" --enable-dns-support "{\"Value\":true}" --region "$REGION"
    aws ec2 modify-vpc-attribute --vpc-id "$VPC_ID" --enable-dns-hostnames "{\"Value\":true}" --region "$REGION"

    # ---------- Internet Gateway ----------
    echo "Creating Internet Gateway..."
    IGW_ID=$(aws ec2 create-internet-gateway \
        --region "$REGION" \
        --tag-specifications "ResourceType=internet-gateway,Tags=[{Key=Name,Value=${VPC_NAME}-IGW},{Key=Environment,Value=$ENVIRONMENT}]" \
        --query 'InternetGateway.InternetGatewayId' --output text)
    [ -z "$IGW_ID" ] && { echo "Failed to create Internet Gateway"; exit 1; }
    
    aws ec2 attach-internet-gateway --vpc-id "$VPC_ID" --internet-gateway-id "$IGW_ID" --region "$REGION"
    echo "IGW attached: $IGW_ID"

        # ---------- Availability Zones ----------
    echo "Fetching Availability Zones for region: $REGION"
    
    # Get available zones and clean the output
    AZS_RAW=$(aws ec2 describe-availability-zones --region "$REGION" \
        --query "AvailabilityZones[?State=='available'].ZoneName" --output text)
    
    # Convert to array and take first 2
    AZS=()
    for az in $AZS_RAW; do
        AZS+=("$az")
        if [ ${#AZS[@]} -eq 2 ]; then
            break
        fi
    done
    
    if [ ${#AZS[@]} -lt 2 ]; then
        echo "Error: Not enough availability zones in region $REGION"
        echo "Available zones: $AZS_RAW"
        exit 1
    fi
    
    AZ1=${AZS[0]}; AZ2=${AZS[1]}
    echo "✓ Using Availability Zones: $AZ1 and $AZ2"

    # ---------- Subnets (Following Project Architecture) ----------
    # Public Subnets: 10.0.1.0/24, 10.0.2.0/24
    # Private App Subnets: 10.0.3.0/24, 10.0.4.0/24  
    # Private Data Subnets: 10.0.5.0/24, 10.0.6.0/24
    PUB_SUBNETS=("10.0.1.0/24" "10.0.2.0/24")
    PRIV_APP_SUBNETS=("10.0.3.0/24" "10.0.4.0/24")
    PRIV_DATA_SUBNETS=("10.0.5.0/24" "10.0.6.0/24")
    
    PUB_SUBNET_IDS=()
    PRIV_APP_SUBNET_IDS=()
    PRIV_DATA_SUBNET_IDS=()

    echo "Creating Subnets according to project architecture..."

    # Public Subnets (for NAT Gateway, Bastion Host, ALB)
    for i in 0 1; do
        echo "Creating Public Subnet $((i+1)) in ${AZS[$i]}..."
        PUB_ID=$(aws ec2 create-subnet \
            --vpc-id "$VPC_ID" --cidr-block "${PUB_SUBNETS[$i]}" \
            --availability-zone "${AZS[$i]}" --region "$REGION" \
            --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=${VPC_NAME}-Public-$((i+1))},{Key=Environment,Value=$ENVIRONMENT}]" \
            --query 'Subnet.SubnetId' --output text)
        [ -z "$PUB_ID" ] && { echo "Failed to create public subnet"; exit 1; }
        aws ec2 modify-subnet-attribute --subnet-id "$PUB_ID" --map-public-ip-on-launch --region "$REGION"
        PUB_SUBNET_IDS+=("$PUB_ID")
        echo "  Public Subnet $((i+1)): $PUB_ID (${AZS[$i]}) - ${PUB_SUBNETS[$i]}"
    done

    # Private App Subnets (for Web Servers)
    for i in 0 1; do
        echo "Creating Private App Subnet $((i+1)) in ${AZS[$i]}..."
        PRIV_APP_ID=$(aws ec2 create-subnet \
            --vpc-id "$VPC_ID" --cidr-block "${PRIV_APP_SUBNETS[$i]}" \
            --availability-zone "${AZS[$i]}" --region "$REGION" \
            --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=${VPC_NAME}-Private-App-$((i+1))},{Key=Environment,Value=$ENVIRONMENT}]" \
            --query 'Subnet.SubnetId' --output text)
        [ -z "$PRIV_APP_ID" ] && { echo "Failed to create private app subnet"; exit 1; }
        PRIV_APP_SUBNET_IDS+=("$PRIV_APP_ID")
        echo "  Private App Subnet $((i+1)): $PRIV_APP_ID (${AZS[$i]}) - ${PRIV_APP_SUBNETS[$i]}"
    done

    # Private Data Subnets (for RDS Database)
    for i in 0 1; do
        echo "Creating Private Data Subnet $((i+1)) in ${AZS[$i]}..."
        PRIV_DATA_ID=$(aws ec2 create-subnet \
            --vpc-id "$VPC_ID" --cidr-block "${PRIV_DATA_SUBNETS[$i]}" \
            --availability-zone "${AZS[$i]}" --region "$REGION" \
            --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=${VPC_NAME}-Private-Data-$((i+1))},{Key=Environment,Value=$ENVIRONMENT}]" \
            --query 'Subnet.SubnetId' --output text)
        [ -z "$PRIV_DATA_ID" ] && { echo "Failed to create private data subnet"; exit 1; }
        PRIV_DATA_SUBNET_IDS+=("$PRIV_DATA_ID")
        echo "  Private Data Subnet $((i+1)): $PRIV_DATA_ID (${AZS[$i]}) - ${PRIV_DATA_SUBNETS[$i]}"
    done

    # ---------- Public Route Table ----------
    echo "Creating Public Route Table..."
    PUB_RT_ID=$(aws ec2 create-route-table --vpc-id "$VPC_ID" \
        --region "$REGION" \
        --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=${VPC_NAME}-Public-RT},{Key=Environment,Value=$ENVIRONMENT}]" \
        --query 'RouteTable.RouteTableId' --output text)
    [ -z "$PUB_RT_ID" ] && { echo "Failed to create public route table"; exit 1; }
    
    aws ec2 create-route --route-table-id "$PUB_RT_ID" --destination-cidr-block "0.0.0.0/0" --gateway-id "$IGW_ID" --region "$REGION"
    for s in "${PUB_SUBNET_IDS[@]}"; do
        aws ec2 associate-route-table --subnet-id "$s" --route-table-id "$PUB_RT_ID" --region "$REGION"
    done

    # ---------- NAT Gateways (one per AZ in Public Subnets) ----------
    echo "Creating NAT Gateways in Public Subnets..."
    NAT_IDS=()
    EIP_ALLOC_IDS=()
    for i in 0 1; do
        echo "Creating NAT Gateway $((i+1)) in Public Subnet ${PUB_SUBNET_IDS[$i]}..."
        EIP_ALLOC=$(aws ec2 allocate-address --domain vpc --region "$REGION" --query 'AllocationId' --output text)
        [ -z "$EIP_ALLOC" ] && { echo "Failed to allocate EIP"; exit 1; }
        EIP_ALLOC_IDS+=("$EIP_ALLOC")
        
        NAT_ID=$(aws ec2 create-nat-gateway \
            --subnet-id "${PUB_SUBNET_IDS[$i]}" --allocation-id "$EIP_ALLOC" \
            --region "$REGION" \
            --tag-specifications "ResourceType=natgateway,Tags=[{Key=Name,Value=${VPC_NAME}-NAT-$((i+1))},{Key=Environment,Value=$ENVIRONMENT}]" \
            --query 'NatGateway.NatGatewayId' --output text)
        [ -z "$NAT_ID" ] && { echo "Failed to create NAT gateway"; exit 1; }
        NAT_IDS+=("$NAT_ID")
        echo "  NAT Gateway $((i+1)) created: $NAT_ID"
    done
    
    echo "Waiting for NAT gateways to become available..."
    for nat_id in "${NAT_IDS[@]}"; do
        echo "  Waiting for NAT Gateway: $nat_id"
        aws ec2 wait nat-gateway-available --nat-gateway-ids "$nat_id" --region "$REGION"
    done
    echo "All NAT gateways are available"

    # ---------- Private Route Tables (one per AZ) ----------
    PRIV_RT_IDS=()
    for i in 0 1; do
        echo "Creating Private Route Table $((i+1)) for AZ ${AZS[$i]}..."
        RT_ID=$(aws ec2 create-route-table --vpc-id "$VPC_ID" \
            --region "$REGION" \
            --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=${VPC_NAME}-Private-RT-$((i+1))},{Key=Environment,Value=$ENVIRONMENT}]" \
            --query 'RouteTable.RouteTableId' --output text)
        [ -z "$RT_ID" ] && { echo "Failed to create private route table"; exit 1; }
        
        aws ec2 create-route --route-table-id "$RT_ID" --destination-cidr-block "0.0.0.0/0" --nat-gateway-id "${NAT_IDS[$i]}" --region "$REGION"
        
        # Associate both App and Data subnets in the same AZ to this route table
        aws ec2 associate-route-table --subnet-id "${PRIV_APP_SUBNET_IDS[$i]}" --route-table-id "$RT_ID" --region "$REGION"
        aws ec2 associate-route-table --subnet-id "${PRIV_DATA_SUBNET_IDS[$i]}" --route-table-id "$RT_ID" --region "$REGION"
        
        PRIV_RT_IDS+=("$RT_ID")
    done

    # ---------- S3 Gateway Endpoint ----------
    echo "Creating S3 Gateway VPC Endpoint..."
    aws ec2 create-vpc-endpoint \
        --vpc-id "$VPC_ID" \
        --vpc-endpoint-type Gateway \
        --service-name "com.amazonaws.${REGION}.s3" \
        --route-table-ids "${PRIV_RT_IDS[@]}" \
        --region "$REGION" \
        --tag-specifications "ResourceType=vpc-endpoint,Tags=[{Key=Name,Value=${VPC_NAME}-S3Endpoint},{Key=Environment,Value=$ENVIRONMENT}]" \
        --output text

    # ---------- Step 3: Security Groups (Following Project Architecture) ----------
    echo "Creating Security Groups as per project architecture..."
    ALB_SG=$(aws ec2 create-security-group --group-name "${VPC_NAME}-ALB-SG" --description "ALB Security Group - HTTP/HTTPS from internet" --vpc-id "$VPC_ID" --region "$REGION" --query 'GroupId' --output text)
    SSH_SG=$(aws ec2 create-security-group --group-name "${VPC_NAME}-SSH-SG" --description "SSH Security Group - SSH from your IP" --vpc-id "$VPC_ID" --region "$REGION" --query 'GroupId' --output text)
    WEB_SG=$(aws ec2 create-security-group --group-name "${VPC_NAME}-Web-SG" --description "Webserver Security Group - HTTP/HTTPS from ALB, SSH from SSH-SG" --vpc-id "$VPC_ID" --region "$REGION" --query 'GroupId' --output text)
    DB_SG=$(aws ec2 create-security-group --group-name "${VPC_NAME}-DB-SG" --description "Database Security Group - MySQL from Web-SG" --vpc-id "$VPC_ID" --region "$REGION" --query 'GroupId' --output text)
    EFS_SG=$(aws ec2 create-security-group --group-name "${VPC_NAME}-EFS-SG" --description "EFS Security Group - NFS from Web-SG" --vpc-id "$VPC_ID" --region "$REGION" --query 'GroupId' --output text)

    # Tag the security groups
    for sg in "$ALB_SG" "$SSH_SG" "$WEB_SG" "$DB_SG" "$EFS_SG"; do
        aws ec2 create-tags --resources "$sg" --tags Key=Environment,Value=$ENVIRONMENT --region "$REGION"
    done

    # Get public IP with fallback
    MY_IP=$(curl -s --max-time 3 https://checkip.amazonaws.com 2>/dev/null || echo "0.0.0.0")/32
    echo "Your IP for SSH access: $MY_IP"

    # Configure security group rules exactly as per project architecture
    echo "Configuring security group rules..."

    # ALB Security Group: Port 80 and 443 from anywhere
    aws ec2 authorize-security-group-ingress --group-id "$ALB_SG" --protocol tcp --port 80  --cidr 0.0.0.0/0 --region "$REGION"
    aws ec2 authorize-security-group-ingress --group-id "$ALB_SG" --protocol tcp --port 443 --cidr 0.0.0.0/0 --region "$REGION"

    # SSH Security Group: Port 22 from your IP only
    aws ec2 authorize-security-group-ingress --group-id "$SSH_SG" --protocol tcp --port 22  --cidr "$MY_IP" --region "$REGION"

    # Web Security Group: 
    # - Port 80 and 443 from ALB Security Group
    # - Port 22 from SSH Security Group
    aws ec2 authorize-security-group-ingress --group-id "$WEB_SG" --protocol tcp --port 80  --source-group "$ALB_SG" --region "$REGION"
    aws ec2 authorize-security-group-ingress --group-id "$WEB_SG" --protocol tcp --port 443 --source-group "$ALB_SG" --region "$REGION"
    aws ec2 authorize-security-group-ingress --group-id "$WEB_SG" --protocol tcp --port 22  --source-group "$SSH_SG" --region "$REGION"

    # Database Security Group: Port 3306 from Web Security Group only
    aws ec2 authorize-security-group-ingress --group-id "$DB_SG"  --protocol tcp --port 3306 --source-group "$WEB_SG" --region "$REGION"

    # EFS Security Group: Port 2049 from Web Security Group only
    aws ec2 authorize-security-group-ingress --group-id "$EFS_SG" --protocol tcp --port 2049 --source-group "$WEB_SG" --region "$REGION"

    echo "Security group rules configured according to project architecture."

    # ---------- Step 4: RDS MySQL (in Private Data Subnets) ----------
    echo "Creating RDS Subnet Group using Private Data Subnets..."
    aws rds create-db-subnet-group \
        --db-subnet-group-name wordpress-db-subnet-group \
        --db-subnet-group-description "Private Data subnets for WordPress RDS" \
        --subnet-ids "${PRIV_DATA_SUBNET_IDS[@]}" \
        --region "$REGION" \
        --tags Key=Name,Value=wordpress-db-subnet-group Key=Environment,Value=$ENVIRONMENT \
        --output text

    echo "Launching RDS MySQL (db.t3.micro) in Private Data Subnets..."
    aws rds create-db-instance \
        --db-instance-identifier wordpress-db \
        --db-instance-class db.t3.micro \
        --engine mysql \
        --engine-version "8.0.43" \
        --allocated-storage 20 \
        --db-name wordpress \
        --master-username admin \
        --master-user-password "$DB_PASSWORD" \
        --vpc-security-group-ids "$DB_SG" \
        --db-subnet-group-name wordpress-db-subnet-group \
        --no-publicly-accessible \
        --backup-retention-period 0 \
        --region "$REGION" \
        --tags Key=Name,Value=wordpress-db Key=Environment,Value=$ENVIRONMENT \
        --output text

    echo "Waiting for RDS to become available (this may take 15-20 minutes)..."
    aws rds wait db-instance-available --db-instance-identifier wordpress-db --region "$REGION"
    RDS_ENDPOINT=$(aws rds describe-db-instances --db-instance-identifier wordpress-db \
        --query 'DBInstances[0].Endpoint.Address' --output text --region "$REGION")
    echo "RDS endpoint: $RDS_ENDPOINT"

    # ---------- Step 5: EFS (Mount Targets in Private App Subnets) ----------
    echo "Creating EFS File System..."
    EFS_ID=$(aws efs create-file-system \
        --performance-mode generalPurpose \
        --encrypted \
        --tags "Key=Name,Value=wordpress-efs" "Key=Environment,Value=$ENVIRONMENT" \
        --region "$REGION" \
        --query 'FileSystemId' --output text)
        [ -z "$EFS_ID" ] && { echo "Failed to create EFS"; exit 1; }

    echo "Waiting for EFS to be available..."
    while true; do
        EFS_STATE=$(aws efs describe-file-systems --file-system-id "$EFS_ID" --region "$REGION" --query "FileSystems[0].LifeCycleState" --output text)
        if [ "$EFS_STATE" = "available" ]; then
            break
        fi
        echo "  Waiting for EFS to be available... Current state: $EFS_STATE"
        sleep 10
    done

    echo "Creating EFS mount targets in Private App subnets..."
    for i in 0 1; do
        echo "  Creating mount target in ${PRIV_APP_SUBNET_IDS[$i]} (${AZS[$i]})"
        aws efs create-mount-target \
            --file-system-id "$EFS_ID" \
            --subnet-id "${PRIV_APP_SUBNET_IDS[$i]}" \
            --security-groups "$EFS_SG" \
            --region "$REGION" \
            --output text
    done

    echo "Waiting for EFS mount targets to be available..."
    sleep 30
    EFS_DNS="${EFS_ID}.efs.${REGION}.amazonaws.com"
    echo "EFS DNS: $EFS_DNS"

    # ---------- Save outputs to file for future reference ----------
    cat > "wordpress_infra_output_${ENVIRONMENT}.txt" <<EOF
WordPress Infrastructure Details - Environment: $ENVIRONMENT
Generated: $(date)
Region: $REGION

=== VPC & Network ===
VPC_ID: $VPC_ID
VPC_CIDR: $VPC_CIDR
Availability Zones: $AZ1, $AZ2

=== Subnets ===
Public Subnets: ${PUB_SUBNET_IDS[@]}
Public Subnet CIDRs: ${PUB_SUBNETS[@]}

Private App Subnets: ${PRIV_APP_SUBNET_IDS[@]}
Private App CIDRs: ${PRIV_APP_SUBNETS[@]}

Private Data Subnets: ${PRIV_DATA_SUBNET_IDS[@]}
Private Data CIDRs: ${PRIV_DATA_SUBNETS[@]}

=== Security Groups ===
ALB_SG: $ALB_SG
SSH_SG: $SSH_SG  
WEB_SG: $WEB_SG
DB_SG: $DB_SG
EFS_SG: $EFS_SG

=== Database Details ===
RDS Endpoint: $RDS_ENDPOINT
DB Name: wordpress
DB User: admin
DB Password: $DB_PASSWORD

=== EFS Details ===
EFS DNS: $EFS_DNS
EFS ID: $EFS_ID

=== NAT Gateways ===
NAT Gateway 1: ${NAT_IDS[0]}
NAT Gateway 2: ${NAT_IDS[1]}

=== Next Steps ===
1. Create Launch Template for EC2 instances
2. Create Application Load Balancer
3. Create Auto Scaling Group
4. Configure Route 53 domain
EOF

    # ---------- Summary ----------
    echo "================================================"
    echo "VPC Setup (Steps 1-5) Complete!"
    echo "================================================"
    cat <<EOF

✓ VPC with CIDR: $VPC_CIDR
✓ 2 Availability Zones: $AZ1, $AZ2
✓ Public Subnets (for NAT, ALB): 2 subnets
✓ Private App Subnets (for Web Servers): 2 subnets  
✓ Private Data Subnets (for RDS): 2 subnets
✓ NAT Gateways: 2 (one per AZ)
✓ Security Groups: ALB, SSH, Web, DB, EFS
✓ RDS MySQL: Launched in Private Data Subnets
✓ EFS: Created with mount targets in Private App Subnets

=== Critical Information ===
RDS Endpoint: $RDS_ENDPOINT
EFS DNS: $EFS_DNS

⚠️  SECURITY NOTES:
1. Database password saved to: wordpress_infra_output_${ENVIRONMENT}.txt
2. RDS is in private subnets and not publicly accessible
3. Change default password before production use
4. Consider using AWS Secrets Manager for credentials

Next: Create Launch Template, ALB, ASG, and Route 53.
EOF
}

# ------------------- Main Execution -------------------
check_num_of_args "$@"
activate_infra_environment
check_aws_cli
check_aws_profile
validate_region
create_vpc_resources