# AWS Identity and Access Management Project Report

## Overview

We're going to learn about AWS Identity and Access Management (IAM) which helps control who can access what in Amazon Web Services. We'll cover things like users, roles, policies, and groups, and we'll also show you how to actually set them up to keep your AWS resources safe.

But before we get into all that, let's make sure you understand the basics of cloud computing. If terms like "Cloud" sound new to you, it's a good idea to go back and review some earlier materials to get a solid grasp of what it's all about.

## Project Goals

- Understand AWS Identity and Access Management (IAM) principles and components.
- Learn to create and manage IAM policies for regulating access to AWS resources securely.
- Apply IAM concepts practically to control access within AWS environments.
- Explore best practices for IAM implementation and security in AWS.

## Learning Outcomes

- Recognize IAM components like users, roles, policies, and groups.
- Create and manage IAM policies to define permissions for users and roles.
- Set up IAM users, groups, and roles to control access to AWS services.
- Understand IAM best practices for maintaining security and managing access to AWS resources.

## Key Concepts

### What is IAM?

IAM, or Identity and Access Management. Think of it as the gatekeeper for your AWS resources, its job is to decide who gets in and what they're allowed to do once they're inside.

Imagine you have this big digital "house" full of all your AWS stuff—your data, your applications, the whole shebang. Now, you don't want just anyone wandering in and messing around with your things, right? That's where IAM steps in.

It's like having your own VIP list for your digital world. IAM helps you keep your AWS resources safe and sound, making sure only the right people get in and that they're only allowed to do what you say they can. It's all about keeping your digital house in order and protecting your precious stuff from any unwanted guests.

Note: AWS resources are the various services and tools provided by Amazon Web Services (AWS) that users can utilize to build and manage their applications and infrastructure in the cloud.

### What is IAM User?

IAM users are like individual accounts for different people or entities within your AWS environment.

For example, if you have a team working on a project, you can create separate IAM users for each team member. Each IAM user would have their own unique username and password, allowing them to access the AWS resources they need for their work.

IAM users help you manage and control access to your AWS resources securely, ensuring that each user only has access to the resources they need to perform their tasks.

### What is IAM Role?

An IAM role defines what someone or something (like an application or service) can do within your AWS account. Each role has a set of permissions that determine which actions it can perform and which AWS resources it can access.

For example, you might have an "admin" role that gives full access to all resources, or a "developer" role that only allows access to certain services for building applications.

Or if we take another example, imagine you have a visitor who needs temporary access to your house to fix something. Instead of giving them a permanent key (IAM user), you give them a temporary key (IAM role) that only works for a limited time and grants access to specific rooms (AWS resources).

IAM roles are flexible and can be assumed by users, services, or applications as needed. They are commonly used for tasks such as granting permissions to AWS services, allowing cross-account access, or providing temporary access to external users. IAM roles enhance security and efficiency by providing controlled access to AWS resources without the need for permanent credentials.

### What is IAM Policy?

An IAM policy is a set of rules that define what actions a role can take. These rules specify the permissions granted to the role. Think of a policy as a rulebook for the role. It outlines which actions are allowed and which are not, helping to ensure secure and controlled access to your AWS resources.

For example, the rulebook might say that the "admin" key (IAM role or user) can open any door and perform any action within the house (AWS resources), while the "viewer" key (IAM role or user) can only open certain doors and look around, but not make any changes.

IAM policies define the permissions granted to IAM roles and users, specifying which AWS resources they can access and what actions they can take. They are essential for maintaining security and controlling access to AWS resources, ensuring that only authorized actions are performed by users and roles within your AWS account.

### What is IAM Group?

IAM Groups are like collections of IAM users. Instead of managing permissions for each user individually, you can organize users into groups based on their roles or responsibilities.

You can think IAM Groups as these neat little collections of users with similar roles or responsibilities. It's like putting everyone into teams based on their tasks. So, you might have a group for developers, another for administrators, and so on. So instead of setting permissions for each person one by one, you set them up for the whole group at once.

For example, let's say you have a development team working on a project. Instead of assigning permissions to each developer one by one, you can create an IAM Group called "Developers" and add all the developers to that group. Then, you assign permissions to the group as a whole. So, if you want all developers to have access to the same resources, you only need to set it up once for the group.

### Best Practices

- Give only the permissions needed: Don't give more access than necessary.
- Use roles instead of users: Roles are safer and can be used when needed.
- Review roles regularly: Remove unused roles to keep things tidy and secure.
- Add extra security with MFA: Use Multi-Factor Authentication for extra protection.
- Use ready-made policies: They're safer and easier to use.
- Keep policies simple: Make separate policies for different tasks.
- Keep track of changes: Keep a record of who changes what.
- Test policies before using them: Make sure they work the way you want them to before applying them to real stuff.
- Use descriptive names: Choose clear and descriptive names for IAM groups to facilitate understanding and management.
- Enforce strong password policies: Encourage users to create strong passwords and implement expiration and complexity requirements.

