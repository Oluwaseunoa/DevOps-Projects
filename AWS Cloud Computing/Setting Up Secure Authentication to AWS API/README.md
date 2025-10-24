# AWS Secure Authentication Setup for API Automation

**Author:** Oluwaseun Osunsola  
**Environment:** AWS  
**Project Link:** https://github.com/Oluwaseunoa/DevOps-Projects/tree/main 

## Introduction

In the rapidly evolving world of cloud computing, securing access to AWS services is crucial for developers, DevOps engineers, and organizations aiming to automate infrastructure tasks efficiently. This comprehensive guide walks you through setting up secure programmatic authentication to AWS APIs using IAM roles, custom policies, dedicated users, and the AWS CLI. By implementing these practices, you'll enable automated operations like creating EC2 instances and managing S3 buckets via shell scripts, all while minimizing security risks such as credential leaks or unauthorized access.

This tutorial is designed for beginners and intermediate users looking to integrate AWS automation into their workflows, such as CI/CD pipelines or custom scripts. Emphasizing best practices like the principle of least privilege and multi-factor authentication (MFA), it ensures your setup is robust, scalable, and compliant with industry standards.

## Objectives

The main goals of this project are to:
- Establish secure authentication mechanisms for programmatic access to AWS APIs.
- Create and configure IAM components specifically for EC2 and S3 automation.
- Install and set up the AWS CLI on Ubuntu for command-line interactions.
- Develop and troubleshoot a shell script for resource automation, including permission fixes.
- Promote cost efficiency through resource cleanup and best practices.

## Definition of Terms

To ensure clarity, here are key terms used throughout this guide:
- **AWS (Amazon Web Services)**: A comprehensive cloud computing platform providing services like computing power, storage, and databases.
- **IAM (Identity and Access Management)**: An AWS service that helps manage secure access to AWS resources by defining users, roles, and permissions.
- **EC2 (Elastic Compute Cloud)**: An AWS service offering scalable virtual servers (instances) in the cloud.
- **S3 (Simple Storage Service)**: An AWS object storage service for storing and retrieving data at any scale.
- **AWS CLI (Command Line Interface)**: A unified tool to manage AWS services from the terminal using commands.
- **MFA (Multi-Factor Authentication)**: A security process requiring two or more verification methods to access an account.
- **Access Keys**: Credentials consisting of an Access Key ID and Secret Access Key used for programmatic access to AWS.
- **SSM (Systems Manager)**: An AWS service for managing and automating operational tasks across resources.
- **Shell Script**: A text file containing a sequence of commands for a Unix-based shell, used here for automation.

## Prerequisites

Before starting, ensure you have:
- An AWS account with MFA enabled.
- Ubuntu Linux 22.04 (or a compatible distribution).
- Basic knowledge of terminal commands.
- A code editor like VS Code or nano.
- Access to a web browser for AWS documentation and console.


🚀 Step-by-Step Implementation

## Phase 1: AWS Console Authentication

### Step 1: Sign In to AWS Account with MFA

- Enter AWS account login credentials
- Complete Multi-Factor Authentication (MFA) verification

Purpose: Secure console access with 2FA

![Step 1](./img/1.sign_in_into_your_aws_account_providing_login_details_and_relevant_mfa.png)

### Step 2: Successful Console Login

- AWS Management Console dashboard loaded

Status: Ready for IAM configuration

![Step 2](./img/2.logged_in_successfully_now_on_the_console.png)

## Phase 2: IAM Policy Creation

### Step 3: Navigate to IAM Service

- Use search bar: type "IAM"
- Select IAM from services results

Purpose: Access Identity and Access Management console

![Step 3](./img/3.use_the_service_search_and_search_for_iam_then_click_on_iam_from_the_result.png)

### Step 4: Access Policies Section

- Click Policies in left sidebar

Purpose: Manage custom permission policies

![Step 4](./img/4.now_on_iam_page_click_on_policies_option_on_the_left_side.png)

### Step 5: Initiate Policy Creation

- Click Create policy button

Purpose: Define custom EC2+S3 permissions

