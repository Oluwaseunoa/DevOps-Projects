
# Jenkins CI/CD Pipeline for Java Application on AWS EC2  
**Freestyle Job, Pipeline with Jenkinsfile, GitHub Webhooks, and Docker Integration**

**Author:** Oluwaseun Osunsola  
**LinkedIn:** https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/  
**Project Repository:** https://github.com/Oluwaseunoa/DevOps-Projects/tree/main/Jenkins-Projects  
**Environment & Tools:** AWS EC2 (Ubuntu 22.04 LTS), Jenkins 2.462.x (LTS), GitHub, Docker 27.x, OpenJDK 21  
**Date Completed:** December 2025  

## Project Overview

This hands-on project documents the complete setup of a **secure and automated Jenkins CI/CD pipeline** on an AWS EC2 Ubuntu instance. The pipeline builds, compiles, and runs a simple Java application while demonstrating key DevOps practices.

Key features implemented:
- Jenkins installation and initial security configuration
- Static Elastic IP for persistent access
- **Freestyle project** with Git polling
- **Declarative Pipeline** using `Jenkinsfile` (Pipeline-as-Code)
- **GitHub webhooks** for real-time triggers (replacing polling)
- **Docker integration** for isolated, reproducible builds

The sample application is a basic Java class `Test.java` that prints a customizable greeting.

All steps include terminal commands, screenshots (in `img/` folder), and explanations. Code snippets are provided for reproducibility.

## Sample Application: Test.java

```java
public class Test {

	public static void main(String[] args) {
		System.out.println("**************************************");
		System.out.println("Hello from GITHub");
		System.out.println("Hello from Jenkins CI Pipeline");
		System.out.println("Hello, will the webhook work?");
		System.out.println("If you see this, the webhook worked and probably the pipeline will be triggered!");
		System.out.println("**************************************");
	}

}

```

## Step-by-Step Documentation

### 1. Server Setup & Jenkins Installation

1. **SSH into Ubuntu EC2 server**  
   ![Step 1](img/1.ssh_into_ubuntu_ec2_server.png)

2. **Update and upgrade system**  
   ![Step 2](img/2.update_and_upgrade_system.png)

3. **Check if Git is installed**  
   ![Step 3](img/3.check_if_git_is_installed_with_git_--version.png)

4. **Install OpenJDK 21**  
   ![Step 4](img/4.install_openjdk-21-jre_-y.png)

5. **Verify Java version**  
   ![Step 5](img/5.verify_instalation_by_checking_version_of_open_jdk.png)

6. **Download Jenkins repository key**  
   ![Step 6](img/6.download_jenkins_repository_key.png)

7. **Add Jenkins repository to APT sources**  
   ![Step 7](img/7.add_jenkins_repository_to_APT_sources.png)

8. **Update package list**  
   ![Step 8](img/8.update_package_list.png)

9. **Install Jenkins**  
   ![Step 9](img/9.installing_jenkins.png)

10. **Enable and start Jenkins**  
    ![Step 10](img/10.enable_and_start_jenkins_with_systemctl.png)

11. **Check Jenkins service status**  
    ![Step 11](img/11.check_jenkins_service_status.png)

### 2. Security Group Configuration

12. **Navigate to Security Groups**  
    ![Step 12](img/12.on_the_instance_dashboard_click_on_Security_tab_then_Security_groups.png)

13. **Edit inbound rules**  
    ![Step 13](img/13.click_on_edit_inbound_rules.png)

14. **Add port 8080 rule**  
    ![Step 14](img/14.click_add_rule_set_custom_TCP_port_8080_from_anywhere(ipv4)_and_save_rules.png)

15. **Security group updated**  
    ![Step 15](img/15.security_group_successfully_modified.png)

### 3. Initial Jenkins Web Setup

16. **Access Jenkins via public IP:8080**  
    ![Step 16](img/16.visit_public_ip_at_port_8080_on_the_browser_and_getting_started_page_appears.png)

17. **Retrieve initial admin password**  
    ![Step 17](img/17.cat_initial_AdminPassword_absolute_path_to_retrieve_password.png)

18. **Unlock Jenkins**  
    ![Step 18](img/18.supply_the_retrieved_password_to_jenkins_starting_page_and_click_continue.png)

19. **Install suggested plugins**  
    ![Step 19](img/19.install_suggested_plugins.png)

20. **Create first admin user**  
    ![Step 20](img/20.create_first_admin_user_username_and_password_and_emai_save_and_continue_.png)

21. **Leave Jenkins URL default**  
    ![Step 21](img/21.leave_jenkins_url_at_default_and_save_and_continue.png)

22. **Jenkins dashboard**  
    ![Step 22](img/22.on_jenkins_server_home_page_dashboard.png)

### 4. Assign Static Elastic IP

23. **Navigate to Elastic IPs**  
    ![Step 23](img/23.on_aws_console_navigate_to_ec2_dasboard_and_click_on_elastic_ip.png)

