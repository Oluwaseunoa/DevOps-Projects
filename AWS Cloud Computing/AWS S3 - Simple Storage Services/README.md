

# 📝Exploring Amazon S3 (Simple Storage Service)

**Author:** Oluwaseun Osunsola  
**Environment:** AWS  
**Project Link:** [GitHub Repository](https://github.com/Oluwaseunoa/DevOps-Projects/)

---

## Introduction

Amazon S3 (Simple Storage Service) is one of the most widely used services in AWS. It provides object storage through a web interface, enabling users to store and retrieve data at any scale. In this project, I will explore the fundamental concepts of S3, create and manage buckets, upload and secure objects, enable versioning, and implement lifecycle policies. This hands-on approach will strengthen my understanding of how cloud storage works and its role in real-world applications.

---

## Project Goals and Learning Outcomes

* Gain a strong understanding of S3 fundamentals: buckets, objects, permissions, versioning, and lifecycle management.
* Create, configure, and manage an S3 bucket using the AWS Management Console.
* Upload and manage data (objects) inside an S3 bucket.
* Explore versioning for tracking file changes.
* Secure an S3 bucket using IAM permissions and bucket policies.
* Implement lifecycle policies to optimize storage costs.
* Reflect on the practical applications of S3 for cloud computing and DevOps.

---

## What is S3?

Amazon Simple Storage Service (Amazon S3) is a scalable object storage service built for storing any type of data. It allows developers and businesses to store large amounts of unstructured data, such as documents, media files, and backups, and access them anytime over the internet. Unlike traditional storage, S3 is serverless, meaning AWS manages all infrastructure, scaling, and durability.

---

## Importance of S3

S3 is a cornerstone of AWS because:

* It provides **high durability (99.999999999%)** for stored objects.
* It is **infinitely scalable**, supporting growth without hardware concerns.
* It offers **secure and fine-grained access control** through IAM roles, policies, and encryption.
* It integrates with many AWS services like CloudFront, Lambda, and Athena.
* It is cost-effective, offering multiple storage classes for different use cases.
* It supports backup, disaster recovery, static website hosting, big data analytics, and application integration.

---

## Step-by-Step Execution

## 📌 Project Objectives
- Understand the fundamentals of Amazon S3.  
- Create and manage S3 buckets.  
- Upload and version objects.  
- Set permissions for public access.  
- Implement lifecycle policies for cost optimization.  

---

## 🚀 Step-by-Step Execution

### 1. Log in to AWS Console
- Log in to your AWS account (or create one if you don’t have).  
![Log in](img/1.log_in_to_your_aws_console(you_can_create_account_if_you_dont_have_one).png)

---

### 2. Navigate to S3 Service
- On the dashboard, search for **S3** and click the service.  
![Search S3](img/2.on_the_dashboard_use_service_search_to_search_for_s3_and_click_on_s3_from_search_result.png)

---

### 3. Create a New Bucket
- Click **Create bucket**.  
![Create bucket](img/3.on_the_s3_dashboard_click_on_create_bucket.png)

- Select **General Purpose**, name the bucket `my-first-s3-bucket-090`, and scroll down.  
![Bucket naming](img/4.select_general_purpose_and_name_bucke_my-first-s3-bucket-090_and_scroll_down.png)

- Disable ACL, block all public access, leave versioning disabled, and scroll.  
![ACL and block access](img/5.disable_acl__block_all_public_access_disable_bucket_versioning_and_scroll_down.png)

- Leave defaults, then click **Create bucket**.  
![Defaults](img/6.leave_every_other_thing_at_default_and_click_create_bucket.png)

- Bucket successfully created.  
![Bucket created](img/7.my-first-s3-bucket-069_successfully_created_and_listed_under_General_Purpose_Buckets.png)

---

### 4. Open the Bucket
- Click the bucket name.  
![Open bucket](img/8.click_to_open_my-first-s3-bucket-069.png)

- View empty bucket (0 objects).  
![Empty bucket](img/9.my-first-s3-bucket-069_opened_and_has_0_object.png)

---

### 5. Upload Your First Object
- On your laptop, create a file `hello welcome.txt` with the  and save it:  
![Create file](img/10.on_the_laptop_create_a_text_file_named_welcome.txt_with_some_data_in_it.png)

- On your empty bucket dashboard, click **Upload**.  
![Upload](img/11.click_upload_to_upload_welcome.txt_from_local_system_to_s3.png)

- Add file → select → open.  
![Add file](img/12.click_on_Add%20file_and_select_the_file_created..png)  
![Select file](img/13.select_file_and_click_open.png)

- File ready → click **Upload**.  
![File ready](img/14.file_added_now_click_upload.png)

- Upload successful.  
![Upload success](img/15.file_upload_successful_showing_under_files_and_folders.png)

- Close upload dialog → back to bucket.  
![Close](img/16.click_on_close_to_go_to_my-first-s3-bucket-069_dashboard.png)

---

### 6. Enable Versioning
- Open **Properties** → under **Bucket Versioning** click edit.  
![Versioning edit](img/17.my-first-s3-bucket-069_dashboard_open_click_properties_tab_under_Bucket_Versioning_click_edit.png)

- Enable and save changes.  
![Enable versioning](img/18.Edit_Bucket_Versioning_open_under_bucket_versioning_click_enable_and_save_changes.png)

- Success message.  
![Versioning enabled](img/19.bucket_versioning_successfully_enabled.png)

- Modify local file and re-upload (new version).  
![Modify file](img/20.modify_the_content_of_the_local_file_save_to_upload_it_again.png)  
![Upload again](img/21.click_object_tab_and_upload_button.png)  
![Add file again](img/22.click_on_Add%20file_and_select_the_file_created..png)  
![Select file](img/23.select_file_and_click_open.png)  
![Upload new version](img/24.file_added_now_click_upload.png)  
![Upload success](img/25.file_upload_successful_showing_under_files_and_folders.png)  
![Close](img/26.click_on_close_to_go_to_my-first-s3-bucket-069_dashboard.png)

- Show versions.  
![Show versions](img/27.click_on_show_version_to_see_different_version_of_object(s).png)

---

### 7. Set Bucket Permissions
- Go to **Permissions** → edit block public access.  
![Permissions edit](img/28.to_set_permission_click_on_permission_tab_under_Block%20public%20access%20(bucket%20settings)_click_edit.png)

- Uncheck → save.  
![Uncheck](img/29.uncheck_Block%20all%20public%20access_and_click_save_changes.png)  
![Confirm](img/30.type_confirm_confirm_in_the_pop_up_to_confirm_changes.png)  
![Success](img/31.successfully_edited_Block_Public_Access_settings_for_the_bucket.png)

- Edit bucket policy.  
![Edit policy](img/32.to_set_access_policy_click_edit_on_bucket_policy.png)  
![Copy ARN](img/33.copy_bucket_ARN_click_on_bucket_policy_generator.png)

- Generate policy.  
![Policy setup](img/34.set_policy_type_S3_Bucket_Policy_effect_Allow_Principal_asteriks_Actions_GetObject_and_GetObjectVersion.png)  
![Policy ARN](img/35.under_Amazon_Resource_Name(ARN)_bucket_ARN_paste_copied_ARN_followed_by_forward_slash_asteriks_then_click_add_statement_button.png)  
![Generate policy](img/36.statement_added_click_generate_policy.png)  
![Copy JSON](img/37.on_the_policy_JSON_Document_pop_up_copy_policy_and_then_close.png)

- Paste policy & save.  
![Save policy](img/38.navigate_to_bucket_policy_tab_paste_policy_created_using_Policy_Generator_Click_Save%20changes.png)  
![Success policy](img/39.successfully_edited_bucket_policy.png)

```bash
# Policy copied
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::my-first-s3-bucket-069/*"
        }
    ]
}

```
---

### 8. Access Object Publicly
- Click on version with `null` ID → copy object URL.  
![Copy object URL](img/40.navigate_to_objects_tab_and_click_on_the_version_with_null_as_iD.png)  
![Copy](img/41.click_to_copy_object_url.png)

- Paste link in browser → object accessible.  
![Browser access](img/42.paste_the_copied_link_in_a_browser_to_access_object_on_the_internet.png)  
![Access success](img/43.object_with_version_id_null_now_accessible_over_the_internet.png)

- Access latest version as well.  
![Latest version](img/44.click_on_the_latest_version_of_the_object.png)  
![Copy latest link](img/45.copy_the_link_to_access_it_over_the_internet.png)  
![Browser latest](img/46.paste_the_copied_link_in_a_browser_to_access_object_on_the_internet.png)  
![Latest access success](img/47.latest_version_accessible_over_the_internet_as_well.png)

---

### 9. Configure Lifecycle Policies
- Go to **Management** tab → create lifecycle rule.  
![Lifecycle rule](img/48.navigate_to_management_tab_of_my-first-s3-bucket-069_and_click_create_lifecycle_rule.png)

- Name the rule & set filters.  
![Lifecycle name](img/49.name_my-lifecycle-rule_Limit_rule_scope_using_one_or_more_filters_prefix_txt_minimum_object_size_2GB_maximum_10.png)

- Transition objects after 30 days → Standard-IA.  
![Transition rule](img/50.transition_current_versions_of_objects_between_storage_classes_storage_class_transition_Standard-IA_30_days_after_creationcreate_rule_b.png)

- Rule added successfully.  
![Lifecycle success](img/51.my-lifecycle-rule_added_successfully_and_the_lifecycle_has_been_updated.png)

---

## 🎯 Project Reflection
Through this lab, we:  
- Created and managed S3 buckets.  
- Uploaded objects and enabled versioning.  
- Configured permissions and bucket policies.  
- Enabled lifecycle management for cost optimization.  

✅ This project gives a solid hands-on foundation in **Amazon S3**.
