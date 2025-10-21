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
    ami_id="resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"  # Latest AL2023 (dynamic)
    count=2  # Number of instances to create
    region="us-east-2" # Region to create cloud resources
    
    # Create the EC2 instances
    aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --count $count \
        --key-name my-key-new-pair \
        --region "$region"
        
    # Check if the EC2 instances were created successfully
    if [ $? -eq 0 ]; then
        echo "EC2 instances created successfully."
    else
        echo "Failed to create EC2 instances."
    fi
}

create_s3_buckets() {
    company="datawise364ng"
    departments=("marketing" "sales" "hr" "operations" "media")
    region="us-west-2"
    
    for department in "${departments[@]}"; do
        bucket_name="${company}-${department}-data-bucket"
        
        aws s3api create-bucket \
            --bucket "$bucket_name" \
            --region "$region" \
            --create-bucket-configuration LocationConstraint="$region"
        
        if [ $? -eq 0 ]; then
            echo "S3 bucket '$bucket_name' created successfully."
        else
            echo "Failed to create S3 bucket '$bucket_name'."
        fi
    done
}



check_num_of_args "$@"
activate_infra_environment
check_aws_cli || exit 1
check_aws_profile || exit 1
create_ec2_instances
create_s3_buckets