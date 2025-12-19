# 🐳 Docker Mastery Project: From Containers to Custom Images & Multi-Container Applications

**Date:** December 19, 2025  
**Student:** [Your Full Name]  
**Institution:** Afe Babalola University (BSc Computer Science)  
**Focus Areas:** Cybersecurity, DevOps, DevSecOps, Containerization

## 1. Introduction

Containerization is a cornerstone technology in modern DevOps and DevSecOps practices. This comprehensive project bridges foundational Docker concepts with advanced real-world workflows.

The project is divided into **two sessions**:

- **Session 1:** Core Docker Container Operations – Lifecycle management, interactivity, persistence, and cleanup using the official Ubuntu image.
- **Session 2:** Advanced Docker – Building a custom Node.js web application image with **Dockerfile** and orchestrating a multi-container stack (Node.js app + MongoDB + Mongo Express) using **Docker Compose**.

This hands-on approach demonstrates end-to-end containerized application development and deployment.

---

## 2. Project Objectives

- Master Docker container lifecycle and management
- Build custom Docker images from scratch
- Orchestrate multi-container applications with Docker Compose
- Implement environment variable management and secret handling
- Demonstrate persistent data storage using MongoDB
- Expose services securely and verify functionality

---

## 3. Prerequisites

- Docker Engine/Desktop installed
- Basic knowledge of Linux commands and Node.js
- Text editor (nano/VS Code)
- AWS EC2 instance (Ubuntu) with Docker and Docker Compose installed (for deployment demo)
- Internet access

---

# Session 1: Core Container Operations

### Step 1: View Existing Containers

List all containers (running and stopped) to check for previous Ubuntu instances.

**Command:**
```bash
docker ps -a
```

📷
![View existing containers](./img/1.docker_ps_-a_to_see_container_of_ubuntu_image_we_previously_ran(docker_run_ubuntu).png)

---

### Step 2: Start a Stopped Container

Restart an existing stopped container using its ID.

**Command:**
```bash
docker start <container_id>
```

📷
![Start stopped container](./img/2.we_can_start_the_container_back_with_docker_start_CONTAINER_ID.png)

---

### Step 3: Run Container with Advanced Options

Demonstrate environment variables, volume mounts, and port mappings.

**Examples:**
```bash
docker run -e VAR=value ubuntu env
docker run -v /host/path:/container/path ubuntu ls /container/path
docker run -p 8080:80 nginx
```

📷
![Run with options](./img/3.we_can_run_containers_back_with_different_options_like_-e_-v_-p.png)

---

### Step 4: Run Container in Detached Mode

Run a container in the background.

**Command:**
```bash
docker run -d --name detached-ubuntu ubuntu sleep infinity
```

📷
![Detached mode](./img/4.we_can_also_run_ubuntu_container_in_background_with_-d.png)

---

### Step 5: Start Container by Name

Start a container using its assigned name.

**Command:**
```bash
docker start <container_name>
```

📷
![Start by name](./img/5.we_can_also_start_containers_with_their_names.png)

---

### Step 6: Stop Container by Name

Gracefully stop a running container.

**Command:**
```bash
docker stop <container_name>
```

📷
![Stop by name](./img/6.we_can_stop_container_with_container_name.png)

---

### Step 7: Restart Container by Name

Restart a container (stop + start).

**Command:**
```bash
docker restart <container_name>
```

📷
![Restart by name](./img/7.we_can_restart_container_with_container_name.png)

---

### Step 8: Remove a Container

Delete a stopped container and verify removal.

**Commands:**
```bash
docker rm <container_name>
docker ps -a
```

📷
![Remove container](./img/8.we_can_also_remove_container_and_check_with_docker_ps_-a.png)

---

### Step 9: Pull the Ubuntu Image

Download the latest Ubuntu image from Docker Hub.

**Command:**
```bash
docker pull ubuntu:latest
```

📷
![Pull Ubuntu image](./img/9.pulling_ubuntu_image_from_docker_hub.png)

---

