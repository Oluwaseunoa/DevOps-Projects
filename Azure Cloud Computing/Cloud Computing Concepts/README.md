# Microsoft Azure Fundamentals (AZ-900) — Section 2 Lab
## Cloud Computing Concepts: Service Models, Pricing & Cost Management

> **Lab Provider:** Dion Training | **Estimated Duration:** 15 minutes  
> **Platform:** Microsoft Azure (Free Account) | **Tools Used:** Azure Pricing Calculator · Azure Portal · Cost Management + Billing
> **Completed by: [**Oluwaseun Osunsola**](https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/)**

---

## 📋 Lab Overview

In this hands-on lab, I took on the role of IT consultant for **CloudFirst Retail**, a startup e-commerce company evaluating Azure deployment options. The objective was to compare IaaS vs. PaaS service models, estimate monthly costs, analyze SLA commitments, and explore Azure's consumption-based cost management tools — all in support of a data-driven cloud adoption recommendation.

---

## 🎯 Learning Objectives

- Compare IaaS and PaaS pricing using the Azure Pricing Calculator
- Identify SLA differences between service models
- Navigate the Azure Cost Management + Billing portal
- Understand consumption-based (OpEx) pricing through hands-on resource exploration
- Apply the Shared Responsibility Model to real service selection decisions

---

## 🧰 Prerequisites

- Active Azure free account (no credit card charges)
- Web browser access
- 10–15 minutes of focused time

---

## 🪜 Step-by-Step Walkthrough

---

### Step 1 — Launch the Azure Pricing Calculator

Navigated to the Azure Pricing Calculator at `https://azure.microsoft.com/en-us/pricing/calculator/` to begin estimating costs before any resource deployment. This reinforces Azure's OpEx model and prevents budget surprises.

![Navigate to Azure Pricing Calculator](img/1.on_the_browser_navigate_to_azure_price_caculator_website.png)

![Products section and search field](img/2.note_product_section_and_product_search_field.png)

---

### Step 2 — Estimate IaaS Costs (Virtual Machines)

Searched for **Virtual Machines** in the Products search bar and added it to the estimate. This demonstrates IaaS — maximum control, but also maximum customer responsibility.

![Search and add Virtual Machines to estimate](img/3.on_the_products_search_section_search_for_virtual_machines_and_click_its_add_to_estimate_button.png)

Scrolled down to configure the VM settings:
- **Region:** East US
- **OS:** Windows
- **Tier:** Standard
- **Instance:** D2s v3 (2 vCPUs, 8 GB RAM)
- **Count:** 2 VMs (for high availability)
- **Hours:** 730 (full month, 24/7)

![Configure Virtual Machine settings](img/4.now_added_scroll_down_to_set_it_up.png)

**IaaS Estimated Monthly Cost: $137.24**

![IaaS monthly cost — $137.24](img/5.scroll_down_to_see_the_estimated_monthly_cost-137.24_dollars.png)

---

### Step 3 — Estimate PaaS Costs (App Service)

Scrolled back to the search bar and added **App Service** to the estimate. PaaS abstracts infrastructure management — Azure handles OS patching, scaling, and availability.

![Search and add App Service to estimate](img/6.scroll_up_to_product_search_again_and_search_for_app_service_then_add_to_estimate.png)

Configured App Service settings:
- **Region:** East US
- **Tier:** Standard
- **Instance:** B1 (1 Core, 1.75 GB RAM)
- **Hours:** 730 (full month)

![Configure App Service settings](img/7.scroll_down_to_app_service_to_configure_the_setup_too.png)

**PaaS Estimated Monthly Cost: $54.75** — roughly 60% cheaper than the IaaS equivalent.

![PaaS monthly cost — $54.75](img/8.scroll_down_to_see_monthly_estimated_cost_for_app_service_as_well-54.75_dollars.png)

> **Key Insight:** With PaaS (App Service), CloudFirst Retail pays less, avoids OS management overhead, and gains automatic scaling — this is elasticity in action.

---

### Step 4 — Explore Service Level Agreements (SLAs)

Opened the Azure SLA documentation page (`https://azure.microsoft.com/en-us/support/legal/sla/`) in a new tab and downloaded the **Service Level Agreement for Microsoft Online Services (WW)** Word document.

