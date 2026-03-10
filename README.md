---

# Customer Revenue at Risk — Subscription Churn & Retention Strategy Dashboard

![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-18-336791?logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/Pandas-EDA-150458?logo=pandas&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## Business Problem

A telecom company is silently losing **$139K in monthly recurring revenue** — and most of it is preventable.

This project identifies *who* is churning, *why* they're leaving, and *what the business can do* to stop it. Using a real-world dataset of 7,043 customers, I built an end-to-end analysis pipeline from raw SQL queries to an interactive Power BI dashboard that quantifies revenue risk and surfaces actionable retention strategies.

---

## Dataset

| Attribute | Details |
|---|---|
| Source | IBM Telco Customer Churn — Kaggle |
| Records | 7,043 customers |
| Features | 21 columns |
| Key fields | Contract type, Payment method, Internet service, Tenure, MonthlyCharges, TotalCharges, Churn |

---

## Stack & Tools

| Layer | Tool |
|---|---|
| Database & SQL Analysis | PostgreSQL 18 |
| Data Cleaning & EDA | Python (Pandas, Seaborn, SQLAlchemy), Jupyter Notebook |
| Dashboard | Power BI Desktop |

---

## Process

```
Raw CSV → PostgreSQL (cleaning + SQL analysis) → Python/Jupyter (EDA) → Power BI (dashboard)
```

**Step 1 — SQL (`pregatire_date.sql`)**
- Imported CSV into PostgreSQL, fixed `TotalCharges` (blank strings → NULL → NUMERIC cast)
- Wrote segmentation queries: churn rate by contract, payment method, internet service
- Calculated monthly revenue at risk from churned customers

**Step 2 — Python (`analiza_vizuala.ipynb`)**
- Connected to PostgreSQL via SQLAlchemy
- Distribution analysis on tenure and charges (Seaborn)
- Segment breakdowns with Pandas groupby

**Step 3 — Power BI Dashboard**
- KPI Cards, Donut chart, Bar charts, Gender & Contract slicers
- Written business insights embedded directly in the report

---

## Key Findings

| # | Finding | Metric |
|---|---|---|
| 1 | Overall churn rate | **26.54%** (1,869 / 7,043 customers) |
| 2 | Monthly Revenue at Risk | **$139,130 / month** |
| 3 | Month-to-Month contracts | **88.55%** of all churned customers |
| 4 | Electronic check churn | **~45%** — highest of all payment methods |
| 5 | Fiber Optic churn | **41.89%** vs DSL 18.96% vs No Internet 7.40% |
| 6 | Missing support services | Customers without TechSupport / OnlineSecurity churn significantly more |
| 7 | Gender parity | ~26% churn for both genders — no disparity detected *(D&I insight)* |

---

## Business Recommendations

**1. Prioritize contract upgrades for Month-to-Month customers**
88.55% of churned customers were on monthly contracts. A targeted incentive campaign (discount, free month) to migrate them to 1- or 2-year contracts is the single highest-leverage retention action.

**2. Investigate the Fiber Optic experience**
A 41.89% churn rate on a premium service signals a value/quality gap. Exit surveys or NPS data for Fiber customers would clarify whether it's pricing, reliability, or competition.

**3. Promote TechSupport & OnlineSecurity add-ons**
Customers without these services churn at significantly higher rates. Bundling them into the onboarding flow (or offering a 30-day free trial) could meaningfully reduce early churn.

**4. Phase out or redesign the Electronic Check payment flow**
~45% churn rate among electronic check users may indicate a friction-heavy payment experience. Promoting autopay via credit card or bank transfer could reduce involuntary churn.

---

## Repository Structure

```
├── pregatire_date.sql       # PostgreSQL setup, data import, analysis queries
├── analiza_vizuala.ipynb    # EDA in Jupyter Notebook
├── telco_churn_backup.sql   # Full database backup
├── dashboard.pbix           # Power BI Dashboard
└── README.md
```

---

##  Dashboard Preview
<img width="2050" height="1152" alt="dashboard" src="https://github.com/user-attachments/assets/4b9c6cf0-8c43-49bb-b725-f80e383b198b" />

---

## 🔗 Links

- 📊 [Power BI Dashboard — Live](https://app.powerbi.com/links/NxjPtiie5-?ctid=607d63ca-9f36-4ad8-9f71-8b3efc392eb1&pbi_source=linkShare)
- 📓 [Jupyter Notebook](https://app.powerbi.com/links/NxjPtiie5-?ctid=607d63ca-9f36-4ad8-9f71-8b3efc392eb1&pbi_source=linkShare) *(add link)*
- 🗄️ [SQL Files](#) *(add link)*

---

*Built by [Your Name] · Iași, România · 2026*