### Step 10: Run Ubuntu in Interactive Mode

Start an interactive Bash session with a named container.

**Command:**
```bash
docker run -it --name my-ubuntu ubuntu bash
```

📷
![Interactive mode](./img/10.run_ubuntu_in_interactive_mode-bash.png)

---

### Step 11: Verify OS Information

Confirm the container is running Ubuntu.

**Command:**
```bash
cat /etc/os-release
```

📷
![OS release](./img/11.check_ubuntu_os-release.png)

---

### Step 12: Navigate File System

Check current directory and list contents.

**Commands:**
```bash
pwd
ls -la
```

📷
![pwd and ls](./img/12.pwd_and_ls_inside_the_ubuntu.png)

---

### Step 13: Create and Enter Directory

Create and navigate into a new directory.

**Commands:**
```bash
mkdir my-folder
cd my-folder
pwd
```

📷
![Create directory](./img/13.mkdir_my-folder_then_cdmy-folder.png)

---

### Step 14: Create and View File

Write content to a file and display it.

**Commands:**
```bash
echo "Hello from Docker!" > file1.txt
cat file1.txt
```

📷
![Create file](./img/14.write_to_file-txt_using_echo_then_cat_the_content.png)

---

### Step 15: Delete Directory

Return to root and remove the directory.

**Commands:**
```bash
cd /
rm -r my-folder
```

📷
![Delete directory](./img/15.go_back_to_root_folder_and_delete_my-folder_created.png)

---

### Step 16: Create Persistence Test File

Create a file to test persistence.

**Commands:**
```bash
echo "This will survive restart" > file2.txt
cat file2.txt
```

📷
![Create file2](./img/16.write_to_file2-txt_and_cat_the_file(Check_after_restart).png)

---

### Step 17: Exit the Container

Exit the interactive shell.

**Command:**
```bash
exit
```

📷
![Exit shell](./img/17.exit_ubuntu_shell.png)

---

### Step 18: Confirm Container Stopped

Verify container is no longer running.

**Command:**
```bash
docker ps
```

📷
![Confirm stopped](./img/18.run_docker_ps_to_confirm_if_container_is_stopped.png)

---

### Step 19: Restart and Reattach

Restart the container and re-enter the session.

**Commands:**
```bash
docker start my-ubuntu
docker attach my-ubuntu
```

📷
![Restart and attach](./img/19.restart_ubuntu_container_and_attach_to_go_back.png)

---

### Step 20: Verify File Persistence

Confirm the file from previous session still exists.

**Commands:**
```bash
ls
cat file2.txt
```

📷
![File persists](./img/20.ls_to_confirm_file2-txt_created_in_last_session_still_exist.png)

---

### Step 21: Exit Again and Confirm Stopped

Exit and verify container state.

**Commands:**
```bash
exit
docker ps
```

📷
![Final exit and confirm](./img/21.exit_and_confirm_the_container_is_stopped.png)

---

### Step 22: List All Containers Before Cleanup

View all containers including stopped ones.

**Command:**
```bash
docker ps -a
```

📷
![List all containers](./img/22.list_all_containers_including_stopped_ones(docker_ps_-a).png)

---

### Step 23: Remove the Container

Permanently delete the container.

**Commands:**
```bash
docker rm my-ubuntu
docker ps -a  # Verify removal
```

📷
![Remove container](./img/23.docker_rm_my-ubutu_to_remove_container.png)

---


# Session 2: Building & Orchestrating a Custom Node.js Application

This session implements a full-stack profile editor application using:
- Custom Docker image (Node.js + Express)
- MongoDB for persistent storage
- Mongo Express for database admin UI
- Docker Compose for orchestration

18. **Create Project Folder (NodeJS_Demo_Application_-_Custom_Image) and LS It to Confirm**  
    Create project directory:  
    `mkdir "NodeJS Demo Application - Custom Image" && ls`

    ![18.create_project_folder(NodeJS_Demo_Application_-_Custom_Image)_and_ls_it_to_confirm.png](img/18.create_project_folder(NodeJS_Demo_Application_-_Custom_Image)_and_ls_it_to_confirm.png)

