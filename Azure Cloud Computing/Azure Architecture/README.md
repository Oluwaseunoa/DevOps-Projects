# Microsoft Azure Fundamentals (AZ-900) — Section 3 Lab
## Azure Architecture: Resource Groups, Regions, Tagging & Governance

> **Lab Provider:** Dion Training | **Estimated Duration:** 15 minutes  
> **Platform:** Microsoft Azure (Free Account) | **Tools Used:** Azure Portal · Resource Groups · Storage Accounts · Cost Management · ARM · IAM
>**Completed by OLUWASEUN OSUNSOLA** [View LinkedIn](https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/)

---

## 📋 Lab Overview

Continuing as IT consultant for **CloudFirst Retail**, this lab focused on establishing a proper organizational structure in Azure before any production workloads are deployed. The goal was to demonstrate how Azure's resource hierarchy works, how region selection impacts deployments, and how a tagging strategy enables accurate cost tracking — all core concepts for AZ-900 and real-world cloud governance.

---

## 🎯 Learning Objectives

- Create and configure Azure Resource Groups with proper naming conventions
- Deploy resources across different regions within the same Resource Group
- Implement a tagging strategy and observe that tags do **not** auto-inherit to resources
- Navigate the Azure organizational hierarchy: Subscriptions → Resource Groups → Resources
- View ARM deployment history to understand Infrastructure as Code (IaC)
- Explore RBAC role assignment and policy inheritance at the Resource Group level

---

## 🧰 Prerequisites

- Active Azure free account
- Access to the Azure Portal
- 15 minutes of focused time

**Azure Services Used:** Resource Groups · Storage Accounts · Azure Portal (Cost Management, Subscriptions, Deployments, Activity Log)

---

## 🪜 Step-by-Step Walkthrough

---

### Step 1 — Sign In to the Azure Portal

Signed into the Azure Portal at `https://portal.azure.com`. This is the entry point for all Azure resource management.