![Step 5](./img/5.click_on_create_policy.png)

### Step 6: JSON Policy Editor

- Select JSON tab

Purpose: Manual policy definition for precision

![Step 6](./img/6.for_specify_permissions_options_choose_json.png)

### Step 7: Define EC2+S3 Full Access Policy

```json
{
        "Version": "2012-10-17",
        "Statement": [
                {
                        "Effect": "Allow",
                        "Action": [
                                "ec2:*",
                                "s3:*"
                        ],
                        "Resource": "*"
                }
        ]
}
```

- Replace default JSON with EC2+S3 permissions
- Click Next

![Step 7](./img/7.replace_the_default_object_with_the_one_specifying_all_permissions_ec2_and_s3_and_click_next.png)

### Step 8: Name and Create Policy

- Name: EC2S3FullAccessPolicy
- Click Create policy

Result: Custom policy available for attachment

![Step 8](./img/8.name_policy_EC2S3FullAccessPolicy_and_click_create_policy.png)

### Step 9: Verify Policy Creation

- Policy appears in Policies list
- Navigate to Roles section

![Step 9](./img/9.policy_successfully_created_clcik_on_roles.png)

## Phase 3: IAM Role Creation

### Step 10: Start Role Creation

- Click Create role

Purpose: Create service-trusted role for EC2

![Step 10](./img/10.on_roles_page_click_on_create_role.png)

### Step 11: Configure Trusted Entity

- Trusted entity: AWS service
- Use case: Search and select EC2
- Click Next

Purpose: Allow EC2 instances to assume this role

![Step 11](./img/11.for_trusted_entity_select_aws_service_for_use_case_search_and_select_ec2_and_clcik_next.png)

### Step 12: Attach Policy to Role

- Search: EC2S3FullAccessPolicy
- Select policy checkbox
- Click Next

![Step 12](./img/12.on_permission_policy_search_the_name_of_the_created_policy_and_select_it_then_click_next.png)

### Step 13: Name the Role

- Role name: AutomationRole
- Scroll to review settings

![Step 13](./img/13.name_role_automation_role_and_scroll_down.png)

### Step 14: Create Role

- Review summary
- Click Create role

Result: AutomationRole ready

![Step 14](./img/14.confirm_the_created_policy_on_permission_policy_summary_and_click_create_role.png)

### Step 15: Role Dashboard Verification

- AutomationRole visible in roles list
- Navigate to Users

![Step 15](./img/15.AutomationRole_now_visible_on_the_roles_dashboard_click_on_users.png)

## Phase 4: IAM User Creation

### Step 16: Create Automation User

- Click Create user

![Step 16](./img/16.on_users_page_click_on_create_user.png)

### Step 17: Name the User

- User name: automation_user
- Click Next

![Step 17](./img/17.name_user_automation_user_and_click_next.png)

### Step 18: Attach Policy to User

- Select Attach policies directly
- Search: EC2S3FullAccessPolicy
- Select and click Next

![Step 18](./img/18.select_attach_policies_directly_search_for_EC2S3FullAccessPolicy_select_it_and_click_next.png)

### Step 19: Review and Create User

- Review user configuration
- Click Create user

![Step 19](./img/19.on_review_page_click_create_user_button.png)

### Step 20: User Creation Success

- automation_user appears in Users list
- Click user for credential setup

![Step 20](./img/20.automation_user_created_successfully_click_on_automation_user_from_Users_list.png)

## Phase 5: Generate Access Keys

### Step 21: Access Security Credentials

- Click Security credentials tab
- Find Access keys section
- Click Create access key

![Step 21](./img/21.click_security_credentials_tab_and_find_access_keys_section_and_click_create_access_key.png)

### Step 22: Select CLI Use Case

- Use case: Command Line Interface (CLI)
- Check recommendation acknowledgment
- Click Next

![Step 22](./img/22.select_CLI_check_understand_recommendation_and_want_to_proceed_click_next.png)

### Step 23: Add Description (Optional)

- Add optional description tag
- Click Create access key

