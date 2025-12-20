# Jenkins CI Pipeline for Java Application with GitHub Integration

**Author:** Oluwaseun Osunsola  
**LinkedIn:** https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/      
**Environment & Tool:** AWS, Docker, Docker Compose, Dockerfile   
**Project Link:** https://github.com/Oluwaseunoa/DevOps-Projects/tree/main/Jenkins-Projects  

## Project Overview
This comprehensive guide walks you through setting up Jenkins on an Ubuntu EC2 instance (AWS) for Continuous Integration (CI) of a simple Java application hosted on GitHub. Jenkins will automate the build process for a basic Java program (e.g., a "Hello World" style greeting app named `Test.java`).

By the end of this tutorial, you'll have:
- A running Jenkins server on AWS EC2.
- Security configurations for access.
- An Elastic IP for stable addressing.
- A Freestyle Jenkins job that clones a GitHub repository, compiles, and runs a Java file.
- Hands-on experience with CI basics.

This setup assumes a basic understanding of AWS, Linux commands, and GitHub. The process is illustrated with screenshots for clarity.

### Prerequisites
- An AWS account with an Ubuntu EC2 instance launched (t2.micro is sufficient for testing).
- SSH key pair for accessing the EC2 instance.
- A GitHub account with a repository containing a simple Java file (e.g., `Test.java` with code like `public class Test { public static void main(String[] args) { System.out.println("Greeting!"); } }`).
- Basic tools: Web browser, terminal/SSH client.

### Important Notes
- All commands are run on the Ubuntu EC2 instance unless specified.
- Replace placeholders like `<your-public-ip>` or repository URLs with your own.
- This guide uses OpenJDK 21 (compatible with Jenkins as of December 2025).
- Security: Use strong passwords; restrict firewall rules in production.
- Costs: EC2 and Elastic IP may incur minor AWS charges.

## Step-by-Step Setup

### Step 1: SSH into Your Ubuntu EC2 Server
Connect to your EC2 instance via SSH to begin the setup.

- Command: `ssh -i your-key.pem ubuntu@<ec2-public-ip>`
- Ensure you're logged in as the ubuntu user with sudo privileges.

![SSH into Ubuntu EC2 Server](./img/1.ssh_into_ubuntu_ec2_server.png)

### Step 2: Update and Upgrade the System
Keep your system packages up to date for security and compatibility.

- Command: `sudo apt update && sudo apt upgrade -y`

![Update and Upgrade System](./img/2.update_and_upgrade_system.png)

### Step 3: Check if Git is Installed
Verify Git is available (required for repository integration later).

- Command: `git --version`
- If not installed, run `sudo apt install git -y`.

![Check if Git is Installed with git --version](./img/3.check_if_git_is_installed_with_git_--version.png)

### Step 4: Install OpenJDK 21 JRE
Jenkins requires Java. Install OpenJDK 21 for the latest compatibility.

- Command: `sudo apt install openjdk-21-jre -y`

![Install openjdk-21-jre -y](./img/4.install_openjdk-21-jre_-y.png)

### Step 5: Verify Java Installation
Confirm Java is installed correctly.

- Command: `java -version`
- Look for output like "openjdk 21.x".

![Verify Installation by Checking Version of OpenJDK](./img/5.verify_instalation_by_checking_version_of_open_jdk.png)

### Step 6: Download Jenkins Repository Key
Add the Jenkins GPG key for secure package installation.

- Command: `sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key`

![Download Jenkins Repository Key](./img/6.download_jenkins_repository_key.png)

### Step 7: Add Jenkins Repository to APT Sources
Register the Jenkins repository.

- Command: `echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null`

![Add Jenkins Repository to APT Sources](./img/7.add_jenkins_repository_to_APT_sources.png)

### Step 8: Update Package List
Refresh the package index to include Jenkins.

- Command: `sudo apt update`

![Update Package List](./img/8.update_package_list.png)

### Step 9: Install Jenkins
Install the Jenkins package.

- Command: `sudo apt install jenkins -y`

![Installing Jenkins](./img/9.installing_jenkins.png)

### Step 10: Enable and Start Jenkins
Start the Jenkins service and enable it on boot.

- Command: `sudo systemctl enable jenkins && sudo systemctl start jenkins`

![Enable and Start Jenkins with systemctl](./img/10.enable_and_start_jenkins_with_systemctl.png)

### Step 11: Check Jenkins Service Status
Verify Jenkins is running.

- Command: `sudo systemctl status jenkins`
- Look for "Active: active (running)".

![Check Jenkins Service Status](./img/11.check_jenkins_service_status.png)

### Step 12: Navigate to Security Groups in AWS Console
In the AWS EC2 dashboard, configure inbound rules for port 8080.

- Go to your instance > Security tab > Click on the Security Group link.

