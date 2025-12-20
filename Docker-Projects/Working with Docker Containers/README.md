# 🐳 Docker Mastery Project: From Containers to Custom Images & Multi-Container Applications

**Author:** Oluwaseun Osunsola  
**LinkedIn:** https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/      
**Environment & Tool:** AWS, Docker, Docker Compose, Dockerfile   
**Project Link:** https://github.com/Oluwaseunoa/DevOps-Projects/tree/main/Docker-Projects  


## 1. Introduction

Containerization is a cornerstone technology in modern DevOps and DevSecOps practices. This comprehensive hands-on project provides a complete progression from foundational Docker concepts to advanced real-world application deployment.

The project is structured into **two distinct sessions**:

- **Session 1:** Core Docker Container Operations – Mastering lifecycle management, interactivity, data persistence, and cleanup using the official Ubuntu image.
- **Session 2:** Advanced Docker Application Development – Building a custom Node.js web application image with Dockerfile and orchestrating a full multi-container stack (Node.js app + MongoDB + Mongo Express) using Docker Compose.

This structured approach demonstrates end-to-end containerized application development, deployment, and verification.

---

## 2. Project Objectives

- Master the Docker container lifecycle and essential management commands
- Build and version custom Docker images from scratch
- Orchestrate complex multi-container applications with Docker Compose
- Implement secure environment variable management and secret handling
- Achieve true data persistence using volumes and MongoDB
- Expose services securely and verify full-stack functionality in a cloud environment

---

## 3. Prerequisites

- Docker Engine or Docker Desktop installed
- Basic knowledge of Linux commands and Node.js fundamentals
- Text editor (nano or VS Code)
- AWS EC2 Ubuntu instance with Docker and Docker Compose installed (for Session 2 deployment)
- Internet access for pulling images and package installation

---

# Session 1: Core Container Operations

This session covers 23 foundational steps focused on Ubuntu container management.

### Step 1: View Existing Containers  
**Command:** `docker ps -a`  
![Step 1](./img/1.docker_ps_-a_to_see_container_of_ubuntu_image_we_previously_ran(docker_run_ubuntu).png)

### Step 2: Start a Stopped Container  
**Command:** `docker start <container_id>`  
![Step 2](./img/2.we_can_start_the_container_back_with_docker_start_CONTAINER_ID.png)

### Step 3: Run Container with Advanced Options (-e, -v, -p)  
![Step 3](./img/3.we_can_run_containers_back_with_different_options_like_-e_-v_-p.png)

### Step 4: Run Container in Detached Mode  
**Command:** `docker run -d ubuntu` 
![Step 4](./img/4.we_can_also_run_ubuntu_container_in_background_with_-d.png)

### Step 5: Start Container by Name  
**Command:** 
```bash 
docker ps -a
docker start <container_name>
```  
![Step 5](./img/5.we_can_also_start_containers_with_their_names.png)

### Step 6: Stop Container by Name  
**Command:** `docker stop <container_name>`  
![Step 6](./img/6.we_can_stop_container_with_container_name.png)

### Step 7: Restart Container by Name  
**Command:** `docker restart <container_name>`  
![Step 7](./img/7.we_can_restart_container_with_container_name.png)

### Step 8: Remove a Container  
**Commands:** 
```bash
docker rm <container_name> 
docker ps -a
```  
![Step 8](./img/8.we_can_also_remove_container_and_check_with_docker_ps_-a.png)

### Step 9: Pull the Ubuntu Image  
**Command:** `docker pull ubuntu`  
![Step 9](./img/9.pulling_ubuntu_image_from_docker_hub.png)

### Step 10: Run Ubuntu in Interactive Mode  
**Command:** `docker run -it --name my-ubuntu ubuntu bash`  
![Step 10](./img/10.run_ubuntu_in_interactive_mode-bash.png)

### Step 11: Verify OS Information  
**Command:** `cat /etc/os-release`  
![Step 11](./img/11.check_ubuntu_os-release.png)

### Step 12: Navigate File System  
**Commands:** 
```bash
pwd  
ls 
```  
![Step 12](./img/12.pwd_and_ls_inside_the_ubuntu.png)

### Step 13: Create and Enter Directory  
**Commands:** 
```bash
mkdir my-folder 
cd my-folder && pwd
```  
![Step 13](./img/13.mkdir_my-folder_then_cdmy-folder.png)

### Step 14: Create and View File  
**Commands:** 
```bash
echo "This is Ubuntu in docker" > file1.txt && cat file1.txt
```  
![Step 14](./img/14.write_to_file-txt_using_echo_then_cat_the_content.png)

