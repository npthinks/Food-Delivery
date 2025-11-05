# 🍽️ Food Analytics — End-to-End ETL & BI Pipeline

An **end-to-end data engineering and analytics project** that transforms raw food delivery data into **decision-ready insights** using **dbt**, **BigQuery**, **Looker**, and **Git**.
The pipeline automates data ingestion, transformation, testing, and visualization to power dashboards for **revenue**, **churn**, **cuisine performance**, and **regional trends**.

---

## 🚀 Key Features

* **Ingestion → Insights:** Automated pipeline for cleaning, modeling, and publishing analytics data.
* **Data Quality:** dbt tests ensure valid payments, positive revenue, and consistent joins.
* **Interactive Dashboards:** Looker visualizes revenue trends, churn, and regional performance.
* **Version Control:** Git-managed workflows enable reproducible, CI-friendly builds.

---

## 🧱 Architecture

* **BigQuery:** Scalable data warehouse for analytics.
* **dbt:** Modular SQL models with lineage and testing.
* **Looker:** BI dashboards for self-serve insights.
* **Git:** CI/CD-ready workflow for versioned analytics.

---

## 🔄 Workflow

1. Load raw marketplace data into BigQuery.
2. Clean and standardize data with dbt.
3. Build curated analytics views for BI.
4. Power Looker dashboards for business insights.

---

## 📊 Dashboards

* Revenue and seasonality tracking.
* Churn and cohort analysis by age/activity.
* Cuisine and category performance.
* City-level benchmarking and comparisons.

---

## ✅ Data Quality

* Automated dbt tests for schema, constraints, and data integrity.
* Ensures reliable, governed analytics across dashboards.

---

## ⚙️ Quick Start

```bash
# Clone repo and install dependencies
git clone <repo-url>
dbt deps
dbt build
```

Connect the published models in **BigQuery** to **Looker** for visualization.

---

## 🗺️ Roadmap

* Incremental dbt models for scalability.
* Semantic metrics layer for unified KPIs.
* CI/CD checks and automated dbt docs.

---

## 👋 Contact

**Nishanth Perumal**
💼 Open to **Data Engineering** and **Analytics** roles in the Netherlands.
🔗 [LinkedIn](https://www.linkedin.com/in/nishanth-perumal-969a71192/)

---
