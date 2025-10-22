#!/bin/bash

# Environment variables
ENVIRONMENT=$1

check_num_of_args() {
    # Checking the number of arguments
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

 activate_infra_environment() { 
# Acting based on the argument value 
if [ "$ENVIRONMENT" == "local" ]; then 
echo "Running script for Local Environment..." 
elif [ "$ENVIRONMENT" == "testing" ]; then 
echo "Running script for Testing Environment..." 
elif [ "$ENVIRONMENT" == "production" ]; then 
echo "Running script for Production Environment..." 
else 
echo "Invalid environment specified. Please use 'local', 'testing', or 
'production'." 
exit 2 
fi 
}

# Function to check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before proceeding."
        return 1
    fi
}

# Function to check if AWS profile is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS profile environment variable is not set."
        return 1
    fi
}

# Function to create EC2 Instances 
    create_ec2_instances() {

    # Specify the parameters for the EC2 instances
    instance_type="t2.micro"
    ami_id="resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
    count=2
    region="us-east-2"
    subnet_id="subnet-06c7cfe7c9fb96a9b"       # Replace with your public subnet ID
    security_group_id="sg-0012c41f2dcc7ac95"  # Replace with your SG ID
    key_name="my-key-new-pair"

    echo "Launching EC2 instances in subnet: $subnet_id ..."

    # Launch EC2 instances with a proper network interface configuration
    aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --count $count \
        --key-name "$key_name" \
        --region "$region" \
        --network-interfaces "DeviceIndex=0,SubnetId=$subnet_id,AssociatePublicIpAddress=true,Groups=$security_group_id" \
        --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Custom-VPC-Instance}]'

    if [ $? -eq 0 ]; then
        echo "✅ EC2 instances created successfully in subnet $subnet_id."
    else
        echo "❌ Failed to create EC2 instances."
    fi
}


check_num_of_args "$@"
activate_infra_environment
check_aws_cli || exit 1
check_aws_profile || exit 1
create_ec2_instances
