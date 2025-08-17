# Introduction to Cloud Computing — Security & Identity Management (IAM)

**Author:** Oluwaseun Osunsola  
**Environment:** AWS  
**Project Link:** https://github.com/Oluwaseunoa/DevOps-Projects/blob/main/Cloud%20Computing/Security%20%26%20Identity%20Management%20(IAM)Security%20%26%20Identity%20Management%20(IAM)/README.mdes

---

## 1. Introduction

This project focuses on **Amazon Web Services (AWS) Identity and Access Management (IAM)** and its application in securing cloud resources for Zappy e-Bank, a fintech startup.  
The objective is to learn how IAM can help enforce **authentication and authorization** for users, ensuring that sensitive financial data is properly secured.  

Through this project, I gained hands-on experience in creating **policies, groups, users, and multi-factor authentication (MFA)**, while applying the **principle of least privilege**.

---

## 2. Importance of IAM for Zappy e-Bank

For a fintech company like Zappy e-Bank, **security and compliance** are critical. IAM helps to:  

* Create and manage AWS **users and groups**.  
* Assign fine-grained **permissions** through IAM **policies**.  
* Implement **multi-factor authentication (MFA)** for stronger access control.  
* Enforce the **principle of least privilege**, ensuring users only have access to what they need.  

This reduces the risk of insider threats, unauthorized access, and compliance violations.

---

## 3. Project Setup

1. Logged into **AWS Management Console** using the administrator account.  
   - Log in using root email. **![](./img/1.log_in_using_root_email.png)**  
   - Supply root user email. **![](./img/2.supply_root_user_email.png)**  
   - Supply root user password and click sign in. **![](./img/3.supply_root_user_password_and_click_sign_in.png)**  
   - Supply MFA code for additional verification. **![](./img/4.supply_mfa_code_for_additional_verification.png)**  
   - Landed on the console dashboard. **![](./img/5.landed_on_the_console_dashboard.png)**  

2. Navigated to the **IAM Dashboard**.  
   - Use the service search. **![](./img/6.use_the_service_search.png)**  
   - Search for IAM and click on it. **![](./img/7.search_for_IAM_and_click_on_it.png)**  
   - Now on IAM dashboard. **![](./img/8.now_on_IAM_dashboard.png)**  

---

## 4. Creating IAM Policies

### Developer Policy (EC2 Access)

* Created a **customer-managed policy** for backend developers.  
  - Service: **EC2**.  
  - Actions: **All EC2 actions**.  
  - Resources: **All**.  
  - Policy Name: `developer-policy`.  

Steps:  
- Click on policies. **![](./img/9.click_on_policies.png)**  
- Click on create policy. **![](./img/10.click_on_create_policy.png)**  
- Under select service section, choose EC2 service. **![](./img/11.under_select_service_section_choose_ec2_service.png)**  
- Under action, check all EC2. **![](./img/12.under_action_check_all_ec2.png)**  
- Under resources, check all. **![](./img/13.under_resources_check_all.png)**  
- Having checked all, click next. **![](./img/14.having_check_all_click_next.png)**  
- Name policy and click create policy. **![](./img/15.name_policy_and_click_create_policy.png)**  
- Developer policy successfully created. **![](./img/16.developer_policy_successfuly_created.png)**  

### Analyst Policy (S3 Access)

* Created a **customer-managed policy** for data analysts.  
  - Service: **S3**.  
  - Actions: **All S3 actions**.  
  - Resources: **All**.  
  - Policy Name: `analyst-policy`.  

Steps:  
- Click create policy to create another one. **![](./img/17.click_create_policy_to_create_another_one.png)**  
- Under select a service, choose S3. **![](./img/18.under_select_a_service_choose_s3.png)**  
- Under action, check all S3. **![](./img/19.under_action_check_all_s3.png)**  
- Under resources, check all. **![](./img/20.under_resources_check_all.png)**  
- Having checked all, click next. **![](./img/21.having_check_all_click_next.png)**  
- Name policy and click create policy. **![](./img/22.name_policy_and_click_create_policy.png)**  
- Analyst policy successfully created. **![](./img/23.analyst_policy_successfuly_created.png)**  

---

## 5. Creating IAM Groups

* **Development-Team** → Attached `developer-policy`.  
* **Analyst-Team** → Attached `analyst-policy`.  

Steps for Development-Team:  
- Click on user group. **![](./img/24.click_on_user_group.png)**  
- Click on create group. **![](./img/25.click_on_create_group.png)**  
- Name the group based on their role. **![](./img/26.name_the_group_based_on_their_role.png)**  
- Attach developer policy and click create group. **![](./img/27.attach_developer_policy_and_click_create_group.png)**  
- Development user group successfully created. **![](./img/28.development_user_group_successfully_created.png)**  

