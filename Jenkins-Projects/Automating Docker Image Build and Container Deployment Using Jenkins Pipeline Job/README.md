# Automating Docker Image Build and Container Deployment Using Jenkins Pipeline Job

**Author:** Oluwaseun Osunsola  
**LinkedIn:** https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/  
**Project Repository:** https://github.com/Oluwaseunoa/DevOps-Projects/tree/main/Jenkins-Projects  
**Environment & Tools:** AWS EC2 (Ubuntu 22.04 LTS), Jenkins 2.462.x (LTS), GitHub
## Project Overview

This project demonstrates how to automate Docker image building and container deployment using a **Jenkins Declarative Pipeline Job**. The workflow integrates **GitHub webhooks** to enable **continuous integration**, ensuring that every code push automatically triggers a Jenkins pipeline that builds a Docker image and deploys a container.

This project builds upon prior Docker foundations knowledge by translating a manual Docker workflow into a fully automated CI pipeline using Jenkins Pipeline as Code.

---

## Technologies Used

* Jenkins (Pipeline Job)
* Docker
* GitHub
* Ubuntu Server
* NGINX
* Shell Scripting

---

## Project Prerequisites

* Jenkins installed and running on Ubuntu
* Docker installed on the Jenkins server
* GitHub repository created
* Jenkins accessible via browser
* Basic understanding of Docker and CI/CD concepts

---

## Step-by-Step Project Implementation

### Step 1: Sign in to Jenkins

Log in to the Jenkins dashboard using your credentials.

![Sign in to Jenkins](./img/1.sign_in_to_jenkins.png)

---

### Step 2: Create a New Jenkins Job

Click **New Item** from the Jenkins dashboard menu.

![Click New Item](./img/2.click_new_item.png)

---

### Step 3: Create a Pipeline Job

Enter the job name **My pipeline job**, select **Pipeline**, and click **OK**.

![Name Job and Select Pipeline](./img/3.name_job_then_select_pipline_and_click_okay.png)

---

### Step 4: Configure Build Trigger

Scroll to the **Build Triggers** section and check **GitHub hook trigger for GITScm polling**.

![Configure Build Trigger](./img/4.Scroll_to_Build%20Triggers_section_check_Github_hook_trigger_for_GITScm_polling.png)

---

### Step 5: Configure Pipeline Script Section

Scroll to the **Pipeline** section, paste the pipeline script, and click **Pipeline Syntax**.

![Scroll to Pipeline Section](./img/5.scroll_to_pipeline_paste_script_and_click_on_pipeline_synthax.png)

---

### Step 6: Select Checkout Sample Step

Under **Sample Steps**, select **checkout: Check out from version control**.

![Select Checkout Step](./img/6.under_Sample_Steps_select_checkout-Check_out_from_version_control.png)

---

### Step 7: Configure Git SCM

Under **SCM**, select **Git** and paste your GitHub repository URL.

![Paste Repository URL](./img/7.under_SCM_select_Git_then_paste_Repository_URL.png)

---

### Step 8: Set Branch Specifier

Scroll and set the branch specifier to **main** (or applicable branch).

![Set Branch Specifier](./img/8.scroll_and_set_branch_specifier_to_main_or_any_branch_applicable.png)

---

### Step 9: Generate Pipeline Script

Click **Generate Pipeline Script**.

![Generate Script](./img/9.click_generate_pipeline_script.png)

---

### Step 10: Copy Generated Script

Copy the generated pipeline checkout syntax.

![Copy Script](./img/10.copy_the_generated_pipeline_script.png)

---

### Step 11: Replace Checkout Section

Replace the Git checkout section of your pipeline script with the generated syntax.

![Replace Checkout Script](./img/11.replace_git_checkout_aspect_of_script_with_pasted_synthax.png)

---

### Step 12: Save the Pipeline Job

Click **Save** to apply all configurations.

![Save Job](./img/12.click_save.png)

---

### Step 13: Open GitHub Repository Settings

Navigate to your GitHub repository and click **Settings**.

![Open Repository Settings](./img/13.open_the_repo_on_github_and_click_settings.png)

