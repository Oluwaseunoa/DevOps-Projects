# AWS IAM Management Shell Script Project

 Author: Oluwaseun Osunsola  
 Environment: AWS, CLI, Windows  
 Project Link: https://github.com/Oluwaseunoa/DevOps-Projects/tree/main/Cloud%20Computing/Shell%20Script%20for%20AWS%20IAM%20Management

## Overview

CloudOps Solutions, a growing company leveraging AWS for its cloud infrastructure, requires automation to streamline AWS Identity and Access Management (IAM) tasks for its expanding DevOps team. This project delivers a Bash shell script, `aws-iam-manager.sh`, to automate the creation of IAM users, an admin group, policy attachment, and user assignments. The script addresses the following objectives:

1. Define an array to store IAM user names for iteration.
2. Create IAM users using AWS CLI commands.
3. Create an "admin" group using AWS CLI.
4. Attach the `AdministratorAccess` policy to the "admin" group.
5. Assign the users to the "admin" group.

**Note**: The project objectives specify five IAM users, but the provided script and screenshots use three users (`alice`, `bob`, `charlie`), likely for a test run. The script can be updated to include five users to fully meet the requirements (see Recommendations).

This `README.md` provides comprehensive documentation, detailing the setup, script development, execution, explanation, conclusions, and recommendations. Screenshots (43 in total) are included in the `./img/` directory to illustrate each step visually.

## 1. Installing and Configuring AWS CLI

The AWS Command Line Interface (CLI) must be installed and configured with appropriate IAM permissions to enable the script to manage IAM resources. The following steps outline the setup process, with screenshots for each action.

### Steps

1. **Search for AWS CLI Download**:
   - Searched for the AWS CLI download page to locate the installer for the Windows environment.
   - ![Search for AWS CLI Download](./img/1.search_for_aws_cli_download_on.png)
2. **Access the Download Page**:
   - Clicked the first link from the search results to visit the official AWS CLI download page.
   - ![Click on the First Link](./img/2.click_on_the_first_link.png)
3. **Download Windows MSI Installer**:
   - Scrolled down and selected the Windows MSI download link for AWS CLI v2.
   - ![Download Windows MSI](./img/3.scroll_down_and_click_windown_version_msi_download_link.png)
4. **Verify and Run Installer**:
   - Verified the downloaded MSI file and ran it to start the installation.
   - ![Verify MSI Download](./img/4.verify_msi_download_and_click_to_run.png)
5. **Complete Installation**:
   - Followed the installation prompts to install AWS CLI on the system.
   - ![Run Installation Steps](./img/5.run_through_the_installation_steps_and_install.png)
6. **Verify AWS CLI Installation**:
   - Opened a terminal (Git Bash on Windows) and ran `aws --version` to confirm successful installation.
   - ![Verify AWS CLI Version](./img/6.verify_installation_via_the_terminal_by_checking_version_of_aws_cli.png)
7. **Access AWS IAM Console**:
   - Searched for "IAM" in the AWS Management Console and navigated to the IAM dashboard.
   - ![Search for IAM](./img/7.on_aws_console_search_for_iam_and_click_on_it.png)
8. **Navigate to Users**:
   - Clicked on "Users" in the IAM dashboard to manage user creation.
   - ![Click on Users](./img/8.click_on_user.png)
9. **Initiate User Creation**:
   - Clicked "Create user" to set up a new IAM user for AWS CLI access.
   - ![Click Create User](./img/9.click_on_create_user.png)
10. **Name User and Skip Console Access**:
    - Named the user (e.g., `aws-cli-admin`) and proceeded without enabling console access, as the user is for CLI use.
    - ![Name User](<./img/10.name_user_and_click_next(no_need_for_console_access).png>)
11. **Attach AdministratorAccess Policy**:
    - Attached the `AdministratorAccess` policy directly to the user to grant IAM management permissions.
    - ![Attach Policy](./img/11.attach_policy_directly_and_choose_administrator_access_and_click_next.png)
12. **Create the User**:
    - Reviewed settings and clicked "Create user" to finalize the user creation.
    - ![Create User](./img/12.click_create_user.png)
13. **Access User Details**:
    - Navigated to the user list and clicked on the newly created user (`aws-cli-admin`).
    - ![Select New User](./img/13.on_user_list_click_on_the_newly_created_user.png)