24. **Allocate Elastic IP**  
    ![Step 24](img/24.click_allocate_elastic_ip_address.png)

25. **Confirm allocation**  
    ![Step 25](img/25.click_on_allocate.png)

26. **Name the IP**  
    ![Step 26](img/26.name_the_ip_jenkins_ip.png)

27. **Select the IP**  
    ![Step 27](img/27.click_on_the_ip.png)

28. **Associate Elastic IP**  
    ![Step 28](img/28.click_associate_elastic_ip_address.png)

29. **Select instance and associate**  
    ![Step 29](img/29.select_instance_and_private_ip_then_click_associate.png)

30. **Association successful**  
    ![Step 30](img/30.elastic_ip_associated_successfully.png)

31. **Verify EIP on instance**  
    ![Step 31](img/31.navigate_to_instance_and_confirm_that_EIP_is_now_on_the_instance.png)

### 5. Update Jenkins URL to Elastic IP

32. **Manage Jenkins**  
    ![Step 32](img/32.on_jenkins_page_click_manage_jenkins.png)

33. **Temporary site access check**  
    ![Step 33](img/33.is_site_breaks_visit_the_attached_EIP_on_port_8080.png)

34. **Jenkins on new IP**  
    ![Step 34](img/34.jenkins_works_on_the_allocated_ip_now_sign_in.png)

35. **Continue to Manage Jenkins**  
    ![Step 35](img/35.continue_to_manage_jenkins.png)

36. **Configure System**  
    ![Step 36](img/36.click_on_System_to_configure_global_setting.png)

37. **Jenkins URL section**  
    ![Step 37](img/37.scroll_down_to_jenkins_url.png)

38. **Update to Elastic IP**  
    ![Step 38](img/38.change_the_new_url_containing_attached_EIP_and_save.png)

39. **Reload to confirm**  
    ![Step 39](img/39.reload_to_see_the_site_is_reachable.png)

### 6. Freestyle Job with Git Polling

40. **GitHub repo overview**  
    ![Step 40](img/40.this_my_repository_named_java-code_will_be_used_it_contain_a_simple_greeting_code(test-java).png)

41. **Create new job**  
    ![Step 41](img/41.on_jenkins_site_click_new_to_create_a_jenkins_job.png)

42. **Name and select Freestyle**  
    ![Step 42](img/42.name_it_select_freestyle_project_and_click_ok.png)

43. **Source Code Management → Git**  
    ![Step 43](img/43.scroll_to_source_code_management_and_click_Git.png)

44. **Go to repo**  
    ![Step 44](img/44.click_to_head_over_to_java-code_repository.png)

45. **Copy HTTPS URL**  
    ![Step 45](img/45.click_code_button_and_copy_the_https_url_of_the_repository.png)

46. **Paste URL in Jenkins**  
    ![Step 46](img/46.back_on_jenkins_paste_the_copied_url_under_repository_url_then_scroll.png)

47. **Specify branch: main**  
    ![Step 47](img/47.under_branches_to_build_specify_the_branch-I_go_for_main.png)

48. **Add Execute shell build step**  
    ![Step 48](img/48.under_build_steps_click_add_build_steps_then_select_execute_shell.png)

49. **Enter command: `javac Test.java`**  
    ![Step 49](img/49.in_the_command_field_enter_javac_Test-java-our_file_name_and_save.png)

50. **Build Now**  
    ![Step 50](img/50.click_Build_Now.png)

51. **Console output**  
    ![Step 51](img/51.build_successful_click_to_see_options_and_select_console_output.png)

52. **Greeting displayed**  
    ![Step 52](img/52.greeting_display_and_code_ran_successfully.png)

53. **Configure job again**  
    ![Step 53](img/53.click_on_the_project_and_select_configure.png)

54. **Enable Poll SCM (H/5 * * * *)**  
    ![Step 54](img/54.scroll_to_triggers_check_Poll_SCM_and_enter_H-5_4_star_in_schedule_box_then_save.png)

55. **Push change to GitHub**  
    ![Step 55](img/55.added_a_new_line_to_Test-java_and_push_to_github.png)

56. **Change visible on GitHub**  
    ![Step 56](img/56.new_line_confirmed_on_github.png)

57. **Trigger build**  
    ![Step 57](img/57.go_to_Jenkins-Project-Git_and_click_Build_Now.png)

58. **New line in console**  
    ![Step 58](img/58.build_successful_new_line_now_showing_on_the_console_output.png)

59. **Back to dashboard**  
    ![Step 59](img/59.go_back_to_jenkins_home_dashboard.png)

### 7. Pipeline Job with Jenkinsfile & GitHub Webhook

60. **Create Pipeline job**  
    ![Step 60](img/60.name_project-Java-Pipeline_select_pipeline_and_click_ok.png)

60b. **Enable GitHub hook trigger**  
    ![Step 60b](img/60b.under_triggers_select_Github_hooks_trigger_for_GITScm_poling.png)

