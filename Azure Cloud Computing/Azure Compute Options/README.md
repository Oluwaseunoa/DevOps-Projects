# Microsoft Azure Fundamentals (AZ-900) — Section 4 Lab
## Azure Compute Options: VMs, App Service, Functions & Cost Analysis

> **Certification Track:** Microsoft Azure Fundamentals (AZ-900)
> **Platform:** Microsoft Azure (Free Account)
> **Estimated Duration:** 25 minutes
> **Tools Used:** Azure Portal · Azure Pricing Calculator · Resource Groups · Virtual Machines · App Service · Azure Functions · Azure Advisor · Cost Management
> **Completed by: Oluwaseun Osunsola [[LinkedIn](https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/)]**

---

## 📋 Lab Overview

In this hands-on lab, I acted as IT consultant for **CloudFirst Retail**, tasked with evaluating Azure compute options before committing to any infrastructure. The goal was to explore VM configuration in depth, compare VM sizing families and pricing across development vs. production workloads, understand the IaaS → PaaS → Serverless spectrum, and navigate cost optimization tools — all without deploying live resources or incurring charges.

This is the **planning and analysis phase** every cloud architect completes before production deployment.

---

## 🎯 Learning Objectives

- Create a tagged Resource Group for a development environment
- Explore full VM configuration options (Basics, Disks, Networking, Management, Monitoring, Tags) without deploying
- Use the Azure Pricing Calculator to compare B, D, and E-series VM costs and savings plans
- Navigate Azure Advisor's five optimization pillars
- Explore App Service (PaaS) and Azure Functions (Serverless) creation flows and pricing tiers
- Navigate Cost Management + Billing and apply tag-based cost filters

---

## 🪜 Step-by-Step Walkthrough

---

### Step 1 — Create a Resource Group with Tags

Signed into the Azure Portal and searched for **Resource Groups** to begin provisioning a tagged development environment for CloudFirst Retail.

![Login and search Resource Groups](img/1.login_to_azure_portal_search_Resource_groups_and_click_on_the_result.png)

Clicked **Create** to begin.

![Click Create](img/2.click_create_button.png)

Selected the subscription, entered the Resource Group name `rg-cloudfirst-dev`, and chose **East US** as the region.

![Select subscription, name and region](img/3.select_subscription_name_%20rg-cloudfirst-dev_region_US_East.png)

![Confirm RG name and East US region, then Next](img/4.select_subscription_name_RG-%20rg-cloudfirst-dev_RG_region-EAST_US_then_next.png)

Added the following governance tags to enable cost tracking and resource management:

| Tag | Value |
|---|---|
| Environment | Development |
| Project | CloudFirst-Retail |
| CostCenter | IT-Development |

![Enter tags then Review and Create](img/5.enter_tags_then_review_and_create.png)

![Click Create to provision the RG](img/6.click_create.png)

Resource Group created successfully. Clicked to open the RG dashboard.

![RG created — click to go to RG](img/7.RG_created_click_to_go_to_RG.png)

![rg-cloudfirst-dev now listed](img/8.%20rg-cloudfirst-dev_now_listed.png)

> **Key Insight:** Tags are metadata applied to resources. They enable cost tracking by department, automated governance via Azure Policy, and compliance reporting. Azure resources support up to **50 tags** each.

---

### Step 2 — Explore Virtual Machine Configuration (Without Deploying)

Searched for **Virtual Machines** in the portal search bar and selected it.

![Search Virtual Machines](img/9.in_the_search_enter_virtual_machine_and_click_on_the_result.png)

Clicked **Create**.

![Click Create](img/10.click_create.png)

Selected **Virtual machine** from the dropdown.

![Click Create → Virtual machine](img/11.click_create_and_then_virtual_machine.png)

#### Basics Tab — Project Details

Selected the subscription and `rg-cloudfirst-dev` as the Resource Group.

![Select subscription and RG](img/12.select_subscription_and_RG.png)

