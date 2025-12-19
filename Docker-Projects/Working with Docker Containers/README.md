
# 🐳 Working with Docker Containers: Hands-On Project Report

**Date: December 19, 2025**

## 1. Introduction

Containerization is a foundational technology in modern DevOps, enabling consistent, isolated, and portable application environments. Docker containers package applications with their dependencies, ensuring identical behavior across development, testing, and production.

This project provides a comprehensive, step-by-step hands-on exploration of Docker container management using the official **Ubuntu** image. Each screenshot corresponds to a specific command or action, demonstrating real terminal output and container behavior.

The focus is on practical command-line operations, container lifecycle, interactivity, persistence, and cleanup.

---

## 2. Project Objectives

- Master the Docker container lifecycle
- Execute containers in interactive, detached, and configured modes
- Manage containers using names and IDs
- Perform file system operations inside containers
- Demonstrate data persistence across container restarts
- Apply best practices for stopping, restarting, and removing containers

---

## 3. Prerequisites

- Docker Engine installed and running
- Basic Linux command-line knowledge
- Internet access to pull images from Docker Hub
- Terminal access

---

## 4. Project Workflow and Implementation

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

## 5. Key Learning Outcomes

- Complete understanding of container lifecycle: create → run → stop → restart → remove
- Proficiency in interactive and detached modes
- Effective container management using names and IDs
- Hands-on file system operations and persistence verification
- Importance of cleanup for resource management

---

## 6. Conclusion

This project delivers a thorough, sequential introduction to Docker container operations through 23 clearly documented steps. Each command is paired with real terminal output, making the learning process visual, reproducible, and practical.

Mastering these fundamentals is essential for DevOps, DevSecOps, cloud engineering, and cybersecurity roles involving containerized environments.

**Recommended Next Steps:**
- Explore Docker volumes for true persistent storage
- Build custom images using Dockerfile
- Manage multi-container apps with Docker Compose
- Implement container networking and security best practices

This hands-on experience forms a solid foundation for advanced container technologies.