Note (difference between users and roles): In AWS, users are like individual people with their own set of keys to access resources. These keys are permanent and tied to specific individuals. It's similar to having your own key to the front door of your house—it's always yours.

On the other hand, roles in AWS are more like special keys that can be used by different people or even programs. These keys provide temporary access and can be used by different users as needed. Roles are like master keys that can be used by anyone who needs access to certain things temporarily. So, while users are tied to specific individuals, roles are more flexible and can be shared among different users for specific tasks.

For MFA you can check Multi-Factor Authentication (MFA) for IAM.

Note on AWS policies:
- Managed Policies: Made by AWS, used by many.
- Customer Managed Policies: You make and manage them.
- Inline Policies: Made for one specific thing.

For further details, please refer to Policies and permissions in IAM in IAM documentation.

## Practical Implementation

A growth marketing consultancy company called GatoGrowFast.com wants to give some access to their employee Seun, Jack and Ade to the AWS resources.

We'll do it in two parts. In the first part of the practical, we'll create a policy granting full access to EC2. Then, we'll create a user named Seun and attach that policy to him.

In the second part, we'll create a group and add two more users, Jack and Ade, to that group. Afterward, we'll create a policy for granting full access to EC2 and S3, and attach it to the group.

The following steps are ordered numSeunally based on the screenshot names provided, with each step linked to its corresponding screenshot for visual reference. Screenshot descriptions have been formatted for readability. Note: Some screenshots use "Seun" as the user name example instead of "Seun," but the process remains the same.

### Part 1: Create EC2 Policy and IAM User (Seun)

1. **Log In And Navigate To Your AWS Console**  
   ![Step 1](./img/1.log_in_and_navigate_to_your_aws_console.png)

2. **Use The Services Search To Search For IAM And Click To Visit The Page**  
   ![Step 2](./img/2.use_the_services_search_to_search_for_IAM_and_click_to_visit_the_page.png)

3. **Click On Policies On The Menu Option**  
   ![Step 3](./img/3.click_on_policies_on_the_menu_uption.png)

4. **Search For Ec2 And Grant By Selecting AmazonEC2FullAccess**  
   ![Step 4](./img/4.search_for_ec2_and_grant_by_selecting_AmazonEc2FullAccess.png)

5. **Click Create Policy**  
   ![Step 5](./img/5.click_create_policy.png)

6. **Select EC2 Service**  
   ![Step 6](./img/6.select_EC2_service.png)

7. **Select All EC2 Action Under Action And Scroll Down**  
   ![Step 7](./img/7.select_all_EC2_Action_under_action_and_scroll_down.png)

8. **Under Resources Tick All And Click Next Button**  
   ![Step 8](./img/8.under_resources_tick_all_and_click_next_button.png)

9. **Add Policy Names And Create Policy**  
   ![Step 9](./img/9.add_policy_names_and_create_policy.png)

10. **Policy Successfully Created**  
    ![Step 10](./img/10.policy_successfully_created.png)

11. **Click On Users Proceed To Create User**  
    ![Step 11](./img/11.click_on_users_proceed_to_create_user.png)

12. **On Users Page Click Create User**  
    ![Step 12](./img/12.on_users_page_click_create_user.png)

13. **Enter User Name Give User Access To The Console And Create User As An IAM User**  
    ![Step 13](./img/13.enter_user_name_give_user_access_to_the_console_and_create_user_as_an_iam_user.png)

14. **Set Custom Password And Force User To Create New Password At Next Login And Click Next**  
    ![Step 14](./img/14.set_custom_password_and_force_user_to_create_new_password_at_next_login_and_click_next.png)

15. **You Can Click Save Password On Google Password Manager If You Prefer For Next Log In**  
    ![Step 15](./img/15_you_can_click_save_password_on_google_password_manager_if_you_prefer_for_next_log_in.png)

16. **On Permission Page Click Attach Policy Directly Filter Policy By Customer Managed Policy Select Created User Policy And Click Next**  
    ![Step 16](./img/16.on_permission_page_click_attach_policy_directly_filter_policy_by_customer_managed_policy_select_created_user_policy_and_click_next.png)

17. **Review And Create**  
    ![Step 17](./img/17.review_and_create.png)

18. **User Seun Successfully Created Now Download CSV File To Retrieve Chosen Password**  
    ![Step 18](./img/18.succesfully_created_user_download_csv_file_to_retrieve_chosen_password.png)

19. **Credential Successfully Downloaded Proceed To User List Page**  
    ![Step 19](./img/19.credential_successfully_downloaded_proceed_to_user_list_page.png)

