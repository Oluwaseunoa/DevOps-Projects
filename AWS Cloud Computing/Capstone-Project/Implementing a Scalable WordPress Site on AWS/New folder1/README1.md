

# **Project Documentation: Scalable WordPress Deployment on AWS**

## **1. Project Title & Objective**

**Title:** Scalable WordPress Deployment on AWS

**Objective:**

* Deploy WordPress in a highly available, fault-tolerant architecture using AWS.
* Use RDS MySQL as a backend database.
* Use EFS for shared storage across multiple EC2 instances.
* Load balance traffic via an Application Load Balancer.
* Implement Auto Scaling for dynamic capacity.
* Enable HTTPS via ACM certificate.

---

## **2. Architecture Diagram**

*![](./img/1.full-stack-wordpress.drawio.png)*

* **Tools:** Draw.io 

---

## **3. Infrastructure Setup**

### **3.1 CloudFormation Template Parameters**

| Parameter         | Description                  | Value                                                           |
| ----------------- | ---------------------------- | --------------------------------------------------------------- |
| KeyName           | EC2 Key Pair for SSH access  | <YOUR_KEY_PAIR>                                                 |
| DBName            | WordPress database name      | wordpress                                                       |
| DBUsername        | RDS master username          | admin                                                           |
| DBPassword        | RDS master password          | <YOUR_DB_PASSWORD>                                              |
| MinCapacity       | Minimum ASG instances        | 2                                                               |
| MaxCapacity       | Maximum ASG instances        | 4                                                               |
| DesiredCapacity   | Desired ASG instances        | 2                                                               |
| LatestAmiId       | AMI for EC2 instances        | `/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2` |
| ACMCertificateArn | Optional SSL certificate ARN | <YOUR_ACM_ARN>                                                  |

---

### **3.2 Stack Creation**

**Steps:**

1. **Navigate to CloudFormation Dashboard and Click Create Stack**
   - Go to the AWS Management Console
   - Search for "CloudFormation" and click on it
   - Click the **"Create stack"** button
   - ![Navigate to CloudFormation Dashboard](img/2.navigate_to_cloudformation_dashboard_and_click_create_stack.png)

2. **Choose Existing Template and Upload File Then Next**
   - Select **"Upload a template file"**
   - Click **"Choose file"** and select `wordpress-stack.yaml`
   - Click **"Next"**
   - ![Upload Template File](img/3.choose_existing_template_and_upload_file_then_next.png)

3. **Name Stack and Enter Database Credentials Then Scroll Down**
   - **Stack name and Database credentials**: Enter `scalable-wordpress-app` (or your preferred name), then `DBName`, `DBPassword`, and, `DBUsername`
   - ![Enter Stack Parameters](img/4.name_stack_and_enter_database_credentials_then_scroll_down.png)

4. **Select Keypair, Leave Everything at Default and Click Next**
   - Verify **KeyName** shows your selected EC2 key pair
   - Leave all other settings at default
   - Click **"Next"**
   - ![Configure Stack Options](img/5.select_keypair_leave_everyrting_at_default_and_click_next_.png)

5. **Acknowledge AWS CloudFormation IAM Resources Warning and Next**
   - AWS will show a warning about IAM resources being created. Check both box and click **"Next"**
   - ![Acknowledge IAM Capabilities](img/6.acknowledge_AWS_CloudFormation_IAM_resources_warning_and_next.png)

6. **Leave Everything at Default and Submit**
   - Review the stack details
   - Leave all settings at default
   - Click **"Submit"** or **"Create stack"**
   - ![Review and Create Stack](img/7.leave_everything_at_default_and_submit.png)

7. **Monitor Stack Creation Progress**
   - The stack creation will begin
   - Monitor the **Events** tab for progress
   - Status will change from **CREATE_IN_PROGRESS** to **CREATE_COMPLETE**
   - This typically takes **15-30 minutes**
   - ![Stack Creation in Progress](img/8.creation_now_in_progress.png)