61. **Pipeline from SCM**  
    ![Step 61](img/61.scroll_to_pipeline_and_select_pipeline_from_scm.png)

62. **Git SCM config**  
    ![Step 62](img/62.under_SCM_select_Git_and_paste_the_github_repository_url_specify_branch_and_scroll_down.png)

63. **Script path: Jenkinsfile**  
    ![Step 63](img/63.for_script_path_select_Jenkinsfile_and_save.png)

63b. **Configuration saved**  
    ![Step 63b](img/63b.configuration_saved.png)

64. **Create Jenkinsfile**  
    ![Step 64](img/64.create_the_Jenkinsfile_in_the_root_of_project_folder.png)

65. **Add pipeline script**  
    ![Step 65](img/65.open_jenkinsfile_and_add_pipeline_script_containing_the_correct_repository_url_and_save.png)

66. **Push Jenkinsfile**  
    ![Step 66](img/66.push_change_to_github.png)

67. **Jenkinsfile on GitHub**  
    ![Step 67](img/67.jenkinsfile_now_confirmed_on_github.png)

68. **GitHub Settings**  
    ![Step 68](img/68.on_the_github_repository_click_settings.png)

69. **Webhooks section**  
    ![Step 69](img/69.click_on_webhooks.png)

70. **Add webhook**  
    ![Step 70](img/70.click_add_webhook.png)

71. **Copy Jenkins webhook URL**  
    ![Step 71](img/71.copy_jenkins_server_url_ads_github-webhook_to_the_url.png)

72. **Configure webhook**  
    ![Step 72](img/72.paste_the_url_under_payload_url_content_type_application_json_just_push_event_then_add_webhook_button.png)

73. **Webhook added**  
    ![Step 73](img/73.webhooks_added_successfully.png)

74. **Push new change**  
    ![Step 74](img/74.added_a_new_line_to_test-java_and_pushed_to_github.png)

75. **Automatic build triggered**  
    ![Step 75](img/75.new_automatically_build_triggered_by_the_pipeline_build_changed_from_4_to_5.png)

76. **View console**  
    ![Step 76](img/76.click_to_view_on_console.png)

77. **New line in output**  
    ![Step 77](img/77.scroll_down_on_the_console_new_build_features_the_new_line.png)

### 8. Docker Integration

78. **SSH & update server**  
    ![Step 78](img/78.connect_with_the_server_and_update_the_server.png)

79. **Install required packages**  
    ![Step 79](img/79.install_needed_packages.png)

80. **Create GPG key directory**  
    ![Step 80](img/80.create_directory_that_store_gpg_key.png)

81. **Download Docker GPG key**  
    ![Step 81](img/81.download_and_save_docker_gpg_key.png)

82. **Add Docker repository**  
    ![Step 82](img/82.add_docker_repository_to_apt_source.png)

83. **Update package list**  
    ![Step 83](img/83.update_packege_list.png)

84. **Install Docker**  
    ![Step 84](img/84.install_docker_and_related_tool.png)

85. **Add jenkins user to docker group**  
    ![Step 85](img/85.add_jenkins_user_to_docker_group.png)

86. **Add ubuntu user to docker group**  
    ![Step 86](img/86.add_ubuntu_user_to_docker_group.png)

87. **Restart Jenkins**  
    ![Step 87](img/87.restart_jenkins_with_systemctl.png)

88. **Test Docker**  
    ![Step 88](img/88.run_hello-world_to_test_docker.png)

89. **Create Dockerfile**  
    ![Step 89](img/89.create_Dockerfile_in_the_project_folder_root.png)

90. **Add Dockerfile content**  
    ![Step 90](img/90.open_Dockerfile_and_add_script.png)

91. **Update Jenkinsfile for Docker**  
    ![Step 91](img/91.update_the_Jenkinsfile_pipeline_jobs_to_run_with_docker.png)

92. **Push changes**  
    ![Step 92](img/92.push_changes_to_github.png)

93. **Build triggered**  
    ![Step 93](img/93.trigger_build.png)

94. **Build successful**  
    ![Step 94](img/94.build_successful_view_console_output.png)

95. **Greeting works in Docker**  
    ![Step 95](img/95.the_update_remain_consistent_despite_now_running_on_docker.png)

## Lessons Learned & Best Practices

- **Webhooks > Polling** — Real-time, efficient, less resource usage.
- **Pipeline-as-Code** — Version-controlled, auditable, reproducible.
- **Docker agents** — Ensure consistent environments, isolate dependencies.
- **Security** — Use Elastic IP with HTTPS (e.g., via Nginx reverse proxy), enable RBAC, use Jenkins credentials plugin.
- **Future Improvements** — Add Maven/Gradle for real projects, unit tests (JUnit), artifact archiving, deployment to AWS ECR/ECS, notifications (Slack/Email).

This project provides a strong foundation for scaling to production-grade CI/CD.