14. **Create Access Key**:
    - Under "Security credentials," clicked "Create access key" to generate CLI credentials.
    - ![Create Access Key](./img/14_click_security_credential_and_then_create_access_key.png)
15. **Select CLI Usage**:
    - Selected "Command Line Interface (CLI)" and checked the recommendation box to proceed.
    - ![Select CLI](./img/15.select_CLI_check_recommendation_box_and_click_next.png)
16. **Tag User and Create Key**:
    - Added a tag (e.g., `aws-cli-admin`) and created the access key.
    - ![Tag and Create Key](./img/16.tag_user_as_aws-cli-admin_and_click_create_access_key.png)
17. **Secure Access Key**:
    - Noted the Access Key ID and Secret Access Key, downloading them as a CSV for secure storage.
    - ![Download Access Key](./img/17.note_access_key_and_secret_key_created_and_download_as_csv_for_secure_storage.png)
18. **Confirm Access Key**:
    - Verified that the user now has an access key for CLI operations.
    - ![User with Access Key](./img/18.user_now_have_access_key.png)
19. **Configure AWS CLI**:
    - Ran `aws configure` in the terminal, supplying the Access Key ID, Secret Access Key, and leaving other prompts (region, output format) at default by pressing Enter.
    - ![Run aws configure](./img/19.proceed_to_command_line_to_run_aws_configure_supply_access_key_then_secret_key_and_leave_every_other_prompt_at_default_by_clicking_enter.png)
20. **Test CLI Access**:
    - Ran `aws ec2 describe-instances` to verify the CLI user’s permissions, confirming access to AWS services.
    - ![Test CLI Command](./img/20.run_aws-describe-instances_to_see_if_cli_user_can_list_ec2_instances.png)
21. **Confirm No EC2 Instances**:
    - Verified the output, confirming no EC2 instances exist (as expected in a test account).
    - ![No EC2 Instances](./img/21.confirmation_that_there_is_truly_no_ec2_instance.png)
22. **Verify IAM User Count**:
    - Navigate to iam user list page to verify that there is only one user so far. Yours may be more, no problem.
    - ![Initial User Count](./img/22.before_our_script_create_array_of_users_confirm_that_only_one_iam_user_now_exist_on_the_aws_account.png)

### Prerequisites

- **AWS CLI**: Installed and configured with an IAM user having permissions for `iam:CreateUser`, `iam:CreateGroup`, `iam:AttachGroupPolicy`, and `iam:AddUserToGroup`.
- **Terminal**: Git Bash (Windows) or native terminal (Linux/macOS).
- **Permissions**: The AWS account must have IAM management capabilities.
- **Linux/Shell Scripting Knowledge**: Familiarity with Bash scripting, as per the Linux foundations prerequisite.

## 2. Script Creation (aws-iam-manager.sh)

The `aws-iam-manager.sh` script was developed to automate IAM resource management for CloudOps Solutions. It defines an array of three IAM user names (`alice`, `bob`, `charlie`) as shown in the provided script, creates the users, sets up an "admin" group with the `AdministratorAccess` policy, and assigns the users to the group. **Note**: The project requires five users, but the script and screenshots reflect a test run with three users. The script can be updated to include five users (see Recommendations).

### Steps

23. **Create Project Directory**:
    - Created a project folder and navigated into it:
    ```bash
    mkdir "Shell Script for AWS IAM Management"
    cd "Shell Script for AWS IAM Management"
    ```
    - ![Create Directory](./img/23.in_your_chosen_location_mkdir_your-project-folder-name_and_cd_into_it.png)
24. **Create Script File**:
    - Created `aws-iam-manager.sh` using `vim` and entered insert mode to write the script.
    ```bash
    vim aws-iam-manager.sh
    ```
    - ![Create Script File](./img/24.in_the_folder_create_aws_iam-sh_using_vim_in_vim_switch_to_insert_mode_to_be_able_to_type.png)
25. **Add Shebang**:
    - Added the shebang (`#!/bin/bash`) to ensure the script runs in Bash.
    - ![Add Shebang](./img/25.script-enter_the_shebang.png)
26. **Document Script Purpose**:
    - Added comments to describe the script’s purpose for clarity.
    - ![Add Comments](./img/26.comment_the_script_purpose_for_readers_to_understand_how_the_code_work.png)
