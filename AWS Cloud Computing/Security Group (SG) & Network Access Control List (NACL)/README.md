# Security Groups and NACLs Project

## Introduction

This project, titled "Security Groups and NACLs," explores the core concepts of Amazon Web Services (AWS) networking security, with a focus on Security Groups and Network Access Control Lists (NACLs). The objective is to understand how Security Groups control inbound and outbound traffic to EC2 instances, and how NACLs serve as subnet-level firewalls to regulate traffic entering and exiting subnets. Through hands-on demonstrations in the AWS Management Console, we deploy and manage these components to demonstrate their functionality.

Before proceeding, a basic understanding of cloud networking is assumed. If terms like "Security Groups" or "NACLs" are unfamiliar, review foundational cloud computing materials.

### Project Goals
- Understand the concepts of Security Groups and Network Access Control Lists (NACLs) in AWS.
- Explore how Security Groups and NACLs function as virtual firewalls to control inbound and outbound traffic.
- Gain hands-on experience with configuring Security Groups and NACLs to allow or deny specific types of traffic.

### Learning Outcomes
- Gain proficiency in configuring Security Groups and NACLs to control network traffic within AWS environments.
- Understand the differences between Security Groups and NACLs, including their scope, statefulness, and rule configurations.
- Learn how to troubleshoot network connectivity issues by analyzing Security Group and NACL configurations.
- Develop a deeper understanding of AWS networking concepts and best practices for securing cloud environments.

## Key Terms and Concepts

### Security Group (SG)
- **Inbound Rules**: Rules that control the incoming traffic to an AWS resource, such as an EC2 instance or an RDS database.
- **Outbound Rules**: Rules that control the outgoing traffic from an AWS resource.
- **Stateful**: Security groups automatically allow return traffic initiated by the instances to which they are attached.
- **Port**: A communication endpoint that processes incoming and outgoing network traffic. Security groups use ports to specify the types of traffic allowed.
- **Protocol**: The set of rules that governs the communication between different endpoints in a network. Common protocols include TCP, UDP, and ICMP.

In simple terms, a Security Group acts like a bouncer at a party, deciding who can enter (inbound traffic) and who can leave (outbound traffic). For example, you might allow only port 80 traffic for a web server, keeping it safe from unauthorized access.

### Network Access Control List (NACL)
- **Subnet-level Firewall**: NACLs act as a firewall at the subnet level, controlling traffic entering and exiting the subnet.
- **Stateless**: Unlike security groups, NACLs are stateless, meaning they do not automatically allow return traffic. You must explicitly configure rules for both inbound and outbound traffic.
- **Allow/Deny**: NACL rules can either allow or deny traffic based on the specified criteria.
- **Ingress**: Refers to inbound traffic, i.e., traffic entering the subnet.
- **Egress**: Refers to outbound traffic, i.e., traffic exiting the subnet.
- **CIDR Block**: Specifies a range of IP addresses in CIDR notation (e.g., 10.0.0.0/24) that the NACL rule applies to.

NACLs are like neighborhood security guards, controlling access at the subnet level rather than for individual resources. They require separate rules for inbound and outbound traffic due to their stateless nature.

### Default Settings
- **Default Security Group**: Every VPC comes with a default security group that allows all outbound traffic and denies all inbound traffic by default.
- **Default NACL**: Every subnet within a VPC is associated with a default NACL that allows all inbound and outbound traffic by default.

### Differences Between Security Groups and NACLs
Security Groups operate at the instance level, are stateful, and implicitly deny traffic not explicitly allowed (no explicit "deny" rules). They protect individual resources by filtering based on protocols, ports, and IP addresses.

NACLs operate at the subnet level, are stateless, and can explicitly allow or deny traffic. They filter based on IP addresses and protocol numbers, applying independently to inbound and outbound traffic.

Note: In security groups, there's no explicit "deny" option as seen in NACLs; any rule configured within a security group implies permission.