Steps for Analyst-Team:  
- Click on create group to create one more. **![](./img/29.click_on_create_group_to_create_one_more.png)**  
- Name the group based on their role. **![](./img/30.name_the_group_based_on_their_role.png)**  
- Attach analyst policy and click create group. **![](./img/31.attach_developer_policy_and_click_create_group.png)** (Note: Filename references developer policy, but context indicates analyst policy attachment.)  
- Analyst user group successfully created. **![](./img/32.analyst_user_group_successfully_created.png)**  

---

## 6. Creating IAM Users

### John (Backend Developer)

* User created: **John**.  
* Added to **Development-Team** group.  
* Console login enabled.  
* Credentials downloaded.  

Steps:  
- Click users to create users. **![](./img/33.click_users_to_create_users.png)**  
- Click create user. **![](./img/34.click_create_user.png)**  
- Enter name, provide access to console, and check IAM user. **![](./img/35.enter_name_provide_access_to_console_and_check_iam_user.png)**  
- Choose password, uncheck password change on next login. **![](./img/36.choose_password_uncheck_password_change_on_next_login.png)**  
- Save password for next login. **![](./img/37.save_passwordfor_next_login.png)**  
- Check to add to development group and click next. **![](./img/38.check_to_add_to_development_group_and_click_next.png)**  
- Review and create user. **![](./img/39.review_and_create_user.png)**  
- Successfully create user. **![](./img/40.successfully_create_user.png)**  
- Download user login CSV. **![](./img/41.download_user_login_csv.png)**  

### Mary (Data Analyst)

* User created: **Mary**.  
* Added to **Analyst-Team** group.  
* Console login enabled.  
* Credentials downloaded.  

Steps:  
- Click create new user to create new user Mary. **![](./img/42.click_create_new_user_to_create_new_user_mary.png)**  
- Enter name, provide access to console, and check IAM user. **![](./img/43.enter_name_provide_access_to_console_and_check_iam_user.png)**  
- Choose password, uncheck password change on next login. **![](./img/44.choose_password_uncheck_password_change_on_next_login.png)**  
- Save password for next login. **![](./img/45.save_passwordfor_next_login.png)**  
- Check to add to analyst group and click next. **![](./img/46.check_to_add_to_analyst_group_and_click_next.png)**  
- Review and create user. **![](./img/47.review_and_create_user.png)**  
- Successfully create user. **![](./img/48.successfully_create_user.png)**  
- Download user login CSV. **![](./img/49.download_user_login_csv.png)**  

---

## 7. Testing and Validation

- Return user list. **![](./img/50.return_user_list.png)**  
- Landed on user list page. **![](./img/51.landed_on_user_list_page.png)**  

### John’s Access

* Logged in as John.  
* Accessed **EC2 Dashboard** ✅.  
* Attempted to access **S3 Dashboard** ❌ (denied).  

Steps:  
- Locate and open John downloaded CSV file. **![](./img/52.locate_and_open_john_downloaded_csv_file.png)**  
- Copy the HTTPS link. **![](./img/53.copy_the_https_link.png)**  
- Paste it on the browser. **![](./img/54.paste_it_on_the_browser.png)**  
- Sign in as IAM user using your login and account ID which is fetched by the link. **![](./img/55.sign_in_as_iam_user_using_your_login_and_account_id_which_is_fetched_by_the_link.png)**  
- Logged in as John. **![](./img/56.logged_in_as_john.png)**  
- Search for EC2 and click on it. **![](./img/57.search_for_ec2_and_click_on_it.png)**  
- Successfully access EC2 dashboard, click launch instance. **![](./img/58.successfully_access_ec2_dashboard_click_launch_instance.png)**  
- Launch an instance page appear. **![](./img/59.launch_an_instance_page_appear.png)**  
- Name server and set it up, also set key pairs and launch instance. **![](./img/60.name_server_and_set_it_up_also_set_key_pairs_and_launch_instance.png)**  
- Instance successfully launched. **![](./img/61.instance_succefully_launched.png)**  
- Search for S3 and click on it. **![](./img/62.search_for_s3_and_click_on_it.png)**  
- Successfully access S3 dashboard, click create bucket. **![](./img/63.successfully_access_s3_dashboard_click_create_bucket.png)** (Note: Context indicates access attempt leading to denial.)  
- Name bucket and set it up. **![](./img/64.name_bucket_and_set_it_up.png)**  
- Scroll down and click create bucket. **![](./img/65.scroll_down_and_click_create_bucket.png)**  
- Failed to create bucket. **![](./img/66.failed_to_create_bucket.png)**  

### Mary’s Access

* Logged in as Mary.  
* Accessed **S3 Dashboard** ✅.  
* Attempted to access **EC2 Dashboard** ❌ (denied).  