19. **Navigate into the Project Folder (NodeJS_Demo_Application_-_Custom_Image)**  
    `cd "NodeJS Demo Application - Custom Image"`

    ![19.navigate_into_the_project_folder(NodeJS_Demo_Application_-_Custom_Image).png](img/19.navigate_into_the_project_folder(NodeJS_Demo_Application_-_Custom_Image).png)

20. **MKDIR App to Create App Folder Then CD into App Folder**  
    `mkdir app && cd app`

    ![20.mkdir_app_to_create_app_folder_then_cd_into_app_folder.png](img/20.mkdir_app_to_create_app_folder_then_cd_into_app_folder.png)

21. **In App Create Images Folder and CD into It**  
    `mkdir images && cd images`

    ![21.in_app_create_images_folder_and_cd_into_it.png](img/21.in_app_create_images_folder_and_cd_into_it.png)

22. **On the Host System Upload an Image to Project Images Folder Using SCP**  
    From local machine:  
    `scp -i your-key.pem profile-1.jpg ubuntu@ec2-ip:~/NodeJS\ Demo\ Application\ -\ Custom\ Image/app/images/`

    ![22.on_the_host_system_upload_an_image_to_project_images_folder_using_scp.png](img/22.on_the_host_system_upload_an_image_to_project_images_folder_using_scp.png)

23. **In Image Folder LS to Confirm That Image Is Successfully Uploaded**  
    `ls`

    ![23.in_image_folder_ls_to_confirm_that_image_is_successfully_uploaded.png](img/23.in_image_folder_ls_to_confirm_that_image_is_successfully_uploaded.png)

24. **From Image Folder CD Back One Step to App Folder**  
    `cd ..`

    ![24.from_image_folder_cd_back_one_step_to_app_folder.png](img/24.from_image_folder_cd_back_one_step_to_app_folder.png)

25. **Nano index.html Then Add Code Save and Exit**  
    Create and populate the frontend HTML file.

    ![25.nano_index-html_then_add_code_save_and_exit.png](img/25.nano_index-html_then_add_code_save_and_exit.png)

26. **Nano server.js Then Add Code Save and Exit**  
    Create the Express backend server code.

    ![26.nano_server-js_then_add_code_save_and_exit.png](img/26.nano_server-js_then_add_code_save_and_exit.png)