![Navigate to Azure SLA website and download the WW SLA document](img/9.navigate_to_azure_SLA_website_in_a_new_tab_and_downoad_WW_SLA_document.png)

Opened the downloaded document and navigated to the Virtual Machines section.

![Open document and scroll to Virtual Machines section](img/10.open_downloaded_document_and_scroll_to_virual_machines_section.png)

#### 4a — VMs in Availability Zones: **99.99% SLA**

Located the "Uptime Calculation and Service Levels for Virtual Machines in Availability Zones" table.

![Scroll to Availability Zones section](img/11.scroll_down_to_Uptime_Calculation_and_Service_Levels_for_Virtual%20Machines_in_Availability_Zones.png)

![Availability Zones SLA — 99.99%](img/11b.note_the_percentage_is_99.99.png)

#### 4b — VMs in Availability Set: **99.95% SLA**

Located the "Uptime Calculation and Service Levels for Virtual Machines in an Availability Set" table.

![Scroll to Availability Set section](img/12.scroll_down_to_Uptime_Calculation_and_Service_Levels_for_Virtual%20Machines_in_Availability_Set.png)

![Availability Set SLA — 99.95%](img/12b.note_the_percentage_is_99.95.png)

#### 4c — Single-Instance VM (Premium SSD): **99.9% SLA**

Located the "Uptime Calculation and Service Levels for Single-Instance Virtual Machines" table and reviewed the Premium SSD column.

![Scroll to Single-Instance VM section](img/13.scroll_down_to_Uptime_Calculation_and_Service_Levels_for_Single-Instance_virtual_machine.png)

![Single-Instance Premium SSD SLA — 99.9%](img/13b.note_the_uptime_for_premium_ssd_premium_ssd_v2_ultra_disk-99.9.png)

#### 4d — App Service SLA: **99.95%**

Used Ctrl+F to locate the App Service SLA section and noted the uptime guarantee.

![App Service SLA — 99.95%](img/14.scroll_to_App_Service_SLA_and_note_its_99.95_percent.png)

> **Composite SLA Concept:** App Service (99.95%) × SQL Database (99.99%) = **~99.94% composite SLA**. More dependencies always reduce overall availability — composite SLAs multiply, they don't average.

| Configuration | SLA |
|---|---|
| VMs across Availability Zones | 99.99% |
| VMs in Availability Set | 99.95% |
| Single-Instance VM (Premium SSD) | 99.9% |
| App Service | 99.95% |

---

### Step 5 — Access Azure Cost Management + Billing

Signed into the Azure Portal (`https://portal.azure.com`) and searched for **Cost Management + Billing**.

![Sign in to Azure Portal](img/15.sign_in_to_azure_portal_create_free_credit_account_if_you_dont_have.png)

![Search for Cost Management + Billing](img/16.search_for_cost_management_billing_and_click_on_it.png)

---

### Step 6 — Explore Cost Management Features

#### Cost Analysis Dashboard

Clicked **Cost analysis** under Cost Management → Reporting + Analytics to view the spending dashboard. This is where consumption-based pricing becomes tangible — every resource charge is visible in real time.

![Cost Analysis dashboard](img/17.click_Cost_analysis_under_Cost%20Management_Reporting_Analytics_to_monitor_dashboard_and_manage_cost.png)

#### Budgets

Navigated to **Budgets** under the Monitoring section. This is where spending limits and threshold alerts are configured.

![Budgets section](img/18.still_under_Cost%20Management_click%20Budgets_under_Monitoring.png)

Clicked **Add** to begin creating a budget.

![Click Add to create budget](img/19.click_add.png)

Reviewed the budget creation form — teams can set monthly limits, define alert thresholds (e.g., 80%, 90%), and configure automatic notifications.

![Budget creation form](img/20.this_is_where_budget_can_be_created.png)

#### Cost Alerts

Navigated back to **Cost alerts** to review alert configuration options for notifying teams when spending approaches defined thresholds.

![Cost Alerts section](img/21.go_back_to_cost_management_and_click_on_cost_alert.png)

![Create cost alert notification](img/22.click_add_and_you_can_create_notification_for_when_cost_approaches_a_specific_threshold.png)

