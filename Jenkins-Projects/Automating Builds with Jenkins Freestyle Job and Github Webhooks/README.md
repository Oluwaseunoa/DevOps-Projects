
# Jenkins Freestyle Project with GitHub Webhook Automation
**Author:** Oluwaseun Osunsola  
**LinkedIn:** https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/  
**Project Repository:** https://github.com/Oluwaseunoa/DevOps-Projects/tree/main/Jenkins-Projects  
**Environment & Tools:** AWS EC2 (Ubuntu 22.04 LTS), Jenkins 2.462.x (LTS), GitHub

## 📌 Project Overview

This project demonstrates how to configure a **Jenkins Freestyle Job** integrated with **GitHub Source Code Management (SCM)** and automate build execution using **GitHub Webhooks**.
The goal is to implement a **basic Continuous Integration (CI) pipeline** where Jenkins automatically triggers builds whenever changes are pushed to a GitHub repository.

---

## 🎯 Project Objectives

* Create and configure a Jenkins Freestyle Job
* Integrate Jenkins with a GitHub repository using Git SCM
* Trigger Jenkins builds manually and automatically
* Configure GitHub Webhooks to enable event-driven builds
* Validate automated build execution via console logs

---

## 🛠 Tools & Technologies Used

* **Jenkins** – Automation Server
* **GitHub** – Source Code Repository
* **Git** – Version Control System
* **GitHub Webhooks** – Build Trigger Mechanism
* **Web Browser** – Jenkins & GitHub Access

---

## 📂 Project Architecture (Logical Flow)

1. Developer pushes code to GitHub
2. GitHub sends a webhook event to Jenkins
3. Jenkins pulls the latest code
4. Jenkins executes the configured job
5. Build status and logs are generated

---

## 🚀 Step-by-Step Project Implementation

---

### Step 1: Open Jenkins in the Browser

Navigate to the Jenkins server URL using a web browser.

📸 **Screenshot:**
![Open Jenkins URL](./img/1.open_browser_and_navigate_to_jenkins_url.png)

---

### Step 2: Sign In to Jenkins

Authenticate with valid Jenkins credentials.

📸 **Screenshot:**
![Sign in to Jenkins](./img/2.sign_in_to_jenkins_server.png)

---

### Step 3: Jenkins Dashboard Displayed

After login, the Jenkins dashboard is displayed, showing existing jobs and options.

📸 **Screenshot:**
![Jenkins Dashboard](./img/3.jenkins_dash_board_displays.png)

---

### Step 4: Create a New Jenkins Job

Click **New Item** to create a new job.

📸 **Screenshot:**
![Click New Item](./img/4.click_new_Item.png)

---

### Step 5: Name the Job and Select Freestyle Project

* Job Name: `my-first-job`
* Job Type: **Freestyle Project**

📸 **Screenshot:**
![Name Job and Select Freestyle](./img/5.name_project_my-first-job_select_freestyle_project_and_click_ok.png)

---

### Step 6: Access Project Configuration Page

The job configuration page opens in a new tab.
Log in to GitHub in preparation for repository setup.

📸 **Screenshot:**
![Job Configuration & GitHub Login](./img/6.now_in_project_configuration_page_in_a_new_tab_log_in_to_GitHub_account.png)

---

### Step 7: Create a New GitHub Repository

Click the **+** icon on GitHub and select **New repository**.

📸 **Screenshot:**
![Create New Repository](./img/7.now_logged_into_github_home_click_plus_icon_to_create_new_repository.png)

---

### Step 8: Initialize the Repository

* Repository Name: `jenkins-scm`
* Initialize with **README.md**

📸 **Screenshot:**
![Initialize Repository](./img/8.name_repo_jenkins-scm_initialize_with_README_then_create_repository.png)

---

### Step 9: Repository Successfully Created

The repository is created with the default branch set to **main**.

📸 **Screenshot:**
![Repository Created](./img/9.repository_now_created_with_default_branch_as_main.png)

---

### Step 10: Return to Jenkins Job Configuration

Switch back to the Jenkins job configuration page.

📸 **Screenshot:**
![Back to Job Config](./img/10.switch_back_to_my-first-job_configuration_page.png)

---

### Step 11: Configure Source Code Management

* Scroll to **Source Code Management**
* Select **Git**

📸 **Screenshot:**
![Select Git SCM](./img/11.scroll_down_to_source_code_management_and_select_Git.png)

---

### Step 12: Copy GitHub Repository URL

Click **Code** in GitHub and copy the HTTPS repository URL.

📸 **Screenshot:**
![Copy Repo URL](./img/12.switch_to_github_repo_click_code_and_copy_https_link.png)

---

### Step 13: Paste Repository URL into Jenkins

Paste the copied GitHub URL into **Repository URL** field.