## Practical Implementation

The practical part is divided into setup and two main sections: Security Groups and NACLs. We begin by setting up the foundational VPC environment, including subnets, internet gateways, route tables, NAT gateways, and an EC2 instance. Then, we configure and test Security Groups and NACLs in various scenarios.

### Setting Up the VPC Environment

1. Navigate to the search bar and enter "VPC", then click on the VPC service that appears.  
   ![Step 1](./img/1.Navigate_to_search_bar_and_enter_VPC_then_click_on_VPC_service_that_appears.png)

2. On the VPC dashboard, click "Create VPC".  
   ![Step 2](./img/2.On_the_VPC_dashboard_Click_Create_VPC.png)

3. On the Create VPC page, select "VPC only", set the IPv4 CIDR block, and click "Create VPC".  
   ![Step 3](./img/3.On_Create_VPC_page_Select_VPC_only_set_IPV4_CIDR_block_and_click_create_VPC.png)

4. VPC successfully created.  
   ![Step 4](./img/4.vpc_successfully_created.png)

5. Note: In case of CIDR block size error, let your block size fall within the specified range.  
   ![Step 5](./img/5.note-in_case_of_CIDR_block_size_error_let_your_block_size_fall_within_the_specified_range.png)

6. Here is the created VPC; click "Subnets" to create a subnet.  
   ![Step 6](./img/6.here_is_the_created_VPC_click_subnets_to_create_subnet.png)

7. On the subnet dashboard, click "Create subnet".  
   ![Step 7](./img/7.on_the_subnet_dashboard_click_create_subnet.png)

8. Select the Subnet VPC (created in the first step).  
   ![Step 8](./img/8.select_the_Subnet_VPC(Created_in_the_first_step).png)

9. Enter subnet name (my-public-subnet-1), set availability zone, subnet IPv4 CIDR block, and click "Add new subnet".  
   ![Step 9](./img/9.Enter_subnet_name(my-public-subnet-1)_set_availability_zone_subnet_IPv4_CIDR_block_and_click_add_new_subnet.png)

10. Enter subnet name (my-private-subnet-1), set availability zone, subnet IPv4 CIDR block, and click "Create subnet".  
    ![Step 10](./img/10.Enter_subnet_name(my-private-subnet-1)_set_availability_zone_subnet_IPv4_CIDR_block_and_click_Create_subnet.png)

11. The architecture.  
    ![Step 11](./img/11.the_architecture.png)

12. my-public-subnet-1 and my-private-subnet-1 successfully created.  
    ![Step 12](./img/12.my-public-subnet-1_and_my-private-subnet-1_successfully_created.png)

13. Since my-public-subnet-1 and my-private-subnet-1 successfully created, now click on "Internet gateways" to connect public subnet to the internet.  
    ![Step 13](./img/13.subnets_created_successfully_created_click_on_internet_gateway_to_connect_public_subnet_to_the_internet.png)

14. On the internet gateway dashboard, click "Create internet gateway" button.  
    ![Step 14](./img/14.on_the_internet_gateway_dashboard_click_create_internet_gateway_button.png)

15. Name internet gateway and click "Create internet gateway".  
    ![Step 15](./img/15.name_internet_gateway_and_click_create_internet_gateway.png)

16. Internet gateway successfully created; note that the state shows detached.  
    ![Step 16](./img/16.internet_gateway_successfully_created_note_that_the_state_shows_detached.png)

17. Click "Actions" and then "Attach to VPC".  
    ![Step 17](./img/17.click_Actions_and_then_Attach_to_VPC.png)

18. Select VPC and click "Attach internet gateway".  
    ![Step 18](./img/18.select_vpc_and_click_attach_internet_gateway.png)

19. Internet gateway successfully attached to VPC.  
    ![Step 19](./img/19.internet_gateway_successfully_attached_to_vpc.png)

20. Present architecture.  
    ![Step 20](./img/20.present_architechture.png)