#### Advisor Recommendations

Clicked **Advisor recommendations** under Optimization to review AI-powered cost reduction suggestions. On a free account with no deployed resources, this section may show no recommendations yet.

![Advisor Recommendations](img/23.click_Advisor_recommendations_under_Optimization_to_Review_cost%20optimization_suggestions.png)

> **Why This Matters:** These tools transform cloud spending from unpredictable to manageable. Budgets + alerts + Advisor recommendations give full visibility and control over Azure's OpEx model.

---

### Step 7 & 8 — Review Shared Responsibility & Export Cost Estimate

Returned to the Azure Pricing Calculator to review the full estimate and apply Shared Responsibility thinking to each service model. Then exported the estimate as an Excel (`.xlsx`) file for stakeholder presentation.

![Review shared responsibility and export estimate](img/24.back_to_azure_price_calculator_review_shared_responsibility_for_each_service_and_export_estimate_document.jpeg)

#### Shared Responsibility Summary

| Responsibility Area | IaaS (VM) | PaaS (App Service) | SaaS |
|---|---|---|---|
| Physical datacenter & hosts | Microsoft | Microsoft | Microsoft |
| Operating system patching | **Customer** | Microsoft | Microsoft |
| Network security group rules | **Customer** | Microsoft | Microsoft |
| Application security & code | **Customer** | **Customer** | **Customer** |
| Data security & encryption | **Customer** | **Customer** | **Customer** |
| Identity & access management | **Customer** | **Customer** | **Customer** |

> **Rule of thumb:** No matter the service model, **data security, identity/access management, and endpoint protection are always the customer's responsibility**.

---

## 📊 Cost Comparison Summary

| Service | Model | Monthly Estimate | OS Patching | Scaling |
|---|---|---|---|---|
| 2× D2s v3 Virtual Machines | IaaS | **$137.24** | Customer | Manual |
| App Service S1 | PaaS | **$54.75** | Microsoft | Automatic |

**PaaS delivers ~60% cost savings** while reducing operational overhead and offering built-in elasticity — a compelling business case for CloudFirst Retail.

---

## 📝 Key Takeaways

**Service Model Selection**
- **IaaS** → Maximum control, maximum responsibility, higher costs. Best for legacy apps or OS-level customization.
- **PaaS** → Managed platform, automatic updates, lower costs. Best when the focus is application code, not infrastructure.
- **SaaS** → Zero infrastructure management, pure consumption (e.g., Microsoft 365).

**Consumption-Based Pricing (OpEx)**
- Pay only for what you use — no upfront capital expenditure (CapEx)
- Cost Management tools (budgets, alerts, Advisor) are essential for cost predictability
- Reserved Instances can save up to 72% for predictable, long-running workloads

**SLA Mechanics**
- More "nines" = less downtime: 99.99% = ~52 minutes/year of allowed downtime
- Composite SLAs are calculated by multiplying individual SLAs — dependencies always reduce overall availability
- Use Availability Zones to achieve the highest VM SLA tier (99.99%)

---

## 🧪 Exam Tips (AZ-900)

| Question Pattern | Answer |
|---|---|
| Most OS-level control? | IaaS — Virtual Machines |
| Least infrastructure management? | SaaS — Microsoft 365 |
| Who patches Azure SQL Database? | Microsoft (PaaS platform management) |
| VM compromised via open RDP port — who's responsible? | Customer (network config is customer responsibility) |
| Consumption-based pricing = which financial model? | OpEx (Operational Expenditure) |
| App Service (99.95%) + SQL DB (99.99%) composite SLA? | ~99.94% |
| SLA with < 1 hour downtime per year? | 99.99% (52.56 min/year) |

---

## 🔗 Resources

- [Azure Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/)
- [Azure SLA Documentation](https://azure.microsoft.com/en-us/support/legal/sla/)
- [Azure Portal — Cost Management](https://portal.azure.com)
- [Dion Training — AZ-900 Course](https://diontraining.com)

---

*Lab completed by [**Oluwaseun Osunsola**](https://www.linkedin.com/in/oluwaseun-osunsola-95539b175/) as part of the Microsoft Azure Fundamentals (AZ-900) certification preparation — Section 2: Cloud Computing Concepts.*