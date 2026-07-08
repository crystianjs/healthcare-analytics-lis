# Healthcare Analytics Portfolio: LIS Data Integration & ETL Pipeline

## 📌 Project Overview
This repository contains an end-to-end data engineering and business intelligence portfolio tailored for the healthcare sector. The project simulates a **Laboratory Information System (LIS)** environment, modeling complex clinical data workflows, turnaround times (TAT), and billing diagnostics. 

The architecture is built on top of a cloud-based **PostgreSQL** database managed via **Supabase**, processed dynamically through **Power Query (ETL)**, and visualised in **Power BI**.

---

## 🛠️ Tech Stack & Architecture
* **Database & Cloud Infrastructure:** PostgreSQL hosted on **Supabase Cloud**, managed via **pgAdmin**.
* **Data Prep & Querying:** Advanced SQL queries (`INNER JOIN`, `LEFT JOIN`, aggregations, conditional filtering).
* **ETL & Data Transformation:** **Power Query** for schema enforcement, data typing, and pipeline orchestration.
* **Data Visualization:** **Power BI Desktop** (utilizing Star Schema dimensional modeling and DAX metrics).
* **Development Practices:** Database-as-Code (DbC) and version control managed via **GitHub**.

---

## 📁 Repository Structure
```text
├── database/
│   ├── 01_create_tables.sql      # Database DDL schema (Patients, Exams, Lab Orders)
│   └── 02_analytical_queries.sql # Complex SQL Queries for data consolidation and TAT analysis
├── bi_dashboard/
│   └── healthcare_dashboard.pbix # Power BI project file (built on top of the 2026 UI)
└── README.md                     # Documentation
```

---

## 🔍 Database Schema & Business Rules
The transactional data structure replicates a production healthcare LIS environment using a **Star Schema** approach:

* **`dim_patients` (Dimension Table):** Captures demographic data (age, gender distribution) ensuring strict primary key integrity.
* **`dim_exams` (Dimension Table):** The laboratory dictionary containing exam codes, departmental division (Hematology, Biochemistry, Molecular Biology), and pricing.
* **`fact_lab_orders` (Fact Table):** High-volume operational logs capturing order dates, laboratory units, status (Pending/Released), and **Turnaround Time (TAT)** in hours.

---

## 🚀 How the Pipeline Works (Step-by-Step)
1. **Cloud Provisioning:** The production-ready database schema is executed directly inside the **Supabase PostgreSQL** cloud container via its internal SQL Editor.
2. **Data Manipulation & Extraction:** Complex SQL statements combine the dimensions and facts to generate optimized datasets, avoiding performance bottlenecks.
3. **Power Query ETL Connection:** Power BI establishes a native connection to the remote PostgreSQL host, triggering the SQL statements and handling strict data transformations within the Power Query editor.
4. **Dashboard Analysis:** The final interface calculates key industry metrics such as operational efficiency, average TAT by department, and active sample queues.

---

## 📈 Dashboard Preview & Interactive Link
* 🔗 **Live Interactive Dashboard (NovyPro):** *[Insert your NovyPro link here after completion]*
* 🖼️ **Project Screenshot:**  
  *[Insert a screenshot image of your final dashboard here]*

---

## 👨‍💻 Author
**Crystian Jesus**  
*IT & Data Systems Analyst | Tecnólogo em Análise e Desenvolvimento de Sistemas (ADS)*  
* 🌍 **LinkedIn:** [://linkedin.com](https://://linkedin.com)
* 🚀 **GitHub Portfolio:** [://github.com](https://://github.com)