### Step 15: Delete Directory  
**Commands:** 
```bash
cd .. 
rm -rf my-folder
 ```  
![Step 15](./img/15.go_back_to_root_folder_and_delete_my-folder_created.png)

### Step 16: Create Persistence Test File  
**Commands:** 
```bash
echo "Check after restart" > file2.txt 
cat file2.txt
```  
![Step 16](./img/16.write_to_file2-txt_and_cat_the_file(Check_after_restart).png)

### Step 17: Exit the Container  
**Command:** `exit`  
![Step 17](./img/17.exit_ubuntu_shell.png)

### Step 18: Confirm Container Stopped  
**Command:** `docker ps`  
![Step 18](./img/18.run_docker_ps_to_confirm_if_container_is_stopped.png)

### Step 19: Restart and Reattach  
**Commands:** 
```bash 
docker start my-ubuntu 
docker attach my-ubuntu
```  
![Step 19](./img/19.restart_ubuntu_container_and_attach_to_go_back.png)

### Step 20: Verify File Persistence  
**Commands:** `ls -ltr file2.txt`
![Step 20](./img/20.ls_to_confirm_file2-txt_created_in_last_session_still_exist.png)

### Step 21: Exit Again and Confirm Stopped  
**Commands:** 
```bash
exit 
docker ps
```  
![Step 21](./img/21.exit_and_confirm_the_container_is_stopped.png)

### Step 22: List All Containers Before Cleanup  
**Command:** `docker ps -a`  
![Step 22](./img/22.list_all_containers_including_stopped_ones(docker_ps_-a).png)

### Step 23: Remove the Container  
**Commands:** 
```bash 
docker rm my-ubuntu && docker ps -a
```  
![Step 23](./img/23.docker_rm_my-ubutu_to_remove_container.png)

---

# Session 2: Building & Orchestrating a Custom Node.js Profile Editor Application

This session demonstrates building a full-stack web application with persistent data storage, deployed on an AWS EC2 instance.

### Step 24: Create Project Directory  
**Command:** 
```bash
mkdir "NodeJS Demo Application - Custom Image"  
ls
```  
![Step 24](./img/18.create_project_folder(NodeJS_Demo_Application_-_Custom_Image)_and_ls_it_to_confirm.png)

### Step 25: Navigate into Project Folder  
**Command:** 
```bash
cd "NodeJS Demo Application - Custom Image"
```  
![Step 25](./img/19.navigate_into_the_project_folder(NodeJS_Demo_Application_-_Custom_Image).png)

### Step 26: Create and Enter `app` Directory  
**Commands:** 
```bash
mkdir app 
cd app
```  
![Step 26](./img/20.mkdir_app_to_create_app_folder_then_cd_into_app_folder.png)

### Step 27: Create `images` Directory  
**Commands:** 
```bash
mkdir images ; cd images
```  
![Step 27](./img/21.in_app_create_images_folder_and_cd_into_it.png)

### Step 28: Upload Profile Image via SCP  
**Command (from local machine):** 
```bash
scp -i your-key.pem profile-1.jpg ubuntu@<ec2-ip>:~/NodeJS\ Demo\ Application\ -\ Custom\ Image/app/images/
```  
![Step 28](./img/22.on_the_host_system_upload_an_image_to_project_images_folder_using_scp.png)

### Step 29: Verify Image Upload  
**Command:** `ls`  
![Step 29](./img/23.in_image_folder_ls_to_confirm_that_image_is_successfully_uploaded.png)

### Step 30: Return to `app` Directory  
**Command:** `cd ..`  
![Step 30](./img/24.from_image_folder_cd_back_one_step_to_app_folder.png)

### Step 31: Create `index.html` (Frontend)  
**Command:** `nano index.html`  
![Step 31](./img/25.nano_index-html_then_add_code_save_and_exit.png)

### Step 32: Create `server.js` (Express Backend) 
**Command:** `nano server.js` 
![Step 32](./img/26.nano_server-js_then_add_code_save_and_exit.png)

### Step 33: Initialize npm Project  
**Command:** `npm init -y`  
![Step 33](./img/27.initialize_the_project_folder_(install_node_and_npm_if_you_dont_have_and_then_initialize).png)

