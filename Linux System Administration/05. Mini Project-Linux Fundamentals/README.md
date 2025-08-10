

# Mini Project - Linux Fundamentals

## Introduction

In the dynamic landscape of technology, mastering the fundamentals is essential for anyone aspiring to excel in fields such as **DevOps**, **Cloud Computing**, **Software Development**, **Cybersecurity**, **Data Analysis/Science**, **AI**, and **QA Testing**. This project is designed to equip you with a solid foundation in **Linux**. Understanding the tech from the basics lays the groundwork for success in various tech-centric careers.

---

## Project Overview

This project guides you through the process of creating, configuring, and managing an AWS EC2 instance running a Linux-based operating system (Ubuntu). The project covers launching an EC2 instance, connecting to it via SSH using MobaXterm, performing basic Linux operations, and setting up a web server using Nginx. Each step is documented with detailed explanations and linked screenshots for clarity.

---

## Project Objectives

- Learn how to create and manage an AWS EC2 instance.  
- Understand SSH connectivity using a key pair and MobaXterm.  
- Perform basic Linux commands for package management and system configuration.  
- Install, configure, and uninstall Nginx to host a simple web server.  
- Demonstrate the ability to troubleshoot and verify configurations.  

---

## Tools and Technologies

- **AWS EC2**: Cloud computing service for launching virtual servers.  
- **Ubuntu**: Linux distribution used as the operating system for the EC2 instance.  
- **MobaXterm**: Terminal emulator for SSH connections to the EC2 instance.  
- **Nginx**: Lightweight web server for hosting a default webpage.  
- **UFW**: Uncomplicated Firewall for managing firewall rules.  
- **Linux Commands**: Tools like `apt`, `tree`, and `systemctl` for system management.

---

## Prerequisites

- An active AWS account with access to the AWS Management Console.  
- MobaXterm (Home Edition) installed on your local machine.  
- Basic understanding of Linux commands and SSH.  
- A web browser to verify the Nginx webpage.  

---


## Setting the Context

In this section, we will create a server in the cloud, and gain access to it from our local environment.  
When we say **"local environment"**, we are referring to your **laptop or desktop PC**, which in most cases runs **Windows** or **MacOS**.  
Then, you will connect to that server in the cloud **remotely**, directly from your laptop.

---

## Step-by-Step Instructions

### 1. Create an AWS Account
Provide your email, password, and payment details to complete the setup.  

![AWS Account Creation](./img/1.awscreation.png)

### 2. Register for AWS  
Fill out the required contact and billing info to activate your account.  

![Register AWS](./img/2.register.png)

### 3. Sign in to AWS  
Use your credentials to access the AWS Management Console.  

![Sign In](./img/3.awssignin.png)

### 4. Access AWS Management Console  
Explore services provided by AWS including EC2.  

![AWS Console](./img/4.awsconsole.png)

### 5. Navigate to EC2 Service  
Search for and click the EC2 service.  

![EC2 Service](./img/5.ec2.png)

### 6. View EC2 Instances  
Check if any EC2 instances are currently running.

![Instances View](./img/6.instances.png)

### 7. Launch a New EC2 Instance  
Click “Launch Instance” to begin.  

![Launch Instance](./img/7.launchinstances.png) 

### 8. Name Server and Select OS  
Name the instance (e.g., “Linux Server”) and choose **Ubuntu 20.04 LTS**.  

![Name Server and OS](./img/8.NameServerAndOSImage.png)

### 9. Select Machine Image and Instance Type  
Use t2.micro (Free Tier eligible).  

![Select Instance](./img/9.MachineImageAndInstanceType.png)

### 10. Create or Select a Key Pair  
Create or reuse a key for secure SSH. 

![Create Key Pair](./img/10.CreateOrSelectKeyPair.png)

### 11. Name Key, Choose Encryption, Download  
Download the `.pem` file and save securely.  

![Download Key](./img/11.NameKeyChooseEncryprionAndDownload.png)

### 12. Configure Network and Firewall Settings  
Allow SSH (port 22) access.  

![Network & Firewall](./img/12.Networkand%20FirewallSetting.png)