27. **Define User Array**:
    - Defined an array with three user names (`alice`, `bob`, `charlie`) for iteration, as shown in the provided script.
    - ![Define Array](./img/27.add_an_array_placeholder_and_store_alice_bob_and_charlie_names_in_it_for_later_loop_to_iterate.png)
28. **Implement User Creation Function**:
    - Wrote the `create_iam_users` function to iterate through the array and create users.
    - ![User Creation Function](./img/28_create_iam_users_function.png)
29. **Implement Group Creation and Policy Attachment**:
    - Wrote the `create_admin_group` function to create the "admin" group and attach the `AdministratorAccess` policy.
    - ![Group and Policy](./img/29.create_addmin_group_and_attach_AdministratorAcess_policy.png)
30. **Implement User Assignment Function**:
    - Wrote the `add_users_to_admin_group` function to assign users to the "admin" group.
    - ![User Assignment Function](./img/30.add_users_to_the_admin_group.png)
31. **Add Main Execution Function**:
    - Implemented the `main` function to orchestrate tasks and check for AWS CLI.
    - ![Main Function](./img/31.script-execution_function.png)
32. **Save and Exit Vim**:
    - Saved the script and exited Vim (`:wq`).
    - ![Exit Vim](./img/32.exit_vim.png)

### Script

```bash
#!/bin/bash

# AWS IAM Manager Script for CloudOps Solutions
# This script automates the creation of IAM users, groups, and permissions

# Define IAM User Names Array (EDIT THIS LIST)
IAM_USER_NAMES=("alice" "bob" "charlie")

# Function to create IAM users
create_iam_users() {
    echo "Starting IAM user creation process..."
    echo "-------------------------------------"

    for user in "${IAM_USER_NAMES[@]}"; do
        # Check if user already exists
        if aws iam get-user --user-name "$user" >/dev/null 2>&1; then
            echo "User $user already exists. Skipping..."
        else
            aws iam create-user --user-name "$user"
            if [ $? -eq 0 ]; then
                echo "Created IAM user: $user"
            else
                echo "Error creating IAM user: $user"
            fi
        fi
    done

    echo "------------------------------------"
    echo "IAM user creation process completed."
    echo ""
}

# Function to create admin group and attach policy
create_admin_group() {
    echo "Creating admin group and attaching policy..."
    echo "--------------------------------------------"

    # Check if group already exists
    if aws iam get-group --group-name "admin" >/dev/null 2>&1; then
        echo "Group 'admin' already exists. Skipping creation..."
    else
        aws iam create-group --group-name admin
        if [ $? -eq 0 ]; then
            echo "Created group: admin"
        else
            echo "Error: Failed to create group 'admin'"
        fi
    fi

    # Attach AdministratorAccess policy
    echo "Attaching AdministratorAccess policy..."
    aws iam attach-group-policy --group-name admin \
        --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

    if [ $? -eq 0 ]; then
        echo "Success: AdministratorAccess policy attached"
    else
        echo "Error: Failed to attach AdministratorAccess policy"
    fi

    echo "----------------------------------"
    echo ""
}

# Function to add users to admin group
add_users_to_admin_group() {
    echo "Adding users to admin group..."
    echo "------------------------------"

    for user in "${IAM_USER_NAMES[@]}"; do
        aws iam add-user-to-group --user-name "$user" --group-name admin
        if [ $? -eq 0 ]; then
            echo "Added $user to admin group"
        else
            echo "Error: Failed to add $user to admin group"
        fi
    done

    echo "----------------------------------------"
    echo "User group assignment process completed."
    echo ""
}

# Main execution function
main() {
    echo "=================================="
    echo " AWS IAM Management Script"
    echo "=================================="
    echo ""

    # Verify AWS CLI is installed and configured
    if ! command -v aws &> /dev/null; then
        echo "Error: AWS CLI is not installed. Please install and configure it first."
        exit 1
    fi

    # Execute the functions
    create_iam_users
    create_admin_group
    add_users_to_admin_group

    echo "=================================="
    echo " AWS IAM Management Completed"
    echo "=================================="
}

# Execute main function
main

exit 0
```

### Thought Process

