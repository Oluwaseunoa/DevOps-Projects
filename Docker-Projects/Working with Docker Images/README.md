

# 🐳 Working with Docker Images
**Author:** Oluwaseun Osunsola  
**Environment & Tools:** AWS, EC2 Ubuntu, Windows, and, VSCode    
**Project Link:** https://github.com/Oluwaseunoa/DevOps-Projects/tree/main/Docker-Projects

## 📌 Project Overview

This project demonstrates **hands-on work with Docker images**, starting from discovering images on Docker Hub, pulling official images, creating a **custom Docker image using a Dockerfile**, running containers, exposing applications via AWS EC2 security groups, and finally **pushing the custom image to Docker Hub** for reuse.

The project uses a simple **CV website (HTML)** served through **Nginx** as the custom Docker image use case.

---

## 🎯 Objectives

* Explore and understand Docker images
* Pull official images from Docker Hub
* Create a custom Docker image using a Dockerfile
* Run and manage containers
* Configure AWS EC2 Security Groups
* Push Docker images to Docker Hub
* Reuse images via pull commands

---

## 🧰 Tools & Technologies

* Docker
* Docker Hub
* Nginx
* AWS EC2
* Linux (Ubuntu)
* HTML
* Vim & Nano editors

---

## 🪜 Project Execution Steps

---

### **Step 1: Discover Docker Images from Docker Hub**

Search for available Ubuntu images on Docker Hub.

📸 Screenshot:
![Docker Search Ubuntu](./img/1.docker_search_ubuntu-discovering_and_exploring_docker_images_from_docker_hub\(ubuntu\).png)

---

### **Step 2: Pull the Ubuntu Image**

Pull the official Ubuntu image successfully from Docker Hub.

📸 Screenshot:
![Pull Ubuntu Image](./img/2.pulling_the_ubuntu_image_with\(OK\)_from_docker_hub.png)

---

### **Step 3: Confirm Pulled Images**

List Docker images to confirm that the Ubuntu image was pulled.

📸 Screenshot:
![Docker Images List](./img/3.docker_images_to_list_images_and_confirm_the_pulled_ubuntu_image.png)

---

### **Step 4: Plan Custom Image Creation**

Prepare to create a custom Docker image for a CV website using a Dockerfile.

📸 Screenshot:
![Custom Image Plan](./img/4.we_are_going_to_create_a_custom_image_of_this_cv_website_html_file_with_dockerfile.png)

---

### **Step 5: Create Dockerfile**

Open and edit the Dockerfile using Vim.

📸 Screenshot:
![Vim Dockerfile](./img/5.vim_Dockerfile_to_create_our_dockerfile.png)

---

### **Step 6: Dockerfile Code**

Add Dockerfile instructions and save the file.

📸 Screenshot:
![Dockerfile Code](./img/6.here_is_the_dockerfile_code_snippet_save_and_exit.png)

---

### **Step 7: Create HTML File**

Create the `index.html` file using Nano editor.

📸 Screenshot:
![Nano Index HTML](./img/7.nano_index_html_file.png)

---

### **Step 8: HTML Code**

Add website content to the HTML file and save.

📸 Screenshot:
![Index HTML Code](./img/8.here_is_index-html_file_code_save_and_exit.png)

---

### **Step 9: Build Docker Image**

Build the Docker image and tag it as `dockerfile`.

📸 Screenshot:
![Docker Build](./img/9.build_the_image_and_tag_it_as_dockerfile(docker_build_-t_dockerfile.).png)

---

### **Step 10: Confirm Image Creation**

List Docker images to verify successful creation.

📸 Screenshot:
![Confirm Image](./img/10.docker_images_to_confirm_dockerfile_image_is_successfully_created.png)

---

### **Step 11: Run Container**

Run a container from the custom Nginx image on port **8080**.

📸 Screenshot:
![Run Container](./img/11.run_container_based_on_the_custom_nginx_image_created_on_port\(8080\).png)

---

### **Step 12: Access EC2 Security Settings**

Navigate to the **Security** tab on the EC2 instance dashboard.

📸 Screenshot:
![EC2 Security Tab](./img/12.on_the_instance_dashboard_click_tab_name_Security_and_under_it_click_security_group.png)

---

### **Step 13: Edit Inbound Rules**

Edit inbound rules of the EC2 security group.

📸 Screenshot:
![Edit Inbound Rules](./img/13.on_the_sg_page_click_edit_inbound_rules.png)

---

### **Step 14: Add New Rule**

Add a new inbound rule.

📸 Screenshot:
![Add Rule](./img/14.click_add_new_rule.png)

---