21. Since IGW is now attached to VPC, click on "Route tables".  
    ![Step 21](./img/21.since_IGW_is_now_attached_to_vpc_click_on_route_tables.png)

22. On the route table dashboard, click "Create route table".  
    ![Step 22](./img/22.on_the_route_table_dashboard_click_create_route_table.png)

23. Name route table, select VPC, and click "Create route table".  
    ![Step 23](./img/23.name_route_table_select_vpc_and_click_create_route_table.png)

24. Route table created; now click on "Subnet associations" then "Edit subnet association".  
    ![Step 24](./img/24.route_table_created_now_click_on_subnet_associations_then_edit_subnet_association.png)

25. Select public subnet and click "Save associations".  
    ![Step 25](./img/25.select_public_subnet_and_click_save_associations.png)

26. Subnet association successfully saved; now under "Routes" tab, click "Edit routes".  
    ![Step 26](./img/26.subnet_association_successfully_saved_now_under_routes_tab_click_edit_routes.png)

27. Click "Add route" to add new route.  
    ![Step 27](./img/27.click_add_route_to_add_new_route.png)

28. Set route destination to 0.0.0.0/0, target to the created IGW, and save changes.  
    ![Step 28](./img/28.set_route_destination_to_0.0.0.0-0_Target_to_the_created_IGW_and_save_changes.png)

29. Route table updated successfully.  
    ![Step 29](./img/29.route_table_updated_successfully.png)

30. Present VPC or network architecture.  
    ![Step 30](./img/30.present_vpc_or_network_architecture.png)

31. Now that route tables have been updated, click on "NAT gateways".  
    ![Step 31](./img/31.now_that_route_tables_have_been_updated_click_on_NAT_Gateway.png)

32. Click "Create NAT gateway".  
    ![Step 32](./img/32.click_create_NAT_gateway.png)

33. Name NATgw, select private subnet, and set connectivity type to private.  
    ![Step 33](./img/33.name_NATgw_select_private_subnet_and_set_connectivity_type_to_private.png)

34. NAT gateway created successfully.  
    ![Step 34](./img/34.NAT_gw_created_successfully.png)

35. Select the created NAT gateway and locate subnet ID link at details section and click on it.  
    ![Step 35](./img/35.select_the_created_NAT_gw_and_locate_subnet_id_link_at_details_section_and_click_on_it.png)

36. In the subnet page, navigate to "Route Table" section and click one route table ID (rtb-...).  
    ![Step 36](./img/36.In_the_subnet%20page_navigate_to_Route_Table_section_and_click_one_route_table_id(rtb-...).png)

37. On route table page, click on "Routes" tab and then "Edit routes".  
    ![Step 37](./img/37.on_route_table_page_click_on_Routes_tab_and_then_edit_routes.png)

38. On the edit route page, click "Add route".  
    ![Step 38](./img/38.on_the_edit_route_page_click_add_route.png)

39. Select 0.0.0.0/0 as destination, NAT Gateway as the target, and the created NAT gateway as the NAT Gateway, then save changes.  
    ![Step 39](./img/39.select_0.0.0.0-0_as_destination_NAT_Gateway_as_the_target_and_the_created_nat_gateway_as_the_NAT_Gateway_then_Save_changes.png)

40. Route table updated successfully; now click "Subnet association" and "Edit subnet association".  
    ![Step 40](./img/40.route_table_updated_successfully_now_click_subnet_association_and_edit_subnet_association.png)

41. Click on the private subnet and then "Save associations" button.  
    ![Step 41](./img/41.click_on_the_private_subnet_and_then_save_associations_button.png)

42. The subnet has been successfully attached with the route table.  
    ![Step 42](./img/42.the_subnet_has_been_successfully_attached_with_the_route_table..png)

43. Present VPC architecture or status.  
    ![Step 43](./img/43.present_vpc_architecture_or_status.png)