### 13. Configure Storage  
Set root volume size (e.g., 8 GB, SSD).  

![Storage Settings](./img/13.ConfigureStorage.png)

### 14. Launch Instance  
Review and launch the instance.  

![Launch Review](./img/14.InitiatedLaunchofInstanceAndConnect.png)

### 15. View Connection Parameters  
Get public IP and SSH command from dashboard.  

![Connection Parameters](./img/15.ConnectionParameters.png)

### 16. Verify Instance Running  
Check instance status.  

![Instance Running](./img/16.SeeInstance.png)

### 17. Review Running Instance Summary  
Check instance details.  

![Instance Summary](./img/17.RunningInstanceSummary.png)

---

## Connect to the Instance
_**Note**: We are using Mobaxterm for windows users and default terminal for Linux and MacOS users_
### 18. Visit MobaXterm Website  (For Windows User Only)
Download MobaXterm for SSH access.  

![MobaXterm Webpage](./img/19.MobaXtermWebPage.png)

### 19. Download MobaXterm  
Click to download installer.  

![Download MobaXterm](./img/20.DownloadMobaXtermNow.png)

### 20. Select MobaXterm Home Edition  
Choose free version (Home Edition).  

![Home Edition](./img/21.MobaHomeEdition.png)

### 21. Launch MobaXterm and Start Terminal  
Open a terminal session.  

![Start Terminal](./img/22.LaunchMobaAndStartTerminal.png)

### 22. Navigate to Key Pair  
Use `chmod 400 key.pem`.  

![Key Location](./img/23.NavigateToKeyPairLocation.png)

### 23. Extract Instance Public IP  
Copy from AWS EC2 dashboard.  

![Copy Public IP](./img/24.ExtractInstancePublicIP.png)

### 24. Run SSH Command  
```bash
ssh -i path/to/key.pem ubuntu@<public-ip>
```  
![SSH Command](./img/25.RunCommandtoConnect.png)

---

## Perform Linux Operations

### 25. Check Hostname and Update  
```bash
hostname  
```  
![Hostname](./img/26.CheckhostnameAndUpdate.png)

### 26. Install Tree  
```bash
sudo apt install tree
```  
![Install Tree](./img/27.InstallTree.png)

### 27. Verify Tree Installation  
```bash
tree /Downloads
```  
![Verify Tree](./img/28.CheckTree.png)

### 28. Update System  
```bash
sudo apt upgrade 
```  
![Update Packages](./img/29.UpdatePackages.png)

### 29. Remove Tree  
```bash
sudo apt remove tree
```  
![Remove Tree](./img/30.RemoveTree.png)

---

## Set Up Web Server

### 30. Install Nginx  
```bash
sudo apt install nginx
```  
![Install Nginx](./img/31.InstallNginx.png)

### 31. Allow Nginx on UFW  
```bash
sudo ufw allow 'Nginx Full'  
sudo ufw enable
```  
![Allow UFW](./img/32.NginxAllowUFW.png)

### 32. Start and Enable Nginx  
```bash
sudo systemctl start nginx  
sudo systemctl enable nginx
```  
![Enable Nginx](./img/33.StartandEnableNginx.png)

### 33. Check Nginx status

![Nginx Default Page](./img/34.CheckNginxStatus.png)
---

### 34. Allow HTTP traffic via Instance Security Group

![Enable Nginx](./img/35.AllowHTTPTrafficViaAWSConsole.png)

### 35. Visit the Nginx default page using instance Pulic IP

![Enable Nginx](./img/36.NginxDefaultPage.png)

### 36. Uninstall Nginx

![Uninstall Nginx](./img/37.UninstallNginx.png) 

### 37. Site stop working

![Enable Nginx](./img/38.SiteStopWorking.png)

## Conclusion

This project has walked you through the core concepts of Linux administration in a cloud environment, using AWS EC2 and basic tools like MobaXterm and Nginx. Mastering these skills will help you transition into roles in **cloud computing**, **cybersecurity**, and other IT-focused disciplines.

## 📁 GitHub Repository Validation

🔗 Repository URL: [DevOps Projects GitHub Repo](https://github.com/Oluwaseunoa/DevOps-Projects)