### **Step 15: Allow Port 8080**

Allow **Custom TCP** traffic on port **8080** from anywhere.

📸 Screenshot:
![Allow Port 8080](./img/15.set_Custom_TCP_on_port_8080_from_anywhere_then_save_rules.png)

---

### **Step 16: Confirm Rule Update**

Inbound rule successfully modified.

📸 Screenshot:
![Inbound Rule Updated](./img/16.inbound_rule_successfully_modified.png)

---

### **Step 17: Stop & List Containers**

Stop the container and list all containers.

📸 Screenshot:
![Stopped Container](./img/17.ctr_c_and_docker_ps_-a_to_list_all_containers\(container_has_stopped\).png)

---

### **Step 18: Restart Container**

Restart container using its container ID.

📸 Screenshot:
![Start Container](./img/18.start_container_with_its_ID(a63543d3367e%20).png)

---

### **Step 19: Access Live Website**

Access the CV website using EC2 public IP and port **8080**.

📸 Screenshot:
![Live Website](./img/19.visit_the_live_website_using_instance_public_IP_on_port_8080.png)

---

## 🚀 Docker Hub Integration

---

### **Step 20: Sign in to Docker Hub**

Proceed to Docker Hub and sign in.

📸 Screenshot:
![Docker Hub Login](./img/20.procceed_to_docker_hub_website_and_sign_in\(sign_up_if_no_account\).png)

---

### **Step 21: Create Repository**

Click **Create Repository** after logging in.

📸 Screenshot:
![Create Repository](./img/21.logged_in_click_create_a_repository.png)

---

### **Step 22: Configure Repository**

Name the repository, describe it, set visibility, and create.

📸 Screenshot:
![Repository Setup](./img/22.name_repository_describe_it_set_visibilty_click_create.png)

---

### **Step 23: Repository Created**

Docker Hub repository created successfully.

📸 Screenshot:
![Repository Created](./img/23.repository_created.png)

---

### **Step 24: Tag Docker Image**

Tag the Docker image and confirm using `docker images`.

📸 Screenshot:
![Tag Image](./img/24.on_terminal_tag_the_image_of_the_dockerfile_and_confirm_with_docker_images.png)

---

### **Step 25: Generate Access Token**

Navigate to account settings and generate a personal access token.

📸 Screenshot:
![Generate Token](./img/25.go_to_account_settings_then_personal_access_token_the_click_generate_new_token.png)

---

### **Step 26: Configure Token**

Describe token, set expiration and permissions, then generate.

📸 Screenshot:
![Token Configuration](./img/26.describe_token_set_expiration_date_set_access_permission_then_click_generate.png)

---

### **Step 27: Save Token**

Save the generated token securely.

📸 Screenshot:
![Token Generated](./img/27.token_generated_save_before_closing_the_page_for_future_use.png)

---

### **Step 28: Docker Login via Terminal**

Log in to Docker Hub using username and access token.

📸 Screenshot:
![Docker Login](./img/28.on_the_terminal_log_in_to_docker\(docker_login_-u_oluwaseunoa\)_using_username_and_created_token.png)

---

### **Step 29: Push Image to Docker Hub**

Push the tagged Docker image.

📸 Screenshot:
![Docker Push](./img/29.push_the_tagged_image_to_docker.png)

---

### **Step 30: Verify Image Push**

Confirm successful image push on Docker Hub.

📸 Screenshot:
![Push Verified](./img/30.verify_the_successful_push_of_my-nginx_version_to_docker_hub.png)

---

### **Step 31: Copy Pull Command**

Copy the Docker pull command for reuse.

📸 Screenshot:
![Pull Command](./img/31.copy_pull_command.png)

---

## ✅ Conclusion

This project demonstrates the **complete lifecycle of Docker image management**, from exploration and creation to deployment and distribution. It reinforces best practices for Docker image handling, container management, cloud networking, and image sharing via Docker Hub.

---

## 📎 Repository Structure

```
.
├── Dockerfile
├── index.html
├── img/
│   ├── *.png
└── README.md
```

## Dockerfile Snippet
```yaml
# Use the official NGINX base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR /usr/share/nginx/html/

# Copy the local HTML fil to the NGINX default public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# No need for CMD as NGINX image comes with a default CMD to start the server

```











## index.html Snippet
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Professional CV - Cybersecurity, DevOps & DevSecOps Engineer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
        }
        header {
            text-align: center;
            padding: 20px;
            background-color: #007bff;
            color: white;
            border-radius: 8px;
        }
        h1, h2 {
            margin-bottom: 10px;
        }
        section {
            margin-bottom: 30px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        ul {
            list-style-type: disc;
            padding-left: 20px;
        }
        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }
        .skill-category {
            background: #e9ecef;
            padding: 15px;
            border-radius: 8px;
        }
        footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9em;
            color: #666;
        }
    </style>