27. **Initialize the Project Folder (Install Node and NPM If You Don't Have and Then Initialize)**  
    Install Node.js if needed, then:  
    `npm init -y`

    ![27.initialize_the_project_folder_(install_node_and_npm_if_you_dont_have_and_then_initialize).png](img/27.initialize_the_project_folder_(install_node_and_npm_if_you_dont_have_and_then_initialize).png)

28. **Install the Packages (express, body-parser, mongodb)**  
    `npm install express body-parser mongodb`

    ![](./img/28.install_the_pacages\(express_bodyParser_mongodb.png)

29. **LS App Folder Cat package.json to Confirm Packages**  
    Verify installed dependencies:  
    `ls && cat package.json`

    ![29.ls_app_folder_cat_package-json_to_confirm_packages.png](img/29.ls_app_folder_cat_package-json_to_confirm_packages.png)

30. **Navigate Back to the Project Folder**  
    `cd ..`

    ![30.navigate_back_to_the_project_folder.png](img/30.navigate_back_to_the_project_folder.png)

31. **Nano .env Then Add Environment Variables Save and Exit**  
    Create `.env` with MongoDB credentials (e.g., `MONGO_USER=admin`, `MONGO_PASSWORD=password`).

    ![31.nano_-env_then_add_environment_variables_save_and_exit.png](img/31.nano_-env_then_add_environment_variables_save_and_exit.png)

32. **Nano .gitignore Then Add What to Ignore Save and Exit**  
    Add `node_modules/`, `.env`, etc., to `.gitignore`.

    ![32.nano_-gitignore_then_add_what_to_ignore_save_and_exit.png](img/32.nano_-gitignore_then_add_what_to_ignore_save_and_exit.png)

33. **Nano Dockerfile and Add Commands**  
    Write the Dockerfile to build the Node.js image.

    ![33.nano_Dockerfile_and_add_commands.png](img/33.nano_Dockerfile_and_add_commands.png)

34. **Build Image Using Docker Build -t node-app:1.0**  
    `docker build -t node-app:1.0 .`

    ![34.build_image_using_docker_build_-t_node-app-1-0.png](img/34.build_image_using_docker_build_-t_node-app-1-0.png)

35. **List Images to See the Created node-app:1.0**  
    `docker images`

    ![35.list_images_to_see_the_created_node-app-1-0.png](img/35.list_images_to_see_the_created_node-app-1-0.png)

36. **Nano docker-compose.yaml and Add Services and Their Data Save and Exit**  
    Define services: `my-app`, `mongodb`, `mongo-express`.

    ![36.nano_docker-compose-yaml_and_add_services_and_their_data_save_and_exit.png](img/36.nano_docker-compose-yaml_and_add_services_and_their_data_save_and_exit.png)

37. **Run Docker Compose --env-file .env Up -d**  
    `docker compose up -d`

    ![37.run_docker_compose--enve-file_up-_d.png](img/37.run_docker_compose--enve-file_up-_d.png)

38. **Docker PS to Check Containers Running**  
    `docker ps`

    ![38.docker_ps_to_check_containers_running.png](img/38.docker_ps_to_check_containers_running.png)

39. **Docker Logs to Check Node.js Application Logs**  
    `docker logs <my-app-container-name>`

    ![39.docker_logs_to_check_nodejsapplication_logs.png](img/39.docker_logs_to_check_nodejsapplication_logs.png)

40. **Navigate to Server EC2 Instance Security Group to Edit Inbound Rule**  
    In AWS Console, open the instance's security group.

    ![40.navigate_to_server_ec2_instance_security_group_to_edit_inbound_rule.png](img/40.navigate_to_server_ec2_instance_security_group_to_edit_inbound_rule.png)

41. **Add Two Rules to Accept Custom TCP Connections from Anywhere on Port 3000 and 8080 Then Save Rules**  
    Add rules: Type=Custom TCP, Port=3000 & 8080, Source=0.0.0.0/0.

    ![41._add_two_rules_to_accept_custom_TCP_connections_from_anywhere_on_port_3000_and_8080_then_save_rules..png](img/41._add_two_rules_to_accept_custom_TCP_connections_from_anywhere_on_port_3000_and_8080_then_save_rules..png)

42. **Visit the Public IP on Port 8080 to See Mongo Express**  
    http://ec2-public-ip:8080 → Login with credentials from `.env`.

    ![42.visit_the_public_ip_on_port_8080_to_see_mongo_express.png](img/42.visit_the_public_ip_on_port_8080_to_see_mongo_express.png)

43. **Create my-db Database**  
    In Mongo Express, create database `my-db`.

    ![43.create_my-db_database.png](img/43.create_my-db_database.png)

44. **Click on my-db and Create Users Collection**  
    Create collection `users`.

    ![44.click_on_my-db_and_create_users_collection.png](img/44.click_on_my-db_and_create_users_collection.png)

45. **Visit the Public IP on Port 3000 to See the Application**  
    http://ec2-public-ip:3000 → Profile editor loads.

    ![45.visit_the_public_ip_on_port_3000_to_see_the_application.png](img/45.visit_the_public_ip_on_port_3000_to_see_the_application.png)

46. **Edit and Update Profile Then Reload to See If Change Is Persistent Across Reload**  
    Edit fields, save, reload page → Data persists (stored in MongoDB).

    ![46.edit_and_update_profile_then_reload_to_see_if_change_is_persistent_across_reload.png](img/46.edit_and_update_profile_then_reload_to_see_if_change_is_persistent_across_reload.png)