### Step 34: Install Dependencies  
**Command:** `npm install express body-parser mongodb dotenv`  
![Step 34](./img/28.install_the_pacages\(express_bodyParser_mongodb.png)

### Step 35: Verify Installed Packages  
**Commands:** `ls && cat package.json`  
![Step 35](./img/29.ls_app_folder_cat_package-json_to_confirm_packages.png)

### Step 36: Return to Project Root  
**Command:** `cd ..`  
![Step 36](./img/30.navigate_back_to_the_project_folder.png)

### Step 37: Create `.env` File  
Secure storage of MongoDB credentials.  
![Step 37](./img/31.nano_-env_then_add_environment_variables_save_and_exit.png)

### Step 38: Create `.gitignore`  
**Content:** `node_modules/`, `.env`  
![Step 38](./img/32.nano_-gitignore_then_add_what_to_ignore_save_and_exit.png)

### Step 39: Create `Dockerfile`  
Multi-stage build for Node.js application.  
![Step 39](./img/33.nano_Dockerfile_and_add_commands.png)

### Step 40: Build Custom Image  
**Command:** `docker build -t node-app:1.0 .`  
![Step 40](./img/34.build_image_using_docker_build_-t_node-app-1-0.png)

### Step 41: Verify Custom Image  
**Command:** `docker images`  
![Step 41](./img/35.list_images_to_see_the_created_node-app-1-0.png)

### Step 42: Create `docker-compose.yml`  
Orchestrates `my-app`, `mongodb`, and `mongo-express` services with volumes and networks.  
![Step 42](./img/36.nano_docker-compose-yaml_and_add_services_and_their_data_save_and_exit.png)

### Step 43: Start Application Stack  
**Command:** `docker compose --env-file .env up -d`  
![Step 43](./img/37.run_docker_compose--enve-file_up-_d.png)

### Step 44: Verify Running Containers  
**Command:** `docker ps`  
![Step 44](./img/38.docker_ps_to_check_containers_running.png)

### Step 45: Check Application Logs  
**Command:** `docker logs <container-name>`  
![Step 45](./img/39.docker_logs_to_check_nodejsapplication_logs.png)

### Step 46: Configure EC2 Security Group  
Open ports 3000 and 8080.  
![Step 46](./img/40.navigate_to_server_ec2_instance_security_group_to_edit_inbound_rule.png)  
![Step 47](./img/41._add_two_rules_to_accept_custom_TCP_connections_from_anywhere_on_port_3000_and_8080_then_save_rules..png)

### Step 48: Access Mongo Express Admin UI  
`http://<ec2-public-ip>:8080`  
![Step 48](./img/42.visit_the_public_ip_on_port_8080_to_see_mongo_express.png)

### Step 49: Create Database `my-db`  
![Step 49](./img/43.create_my-db_database.png)

### Step 50: Create `users` Collection  
![Step 50](./img/44.click_on_my-db_and_create_users_collection.png)

### Step 51: Access Profile Editor Application  
`http://<ec2-public-ip>:3000`  
![Step 51](./img/45.visit_the_public_ip_on_port_3000_to_see_the_application.png)

### Step 52: Test Data Persistence  
Edit profile → Save → Reload → Changes persist via MongoDB  
![Step 52](./img/46.edit_and_update_profile_then_reload_to_see_if_change_is_persistent_across_reload.png)

---

## 4. Key Learning Outcomes

- Complete mastery of Docker container lifecycle and management commands
- Ability to build optimized, versioned custom images using Dockerfile
- Proficiency in orchestrating multi-container applications with Docker Compose
- Secure handling of environment variables and secrets
- Implementation of persistent storage across container restarts
- Real-world deployment and networking configuration in cloud environments
- Full-stack application integration with database persistence

---

## 5. Conclusion

This dual-session Docker Mastery Project successfully bridges foundational container operations with advanced production-grade application development and orchestration.

**Session 1** established strong command-line proficiency and deep understanding of container behavior, persistence, and lifecycle management.  
**Session 2** elevated these skills into a complete DevOps workflow: building custom images, managing dependencies securely, orchestrating interdependent services, and deploying a fully functional, persistent web application in the cloud.

The hands-on execution across 52 documented steps demonstrates professional-level competency in containerization—critical for roles in **DevOps**, **DevSecOps**, and **Cloud Engineering**.

This project serves as a solid portfolio piece showcasing practical expertise in modern container technologies and prepares for advanced topics such as CI/CD pipelines, image security scanning, Kubernetes orchestration, and production monitoring.

**Future Enhancements:**
- Integrate CI/CD with GitHub Actions and Docker Hub
- Add image vulnerability scanning (Trivy/Grype)
- Implement HTTPS with Nginx reverse proxy and Let's Encrypt
- Scale with Docker Swarm or migrate to Kubernetes
- Add authentication and input validation for enhanced security

Mastery of these concepts positions you at the forefront of cloud-native development and infrastructure management.