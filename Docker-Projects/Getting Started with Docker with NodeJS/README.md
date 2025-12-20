# Getting Started with Docker and Node.js: A Comprehensive Hands-On Project

  
**Author:** Oluwaseun Osunsola  
**LinkedIn:** https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/      
**Environment & Tool:** AWS, Docker, Docker Compose, Dockerfile   
**Project Link:** https://github.com/Oluwaseunoa/DevOps-Projects/tree/main/Docker-Projects  

**Project Overview**   
This comprehensive guide walks you through installing Docker on an AWS EC2 Ubuntu instance, mastering fundamental Docker commands, building a custom Docker image for a Node.js application, and orchestrating a multi-container setup using Docker Compose. The application is a full-stack user profile editor built with Express.js, connected to MongoDB for persistent storage, and includes Mongo Express as a web-based admin interface.

By the end of this tutorial, you will have:
- A running Dockerized Node.js web application accessible publicly.
- Persistent data storage in MongoDB.
- Hands-on experience with Docker fundamentals, image building, and container orchestration.
- Understanding of networking, security groups, and environment variable management in containerized environments.

**Target Audience:** Beginners to intermediate learners in DevOps, Docker, Node.js, and cloud deployment (AWS EC2).


## Prerequisites

Before starting:
- An active AWS account.
- Basic familiarity with the Linux terminal, SSH, and AWS EC2.
- A local machine with SSH client and SCP support.
- A profile picture (JPG format) to upload for the application demo.

## Detailed Step-by-Step Guide

The following steps are executed in sequence on the Ubuntu EC2 instance (except where noted). Each step includes a brief explanation, the commands used (where applicable), and a screenshot reference.

1. **Launch Ubuntu Server**  
   Launch a new EC2 instance running Ubuntu Server (e.g., 22.04 LTS). Select an appropriate instance type (t2.micro is sufficient for this demo), configure a key pair for SSH access, and ensure the security group allows inbound SSH (port 22).

   ![1.launched_ubuntu_sever.png](img/1.launched_ubuntu_sever.png)

2. **Connect to the Ubuntu Server via SSH**  
   From your local machine, connect using:  
   `ssh -i /path/to/your-key.pem ubuntu@ec2-public-ip`

   ![2.connect_to_the_ubuntu_server_via_ssh.png](img/2.connect_to_the_ubuntu_server_via_ssh.png)

3. **Update the Server**  
   Update package lists and upgrade installed packages:  
   `sudo apt update && sudo apt upgrade -y`

   ![3.update_the_server.png](img/3.update_the_server.png)

4. **Install Required Packages**  
   Install prerequisites for adding the Docker repository:  
   `sudo apt install ca-certificates curl gnupg lsb-release -y`

   ![4,install_required_package.png](img/4,install_required_package.png)

5. **Create Docker Keyring**  
   Create directory for Docker's GPG key:  
   `sudo mkdir -p /etc/apt/keyrings`

   ![5.create_docker_keyring.png](img/5.create_docker_keyring.png)

6. **Add Official Docker GPG Key**  
   Download and add Docker's official GPG key:  
   `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`

   ![6.add_official_docker_GPG_key.png](img/6.add_official_docker_GPG_key.png)

7. **Add Official Docker Repository**  
   Add the Docker APT repository:  
   `echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`

   ![7.add_official_docker_repository.png](img/7.add_official_docker_repository.png)

8. **Install Docker Engine**  
   Update packages and install Docker Engine and Compose plugin:  
   `sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y`

   ![8.install_docker_engine.png](img/8.install_docker_engine.png)

9. **Verify Docker Installation**  
   Check Docker version:  
   `docker --version`

   ![9.verify_docker_installation.png](img/9.verify_docker_installation.png)

10. **Run Docker Without Sudo**  
    Add current user to Docker group:  
    `sudo usermod -aG docker $USER`  
    Log out and back in for changes to take effect.

    ![10.run_docker_without_sudo.png](img/10.run_docker_without_sudo.png)

11. **Running the First Container (Hello World)**  
    Test Docker with a simple container:  
    `docker run hello-world`

    ![11.Running_the_First Container_(Hello_World).png](img/11.Running_the_First Container_(Hello_World).png)

12. **Verify Images (docker images)**  
    List locally available images:  
    `docker images`

    ![12.verify_images(docker_images).png](img/12.verify_images(docker_images).png)

13. **List Running Containers (docker ps)**  
    Show currently running containers:  
    `docker ps`

    ![13.list_running_containers_(docker_ps).png](img/13.list_running_containers_(docker_ps).png)

14. **List Both Running and Stopped Containers (docker ps -a)**  
    Show all containers (running and stopped):  
    `docker ps -a`

    ![14.list_both_running_and_stopped_containers_(docker_ps_-a).png](img/14.list_both_running_and_stopped_containers_(docker_ps_-a).png)

15. **Stop a Container Using Its Container ID**  
    Stop a running container:  
    `docker stop <container_id>`

    ![15.stop_a_container_using_ts_container_ID.png](img/15.stop_a_container_using_ts_container_ID.png)

16. **Pull an Ubuntu Image**  
    Download the official Ubuntu image:  
    `docker pull ubuntu`

    ![16.pull_an_ubuntu_image.png](img/16.pull_an_ubuntu_image.png)

17. **Delete Image Using Its Image ID**  
    Remove an image:  
    `docker rmi <image_id>`

    ![17.delete_image_using_its_image_id.png](img/17.delete_image_using_its_image_id.png)

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

## Key Learnings & Best Practices

- **Docker Fundamentals:** Images, containers, volumes, networking.
- **Custom Image Building:** Multi-stage or simple builds for Node.js apps.
- **Docker Compose:** Orchestrating multiple services with dependencies.
- **Environment Variables:** Secure handling via `.env` files.
- **Persistence:** MongoDB volume ensures data survives container restarts.
- **Security Considerations:** Restrict security group rules in production (avoid 0.0.0.0/0).

## Troubleshooting Tips

- Container restarting? Check logs: `docker compose logs my-app`.
- Connection refused? Verify security group ports and `docker ps`.
- DB not connecting? Ensure env vars are passed and MongoDB is healthy.
- Image build issues? Use `--no-cache` flag.

## Conclusion

This project provides a complete, real-world introduction to containerization with Docker. You now have a deployable full-stack application running on cloud infrastructure. Extend this further by adding authentication, CI/CD pipelines, or deploying to Kubernetes.

Congratulations on completing the tutorial! Your Dockerized Node.js + MongoDB application is live and production-ready for demo purposes.