📸 **Screenshot:**
![Paste Repo URL](./img/13.switch_back_to_continue_project_configuration_paste_the_copied_url_in_repository_url.png)

---

### Step 14: Specify Branch and Save

* Branch Specifier: `*/main`
* Click **Save**

📸 **Screenshot:**
![Save SCM Configuration](./img/14.ensure_branch_specifier_is_main_and_click_save.png)

---

### Step 15: Trigger Manual Build

Click **Build Now** to run the first build manually.

📸 **Screenshot:**
![Build Now](./img/15.from_job_page_click_Build_Now.png)

---

### Step 16: Observe Build Status

The build appears in the **Build History** section and completes successfully.

📸 **Screenshot:**
![Build Success](./img/16.observe_execution_in_build_history_section_confirm_it_mark_green_for_success.png)

---

### Step 17: View Console Output

Click the build number and view the console output.

📸 **Screenshot:**
![Console Output](./img/17.click_to_see_console_output_on_build_section.png)

---

### Step 18: Build Execution Completed Successfully

The job finishes successfully. Navigate back to the job page.

📸 **Screenshot:**
![Build Finished](./img/18.job_execution_project_shows_and_finished_with_success_click_to_go_back_to_job.png)

---

### Step 19: Re-open Job Configuration

Click **Configure** to enable automation.

📸 **Screenshot:**
![Reconfigure Job](./img/19.back_to_job_page_click_configure.png)

---

### Step 20: Enable GitHub Webhook Trigger

* Scroll to **Build Triggers**
* Select **GitHub hook trigger for GITScm polling**
* Save configuration

📸 **Screenshot:**
![Enable Webhook Trigger](./img/20.scroll_to_build_trigger_select_GitHub_hook_trigger_for_GITScm_polling_save_configuration.png)

---

### Step 21: Configuration Saved Successfully

📸 **Screenshot:**
![Configuration Saved](./img/21.configuration_saved.png)

---

### Step 22: Open GitHub Repository Settings

📸 **Screenshot:**
![Open Repo Settings](./img/22.open_the_repo_on_github_and_click_settings.png)

---

### Step 23: Navigate to Webhooks

📸 **Screenshot:**
![Click Webhooks](./img/23.click_on_webhooks.png)

---

### Step 24: Add New Webhook

📸 **Screenshot:**
![Add Webhook](./img/24.click_add_webhooks.png)

---

### Step 25: Configure Webhook

* Payload URL: `http://<jenkins-ip>:8080/github-webhook/`
* Content Type: `application/json`
* Event: **Just the push event**

📸 **Screenshot:**
![Webhook Configuration](./img/25.paste_the_url_under_payload_url_content_type_application_json_just_push_event_then_add_webhook_button.png)

---

### Step 26: Webhook Added Successfully

📸 **Screenshot:**
![Webhook Success](./img/26.webhook_added_successfully.png)

---

### Step 27: Clone GitHub Repository Locally

📸 **Screenshot:**
![Clone Repository](./img/27.clone_the_github_repo.png)

---

### Step 28: Open README File

📸 **Screenshot:**
![Open README](./img/28.navigate_to_the_cloned_repo_and_open_the_README.png)

---

### Step 29: Modify README Content

📸 **Screenshot:**
![Edit README](./img/29.add_new_content_to_README.png)

---

### Step 30: Commit and Push Changes

📸 **Screenshot:**
![Commit and Push](./img/30.stage_commit_and_push_changes_to_github.png)

---

### Step 31: Verify Changes on GitHub

📸 **Screenshot:**
![Changes on GitHub](./img/31.reload_and_see_new_changes_display_on_github.png)

---

### Step 32: Observe Automatic Build Trigger

Jenkins automatically triggers a new build without manual action.

📸 **Screenshot:**
![Automatic Build Triggered](./img/32.note_that_the_build_was_triggered_automatically.png)

---

### Step 33: View Console Output for Webhook Build

📸 **Screenshot:**
![Webhook Build Console Output](./img/33.view_the_console_output_to_the_commit.png)

---

## ✅ Project Outcome

* Jenkins Freestyle Job successfully configured
* GitHub repository integrated via SCM
* Manual and automatic builds validated
* GitHub Webhook successfully triggers Jenkins builds
* CI workflow fully operational

---

## 📘 Key Learnings

* Jenkins Freestyle job creation and configuration
* GitHub SCM integration
* Webhook-based automation
* Core CI/CD principles
* Build monitoring and log analysis

---

## 🔮 Future Improvements

* Add build steps (shell scripts or Maven/Node builds)
* Integrate automated testing
* Implement Jenkins Pipelines (Jenkinsfile)
* Add notifications (Slack / Email)
* Secure Jenkins with credentials management

---

## 👤 Author

**Seun**
DevOps / Cloud Engineering Project