8. **Verify Stack Creation Success**
   - Once complete, the stack status shows **CREATE_COMPLETE**
   - Click on your stack name to view **Outputs**
   - Key outputs to note:
     | Output | Description |
     |--------|-------------|
     | **LoadBalancerDNS** | Temporary ALB URL for testing |
     | **WebsiteURL** | Final HTTPS URL (`https://yourdomain.com`) |
     | **DatabaseEndpoint** | RDS MySQL endpoint |
     | **EFSFileSystemId** | EFS file system ID |

   - ![Creation complete, see outputs](img/9.stack_creation_complete_click_to_see_outputs_tab.png)
---

## **4. WordPress Configuration**

### **4.1 wp-config.php**

**Database Connection Settings:**

```php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'admin' );
define( 'DB_PASSWORD', 'Password1!' );
define( 'DB_HOST', '<RDS_ENDPOINT>' ); // e.g., scalable-wordpress-app-wordpressdb-t9p5cfbu6ixc.c1g2koy0ijck.us-east-2.rds.amazonaws.com
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

/* SSL Settings */
define('FORCE_SSL_ADMIN', true);
if(isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
  $_SERVER['HTTPS'] = '1';
}
```

**Screenshot:**

* Open `wp-config.php` showing DB and SSL settings.

---

### **4.2 Verify EFS Mount**

**Command:**

```bash
df -h | grep efs
```

**Expected Output:**

```
fs-xxxxxxxxxxxx.efs.us-east-2.amazonaws.com:/  8.0E  0  8.0E  0% /var/www/html
```

**Screenshot:** Terminal showing EFS mounted at `/var/www/html`.

---

## **5. Testing & Validation**

### **5.1 Access Website**

* Open the ALB DNS in a browser:

  ```
  http(s)://<ALB_DNS>
  ```
* Screenshot of the WordPress setup page.

### **5.2 Load Balancing Test**

* Stop one EC2 instance in the ASG.
* Refresh the website, confirm it is still available.
* Screenshot of browser showing site live.

### **5.3 Auto Scaling Test**

* Generate CPU load (optional):

  ```bash
  sudo yum install -y stress
  stress --cpu 2 --timeout 600
  ```
* Confirm ASG launches additional EC2 instances.
* Screenshot: ASG activity scaling up.

### **5.4 Database Connection Test**

* From EC2:

  ```bash
  mysql -h <RDS_ENDPOINT> -u <DB_USER> -p
  ```
* Screenshot: successful connection to RDS.

---

## **6. Security Validation**

* Check security groups:

  * ALB → EC2: HTTP/HTTPS
  * EC2 → RDS: MySQL
  * EC2 → EFS: NFS (2049)
* Screenshot: AWS Security Group rules.

---

## **7. Backup & Persistence**

* **RDS:** Confirm automated backups enabled. Screenshot.
* **EFS:** Create a test file on one EC2 instance, terminate instance, verify file persists via another EC2. Screenshot.

---

## **8. Outputs / Final Verification**

* **ALB DNS:** `http(s)://<ALB_DNS>`
* **WordPress Admin Login:** `/wp-admin`
* **RDS Endpoint:** `<RDS_ENDPOINT>`
* **EFS ID:** `<EFS_ID>`

**Screenshots:**

* Website homepage
* Admin dashboard
* CloudFormation outputs

---

## **9. Conclusion**

* Summary of what was built.
* Lessons learned.
* Possible improvements:

  * Enable CloudFront CDN for better performance
  * Enable Multi-AZ RDS for HA
  * Add WAF or security rules

---

### **Tips for Screenshots**

1. Use **AWS Console screenshots** for VPC, EC2, RDS, EFS, ALB, and ASG.
2. Use **terminal screenshots** for commands like `df -h`, `mysql`, `ping`, `curl`.
3. Annotate screenshots using arrows or boxes to highlight key info.

---