![Sign into Azure Portal](img/1.sign_into_Azure_portal_create_account_if_you've_not.png)

---

### Step 2 — Navigate to Resource Groups

Searched for **Resource groups** in the top search bar and navigated to the Resource Groups page. Resource Groups are the logical containers that organise every Azure resource — this is where governance, access control, and cost tracking begin.

![Search for Resource Groups](img/2.search_for_resource_group_and_click_on_it_to_go_to_the_page.png)

Clicked **+ Create** to begin creating a new Resource Group.

![Click Create](img/3.click_create.png)

---

### Step 3 — Create the CloudFirst Retail Resource Group

Configured the Resource Group with the following settings, following Azure naming best practices (`rg-[application]-[environment]-[region]`):

- **Subscription:** Azure Free Account
- **Resource group name:** `rg-cloudfirst-test-eastus`
- **Region:** East US

![Configure RG name, subscription, and region](img/4.select_subscription_enter_RG_name_and_select_region_then_next.png)

On the **Tags** tab, added three organisational tags to the Resource Group:

| Name | Value |
|---|---|
| Environment | Test |
| Project | CloudFirst-Retail |
| Department | IT-Consulting |

![Add tags to Resource Group](img/5.enter_environment_tag_project_tag_and_department_tag_then_review_and_create.png)

Reviewed all settings and clicked **Create**.

![Verify and create Resource Group](img/6.verify_setting_and_click_create.png)

Resource Group `rg-cloudfirst-test-eastus` was successfully created. Clicked on it to enter the RG dashboard.

![RG created — click to open](img/7.rg-cloudfirst-test-eastus_created_now_click_on_it.png)

> **Why This Matters:** The RG region only determines where its **metadata** is stored — not where the resources inside must live. This matters for compliance and data residency requirements.

---

### Step 4 — Deploy a Storage Account in a Different Region

From inside the Resource Group, clicked **+ Create** to deploy a resource.

![Click Create inside RG](img/8.in_the_RG_dashboard_click_create.png)

Searched for **Storage account** and selected it from the results.

![Search for Storage Account](img/9.in_search_box_type_storage_account_and_click_enter_then_select_it_from_the_result.png)

On the Storage Account creation page, confirmed the subscription and plan.

![Select subscription and plan](img/10.on_the_storage_account_dashboard_select_subscription_and_plan_click_create.png)

Configured the Storage Account with intentionally different region from the RG to demonstrate that Resource Groups are logical, not physical, boundaries:

- **Subscription:** Pre-selected
- **Resource group:** `rg-cloudfirst-test-eastus` (pre-selected)
- **Storage account name:** `cfretailtest234`
- **Region:** South Africa North *(different from the RG's East US region)*
- **Performance:** Standard
- **Redundancy:** Locally-redundant storage (LRS)

![Configure Storage Account settings](img/11.Sub_and_RG_preset_enter_SA_name_cfretailtest234_region_SouthAfricaNorth_perfomance_standard_redundancy_LRS_then_review_and_create.png)

Clicked **Create** to deploy.

![Click Create to deploy](img/12.click_create.png)

Deployment completed successfully. Clicked **Go to resource**.

![Deployment complete](img/13.deployment_now_completed_click_to_g_to_resources.png)

---

### Step 5 — Observe Cross-Region Deployment

In the storage account **Essentials** section, confirmed that the resource location shows **South Africa North** — even though the parent Resource Group is in **East US**. This proves that Resource Groups are purely logical containers with no physical boundary restrictions.

![Resource location is South Africa North despite RG being East US](img/14.note_under_essentials_that_the_resource_location_is_southafricanorth_though_RG_location_is_EastUS.png)

> **Real-World Application:** CloudFirst Retail could have development resources in South Africa, production infrastructure in East US, and manage them all under the same Resource Group for unified governance.

---

### Step 6 — Observe Tag Non-Inheritance (Critical AZ-900 Concept)

Clicked **Tags** under Settings on the storage account. The Tags page was completely **empty** — even though the parent Resource Group had three tags applied.

![Tags are empty — not inherited from RG](img/15.click_on_the_tags_and_notice_that_tags_are_empty_because_they_are_not_inherited_from_RG.png)

> ⚠️ **Key Concept — Exam Trap:** Tags applied to a Resource Group do **NOT** automatically flow down to resources inside. This is one of the most commonly tested and most commonly misunderstood concepts in AZ-900 and in production environments.

---

### Step 7 — Apply Tags Directly to the Storage Account

Manually applied four tags directly to the storage account to enable accurate cost tracking and organisational management:

| Name | Value |
|---|---|
| Environment | Test |
| Project | CloudFirst-Retail |
| Department | IT-Consulting |
| CostCenter | CC-1001 |

Clicked **Apply** to save.

![Apply 4 tags directly to storage account](img/16.add_the_3_tags_added_to_RG_to_resource_and_CostCenter_CC-1001_making_4_then%20apply.png)

> **Why This Matters:** These tags now appear in billing reports and cost analysis dashboards. In production, Azure Policy is used to automatically enforce tagging requirements — blocking deployments that don't include required tags like `Project` and `CostCenter`.

---

### Step 8 — View the Azure Resource Hierarchy

Navigated back home and searched for **Subscriptions** to trace the full Azure organisational hierarchy in action.

![Navigate home and go to Subscriptions](img/17.navigate_back_home_and_click_on_subscription_or_search_and_then_click.png)

Selected the active subscription.

![Select subscription](img/18.select_subscription.png)

Inside the subscription dashboard, clicked on `rg-cloudfirst-test-eastus` under Resource Groups to confirm the storage account `cfretailtest234` is listed — visually confirming the hierarchy: **Subscription → Resource Group → Resource**.

![Confirm Azure hierarchy: Sub → RG → Resource](img/19.in_Sub_dashboard_click_RG-rg-cloudfirst-test-eastus_to_see_cfretailtest234_and_confirm_azure_hierachy.png)

> **Governance Insight:** RBAC permissions and Azure Policies applied at the Subscription or Resource Group level **do** inherit downward to all resources within — unlike tags. This is how enterprises govern thousands of resources with minimal administrative effort.

---

### Step 9 — Explore Cost Management with Tags

Inside the Resource Group, navigated to **Cost Management → Cost Analysis**.

![Click Cost Management then Cost Analysis](img/20.under_RG_click_cost_management_then_cost_analysis.png)

The dashboard showed no data — expected behaviour for newly created resources. Cost data typically takes **8–24 hours** to appear after resource creation.

![No data displayed — normal for new resources](img/21.note_that_there_is_nothing_to_display_because_it_takes_8-24hrs_to_display_cost_for_a_newly_created_resource.png)

Clicked **View** to explore the available cost breakdown filter options.

![View different filter parameters](img/22.click_view_to_see_different_filter_parameters.png)

Noted that costs can be grouped and filtered by tags — enabling per-project, per-department, and per-environment cost attribution once data becomes available.

![Costs can be grouped by tags](img/23.note_groupings_can_also_be_by_tags_for_a_more_organized_report.png)

> **Business Impact:** Without consistent resource-level tagging, a total cloud bill gives no visibility into which project or team is driving spend. With tags like `Project=CloudFirst-Retail` and `CostCenter=CC-1001`, finance can allocate costs precisely and identify overruns early.

---

### Step 10 — View ARM Deployment History

From the Resource Group, navigated to **Settings → Deployments** to view the Azure Resource Manager deployment audit trail.

![Click Deployments under RG Settings](img/24.from_RG_%20click_rgcloudfirst-test-eastus_under_its_setting_click_deployments.png)

Reviewed the deployment list — noting the **Status** (Succeeded) and the **Duration** it took to provision the storage account.

![Note deployment status and duration](img/25.note_the_status_and_the_duration_it_took_to_create_it_then_click_on_the_name.png)

Clicked on the deployment name and explored the **Inputs**, **Outputs**, and **Template** tabs.

![Inputs, Outputs, and Template available](img/26.note_both_input_output_and_template_are_provided_click_on_template.png)

Viewed the underlying **ARM template** — the JSON infrastructure-as-code blueprint that Azure used to provision the storage account. This same template can be exported, version-controlled, and reused for repeatable deployments.

![View ARM template for IaC](img/27.view_ARM_template_for_IaC_automation_and_templating.png)

> **DevOps Connection:** Every Azure deployment — whether made through the portal, CLI, or SDK — goes through ARM. The deployment history and exportable templates are the foundation of Infrastructure as Code (IaC) practices that senior cloud engineers rely on.

---

### Step 11 — Explore RBAC and Policy Inheritance

From the Resource Group, navigated to **Access control (IAM) → Role assignments**.

![Click IAM then Role assignments](img/28.from_RG_%20click_rgcloudfirst-test-eastus_under_its_access_control_IAM_click_role_assignment.png)

Observed that my account has the **Owner** role — inherited from the Subscription level above. The **Scope** column confirmed the permission originated at the subscription, not the Resource Group itself.

![Owner role inherited from Subscription](img/29.note_my_account_has_inherited_owner_role_from_subscription.png)

> **Key Distinction — Inheritance Rules:**
> | Feature | Inherits Down? |
> |---|---|
> | RBAC Permissions | ✅ Yes |
> | Azure Policies | ✅ Yes |
> | Tags | ❌ No |

---

## 🏗️ Azure Governance Hierarchy (Visualised)

```
Root Management Group
    └── Management Groups (up to 6 levels)
            └── Subscriptions (billing boundary)
                    └── Resource Groups (logical container)
                            └── Resources (VMs, Storage, Databases...)

Permissions & Policies → flow DOWN ✅
Tags → do NOT flow down ❌
```

---

## 📝 Key Takeaways

**Resource Groups Are Logical, Not Physical**
Resource Groups only store metadata in their selected region. Resources inside can be deployed in any Azure region globally — demonstrated by deploying a storage account in South Africa North inside an East US Resource Group.

**Tag Inheritance Is a Myth (The Most Common Exam Trap)**
Tags must be applied directly and individually to each resource. Tagging only the Resource Group gives a false sense of coverage and leads to incomplete cost reports in production environments.

**RBAC and Policies DO Inherit**
Unlike tags, RBAC permissions and Azure Policies flow automatically from Subscription → Resource Group → Resource. This is the mechanism that enables governance at scale without manually configuring every resource.

**ARM Powers Everything**
Every Azure operation — portal click, CLI command, SDK call — is processed through Azure Resource Manager. ARM's deployment history provides a full audit trail and the exported templates enable repeatable, version-controlled infrastructure deployments (IaC).

**Region Selection Has Real Impacts**
Beyond geography, region choice affects latency, cost (up to 30–50% variance for the same service), data residency compliance, and service availability. Region selection is a deliberate architectural decision, not just a default.

---

## 🧪 Exam Tips (AZ-900)

| Question Pattern | Answer |
|---|---|
| Can resources in a RG be in different regions? | Yes — RG is logical, not physical |
| What happens when you delete a Resource Group? | All resources inside are deleted permanently |
| Do tags on a RG flow to resources inside? | No — tags must be applied to each resource directly |
| What DOES inherit from RG to resources? | RBAC permissions and Azure Policies |
| What handles all Azure deployment requests? | Azure Resource Manager (ARM) |
| What does ARM idempotence mean? | Running the same deployment multiple times produces the same result |
| What sits above Subscriptions in Azure governance? | Management Groups |
| How deep can Management Groups nest? | 6 levels (excluding root) |

---

## 🔗 Resources

- [Azure Portal](https://portal.azure.com)
- [Azure Resource Manager Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/)
- [Azure Naming Conventions](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)
- [Dion Training — AZ-900 Course](https://diontraining.com)

---

*Lab completed by Oluwaseun Osunsola [[View LinkedIn](https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/)] as part of the Microsoft Azure Fundamentals (AZ-900) certification preparation — Section 3: Azure Architecture.*