Configured instance details:
- **VM name:** vm-cloudfirst-dev
- **Region:** East US
- **Availability options:** No infrastructure redundancy required
- **Security type:** Standard
- **Image:** Ubuntu Server 24.04 LTS - x64 Gen2

![Instance details configuration](img/13.instance_details_vm-cloudfirst-dev%20_RG_EASTUS_no_infra_redundancy_standard_security_Ubuntu_Server_24.04%20LTS-x64_Gen2.png)

Selected the **B1s** size (1 vCPU, 1 GiB RAM) at **$7.59/month** — a Burstable, cost-effective instance ideal for dev/test variable workloads. Set authentication type to Password.

![B1s size selected — $7.59/month, authentication set to password](img/14.size-B1_vCPU_1_GiB_RAM_7.59_per_month_authentication-password.png)

Set the admin username, password, and configured inbound ports to allow **SSH (port 22)**.

![Username, password and SSH inbound port configuration](img/15.set_username_and_password_allow_inbound_traffic_on_selected_port_and_select_port_22_SSH_then_next.png)

> ⚠️ **Security Note:** Opening SSH port 22 to the internet is flagged with a security warning. In production, use Azure Bastion or restrict source IPs via Network Security Group rules.

#### Disks Tab

Selected **Standard SSD (locally redundant storage)** — a balanced cost/performance option at ~$6–8/month, recommended for most workloads. Proceeded to Networking.

![Disk type — Standard SSD, LRS](img/16.for_disk_standard_SSD_locally_redundant_storage_then_next_to_networking.png)

> **Disk Type vs. SLA:**
> | Disk Type | ~Cost/Month | Single-Instance SLA |
> |---|---|---|
> | Standard HDD | $4–5 | No SLA |
> | Standard SSD | $6–8 | No SLA |
> | Premium SSD | $20–25 | **99.9%** |

#### Networking Tab

Observed that Azure **automatically generates** all networking resources — Virtual Network, subnet, Public IP, and Network Security Group — when a VM is configured. No manual setup required.

![Auto-generated VNet, Public IP, Subnet, NIC, NSG — SSH port 22](img/17.vnet,publicIp,subnet_are_automatically_generated_nic_basic_inbound_ssh_port22_next_to_management.png)

> **Key Insight:** VM deployment creates 6 resources automatically — the VM, VNet, subnet, NIC, Public IP, NSG, and OS disk. Each is a separately managed resource.

#### Management Tab

Enabled **Managed Identity** and **Microsoft Entra ID** login, and noted the **Auto-shutdown** option — a cost-saving feature that schedules automatic VM shutdown at a specified time.

![Enable Identity, Entra ID and Auto-shutdown](img/18.enable_identitity_entraID_and_check_auto_shutdown.png)

Enabled **Backup** and **Guest OS periodic assessment** for patch management.

![Enable Backup and Guest OS periodic assessment](img/19.enable_backup_GuestOS_periodic_assessment_then_next_to_monitoring.png)

#### Monitoring Tab

Reviewed monitoring options — enabled **OS guest diagnostics** and **Boot diagnostics** (uses managed storage at no extra cost).

![Enable OS guest diagnostics and Boot diagnostics](img/20.Enable_OS_guest_diagnostics_and_Boot_diagnostics_next_to_advanced.png)

#### Advanced Tab

Left all Advanced configuration options at their defaults — Extensions, Cloud-init scripts, and User data are optional features not required for this lab.

![Advanced tab — leave all defaults](img/21.leave_all_Advanced_configuration_by_default_and_next_to_tags.png)

#### Tags Tab

Manually applied the same three tags from the Resource Group to the VM. This is a critical exam concept — tags applied to the RG are **not inherited** by child resources.