### Part 1: Security Groups

We now create an EC2 instance and configure Security Groups, exploring scenarios such as allowing specific inbound/outbound traffic, removing rules, and testing connectivity.

44. Create an Ubuntu EC2 instance and name it "my-test-instance" and scroll down.  
    ![Step 44](./img/44.create_an_Ubuntu_EC2_instance_and_name_it_my-test-instance_and_scroll_down.png)

45. After setting the key pair, on the network settings click on "Edit".  
    ![Step 45](./img/45.after_setting_the_key_pair_on_the_network_settings_click_on_edit.png)

46. Set its VPC to the created VPC (10.0.0.0/16) and subnet to the public subnet. Enable Auto-assign public IP, then launch instance.  
    ![Step 46](./img/46.Choose_created_vpc(10.0.0.0-16)_and_public_subnet_Enable_Auto-assign_public_IP_then_launch_instance.png)

47. We have created a public EC2 in the public subnet which hosts our website.  
    ![Step 47](./img/47.we_have_created_a_public_ec2_in_the_public_subnet_which_hosts_our_website.png)

48. To see the instance security group rule, click on "Security" tab and the security groups link.  
    ![Step 48](./img/48.to_see_the_instance_security_group_rule_click_on_security_tab_and_the_security_groups_link.png)

49. Note that the security group inbound rule allows only IPv4 SSH connection using TCP port 22 from anywhere.  
    ![Step 49](./img/49.note_that_the__security_group_inbound_rule_allows_only_ipv4-ssh_connection_using_tcp_port22_from_anywhere.png)

50. Security group outbound rule however allows only IPv4 All traffic connection using all protocol on all ports from anywhere.  
    ![Step 50](./img/50.security_group_outbound_rule_however_allows_only_ipv4-All_traffic_connection_using_all_protocol_on_all_ports_from_anywhere.png)

51. Back to instance, retrieve the public IP address of the instance from details tab.  
    ![Step 51](./img/51.back_to_instance_retrieve_the_public_ip_address_of_the_instance_from_details_tab.png)

52. Using the IP, the site is unreachable due to HTTP rule not defined in the security group.  
    ![Step 52](./img/52.using_the_ip_the_site_is_unreachable_due_to_http_rule_not_defined_in_the_security_group.png)

53. Navigate to "Security groups" on the left side bar and click on it.  
    ![Step 53](./img/53.navigate_to_security_group_on_the_left_side_bar_and_click_on_it.png)

54. Click on "Create security group".  
    ![Step 54](./img/54.click_on_create_security_group.png)

55. Set security group name, select VPC, and under inbound rules click on "Add rule".  
    ![Step 55](./img/55.set_security_group_name_select_vpc_and_under_inbound_rules_click_on_add_rule.png)

56. Add HTTP and SSH inbound rules respectively and set their source to be from anywhere.  
    ![Step 56](./img/56.add_http_and_ssh_inbound_rules_respectively_and_set_their_source_to_be_from_anywhere.png)

57. Keep the outbound rules the way it is.  
    ![Step 57](./img/57.keep_the_outbound_rules_the_way_it_is.png)

58. Now click "Create security group".  
    ![Step 58](./img/58.now_click_create_security_group.png)

59. Security group created successfully.  
    ![Step 59](./img/59.security_group_created_successfully.png)

60. Click on "Instances" to navigate to instances.  
    ![Step 60](./img/60.click_on_instances_to_navigate_to_instances.png)

61. To attach created security group to my-test-instance, select it and click on "Actions" button then "Security" option.  
    ![Step 61](./img/61.to_attach_created_security_group_to_my-test-instance_select_it_and_click_on_actions_button_then_security_option.png)

62. Under security option, click on "Change security groups".  
    ![Step 62](./img/62.under_security_option_click_on_change_my_security_groups.png)

63. On change security groups page, select the created security group.  
    ![Step 63](./img/63.On_change_security_groups_page_select_the_created_security_group.png)