---

### Step 14: Open Webhooks Configuration

Click **Webhooks** from the repository settings menu.

![Click Webhooks](./img/14.click_on_webhooks.png)

---

### Step 15: Add a New Webhook

Click **Add webhook**.

![Add Webhook](./img/15.click_add_webhooks.png)

---

### Step 16: Configure Webhook Details

Paste the Jenkins webhook URL, set content type to **application/json**, choose **Just the push event**, and click **Add webhook**.

![Configure Webhook](./img/16.paste_the_url_under_payload_url_content_type_application_json_just_push_event_then_add_webhook_button.png)

---

### Step 17: Webhook Added Successfully

Confirmation that the webhook was added successfully.

![Webhook Added](./img/17.webhook_added_successfully.png)

---

### Step 18: Create Docker Installation Script

SSH into the Ubuntu server and create a `docker.sh` file using `nano`.

![Create docker.sh](./img/18.ssh_into_ubuntu_system_and_create_docker-sh_file_with_nano.png)

---

### Step 19: Paste Docker Installation Script

Paste the Docker installation commands, save, and exit the file.

![Paste Docker Script](./img/19.paste_docker_installation_script_save_and_exit.png)

---

### Step 20: Make Script Executable

Make the script executable using `chmod`.

![Make Executable](./img/20.make_script_an_executable.png)

---

### Step 21: Execute Docker Installation Script

Run the script to install Docker on the Jenkins server.

![Execute Script](./img/21.execute_script.png)

---

### Step 22: Create Dockerfile

In the project repository, create a `Dockerfile` using NGINX as the base image.

![Create Dockerfile](./img/22.in_the_project_folder_create_Dockerfile_and_add_script_nginx_as_base_image.png)

---

### Step 23: Create index.html File

Create an `index.html` file and add the application content.

![Create index.html](./img/23.also_create_index-html_file_and_add_content.png)

---

### Step 24: Commit and Push Changes

Stage, commit, and push the Dockerfile and index.html to GitHub.

![Commit and Push](./img/24.stage_commit_and_push_changes_to_github.png)

---

### Step 25: Pipeline Triggered Automatically

The GitHub push automatically triggers the Jenkins pipeline.

![Pipeline Triggered](./img/25.pipeline_triggered_automatically_and_code_executed_successfully.png)

---

### Step 26: View Console Output

Open the console output to monitor pipeline execution.

![Console Output](./img/26.view_console_output.png)

---

### Step 27: Pipeline Finished Successfully

Pipeline execution completed successfully.

![Pipeline Success](./img/27.pipeline_finished_with_success.png)

---

### Step 28: Open Security Group

Navigate to the instance dashboard and click the **Security Group**.

![Open Security Group](./img/28.to_access_the_website_on_instance_dashboard_click_security_group.png)

---

### Step 29: Edit Inbound Rules

Click **Edit inbound rules**.

![Edit Inbound Rules](./img/29.click_edit_inbound_rules.png)

---

### Step 30: Add Port 8081 Rule

Add a **Custom TCP rule** for port **8081** and allow access from anywhere.

![Add Port Rule](./img/30.add_custom_TCP_rule_on_port_8081_from_anywhere_and_save_rules.png)

---

### Step 31: Inbound Rule Added Successfully

Inbound security group rules updated successfully.

![Inbound Rule Success](./img/31.inbound_security_group_successfully_modified.png)

---

### Step 32: Access the Application

Visit the application using the server IP on port **8081**.

```
http://<server-ip>:8081
```

![Visit Application](./img/32.visit_the_application_using_the_ip_on_port_8081.png)

---

## Project Outcome

* Jenkins Pipeline Job successfully created
* GitHub webhook integrated
* Docker image built automatically
* Docker container deployed automatically
* Application accessible via web browser

---

## Key Learning Outcomes

* Jenkins Pipeline Job configuration
* Writing Declarative Pipeline scripts
* GitHub webhook integration
* Automating Docker builds with Jenkins
* Implementing Continuous Integration (CI)

## 👤 Author

**Oluwaseun**
DevOps / Cloud Engineering Project