![On the Instance Dashboard Click on Security Tab Then Security Groups](./img/12.on_the_instance_dashboard_click_on_Security_tab_then_Security_groups.png)

### Step 13: Edit Inbound Rules
Modify the security group to allow access.

- Click "Edit inbound rules".

![Click on Edit Inbound Rules](./img/13.click_on_edit_inbound_rules.png)

### Step 14: Add Rule for Port 8080
Allow TCP traffic on port 8080 from anywhere (0.0.0.0/0 for IPv4). For production, restrict to your IP.

- Type: Custom TCP, Port: 8080, Source: Anywhere-IPv4.

![Click Add Rule Set Custom TCP Port 8080 from Anywhere (IPv4) and Save Rules](./img/14.click_add_rule_set_custom_TCP_port_8080_from_anywhere(ipv4)_and_save_rules.png)

### Step 15: Confirm Security Group Modification
Save the changes and verify the update.

![Security Group Successfully Modified](./img/15.security_group_successfully_modified.png)

### Step 16: Access Jenkins Web Interface
Open a browser and visit `http://<ec2-public-ip>:8080`. The "Getting Started" page should appear.

![Visit Public IP at Port 8080 on the Browser and Getting Started Page Appears](./img/16.visit_public_ip_at_port_8080_on_the_browser_and_getting_started_page_appears.png)

### Step 17: Retrieve Initial Admin Password
Get the unlock password from the server.

- Command: `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

![Cat Initial AdminPassword Absolute Path to Retrieve Password](./img/17.cat_initial_AdminPassword_absolute_path_to_retrieve_password.png)

### Step 18: Unlock Jenkins
Paste the password on the web page and continue.

![Supply the Retrieved Password to Jenkins Starting Page and Click Continue](./img/18.supply_the_retrieved_password_to_jenkins_starting_page_and_click_continue.png)

### Step 19: Install Suggested Plugins
Choose "Install suggested plugins" for essentials like Git integration.

![Install Suggested Plugins](./img/19.install_suggested_plugins.png)

### Step 20: Create First Admin User
Set up credentials: Username, password, full name, email.

![Create First Admin User Username and Password and Email Save and Continue](./img/20.create_first_admin_user_username_and_password_and_emai_save_and_continue_.png)

### Step 21: Confirm Jenkins URL
Leave it at the default for now (we'll update later with Elastic IP).

![Leave Jenkins URL at Default and Save and Continue](./img/21.leave_jenkins_url_at_default_and_save_and_continue.png)

### Step 22: Jenkins Dashboard
You're now on the main dashboard.

![On Jenkins Server Home Page Dashboard](./img/22.on_jenkins_server_home_page_dashboard.png)

### Step 23: Navigate to Elastic IPs in AWS Console
For a static IP, go to EC2 > Network & Security > Elastic IPs.

![On AWS Console Navigate to EC2 Dashboard and Click on Elastic IP](./img/23.on_aws_console_navigate_to_ec2_dasboard_and_click_on_elastic_ip.png)

### Step 24: Allocate Elastic IP
Create a new static IP.

- Click "Allocate Elastic IP address".

![Click Allocate Elastic IP Address](./img/24.click_allocate_elastic_ip_address.png)

### Step 25: Confirm Allocation
Proceed with allocation (use Amazon's pool).

![Click on Allocate](./img/25.click_on_allocate.png)

### Step 26: Name the Elastic IP
Tag it as "jenkins-ip" for identification.

![Name the IP jenkins_ip](./img/26.name_the_ip_jenkins_ip.png)

### Step 27: Select the IP
Click on the new IP in the list.

![Click on the IP](./img/27.click_on_the_ip.png)

### Step 28: Associate Elastic IP
Link it to your EC2 instance.

- Click "Associate Elastic IP address".

![Click Associate Elastic IP Address](./img/28.click_associate_elastic_ip_address.png)

### Step 29: Select Instance and Associate
Choose your instance and private IP, then associate.

![Select Instance and Private IP Then Click Associate](./img/29.select_instance_and_private_ip_then_click_associate.png)

### Step 30: Confirm Association
Verify the success message.

![Elastic IP Associated Successfully](./img/30.elastic_ip_associated_successfully.png)

### Step 31: Check Instance for Elastic IP
Back on the instance details, confirm the new public IP.

![Navigate to Instance and Confirm That EIP is Now on the Instance](./img/31.navigate_to_instance_and_confirm_that_EIP_is_now_on_the_instance.png)

### Step 32: Access Manage Jenkins
On the Jenkins dashboard, click "Manage Jenkins".

![On Jenkins Page Click Manage Jenkins](./img/32.on_jenkins_page_click_manage_jenkins.png)

### Step 33: Test Site with Elastic IP
If the site breaks, visit `http://<elastic-ip>:8080`.