### Part 2: Create Group, Add Users (Jack and Ade), Create EC2/S3 Policy, and Attach to Group

20. **Created User Listed Now Click On User Group**  
    ![Step 20](./img/20.created_user_listed_now_click_on_user_group.png)

21. **On User Group Page Click On Create Group**  
    ![Step 21](./img/21.on_user_group_page_click_on_create_group.png)

22. **Set Group Name And Scroll Down And Click Create Group**  
    ![Step 22](./img/22.set_group_name_and_scroll_down_and_click_create_group.png)

23. **Group Successfully Created Click Users To Create New User**  
    ![Step 23](./img/23.group_successfully_created_click_users_to_create_new_user.png)

24. **User List Page Appear Click Create User**  
    ![Step 24](./img/24.user_list_page_appear_click_create_user.png)

25. **Choose User Name And Click Next**  
    ![Step 25](./img/25.choose_user_name_and_click_next.png)

26. **In The Permission Option Select Add User To Group And Select Development-Team And Click Next**  
    ![Step 26](./img/26.in_the_permission_option_select_add_user_to_group_and_select_development-team_and_click_next.png)

27. **Review And Click Create User**  
    ![Step 27](./img/27.review_and_click_create_user.png)

28. **User Jack Successfully Created**  
    ![Step 28](./img/28.user_jack_successfully_created.png)

29. **Create Another User By Clicking Create User**  
    ![Step 29](./img/29.create_another_user_by_clicking_create_user.png)

30. **Choose User Name And Click Next**  
    ![Step 30](./img/30.choose_user_name_and_click_next.png)

31. **In The Permission Option Select Add User To Group And Select Development-Team And Click Next**  
    ![Step 31](./img/31.in_the_permission_option_select_add_user_to_group_and_select_development-team_and_click_next.png)

32. **Review And Click Create User**  
    ![Step 32](./img/32.review_and_click_create_user.png)

33. **User Ade Successfully Created**  
    ![Step 33](./img/33.user_ade_successfully_created.png)

34. **Click Policies To Create New Policy For The Group**  
    ![Step 34](./img/34.click_policies_to_create_new_policy_for_the_group.png)

35. **Click Create Policy**  
    ![Step 35](./img/35.click_create_policy.png)

36. **Choose EC2 And Select All Action And Resources**  
    ![Step 36](./img/36.choose_EC2_and_select_all_action_and_resources.png)

37. **Select Add More Permission And Selected S3 Service**  
    ![Step 37](./img/37.select_add_more_permission.png)

38. **Choose S3 And Select All Action And All Resources And Click Next**  
    ![Step 38](./img/38.choose_s3_and_select_all_action_and_all_resources_and_click_next.png)

39. **Name Policy And Click Create Policy**  
    ![Step 39](./img/39.name_policy_and_click_create_policy.png)

40. **Development-Team-Policy Successfully Created Navigate To User Group Page**  
    ![Step 40](./img/40.development-team-policy_successfuly_created_navigate_to_user_group_page.png)

41. **Click Development-Team**  
    ![Step 41](./img/41.click_development-team.png)

42. **Click On Permission Tab Then Add Permission Button And Attach Policy**  
    ![Step 42](./img/42.click_on_permission_tab_then_add_permission_button.png)

43. **On Policy Name List Filter By Customer Managed**  
    ![Step 43](./img/43.on_policy_name_list_filter_by_customer_managed.png)

44. **Select Development-Team-Policy And Click Attach Policy**  
    ![Step 44](./img/44.select_Development-team-policy_and_click_attach_policy.png)

45. **Policy Successfully Attached**  
    ![Step 45](./img/45.policy_successfully_attached.png)

## Project Reflection

The AWS IAM project explored access control through creating policies, users, and groups. This reflection summarizes outcomes, challenges, lessons, and improvements.

## Project Outcomes
The project met its goals:
- Understood IAM components (users, groups, policies).
- Created EC2 policy for user Seun and EC2/S3 policy for the Development-team group with users Jack and Ade.
- Applied best practices like least privilege and descriptive names.
- Gained hands-on skills in managing AWS access securely.

## Challenges Faced
- Navigating AWS Console was initially complex; search and sidebar helped.
- Configuring policies required balancing granularity and access.

## Lessons Learned
- Granular policies enhance security.
- Groups streamline permission management for teams.
- Clear documentation prevents errors.
- Best practices like least privilege are practical and effective.

## Potential Improvements
- Add MFA setup for users.
- Include IAM role creation (e.g., for AWS services).
- Test policies using IAM Policy Simulator.
- Ensure consistent naming in documentation.

## Conclusion
The project built practical IAM skills for secure AWS resource management. Challenges like console navigation and policy setup were overcome, reinforcing best practices. Adding MFA, roles, and policy testing would enhance future iterations. I’m now confident in applying IAM to real-world scenarios.