![Step 23](./img/23.add_description_tag(optional)_then_click_create_access_key.png)

### Step 24: Download Credentials

Critical: Download .csv file immediately

- Contains Access Key ID and Secret Access Key
- Click Done

![Step 24](./img/24.access_key_and_secret_key_generated_click_to_download_csv_file_and_then_click_Done.png)

### Step 25: Verify Key Status

- Access key status: Active
- Usage: Unused (expected)

![Step 25](./img/25.back_to_autmation_user_dashboard_note_that_access_key_now_active_but_unused.png)

## Phase 6: AWS CLI Installation (Ubuntu)

### Step 26: Ubuntu Environment Setup

- OS: Ubuntu Linux 22.04
- Terminal ready for CLI installation

![Step 26](./img/26.ubuntu_linux_will_be_use_for_the_CLI.png)

### Step 27: Create Installation Script

- `nano install_cli.sh`

![Step 27](./img/27.created_a_file_call_install_cli-sh_with_nano.png)

### Step 28: Write Installation Commands

```bash
#!/bin/bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

- Save: Ctrl+O, Enter, Ctrl+X

![Step 28](./img/28.in_it_type_this_commands_save_and_exit.png)

### Step 29: Make Script Executable

- `chmod +x install_cli.sh`

![Step 29](./img/29.turn_install_cli-sh_to_executable(chmod+x).png)

### Step 30: System Update

- `sudo apt update && sudo apt upgrade -y`

![Step 30](./img/30.update_the_ubuntu_system(sudo_apt).png)

### Step 31: Install Curl

- `sudo apt install curl`

![Step 31](./img/31.install_curl_package.png)

### Step 32: Execute Installation Script

- `./install_cli.sh`

![Step 32](./img/32.execute_install_cli-sh_to_install_aws_cli.png)

### Step 33: Verify AWS CLI Installation

- `aws --version`

Expected Output: aws-cli/2.15.30 Python/3.11.6 Linux/...

![Step 33](./img/33.check_aws_cli_version_to_ensure_succesful_installation(--version).png)

## Phase 7: AWS CLI Configuration & Testing

### Step 34: Extract Credentials from CSV

- Open downloaded accesskeys.csv in LibreOffice Calc
- Copy Access Key ID and Secret Access Key

![Step 34](./img/34.open_the_downloaded_accesskeys-csv_on_ubuntu_libre_office.png)

### Step 35: Configure AWS CLI (Credentials)

- `aws configure`
- AWS Access Key ID [None]: AKIA...
- AWS Secret Access Key [None]: ...

![Step 35](./img/35.run_aws_configure_enter_access_key_id_and_secret_key_to_first_two_prompt_respectively.png)

### Step 36: Configure Region & Output

- Default region name [None]: us-east-1
- Default output format [None]: json

![Step 36](./img/36.provide_default_region_and_prefared_outut_format_respectively.png)

### Step 37: Test API Connectivity

- `aws ec2 describe-regions --output table`

✅ Success: Complete regions table displayed

![Step 37](./img/37.aws_ec2_describe-region_table_output_to_test_configuration.png)

### Step 38: Test EC2 Instance Listing

- `aws ec2 describe-instances`

✅ Success: Empty response (no instances = correct)

![Step 38](./img/38.aws_describe-instances_and_there_is_empty_reservation.png)

## Phase 8: Prepare Automation Script and Resources

### Step 39: Create Automation Script File

- Create the shell script file using `touch aws-resources.sh`

Purpose: This script will automate EC2 instance creation and S3 bucket management.

![Step 39](./img/39.create_aws-resources-sh_with_touch_command.png)

### Step 49: Navigate to EC2 Service

- Use the search bar to search for "EC2" and click on it

Purpose: Access EC2 dashboard for key pair creation.

![Step 49](./img/49.search_for_ec2_and_click_on_it.png)

### Step 50: Access Key Pairs Section

- Find "Key Pairs" under "Network and Security" on the left sidebar and click on it

Purpose: Manage key pairs for secure SSH access to EC2 instances.

![Step 50](./img/50.find_Key_Pairs_under_Network_and_Security_on_the_left_sidebar_and_click_on_it.png)

### Step 51: Initiate Key Pair Creation

- On the Key Pairs page, click "Create key pair"

![Step 51](./img/51.on_the_keypair_page_click_create_keypair.png)

### Step 52: Configure and Create Key Pair

- Name the key pair (e.g., MyKeyPair)
- Select key type (e.g., RSA) and file format (e.g., .pem)
- Click "Create key pair"

![Step 52](./img/52.name_key_pair_select_type_and_format_and_click_create_key_pair.png)

### Step 53: Verify Key Pair Creation

- Key pair created and .pem file downloaded

Purpose: Use this key pair in the automation script for EC2 launches.

![Step 53](./img/53.keypair_created_and_downloaded.png)

### Step 54: Search for AWS CLI EC2 Reference

- In your preferred browser, search for "aws cli command reference ec2"

Purpose: Reference official documentation for scripting EC2 commands.

![Step 54](./img/54.on_your_preferred_browser_search_for_aws_cli_command_reference_ec2.png)

### Step 55: Access CLI Reference

- Click on the first link for CLI latest reference (EC2 section)

![Step 55](./img/55.click_on_the_first_link_showing_cli_latest_reference_ec2.png)

### Step 56: Explore Documentation

- Now on the AWS CLI commands official documentation webpage

![Step 56](./img/56.now_on_aws_cli_commands_official_documentation_webpage.png)

### Step 57: Find run-instances Command

- Search for "run-instances" using Ctrl+F and click on it when found

Purpose: Use this command in the script for creating EC2 instances.

![Step 57](./img/57.search_for_run-instances_with_ctrl-f_and_click_on_it_when_found.png)

## Phase 9: Develop the Automation Shell Script

### Step 58: Prepare Script for Editing
- Create a new file called 'aws-resources.sh'
- Make aws-resources.sh executable
- Open in VS Code (or your code editor)
- 
```bash
    touch aws-resources.sh
    chmod +x aws-resources.sh
    code aws-resources.sh