64. Click on "Add security group".  
    ![Step 64](./img/64.click_on_add_security_group.png)

65. See that the security group is now added; now click "Save".  
    ![Step 65](./img/65.see_that_the_security_group_is_now_added_now_click_save.png)

66. Security group now attached successfully; now copy the public address to test it on the browser again.  
    ![Step 66](./img/66.security_group_now_attached_successfully_now_copy_the_public_address_to_test_it_on_the_browser_again.png)

67. It is still unreachable because webserver is not automatically configured to serve webpage on a newly created instance.  
    ![Step 67](./img/67.it_is_still_unreachable_because_webserver_is_not_automatically_configured_to_serve_webpage_on_a_newly_created_instance.png)

68. SSH into the Ubuntu server to manage and configure it to serve web page.  
    ![Step 68](./img/68.ssh_into_the_ubuntu_server_to_manage_and_configure_it_to_serve_web_page.png)

69. Update Ubuntu server.  
    ![Step 69](./img/69.update_ubuntu_server.png)

70. Install apache2.  
    ![Step 70](./img/70.install_apache2.png)

71. Enable apache2 with systemctl.  
    ![Step 71](./img/71.enable_apache2_with_systemctl.png)

72. Start apache2 with systemctl.  
    ![Step 72](./img/72.start_apache2_with_systemctl.png)

73. Reload and the previously unreachable page is now reachable on the browser.  
    ![Step 73](./img/73.reload_and_the_previously_unreachable_page_is_now_reachable_on_the_browser.png)

74. SG Overview - Inbound rule allows SSH and HTTP traffic from any source hence webserver reachable over the internet via CLI (SSH) and browser (HTTP).  
    ![Step 74](./img/74.SG_Overview-Inbound_rules_allow_ssh_http_any_source_website_reachable_over_the_internet_via_cli(ssh)_and_browser(http).png)
75. SG Overview - Outbound rules allows all traffic for all protocol through all port to exit the server.  
    ![Step 75](./img/75.SG_Overview-Outbound_rules_allows_all_traffic_for_all_protocol_through_all_port_to_exit_the_server.png)

#### Scenario 1: Inbound Rules for HTTP/SSH, Outbound for All (Default Successful Access)
This is the initial configuration where inbound allows HTTP and SSH from anywhere, and outbound allows all traffic. The website is reachable.

#### Scenario 2: Inbound Rules for HTTP/SSH, No Outbound Rules
76. On the outbound rules tab, click "Edit outbound rules".  
    ![Step 76](./img/76.on_the_outbound_rules_tab_click_edit_outbound_rules.png)

77. Click "Delete" to delete outbound rule and click "Save rules".  
    ![Step 77](./img/77.click_delete_to_delete_outbound_rule_and_click_save_rules.png)

78. Outbound security rules now deleted.  
    ![Step 78](./img/78.outbound_security_rules_now_deleted.png)

79. Website reachability tested after deleting the outbound rules and nothing breaks as website is still reachable.  
    ![Step 79](./img/79.website_reacheability_tested_after_deleting_the_outbound_rules_and_nothing_breaks_as_website_is_still_reachable.png)

(Website remains reachable due to the stateful nature of Security Groups.)

#### Scenario 3: Remove Both Inbound and Outbound Rules
80. Back to the created Security Group, click "Inbound rules" and then "Edit inbound rules".  
    ![Step 80](./img/80.back_to_the_created_Security_Group_click_inbound_rules_and_then_edit_inbound_rules.png)

81. Delete both inbound rules and click "Save rules".  
    ![Step 81](./img/81.delete_both_inbound_rule_and_click_save_rules.png)

82. Like outbound rules, inbound rules have now been deleted.  
    ![Step 82](./img/82.like_outbound_rules_inbound_rules_have_now_been_deleted.png)