Steps:  
- Locate and open Mary downloaded CSV file. **![](./img/67.locate_and_open_john_downloaded_csv_file.png)** (Note: Filename references John, but context indicates Mary's file.)  
- Copy the HTTPS link. **![](./img/68.copy_the_https_link.png)**  
- Paste it on the browser. **![](./img/69.paste_it_on_the_browser.png)**  
- Sign in as IAM user using your login and account ID which is fetched by the link. **![](./img/70.sign_in_as_iam_user_using_your_login_and_account_id_which_is_fetched_by_the_link.png)**  
- Logged in as Mary. **![](./img/71.logged_in_as_mary.png)**  
- Search for S3 and click on it. **![](./img/72.search_for_s3_and_click_on_it.png)**  
- Successfully access S3 dashboard, click create bucket. **![](./img/73.successfully_access_s3_dashboard_click_create_bucket.png)**  
- Name bucket and set it up. **![](./img/74.name_bucket_and_set_it_up.png)**  
- Scroll down and click create bucket. **![](./img/75.scroll_down_and_click_create_bucket.png)**  
- Bucket successfully created. **![](./img/76.bucket_succefully_created.png)**  
- Search for EC2 and click on it. **![](./img/77.search_for_ec2_and_click_on_it.png)**  
- Successfully access EC2 dashboard, click launch instance. **![](./img/78.successfully_access_ec2_dashboard_click_launch_instance.png)** (Note: Context indicates access attempt leading to denial.)  
- Name server and set it up, also set key pairs and launch instance. **![](./img/79.name_server_and_set_it_up_also_set_key_pairs_and_launch_instance.png)**  
- Mary not authorized to create key pair. **![](./img/80.mary_not_authorized_to_create_key_pair.png)**  

This confirmed that users had **role-specific permissions** aligned with the principle of least privilege.

---

## 8. Enabling Multi-Factor Authentication (MFA)

### John (Backend Developer)

* Enabled MFA.  
* Linked with **Google Authenticator**.  
* Tested successful login with MFA.  

Steps:  
- Search IAM to set MFA for John. **![](./img/81.search_iam_to_set_mfa_for_John.png)**  
- Login as IAM admin and navigate to IAM dashboard. **![](./img/82.login_as_iam_admin_and_navigate_to_iam_dashboard.png)**  
- Click on users. **![](./img/83.click_on_users.png)**  
- Click on John. **![](./img/84.click_on_john.png)**  
- Click security credential and assign MFA. **![](./img/85.click_security_credential_and_assign_mfa.png)**  
- Set name and choose authenticator app and click next. **![](./img/86.set_name_and_choose_authenticator_app_and_click_next.png)**  
- Show QR, scan it and supply code as instructed. **![](./img/87.show_qr_scan_it_and_supply_code_as_instructed.png)**  
- MFA successfully added. **![](./img/88.mfa_successfully_added.png)**  
- Sign-in as John. **![](./img/89.sign-in_as_john.png)**  
- Supply required MFA and login. **![](./img/90.supply_required_mfa_and_login.png)**  
- Successfully logged in. **![](./img/91.successfully_logged_in.png)**  

### Mary (Data Analyst)

* Enabled MFA.  
* Linked with **Microsoft Authenticator**.  
* Tested successful login with MFA.  

Steps:  
- Click users to repeat the same step for Mary. **![](./img/92.click_users_to_repeat_the_same_step_for_mary.png)**  
- Click on Mary. **![](./img/93.click_on_mary.png)**  
- Click security credential and assign MFA. **![](./img/94.click_security_credential_and_assign_mfa.png)**  
- Set name and choose authenticator app and click next. **![](./img/95.set_name_and_choose_authenticator_app_and_click_next.png)**  
- Show QR, scan it and supply code as instructed. **![](./img/96.show_qr_scan_it_and_supply_code_as_instructed.png)**  
- MFA successfully added. **![](./img/97.mfa_successfully_added.png)**  

---

## 9. Project Reflection

### 9.1 Role of IAM in AWS

IAM defines **who** can access AWS and **what actions** they can perform. It enhances security, compliance, and efficient resource management.

### 9.2 Difference Between IAM Users and Groups

* **IAM Users** → Individual identities (e.g., John, Mary).  
* **IAM Groups** → Collections of users with shared permissions (e.g., Development-Team, Analyst-Team).  
  Groups simplify permission management at scale.

### 9.3 Process of Creating IAM Policies

* Identify required service.  
* Select allowed actions.  
* Define resources.  
* Save as **custom policy**.  
* Attach policy to a user or group.

### 9.4 Significance of Principle of Least Privilege

Granting users only the access they need minimizes risks and prevents accidental or malicious misuse of AWS resources.

### 9.5 Scenario with John and Mary

* **John** → User in Development-Team → EC2 access only.  
* **Mary** → User in Analyst-Team → S3 access only.  
* Both secured with **MFA**.  
* This setup mirrors real-world fintech security practices.

---

## 10. Conclusion

This project demonstrated how AWS IAM helps enforce **secure, role-based access control** for Zappy e-Bank. By applying IAM concepts such as **users, groups, policies, and MFA**, the project successfully built a secure environment that aligns with fintech compliance requirements and the **principle of least privilege**.