</head>
<body>
    <header>
        <h1>Oluwaseun Osunsola</h1> 
        <p>Cybersecurity, DevOps & DevSecOps Engineer</p>
        <p>Email: oluwaseun.osunsola@example.com | Phone: (123) 456-7890 | LinkedIn: https://www.linkedin.com/in/oluwaseun-osunsola-95539b175 | Location: Lagos, Nigeria</p>
    </header>

    <section id="summary">
        <h2>Professional Summary</h2>
        <p>Dynamic and versatile engineer with expertise in Cybersecurity, DevOps, and DevSecOps. Holding a degree in Psychology, I bring a unique perspective on human behavior to enhance security practices. Currently pursuing a BSc in Computer Science at Afe Babalola University, I am passionate about integrating secure development lifecycles with efficient operations to protect and optimize digital infrastructures.</p>
    </section>

    <section id="education">
        <h2>Education</h2>
        <ul>
            <li><strong>BSc in Computer Science (In Progress)</strong><br>Afe Babalola University, Ado-Ekiti, Nigeria<br>Expected Graduation: 2028</li>
            <li><strong>BSc in Psychology</strong><br>Ekiti State University, Ado-Ekiti, Nigeria<br>Graduated: 2019</li> 
        </ul>
    </section>

    <section id="skills">
        <h2>Skillsets</h2>
        <div class="skills-grid">
            <div class="skill-category">
                <h3>Cybersecurity Skills</h3>
                <ul>
                    <li>Threat Detection & Response</li>
                    <li>Firewall Configuration (e.g., pfSense, Cisco ASA)</li>
                    <li>Intrusion Detection Systems (IDS) like Snort</li>
                    <li>Ethical Hacking & Penetration Testing (using Kali Linux, Metasploit)</li>
                    <li>Vulnerability Assessment (Nessus, OpenVAS)</li>
                    <li>Encryption & Cryptography (AES, RSA)</li>
                    <li>Security Information and Event Management (SIEM) with Splunk/ELK Stack</li>
                </ul>
            </div>
            <div class="skill-category">
                <h3>DevOps Skills</h3>
                <ul>
                    <li>CI/CD Pipelines (Jenkins, GitLab CI)</li>
                    <li>Containerization (Docker, Podman)</li>
                    <li>Orchestration (Kubernetes, Docker Swarm)</li>
                    <li>Infrastructure as Code (Terraform, Ansible)</li>
                    <li>Cloud Platforms (AWS, Azure, GCP)</li>
                    <li>Monitoring & Logging (Prometheus, Grafana, ELK Stack)</li>
                    <li>Version Control (Git, GitHub)</li>
                </ul>
            </div>
            <div class="skill-category">
                <h3>DevSecOps Skills</h3>
                <ul>
                    <li>Secure Code Review & Static Analysis (SonarQube)</li>
                    <li>Dynamic Application Security Testing (DAST) with OWASP ZAP</li>
                    <li>Integration of Security in CI/CD (Snyk, Checkmarx)</li>
                    <li>Compliance & Auditing (HIPAA, GDPR, PCI-DSS)</li>
                    <li>Secrets Management (HashiCorp Vault, AWS Secrets Manager)</li>
                    <li>Automated Security Testing in Pipelines</li>
                    <li>Shift-Left Security Practices</li>
                </ul>
            </div>
        </div>
    </section>

    <section id="experience">
        <h2>Professional Experience</h2>
        <ul>
            <li><strong>DevSecOps Engineer</strong><br>[Company Name], [Location]<br>[Dates]<br>- Implemented secure DevOps pipelines reducing vulnerabilities by 40%.<br>- Managed Kubernetes clusters with integrated security controls.</li>
            <li><strong>Cybersecurity Analyst</strong><br>[Company Name], [Location]<br>[Dates]<br>- Conducted penetration tests and remediated findings.<br>- Monitored network traffic for anomalies using SIEM tools.</li>
            <!-- Add more experiences or projects as needed; customize with your real details -->
        </ul>
    </section>

    <section id="certifications">
        <h2>Certifications</h2>
        <ul>
            <li>Certified Cybersecurity Technician (CCT)</li>
            <li>CompTIA Security+</li>
            <li>ISC2 CC</li>
        </ul>
    </section>

    <footer>
        <p>&copy; 2025 Oluwaseun Osunsola. All rights reserved.</p>
    </footer>
</body>
</html>

```