83. Web page now unreachable again.  
    ![Step 83](./img/83.web_page_now_unreachable_again.png)

(No access without inbound rules.)

#### Scenario 4: No Inbound Rules, Outbound Rules for HTTP
84. Back to the created Security Group, click "Outbound rules" and then "Edit outbound rules".  
    ![Step 84](./img/84.back_to_the_created_Security_Group_click_outbound_rules_and_then_edit_outbound_rules.png)

85. Click on "Add rules".  
    ![Step 85](./img/85.click_on_add_rules.png)

86. Set type HTTP, protocol TCP, port 80, Destination Anywhere, and save rules.  
    ![Step 86](./img/86.set_type_http_protocol_tcp_port_80_Destination_Anywhere_and_save_rules.png)

87. Outbound rules successfully modified.  
    ![Step 87](./img/87.outbound_rules_successfully_modified.png)

88. Note that inbound rules is still empty because we deleted it.  
    ![Step 88](./img/88.note_that_inbound_rules_is_still_empty_because_we_deleted_it.png)

89. Web page now unreachable again.  
    ![Step 89](./img/89.web_page_now_unreachable_again%20-%20Copy.png)

90. Note that the outbound traffic works normally when we curl amazon.com via the instance connect CLI.  
    ![Step 90](./img/90.note_that_the_outbount_traffic_work_normally_when_we_curl_amazon.com_via_the_instance_connect_cli.png)

90b. Reset the SG to allow inbound HTTP traffic; we need this to test the NACL as we go further.  
    ![Step 90b](./img/90b.reset_the_SG_to_allow_inbound_http_traffic_we_need_this_to_test_the_NACL_as_we_go_further.png)

(Outbound allows traffic, but no inbound means the website is unreachable from outside.)

### Part 2: NACLs

We now configure NACLs at the subnet level, examining defaults and modifying rules to allow/deny traffic, demonstrating their stateless nature.

91. Navigate to VPC using the console search.  
    ![Step 91](./img/91.navigate_to_vpc_using_the_console_search.png)

92. Click on "Network ACLs" to navigate to it.  
    ![Step 92](./img/92.click_on_network_ACLs_to_navigate_to_it.png)

93. Click on "Create network ACL".  
    ![Step 93](./img/93.click_on_create_network_ACL.png)

94. Name network ACL, select the created VPC, and click "Create network ACL".  
    ![Step 94](./img/94.name_network_ACL_select_the_created_vpc_and_click_create_network_acl.png)

95. Note that it denies all inbound traffic by default.  
    ![Step 95](./img/95.note_that_it_denies_all_inbound_traffic_by_default.png)

96. All outbound traffic are also denied by default.  
    ![Step 96](./img/96.all_outbound_traffic_are_also_denied_by_default.png)

#### Examine Default Settings
Defaults deny all traffic (as shown above).

#### Modify Inbound to Permit All
97. Click on "Inbound rules" tab then "Edit inbound rules".  
    ![Step 97](./img/97.click_on_inbound_rules_tab_then_edit_inbound_rules.png)

98. Click on "Add new rule".  
    ![Step 98](./img/98.click_on_add_new_rule.png)

99. Set rule number 1, all traffic, any source, then allow and click "Save changes".  
    ![Step 99](./img/99.set_rule_number_1_all_traffic_any_source_then_allow_and_click_save_changes.png)

100. Successfully updated inbound rules for NACL; click "Actions" and "Subnet association" to associate NACL with subnet.  
    ![Step 100](./img/100.successfully_updated_inbound_rules_for_NACL_click_Action_and_subnet_association_to_associate_NACL_with_subnet.png)

101. On edit subnet page, click public subnet and save changes.  
    ![Step 101](./img/101.on_edit_subnet_page_click_public_subnet_and_save_changes.png)

102. Successfully updated subnet association.  
    ![Step 102](./img/102.successfully_updated_subnet_association.png)

