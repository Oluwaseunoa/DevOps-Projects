#!/bin/bash
# Instructs the system to run the script using the Bash shell interpreter

# ===== Environment Setup =====
ENVIRONMENT=$1
# Retrieves the first argument passed to the script (e.g., local, testing, production)
AWS_PROFILE="testing"
# Initializes the "testing" profile as the aws profile to be used

# ===== Function Definitions =====

# 1. Check if script argument is provided
check_num_of_args() {
    if [ "$#" -eq 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

# 2. Activate environment-specific logic
activate_infra_environment() {
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

# 3. Check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before proceeding."
        return 1
    fi
}

# 4. Check if AWS_PROFILE environment variable is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS profile environment variable is not set."
        return 1
    fi
}

# ===== Function Calls =====

check_num_of_args
# Validates that the script is called with an argument

activate_infra_environment
# Executes logic based on the environment

check_aws_cli
# Confirms AWS CLI is available on the system

check_aws_profile
# Ensures AWS_PROFILE is set for authentication