- **User Array**: Used three user names (`alice`, `bob`, `charlie`) as provided, aligning with the screenshots. To meet the five-user requirement, the array can be updated to include two additional users (e.g., `dave`, `eve`).
- **Modular Design**: Structured the script with separate functions for user creation, group creation, and user assignment to enhance readability and maintainability.
- **Error Handling**: Implemented checks for existing users (`aws iam get-user`) and groups (`aws iam get-group`) to ensure idempotency, preventing errors on re-runs.
- **User Feedback**: Included `echo` statements for clear progress updates and error messages using `$?` to check command success.
- **Exit Code**: Corrected `exit -1` to `exit 0` to indicate successful execution.

## 3. Script Execution

The script was executed in a terminal environment (Git Bash on Windows) after ensuring AWS CLI was configured. The execution was efficient, and results were verified via both CLI and AWS Console.

### Steps

33. **Make Script Executable**:
    - Ran `chmod +x aws-iam-manager.sh` to make the script executable.
    - ![Make Executable](./img/33.turn_aws-iam-manager-sh_to_executable.png)
34. **Run the Script**:
    - Executed the script with `./aws-iam-manager.sh`, completing all tasks successfully.
    - ![Execute Script](./img/34.successfully_execute_and_perform_task.png)
35. **Confirm Execution Time**:
    - Noted that the script completed in less than 30 seconds, indicating efficiency.
    - ![Execution Time](./img/35.task_completed_in_less_than_30seconds.png)
36. **Verify Users via CLI**:
    - Ran `aws iam list-users` to confirm the creation of users `alice`, `bob`, and `charlie`.
    - ![CLI User Verification](<./img/36.ran_aws_iam_list-user_and_successfully_confirm_created_users(alice_bob_and_charlie).png>)
37. **Verify Group Creation via CLI**:
    - Ran `aws iam list-groups` to confirm the "admin" group was created.
    - ![CLI Group Verification](./img/37.aws_iam_list-groups_to_confirm_group_creation.png)
38. **Verify Policy Attachment via CLI**:
    - Ran `aws iam list-attached-group-policies --group-name admin` to confirm the `AdministratorAccess` policy was attached.
    - ![CLI Policy Verification](./img/38.aws_iam_list-attached-group-policies--group-name_admin.png)
39. **Verify User Group Membership via CLI**:
    - Ran `aws iam list-groups-for-user --user-name alice` to confirm user group membership.
    - ![CLI Group Membership](./img/39.aws_iam_list-groups-for-user--user-name_alice.png)
40. **Verify Users via AWS Console**:
    - Navigated to the IAM user list in the AWS Console to visually confirm the created users (`alice`, `bob`, `charlie`).
    - ![Console User Verification](<./img/40.navigated_to_aws_iam_user_list_dashboard(GUI)_and_successfully_confirm_created_users(alice_bob_and_charlie).png>)
41. **Verify Group via AWS Console**:
    - Navigated to the IAM group list in the AWS Console to confirm the "admin" group.
    - ![Console Group Verification](<./img/41.navigated_to_aws_iam_user_group_list_dashboard(GUI)_and_successfully_confirm_created_users_group_admin.png>)
42. **Verify Group Membership via AWS Console**:
    - Clicked on the "admin" group in the AWS Console to confirm user membership (`alice`, `bob`, `charlie`).
    - ![Console Membership Verification](<./img/42.clicked_admin_group_on_aws_iam_user_group_list_dashboard(GUI)_and_successfully_confirm_created_users_are_in_the_group.png>)
43. **Verify Policy via AWS Console**:
    - Checked the "admin" group permissions to verify the `AdministratorAccess` policy.
    - ![Console Policy Verification](./img/43.clicked_permission_and_successfully_verify_group_has_AdministratorAccess.png)

### Sample Output

```bash
==================================
 AWS IAM Management Script
==================================

Starting IAM user creation process...
-------------------------------------
Created IAM user: alice
Created IAM user: bob
Created IAM user: charlie
------------------------------------
IAM user creation process completed.

Creating admin group and attaching policy...
--------------------------------------------
Created group: admin
Attaching AdministratorAccess policy...
Success: AdministratorAccess policy attached
----------------------------------

Adding users to admin group...
------------------------------
Added alice to admin group
Added bob to admin group
Added charlie to admin group
----------------------------------------
User group assignment process completed.

==================================
 AWS IAM Management Completed
==================================
```

### Verification Commands