![If Site Breaks Visit the Attached EIP on Port 8080](./img/33.is_site_breaks_visit_the_attached_EIP_on_port_8080.png)

### Step 34: Sign In with New IP
Jenkins now works on the Elastic IP; log in.

![Jenkins Works on the Allocated IP Now Sign In](./img/34.jenkins_works_on_the_allocated_ip_now_sign_in.png)

### Step 35: Continue to Manage Jenkins
Proceed to configuration.

![Continue to Manage Jenkins](./img/35.continue_to_manage_jenkins.png)

### Step 36: Configure System Settings
Click "Configure System" for global settings.

![Click on System to Configure Global Setting](./img/36.click_on_System_to_configure_global_setting.png)

### Step 37: Scroll to Jenkins URL
Find the "Jenkins Location" section.

![Scroll Down to Jenkins URL](./img/37.scroll_down_to_jenkins_url.png)

### Step 38: Update Jenkins URL
Change to `http://<elastic-ip>:8080` and save.

![Change the New URL Containing Attached EIP and Save](./img/38.change_the_new_url_containing_attached_EIP_and_save.png)

### Step 39: Reload to Verify
Refresh the page to ensure accessibility.

![Reload to See the Site is Reachable](./img/39.reload_to_see_the_site_is_reachable.png)

### Step 40: Prepare Your GitHub Repository
Use a repository like "java-code" with `Test.java` (simple greeting code).

![This My Repository Named java-code Will Be Used It Contain a Simple Greeting Code (test-java)](./img/40.this_my_repository_named_java-code_will_be_used_it_contain_a_simple_greeting_code(test-java).png)

### Step 41: Create New Jenkins Job
On dashboard, click "New Item".

![On Jenkins Site Click New to Create a Jenkins Job](./img/41.on_jenkins_site_click_new_to_create_a_jenkins_job.png)

### Step 42: Name and Select Freestyle Project
Name it (e.g., "JavaBuild"), select Freestyle, OK.

![Name It Select Freestyle Project and Click OK](./img/42.name_it_select_freestyle_project_and_click_ok.png)

### Step 43: Configure Source Code Management
Scroll to SCM, select Git.

![Scroll to Source Code Management and Click Git](./img/43.scroll_to_source_code_management_and_click_Git.png)

### Step 44: Go to Your GitHub Repository
Open your "java-code" repo on GitHub.

![Click to Head Over to java-code Repository](./img/44.click_to_head_over_to_java-code_repository.png)

### Step 45: Copy Repository URL
Click "Code" and copy the HTTPS URL.

![Click Code Button and Copy the HTTPS URL of the Repository](./img/45.click_code_button_and_copy_the_https_url_of_the_repository.png)

### Step 46: Paste Repository URL in Jenkins
In Jenkins, paste under "Repository URL", then scroll.

![Back on Jenkins Paste the Copied URL Under Repository URL Then Scroll](./img/46.back_on_jenkins_paste_the_copied_url_under_repository_url_then_scroll.png)

### Step 47: Specify Branch to Build
Under Branches, set to "main" (or your branch).

![Under Branches to Build Specify the Branch - I Go for Main](./img/47.under_branches_to_build_specify_the_branch-I_go_for_main.png)

### Step 48: Add Build Step
Under Build Steps, add "Execute shell".

![Under Build Steps Click Add Build Steps Then Select Execute Shell](./img/48.under_build_steps_click_add_build_steps_then_select_execute_shell.png)

### Step 49: Enter Build Command
Command: `javac Test.java` (compiles your Java file). Save.

![In the Command Field Enter javac Test-java - Our File Name and Save](./img/49.in_the_command_field_enter_javac_Test-java-our_file_name_and_save.png)

### Step 50: Trigger the Build
Click "Build Now" to run the job.

![Click Build Now](./img/50.click_Build_Now.png)

### Step 51: Check Build Status
View build history; select Console Output for details.

![Build Successful Click to See Options and Select Console Output](./img/51.build_successful_click_to_see_options_and_select_console_output.png)

### Step 52: Verify Output
Console shows compilation success and any output (e.g., greeting if running `java Test`—add if needed).

![Greeting Display and Code Ran Successfully](./img/52.greeting_display_and_code_ran_successfully.png)

## Next Steps and Best Practices
- **Add Execution**: Modify the shell step to `javac Test.java && java Test` to run and print the greeting.
- **Triggers**: Add GitHub webhook for automatic builds on push (install GitHub plugin if needed).
- **Security**: Set up HTTPS (self-signed or with domain), user roles via plugins.
- **Scaling**: Use pipelines for complex workflows; integrate Docker for containerized builds.
- **Cleanup**: Release Elastic IP when done to avoid charges.
- **Troubleshooting**: Check Jenkins logs (`/var/log/jenkins/jenkins.log`), ensure Java path is in $PATH.