```
Purpose: Begin building the automation script incrementally.

![Step 58](./img/58.create_aws-resources-sh_turn__to_executable_open_in_vs_code(or_your_code_editor).png)

### Step 59: Add Shebang and ENVIRONMENT Variable

Add the following to the script:

```bash
#!/bin/bash

# Environment variables
ENVIRONMENT=$1"
```

- Run `./aws-resources.sh` to test basic execution (no output expected yet)

![Step 59](./img/59.add_shebang_and_environmental_variables_and_run_aws-resource-sh_script.png)

### Step 60: Add Argument Check Function

Add the function and call it:

```bash
check_num_of_args() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

check_num_of_args "$@"
```

- Run without argument (error expected)
- Run with argument (e.g., `./aws-resources.sh local`) (success)

Purpose: Ensure script is called with environment parameter.

![Step 60](./img/60.add_check_num_of_args()_call_it_and_run_without_and_with_argument.png)

### Step 61: Add Environment Activation Function

Add the function and call it:

```bash
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
activate_infra_environment
```

![Step 61](./img/61.add_activate_infra_environment()_and_call_it.png)

### Step 62: Test Environment Activation

- Run with invalid environment (error expected)
`./aws-resources.sh invalid`
- Run with "local" environment (success)
`./aws-resources.sh local`  
![Step 62](./img/62.run_activate_infra_environment()_with_invalid_and_local_env_passed.png)

### Step 63: Add AWS CLI Check Function

Add the function and call it:

```bash
# Function to check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before proceeding."
        return 1
    fi
}
check_aws_cli || exit 1
```

![Step 63](./img/63.add_and_call_check_aws_cli().png)

### Step 64: Run AWS CLI Check

- Execute the script; no error as CLI is installed
`./aws-resources.sh local`
![Step 64](./img/64.run_check_aws_cli_with_no_error.png)

### Step 65: Add AWS Profile Check Function

Add the function and call it:

```bash
# Function to check if AWS profile is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS profile environment variable is not set."
        return 1
    fi
}