![Add tags manually — not inherited from RG](img/22.add_the_tags_added_to_the_RG_because_it's_not_inherited_then_review_and_create.png)

> **⚠️ Critical Exam Concept:** Tags do NOT inherit from Resource Groups to resources. RBAC permissions, Azure Policy assignments, and Resource Locks DO inherit — but tags must be applied explicitly at each resource level.

#### Review + Create — Download ARM Template (No Deployment)

Ignored the validation error (expected for a conceptual lab) and clicked **Download a template for automation** to capture the ARM template — a JSON representation of the full VM configuration ready for IaC reuse.

![Ignore validation error — download ARM automation template for IaC](img/23.ignore_validation_error_because_lab_is_conceptual_click_download_automation_template_for_IaC_with_ARM.png)

Clicked **Cancel** — the full configuration was explored without deploying any resources or incurring costs.

![Cancel VM creation](img/24.click_to_cancle_creation_process.png)

---

### Step 3 — Compare VM Sizes & Pricing with Azure Pricing Calculator

Navigated to the **Azure Pricing Calculator** and added Virtual Machines to begin a three-way cost comparison across VM sizing families.

![Visit Azure Pricing Calculator — add Virtual Machines](img/25.visit_Azure_Pricing_Calculator_page_find_VirtualMachines_in_the_Featured%20products_and_add_to_estimate.png)

#### VM 1 — Development (B1s): $7.59/month

Configured: Linux · Ubuntu · East US · Standard · **B1s (1 vCPU, 1 GiB RAM)**

![B1s configuration — $7.59/month](img/26.configure_Linux_ubuntu_B1s_Standard_tier_VM_in_EastUS_estimated_cost_is_now_7.59USD.png)

#### VM 2 — Production (D2s v3): $70.08/month

Added a second VM instance to the estimate.

![Add second VM to estimate](img/27.click_add_to_estimate_again_to_have_new_VM_instance.png)

Configured: Linux · Ubuntu · East US · Standard · **D2s v3 (2 vCPU, 8 GiB RAM)**

![D2s v3 configuration](img/28.configure_Linux_ubuntu%20D2s_v3_2%20vCPU_8_GiB_RAM_Standard_tier_VM_in_EastUS_estimated_cost_is_now_7.59USD_then_scroll_to_see_the_cost.png)
**Production VM estimated monthly cost: $70.08** — approximately 9× the cost of the dev B1s.

![D2s v3 cost — $70.08/month](img/29.note_the_cost_is_70.08USD_per_month.png)

#### VM 3 — Memory-Optimized (E2s v3): $91.98/month

Added a third comparison instance: **E2s v3 (2 vCPU, 16 GiB RAM)** for memory-intensive workloads such as databases and caching.

![Add E2s v3 — 2 vCPU, 16 GiB RAM](img/30.add_third_comparison_2%20vCPU_16_GiB_RAM.png)

**Memory-optimized VM estimated monthly cost: $91.98**

![E2s v3 cost — $91.98/month](img/31.note_this_cost_91.98USD_monthly.png)

#### Exploring Savings Plans and Reserved Instances

Explored all available commitment-based pricing options to understand long-term savings:

**1-Year Savings Plan — 31% discount → $63.47/month**

![1-year savings plan — 31% off, $63.47/month](img/32.explore_1_year_saving_plan_for_31percent_discount_cost_now_63.47_.png)

**3-Year Savings Plan — 53% discount → $43.23/month**

![3-year savings plan — 53% off, $43.23/month](img/33.explore_3_year_saving_plan_for_53percent_discount_cost_now_43.23USDpermonth_.png)

**1-Year Reserved Instance — 38% discount → $57.08/month**

![1-year reserved — 38% off, $57.08/month](img/34.explore_1_year_reservaion_plan_for_38percent_discount_cost_now_57.08USDpermonth_.png)

**3-Year Reserved Instance — 60% discount → $36.05/month**

![3-year reserved — 60% off, $36.05/month](img/35.explore_3_year_reservaion_plan_for_60percent_discount_cost_now_36.05USDpermonth_.png)

#### VM Cost Comparison Summary

| VM | Series | vCPU | RAM | Pay-as-you-go | 1-Yr Reserved | 3-Yr Reserved |
|---|---|---|---|---|---|---|
| B1s | Burstable (Dev) | 1 | 1 GiB | $7.59 | — | — |
| D2s v3 | General Purpose (Prod) | 2 | 8 GiB | $70.08 | $57.08 | $36.05 |
| E2s v3 | Memory-Optimized | 2 | 16 GiB | $91.98 | — | — |

> **VM Series Quick Reference:**
> - **B = Burstable** — Budget dev/test, variable workloads
> - **D = Daily Use** — Balanced CPU/memory, production apps
> - **E = Enormous Memory** — RAM-intensive databases, caching
> - **F = Fast CPU** — Compute-intensive batch processing
> - **M = Massive Memory** — Terabyte-scale configurations

---

### Step 4 — Explore Azure Advisor Recommendations

Switched back to the Azure Portal and searched for **Advisor**.

![Search Advisor and click on it](img/36.switch_to_azure_portal_back_and_search_Advisor_then_click_on_it.png)

Reviewed the five Advisor recommendation pillars and clicked through to **Cost** — confirmed that the environment is following current recommendations (no active cost alerts for the new environment).

![Review 5 pillars — Cost shows recommendations are being followed](img/37.review_the_5_recommendation_click_on_cost_all_shows_you_are_following_recommendation.png)

> **Azure Advisor — Five Pillars:**
> | Pillar | What It Addresses |
> |---|---|
> | Cost | Right-size VMs, delete unused resources, buy Reserved Instances |
> | Security | Enable MFA, apply NSG rules, enable disk encryption |
> | Reliability | Use Availability Zones, enable backup |
> | Operational Excellence | Implement tagging, configure monitoring |
> | Performance | Upgrade disk types, scale resources |
>
> Advisor is **completely free**, requires no configuration, and needs **24–48 hours** of usage data to generate active recommendations.

---

### Step 5 — Compare Azure Compute Service Options

#### App Service (PaaS) — Explore Configuration

Searched for **App Services** and clicked on the result.

![Search App Services](img/38.search_for_app_services_and_click_on_the_result.png)

Clicked **Create → Web App**.

![Click Create → Web App](img/39.click_create_then_webapp.png)

Configured basics: Subscription · `rg-cloudfirst-dev` · Name: `cf-dev-webapp` · Runtime: **Node 24** · OS: **Linux** · Region: **East US**.

![App Service basics configuration](img/40.select_sub_RG_rg-cloudfirst-dev_name_rg-cloudfirst-dev_runtime_Node24_OS_linux_EastUS.png)

> **Key Observation vs. VM:** No OS selection screen, no disk configuration, no networking setup. Azure manages all infrastructure — you only configure the application runtime.

Clicked **Explore pricing plans** to review available tiers.

![Click Explore pricing plans](img/41.under_pricing_plan_click_explore_pricing_plans.png)

Clicked **Learn more about App Service pricing** to open the full pricing page.

![Click Learn more about App Service pricing](img/42.click_learn_more_about_app_service_pricing_plan.png)

Applied filters to match the lab requirements.

![Set filter to match needs](img/43.ensure_the_filter_matches_needs.png)

**F1 (Free tier)** — 1 GB RAM, 60 min/day compute. Great for learning and development.

![F1 is Free](img/44.F1_is_free.png)

**B1 (Basic)** — Always-on, custom domains at **$12.41/month**.

![B1 Basic — $12.41/month](img/45.review_B_series_B1_is_12.41USD.png)

Clicked to view Standard plans.

![View Standard plans](img/46.click_here_to_see_Standard_plans.png)

**S1 (Standard)** — Auto-scaling, staging slots at **$69.35/month**.

![S1 Standard — $69.35/month](img/47.see_S-series_S1_is_69.35USD_per_month.png)

**P1V2 (Premium Legacy)** — Advanced scaling, VNet integration at **$73.73/month**.

![P1V2 Premium — $73.73/month](img/48.on_the_same_page_review_legacy_premium_plan_P1V2_is_73.73usd_per_month.png)

Cancelled App Service creation — exploration complete.

![Cancel App Service creation](img/49.back_to_app_service_creation_page_cancle_everything.png)

#### Azure Functions (Serverless) — Explore Configuration

Searched for **Function App**.

![Search Function App](img/50.search_for_function_app.png)

Clicked **Create**.

![Click Create](img/51.click_create.png)

Selected **Flex Consumption** (pay-as-you-go serverless hosting) to demonstrate the event-driven, per-execution billing model — the first 1 million executions per month are free.

![Select Flex Consumption — pay-as-you-go serverless](img/52.select_flex_consumption_for_pay_as_you_go.png)

Configured: Subscription · `rg-cloudfirst-dev` · Name: `cf-dev-functions` · Runtime: **Node 22 LTS** · OS: **Linux** · Region: **East US**.

![Function App configuration](img/53.select_sub_RG_rg-cloudfirst-dev_name_cf-dev-functions_runtime_Node22LTS_OS_linux_EastUS.png)

> **Key Observation vs. App Service:** No infrastructure management at all. You provide only the code and runtime. Azure handles scaling, OS, patching, and availability automatically.

Cancelled creation — exploration complete.

![Cancel Function App creation](img/54.cancle_creation_process.png)

#### Compute Service Decision Matrix

| Requirement | Best Service | Why |
|---|---|---|
| Full OS control / legacy app | Virtual Machine (IaaS) | Complete OS, driver, registry control |
| Lift-and-shift migration | Virtual Machine (IaaS) | Minimal architectural changes |
| Web app or REST API | App Service (PaaS) | Built-in scaling, managed runtime |
| Minimal infrastructure management | App Service (PaaS) | Azure manages OS, patching, runtime |
| Code runs only when triggered | Azure Functions (Serverless) | Pay per execution, not per hour |
| Event-driven / queue processing | Azure Functions (Serverless) | Purpose-built for event architecture |
| Container orchestration | AKS | Managed containerized workloads |

---

### Step 6 — Review Cost Management Interface

Searched for **Cost Management + Billing**, clicked into **Reports + Analytics → Cost Analysis**. No costs accumulated in the current month — expected for a newly created environment.

![Cost Management — Cost Analysis, no current month cost](img/55.search_cost_management_click_on_it_on_CM_click_on_reports_and_analytics_then_cost_analysis_no_cost_accumulated_this_month.png)

Filtered to **Last 30 days** and observed **$0.01 USD** accumulated — a small charge from a previously deployed Storage Account in the `rg-cloudfirst-test-eastus` Resource Group from an earlier lab.

![Last 30 days — $0.01 accumulated](img/56.filter_to_last_30_days_and_0.01USD_has_been_accummulated.png)

Applied **Group by: Tag** to break down the cost by department tag.

![Apply Group by Tag filter](img/57.apply_group_by_tag_filter.png)

Applied the `Department` tag filter — identified that the **IT-Consulting** department incurred the $0.01 charge, traced to a Storage Account resource.

![Department tag — IT-Consulting spent on Storage Account](img/58.applied_department_tag_and_found_that_it-consulting_department_spent_the_money_on_storage_account.png)

Applied combined filters — **Resource Group:** `rg-cloudfirst-test-eastus` · **Service name:** Storage · **Environment:** Test — to produce a fully scoped, filtered cost view.

![Apply RG, Service and Environment filters for scoped cost view](img/59.apply_filter_RGname_rg-cloudfirst-test-eastus_SName_storage_Environment_test_to_see_a_filtered_inf.png)

> **Key Insight:** This is tag-based cost attribution in action. The `Department`, `Environment`, and `Project` tags applied in the earlier lab enabled this precise cost drill-down — demonstrating exactly why consistent tagging across all resources is non-negotiable from day one.

---

## 📊 Concepts Demonstrated at a Glance

| Concept | What Was Demonstrated |
|---|---|
| **VM Sizing Families** | B (Burstable), D (General), E (Memory) compared hands-on with real pricing |
| **Savings Plans vs. Reserved Instances** | 1yr/3yr options compared — up to 60% savings over pay-as-you-go |
| **Tag Non-Inheritance** | Tags manually reapplied to VM because RG tags do not propagate |
| **ARM Template / IaC** | Full VM config exported as downloadable JSON for automation reuse |
| **Auto-generated VM Resources** | VNet, Subnet, Public IP, NIC, NSG all created automatically |
| **IaaS vs. PaaS vs. Serverless** | Configuration complexity decreases as management responsibility shifts to Azure |
| **App Service Pricing Tiers** | F1 (Free) → B1 ($12.41) → S1 ($69.35) → P1V2 ($73.73) compared |
| **Serverless Billing Model** | Azure Functions Flex Consumption — pay per execution, not per hour |
| **Azure Advisor 5 Pillars** | Cost, Security, Reliability, Operational Excellence, Performance reviewed |
| **Tag-Based Cost Attribution** | Department tag identified which team incurred charges on which resource |

---

## 📝 Key Takeaways

**Right-sizing starts before deployment.** The Azure Pricing Calculator is the primary tool for budget planning, service comparison, and stakeholder communication. Use it before committing any infrastructure.

**Tags must be applied explicitly — they don't inherit.** RBAC permissions, Azure Policy assignments, and Resource Locks cascade from Resource Group to resource. Tags do not. Enforce tagging at scale using Azure Policy.

**The compute spectrum: control vs. convenience.** VMs (IaaS) give maximum control with maximum management responsibility. App Service (PaaS) reduces overhead to application code. Azure Functions (Serverless) removes infrastructure entirely — you manage only the code.

**ARM templates capture every portal decision as IaC.** The "Download template for automation" button on the Review + Create screen exports a JSON ARM template ready for version control, parameterisation, and pipeline integration.

**Reserved Instances provide up to 60% savings for predictable workloads.** Pay-as-you-go is right for variable or short-lived workloads. For 24/7 production workloads with predictable demand, 1-year or 3-year Reserved Instances are the financially responsible choice.

**Cost Management needs tags to tell the story.** Without consistent tagging, Cost Analysis shows total spend but cannot attribute it. With tags, it becomes a full financial reporting tool — filterable by department, environment, project, and resource type.

---

## 🧪 AZ-900 Exam Quick Reference

**VM Series:**
- `B` = Burstable → Dev/test, variable workloads
- `D` = Daily Use → General purpose production
- `E` = Enormous Memory → Databases, caching
- `F` = Fast CPU → Batch, analytics
- `M` = Massive Memory → Terabyte-scale

**SLA by VM Configuration:**

| Configuration | SLA |
|---|---|
| Single VM + Standard SSD | No SLA |
| Single VM + Premium SSD | 99.9% |
| 2+ VMs in Availability Set | 99.95% |
| VMs across Availability Zones | 99.99% |

**Cost Tools — Know the Difference:**

| Tool | Purpose |
|---|---|
| Pricing Calculator | Estimate costs **before** deployment |
| Cost Management + Billing | Monitor **actual** spending and forecasts |
| Azure Advisor | AI-powered **optimization recommendations** |
| TCO Calculator | Compare on-premises vs. Azure migration costs |

**What Inherits from Resource Groups:**
- ✅ RBAC permissions
- ✅ Azure Policy assignments
- ✅ Resource Locks
- ❌ Tags (must be applied individually)

---

## 🔗 Resources

- [Azure Portal](https://portal.azure.com)
- [Azure Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/)
- [Azure Virtual Machine Sizes](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes)
- [App Service Pricing](https://azure.microsoft.com/en-us/pricing/details/app-service/linux/)
- [Azure Functions Pricing](https://azure.microsoft.com/en-us/pricing/details/functions/)
- [Azure Advisor Documentation](https://learn.microsoft.com/en-us/azure/advisor/advisor-overview)
- [Azure Cost Management](https://learn.microsoft.com/en-us/azure/cost-management-billing/)

---

*Lab completed by Oluwaseun Osunsola [[LinkedIn](https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/)] as part of the Microsoft Azure Fundamentals (AZ-900) certification preparation — Section 4: Azure Compute Options.*