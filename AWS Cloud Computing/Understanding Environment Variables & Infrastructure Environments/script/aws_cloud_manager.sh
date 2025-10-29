#!/bin/bash

# Environment variables
ENVIRONMENT=$1
NUMBER_OF_INSTANCES=$2

check_num_of_args() {
    # Checking the number of arguments
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <environment> <number_of_instances>"
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
        echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
        exit 2 
    fi 
}


# Function to check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before proceeding."
        exit 1
    fi
}

# Function to check if AWS profile is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ] && [ "$ENVIRONMENT" != "local" ]; then
        echo "AWS profile environment variable is not set for $ENVIRONMENT environment."
        exit 1
    fi
}

# Function to create local log files or EC2 instances
create_local_testing_or_prod_resources() {
    # Validate number_of_instances is a positive integer
    if ! [[ "$NUMBER_OF_INSTANCES" =~ ^[1-9][0-9]*$ ]]; then
        echo "Invalid number_of_instances: Must be a positive integer."
        exit 2
    fi

    if [ "$ENVIRONMENT" == "local" ]; then
        echo "Creating $NUMBER_OF_INSTANCES sample log files locally..."
        for ((i=1; i<=NUMBER_OF_INSTANCES; i++)); do
            echo "Log entry $i for local simulation" > "log_file_$i.txt"
            if [ $? -eq 0 ]; then
                echo "✅ Created log_file_$i.txt successfully."
            else
                echo "❌ Failed to create log_file_$i.txt."
            fi
        done
    else

        # Common parameters
        instance_type="t2.micro"    # for testing environment
        instance_type2="t3.micro"   #for production environment
        ami_id="resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
        region="us-east-2"
        # No explicit subnet assignment (let AWS choose default)
        subnet_id=None   # or simply omit this parameter when creating the instance
        # Create a new Security Group instead of using an existing one
        create_security_group=True  # flag to indicate a new SG should be created
        security_group_name="auto-created-sg"
        security_group_description="Security group automatically created for this instance"
        key_name="my-key-new-pair" # for testing environment
        key_name2="MyKeyPair1"      #for production environment

        echo "Launching $NUMBER_OF_INSTANCES EC2 instances in $ENVIRONMENT subnet: $subnet_id..."

        # Launch EC2 instances with profile based on environment
        if [ "$ENVIRONMENT" == "testing" ]; then
            aws ec2 run-instances --profile testing \
                --image-id "$ami_id" \
                --instance-type "$instance_type" \
                --count "$NUMBER_OF_INSTANCES" \
                --key-name "$key_name" \
                --region "$region" \
                --associate-public-ip-address \
                --tag-specifications "ResourceType=instance,Tags=[{Key=Environment,Value=$ENVIRONMENT}]"
        elif [ "$ENVIRONMENT" == "production" ]; then
            aws ec2 run-instances --profile production \
                --image-id "$ami_id" \
                --instance-type "$instance_type2" \
                --count "$NUMBER_OF_INSTANCES" \
                --key-name "$key_name2" \
                --region "$region" \
                --associate-public-ip-address \
                --tag-specifications "ResourceType=instance,Tags=[{Key=Environment,Value=$ENVIRONMENT}]"
        fi

        if [ $? -eq 0 ]; then
            echo "✅ $NUMBER_OF_INSTANCES EC2 instances created successfully in $ENVIRONMENT subnet $subnet_id."
        else
            echo "❌ Failed to create EC2 instances in $ENVIRONMENT."
            exit
        fi
    fi
}


# Execute functions
check_num_of_args "$@"
activate_infra_environment
check_aws_cli
check_aws_profile
create_local_testing_or_prod_resources