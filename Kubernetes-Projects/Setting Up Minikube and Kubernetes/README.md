# **Container Orchestration with Kubernetes using Minikube**

## 👤 Author

**Oluwaseun Osunsola**  
[LinkedIn](https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/)

---

# 🧩 **Project Overview**

This project demonstrates the setup and deployment of a local Kubernetes environment using **Minikube** and **Docker** on Ubuntu (VMware). It covers:

* Environment preparation
* Docker installation and validation
* Minikube cluster setup
* Kubernetes CLI (kubectl) usage
* Application deployment and exposure
* Scaling and self-healing demonstration

---

# 🎯 **Project Objectives**

By the end of this project:

* Understand Kubernetes architecture and components
* Deploy a local Kubernetes cluster using Minikube
* Build and run containerized applications
* Perform scaling and observe self-healing

---

# 🖥️ **System Requirements**

* CPU: ≥ 2 cores
* RAM: ≥ 2GB
* Disk: ≥ 20GB

---

# 🔷 **PHASE 1: System Verification**

Check available system resources:

```bash
nproc
free -h
df -h
```

![](./img/1.nproc_free-h-df-h_to_check_available_CPU_RAM_and_Disk_we_expect_2-2GB_18-20GB_respectively.png)

---

# 🔷 **PHASE 2: Install Docker**

### Step 1: Update package index

```bash
sudo apt-get update
```

![](./img/2.update_local_package_index_from_repo_listed.png)

---

### Step 2: Install required packages

```bash
sudo apt-get install ca-certificates curl gnupg
```

![](./img/3.install_ca-certificates_curl_gnup_packages.png)

---

### Step 3: Create keyring directory

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```

![](./img/4.install-m_0755-d_to_create_keyring_directory.png)

---

### Step 4: Add Docker GPG key

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

![](./img/5.download_docker_gpg_and_convert_it_to_binary_format.png)

---

### Step 5: Set permissions

```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

![](./img/6.make_gpg_key_file_readable_by_all_users.png)

---

### Step 6: Add Docker repository

```bash
echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

![](./img/7.add_docker_APT_to_system_source_list.png)

---

### Step 7: Update package index again

![](./img/8.update_local_package_index_from_repo_listed_again.png)

---

### Step 8: Install Docker

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

![](./img/9.install_docker_and_its_related_component.png)

---

### Step 9: Verify Docker

```bash
sudo systemctl status docker
```

![](./img/10.systemctl_to_verify_docker.png)

---

### Step 10: Add user to Docker group

```bash
sudo usermod -aG docker $USER
```

![](./img/11.add_current_user_to_docker_group.png)

---

### Step 11: Test Docker

```bash
docker run hello-world
```

![](./img/12.b_run_helloworld_to_test_docker.png)

---

### Step 12: Apply group changes

```bash
newgrp docker
```

![](./img/12.newgrp_docker_to_start_new_shell_with_docker_group.png)

---

# 🔷 **PHASE 3: Install Minikube**

### Step 1: Download Minikube

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
```

![](./img/13.download_minikube.png)

---

### Step 2: Install Minikube

```bash
sudo dpkg -i minikube_latest_amd64.deb
```

![](./img/14.install_minikube.png)

---

### Step 3: Verify installation

```bash
minikube version
```

![](./img/15.verify_minikube.png)

---

# 🔷 **PHASE 4: Install kubectl**

```bash
sudo snap install kubectl --classic
```

![](./img/16.install_kubectl_which_kubernetes_cli.png)

---

### Verify kubectl

```bash
kubectl version --client
```

![](./img/17.verify_kubectl_version.png)

---

# 🔷 **PHASE 5: Start Kubernetes Cluster**

### Step 1: Start Minikube

```bash
minikube start --driver=docker
```

![](./img/18.start_minikube_to_download_kubernetes.png)

---

### Step 2: Verify node

```bash
kubectl get nodes
```

![](./img/19.verify_cluster.png)

---

### Step 3: Check Minikube status

```bash
minikube status
```

![](./img/20.minikube_status_to_verify_status.png)

---

### Step 4: Cluster info

```bash
kubectl cluster-info
```

![](./img/21.kubectl_cluster-info_to_verify.png)

---

# 🔷 **PHASE 6: Deploy Application**

### Step 1: Create deployment

```bash
kubectl create deployment my-nginx --image=nginx
```

![](./img/22.create_nginx_deployment.png)

---

### Step 2: Verify deployment

```bash
kubectl get deployments
```

![](./img/23.get_deployments.png)

---

### Step 3: Check pods

```bash
kubectl get pods
```

![](./img/24.get_pods.png)

---

### Step 4: Describe pod

```bash
kubectl describe pod <pod-name>
```

![](./img/25.copy_pod_name_and_describe_pod_using_the_copied_name.png)

---

# 🔷 **PHASE 7: Expose Application**

### Step 1: Expose deployment

```bash
kubectl expose deployment my-nginx --type=NodePort --port=80
```

![](./img/26.expose_port_on_port_80.png)

---

### Step 2: Verify service

```bash
kubectl get services
```

![](./img/27.get_services_to_see_deployments.png)

---

### Step 3: Access application

```bash
minikube service my-nginx
```

![](./img/28.minikube_my-nginx_to_view_application.png)

---

### Step 4: Application in browser

![](./img/29.application_now_running_on_the_browser_using_IP_and_port.png)

---

# 🔷 **PHASE 8: Scaling & Self-Healing**

### Step 1: Scale application

```bash
kubectl scale deployment my-nginx --replicas=3
```

![](./img/30.scale_application.png)

---

### Step 2: Verify pods

```bash
kubectl get pods
```

![](./img/31.verify_the_3_pods.png)

---

### Step 3: Delete a pod

```bash
kubectl delete pod <pod-name>
```

![](./img/32.delete_one_of_the_pods.png)

---

### Step 4: Observe self-healing

```bash
kubectl get pods
```

![](./img/33.new_pod_is_now_created.png)

---

# 🧠 **Key Concepts Demonstrated**

* Containerization using Docker
* Kubernetes cluster setup with Minikube
* Deployment and management of Pods
* Service exposure using NodePort
* Horizontal scaling
* Self-healing (automatic pod recreation)

---

# 🏁 **Conclusion**

This project successfully demonstrates how Kubernetes orchestrates containerized applications by automating deployment, scaling, and recovery. Using Minikube enabled a local simulation of a production-like Kubernetes environment.