103. Web page unreachable even though we set inbound rules to allow all traffic; this is because NACL is stateless.  
    ![Step 103](./img/103.web_page_unreachable_even_though_we_set_inbound_rules_to_allow_all_traffic_this_is_because_NACL_is_stateless.png)

104. Even though the inbound rules allow traffic, the outbound rules deny.  
    ![Step 104](./img/104.even_though_the_inbound_rules_allow_traffic_the_outbound_rules_deny.png)

105. Here is outbound rules that denies.  
    ![Step 105](./img/105.here_is_outbound_rules_that_denies.png)

106. Here is the architecture overview that makes the website unviewable.  
    ![Step 106](./img/106.Here_is_the_architecture_overview_that_makes_the_website_unviewable.png)

#### Adjust Outbound to Allow All
107. Select created NACL, click the "Outbound rules" tab, and edit outbound rules.  
    ![Step 107](./img/107.select_created_NACL_click_the_outbound_rules_tab_and_edit_outbound_rules.png)

108. Click "Add new rule".  
    ![Step 108](./img/108.click_add_new_rule.png)

109. Set rule number to 1, all traffic, all destination, allow, save changes.  
    ![Step 109](./img/109.set_rule_number_to-1_all_traffic_all_destination_allow_save_changes.png)

110. Outbound traffic updated successfully allowing all traffic.  
    ![Step 110](./img/110.outbound_traffic_updated_successfully_allowing_all_traffic.png)

111. Website now reachable due to inbound and outbound rules allowing traffic.  
    ![Step 111](./img/111.website_now_reachable_due_to_inbound_and_outbound_rules_allowing_traffic.png)

#### Additional Scenario: Allow All in SG, Deny All in NACL
112. In this new scenario, set security group inbound rules to allow HTTP and SSH from anywhere.  
    ![Step 112](./img/112.in_this_new_scenerio_set_security_group_inbound_rules_to_allow_HTTP_and_SSH_from_anywhere.png)

113. Also set security group outbound rules to allow all traffic to anywhere and save rules.  
    ![Step 113](./img/113.also_set_security_group_outbound_rules_to_allow_all_traffic_to_anywhere_and_save_rules.png)

114. All types of outbound traffic now allowed to any destination over the internet.  
    ![Step 114](./img/114.all_types_of_outbound_traffic_now_allowed_to_any_destination_over_the_internet.png)

115. Navigate back to NACL, remove NACL inbound rules that allow all traffic, and save rule.  
    ![Step 115](./img/115.navigate_back_to_NACL_remove_NACL_inbound_rules_that_allow_all_traffic_and_save_rule.png)

116. NACL inbound rules now deny all traffic types of all protocols on all port from all source.  
    ![Step 116](./img/116.NACL_inbound_rules_now_deny_all_traffic_types_of_all_protocols_on_all_port_from_all_source.png)

117. Also remove outbound rules that allow all traffic to all destination and save changes.  
    ![Step 117](./img/117.Also_remove_outbound_rules_that_allow_all_traffic_to_all_destination_and_save_changes.png)

118. NACL outbound rules now deny all traffic types of all protocols on all port to all destinations.  
    ![Step 118](./img/118.NACL_outbound_rules_now_deny_all_traffic_types_of_all_protocols_on_all_port_to_all_destinations.png)

119. Web page unreachable because NACL denies traffic.  
    ![Step 119](./img/119.web_page_unreachable_because_NACL_denies_traffic.png)

(Even with permissive SG rules, NACL denials block traffic at the subnet level.)

## Project Reflection

Successfully configured Security Groups and NACLs to control inbound and outbound traffic in AWS. Identified the differences between Security Groups and NACLs and their respective roles in network security. Explored various scenarios to understand how Security Groups and NACLs interact and impact network traffic. Learned valuable troubleshooting techniques for diagnosing and resolving network connectivity issues in AWS. Overall, gained practical experience and confidence in managing network security within AWS environments.