- `aws iam list-users`: Lists all users to confirm creation.
- `aws iam list-groups`: Verifies the "admin" group.
- `aws iam list-attached-group-policies --group-name admin`: Confirms the `AdministratorAccess` policy.
- `aws iam list-groups-for-user --user-name alice`: Verifies user group membership.

## 4. Script Explanation

The script’s design and functionality are explained below to clarify its logic and implementation, without repeating the full code.

### Structure

- **Shebang (`#!/bin/bash`)**: Ensures the script runs in a Bash environment.
- **Main Function**: Orchestrates execution and checks for AWS CLI installation (`command -v aws`).

### Key Components

- **User Array (`IAM_USER_NAMES`)**:
  - Stores three user names (`alice`, `bob`, `charlie`) for iteration, as per the provided script. Can be extended to five users to meet requirements.
- **Function `create_iam_users`**:
  - Iterates through the array using a `for` loop.
  - Checks for existing users with `aws iam get-user` to avoid duplicates.
  - Creates users with `aws iam create-user --user-name "$user"`.
  - Uses `$?` to confirm success and provide feedback.
- **Function `create_admin_group`**:
  - Checks for the "admin" group with `aws iam get-group`.
  - Creates the group with `aws iam create-group --group-name admin`.
  - Attaches the `AdministratorAccess` policy using `aws iam attach-group-policy`.
  - Verifies policy attachment with `$?`.
- **Function `add_users_to_admin_group`**:
  - Iterates through the user array to add each user to the "admin" group using `aws iam add-user-to-group`.
  - Confirms success for each user.

### AWS CLI Commands

| Command                                                                                                   | Purpose                    |
| --------------------------------------------------------------------------------------------------------- | -------------------------- |
| `aws iam create-user --user-name "$user"`                                                                 | Creates an IAM user.       |
| `aws iam get-user --user-name "$user"`                                                                    | Checks if a user exists.   |
| `aws iam create-group --group-name admin`                                                                 | Creates the "admin" group. |
| `aws iam attach-group-policy --group-name admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess` | Attaches the admin policy. |
| `aws iam add-user-to-group --user-name "$user" --group-name admin`                                        | Adds a user to the group.  |

### Design Choices

- **Idempotency**: Checks for existing users and groups prevent errors on re-runs.
- **Modularity**: Separate functions for each task improve maintainability.
- **Error Handling**: Uses `$?` and suppressed output (`>/dev/null 2>&1`) for clean checks.
- **Feedback**: Clear `echo` statements guide the user through execution.

## 5. Conclusion

The project delivered `aws-iam-manager.sh`, meeting the core objectives:

- Defined an array with three IAM user names (`alice`, `bob`, `charlie`).
- Created the users via AWS CLI.
- Created an "admin" group and attached the `AdministratorAccess` policy.
- Assigned all users to the group.

The script executed efficiently (under 30 seconds), with robust error handling and user-friendly output. Verification via CLI and AWS Console (screenshots 36–43) confirmed the results. However, the script uses three users instead of the required five, likely for testing purposes as reflected in the screenshots. The setup process ensured proper AWS CLI configuration, and challenges, such as IAM permissions, were addressed by configuring an `aws-cli-admin` user. Updating the script to include five users would fully align with the requirements.

## 6. Recommendations

To enhance the script and align with AWS best practices, consider the following:

### Script Improvements

- **Update User Count**: Modify `IAM_USER_NAMES` to include five users (e.g., `IAM_USER_NAMES=("alice" "bob" "charlie" "dave" "eve")`) to meet the project requirement.
- **Logging**: Add logging to a file (e.g., `echo "Log message" >> iam.log`) for audit trails.
- **Dynamic Input**: Allow user names to be passed as command-line arguments for flexibility.
- **Retry Logic**: Implement retries for transient AWS CLI failures.

### Security Enhancements

- **Least Privilege**: Replace `AdministratorAccess` with a custom policy for specific permissions.
- **IAM Audits**: Schedule regular audits using `aws iam generate-credential-report`.

### Scalability

- **Multiple Groups**: Support additional groups or policies for varied roles.
- **CI/CD Integration**: Incorporate the script into a CI/CD pipeline for automated IAM management.

### Testing

- **Sandbox Testing**: Always test in a non-production AWS account.
- **Unit Tests**: Use a Bash testing framework like `bats` to validate functions.