check_aws_profile || exit 1
```

![Step 65](./img/65.add_and_call_check_aws_profile().png)

### Step 66: Test AWS Profile Check

- Run script: `./aws-resources.sh local` (error if not set)
- Export `AWS_PROFILE=default`
- Run again: `./aws-resources.sh local` (success)

![Step 66](./img/66.run_check_aws_profile_export_profile_to_set_profile_check_again_no_error_now_set.png)

### Step 67: Add EC2 Instance Creation Function

Add the function and call it:

```bash
# Function to create EC2 Instances 
    create_ec2_instances() {

    # Specify the parameters for the EC2 instances
    instance_type="t2.micro"
    ami_id="resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
    count=2
    region="us-east-2"
    subnet_id="subnet-<pseudo-id:Enter yours>"       # Replace with your public subnet ID
    security_group_id="sg-<pseudo-id:Enter yours>"  # Replace with your SG ID
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

create_ec2_instances
```

Note: Adjust parameters like AMI ID, key name, and instance profile as per your setup. This example uses SSM to fetch a dynamic AMI ID.

![Step 67](./img/67.add_and_call_create_ec2_instances().png)

### Step 68: Verify No Existing EC2 Instances

- Before execution, note there are currently no EC2 instances (check via `aws ec2 describe-instances` or console)

![Step 68](./img/68.before_execution-note_there_are_currently_no_ec2_instance.png)

### Step 69: Add S3 Bucket Creation Function

Add the function and call it:

```bash
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
create_s3_buckets
```

Note: Creates multiple unique buckets to demonstrate automation.

![Step 69](./img/69.add_and_call_create_s3_buckets().png)

### Step 70: Verify No Existing S3 Buckets

- Before execution, note there are currently no S3 buckets (check via `aws s3 ls` or console)

![Step 70](./img/70.before_execution-note_there_are_currently_no_s3_bucket.png)

## Phase 10: Test Script and Troubleshoot Permissions

### Step 71: Run Script to Create Resources

- Execute `./aws-resources.sh local`

![Step 71](./img/71.run_script_to_create_instances_and_s3.png)

### Step 72: Initial Execution Results

- S3 buckets created successfully
- EC2 creation denied due to SSM permissions error (e.g., access denied for ssm:GetParameter)

Purpose: Identifies missing permissions in the policy.

![Step 72](./img/72.successully_created_s3_but_ec2_show_ssm_denied_creation.png)

### Step 73: Verify Created S3 Buckets

- Check the created buckets on the S3 console dashboard

![Step 73](./img/73.here_are_the_created_buckets_on_the_s3_console_dashboard_.png)

### Step 74: Navigate Back to IAM Policies

- Back to IAM dashboard, click on Policies

![Step 74](./img/74.back_to_iam_dashboard_click_on_policies.png)

### Step 75: Open Existing Policy

- Search for EC2S3FullAccessPolicy created initially and click to open it

![Step 75](./img/75.search_for_EC2S3FullAccessPolicy_created_initially_and_click_to_open_it.png)

### Step 76: Edit Policy

- On EC2S3FullAccessPolicy dashboard, in permissions section, click Edit

![Step 76](./img/76.on_EC2S3FullAccessPolicy_dashboard_permission_section_click_edit.png)

### Step 77: Access JSON Editor

- Ensure JSON is selected and policy editor JSON shows

![Step 77](./img/77.ensure_json_is_clicked_and_policy_editor_json_shows.png)

### Step 78: Update JSON for SSM Permissions

Update the JSON by adding a new statement for SSM:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:*",
                "s3:*",
                "ssm:GetParameter",
                "ssm:GetParameters",
                "ssm:DescribeParameters"
            ],
            "Resource": "*"
        }
    ]
}
```

Purpose: Add permissions for SSM Parameter Store access used in the script.

![Step 78](./img/78.update_json_by_adding_ssm_GetParameter_GetParameters_and_DecribeGetParameters_to_Action.png)

### Step 79: Proceed with Edit

- Scroll down and click Next

![Step 79](./img/79.scroll_down_and_click_next.png)

### Step 80: Save Policy Changes

- Click to set new version as default and click Save changes

![Step 80](./img/80.click_to_set_new_version_as_default_and_click_save_changes.png)

### Step 81: Verify Policy Edit

- Policy edited successfully

![Step 81](./img/81.policy_edited_succesfully.png)

### Step 82: Delete Existing S3 Buckets

- Run commands to delete all buckets starting with "datawise" created in first execution (e.g., `aws s3 rb s3://datawise-bucket --force` in a loop)
```bash
for bucket in $(aws s3api list-buckets --query "Buckets[].Name" --output text | tr '\t' '\n' | grep '^datawise'); do
    echo "🧹 Deleting $bucket ..."
    aws s3 rb "s3://$bucket" --force
done

```
Purpose: Clean up before re-testing to avoid duplicates.

![Step 82](./img/82.run_command_to_delete_all_bucket_starting_with_datawise_created_in_first_execution.png)

### Step 83: Re-run Script for EC2

- Execute the script again; EC2 block now launches successfully with no error, EC2 creation initiated

![Step 83](./img/83.ec2_block_now_launch_successfully_with_no_error_and_ec2_creation_initiated.png)

### Step 84: Successful Resource Creation

- EC2 and S3 now created successfully with no error

![Step 84](./img/84.ec2_and_s3_now_created_successfully_with_no_error.png)

### Step 85: Verify Created EC2 Instances

- Check created instances on EC2 instance dashboard

![Step 85](./img/85.created_instances_on_ec2_instance_dashboard.png)

## Phase 11: Clean Up Resources

### Step 86: Terminate EC2 Instances

- Select all the instances, click Instance state, and select Terminate instances

![Step 86](./img/86.select_all_the_instances_click_instance_state_and_terminate_instances.png)

### Step 87: Confirm Termination

- Click button to terminate and delete

![Step 87](./img/87.Click_button_to_terminate_and_delete.png)

### Step 88: Verify Termination

- Instances now terminated

![Step 88](./img/88.Instances_now_terminated.png)

### Step 89: Delete S3 Buckets

- Run command to delete all buckets starting with "datawise" to avoid costs as well (e.g., `aws s3 rb s3://datawise-bucket --force` in a loop)

![Step 89](./img/89.run_command_to_delete_all_bucket_starting_with_datawise_to_avoid_cost_as_well.png)

## Conclusion

This guide has provided a thorough, step-by-step process for setting up secure AWS authentication and automation, from IAM configuration to scripting resource management. By following these instructions, you've built a foundation that not only automates EC2 and S3 tasks but also prioritizes security and efficiency. Remember, maintaining secure practices like regular key rotation and monitoring is key to long-term success in cloud environments.

## Learning Outcomes

By completing this tutorial, you will:
- Understand IAM components and how to apply the least privilege principle.
- Be able to create custom policies, roles, and users for specific AWS services.
- Know how to install and configure the AWS CLI on Ubuntu.
- Gain skills in writing and debugging shell scripts for AWS automation.
- Learn to troubleshoot permissions and clean up resources to manage costs effectively.

## Recommendations

- Regularly review and audit IAM policies to ensure they remain aligned with your needs.
- Explore advanced tools like AWS SDKs or Terraform for more complex infrastructure as code.
- Enable AWS CloudTrail for logging API activities and enhance monitoring.
- Consider using temporary credentials via STS for even greater security in production.
- For further learning, refer to the official AWS documentation on IAM best practices and CLI commands.

🎉 Next Steps

1. Enhance the script with additional features like error handling or multi-region support.
2. Integrate this setup into a CI/CD pipeline using tools like Jenkins or GitHub Actions.
3. Experiment with other AWS services, such as Lambda or RDS, using similar authentication methods.
4. Join AWS communities or forums for troubleshooting and advanced tips.

📸 Total Documentation

89 Screenshots - Complete visual step-by-step guide

👤 Author

Oluwaseun Osunsola

Date: October 24, 2025

📄 License

This project is licensed under the MIT License - see the LICENSE file for details.