# CreditPulse — Credit Risk & Loan Portfolio Analytics

> **A SQL + Power BI analytics project for monitoring loan portfolio performance, delinquency, defaults, and credit-risk indicators.**

![Credit Risk Analytics Dashboard](screenshots/Credit_Risk_Analytics_Dashboard.jpg)

## 📌 Overview

**CreditPulse** is a credit risk analytics project designed to analyze a loan portfolio and transform raw lending data into actionable risk insights.

The project combines **MySQL for data extraction and analysis** with **Power BI for interactive reporting and visualization**. It focuses on portfolio exposure, credit quality, delinquency patterns, default behavior, and KPI monitoring.

The dashboard is designed around a practical credit-risk workflow:

**Data → SQL Analysis → Risk Metrics → Power BI Dashboard → Business Insights**

---

## 🎯 Objectives

* Analyze overall **loan portfolio performance and exposure**
* Monitor **delinquency and default patterns**
* Examine the relationship between **credit score and delinquency**
* Build KPIs that support **credit-risk monitoring**
* Develop an interactive dashboard for **data-driven decision-making**

---

## 🛠️ Tech Stack

| Technology      | Purpose                                              |
| --------------- | ---------------------------------------------------- |
| **MySQL**       | Database management and SQL analysis                 |
| **SQL**         | Data extraction, filtering, aggregation and analysis |
| **Power BI**    | Interactive dashboard and visualization              |
| **DAX**         | Risk metrics and calculated measures                 |
| **Excel / CSV** | Initial dataset preparation                          |
| **GitHub**      | Project versioning and documentation                 |

---

## 📊 Dashboard

The Power BI dashboard provides a consolidated view of the loan portfolio through:

### Portfolio Overview

* Total Loans
* Total Loan Exposure
* Average Credit Score
* Delinquency Rate
* Default Rate

### Delinquency & Default Analysis

* Loans by Delinquency Bucket
* Loan Exposure by Delinquency
* Defaults by Delinquency Bucket
* Loan Default Distribution

### Credit Risk Analysis

* Credit Score Distribution
* Credit Score vs. Delinquency

These views allow portfolio performance and risk indicators to be examined from multiple perspectives.

---

## 🔎 Key Analysis Areas

### 1. Portfolio Exposure

The project measures the overall loan exposure and number of loans in the portfolio, providing a high-level view of the lending book.

### 2. Delinquency Analysis

Loans are categorized into delinquency ranges:

* Current
* 1–30 Days
* 31–60 Days
* 61–90 Days
* 90+ Days

This allows the portfolio to be examined according to the severity of payment delinquency.

### 3. Default Analysis

Default indicators are analyzed across the portfolio and by delinquency bucket to identify where defaults are concentrated.

### 4. Credit Score Analysis

Credit scores are grouped into ranges to make the portfolio's credit-quality distribution easier to interpret.

The dashboard also compares **credit score ranges with delinquency**, helping investigate whether lower credit quality is associated with greater delinquency within the analyzed portfolio.

---

## 📈 Risk Metrics

The dashboard includes calculated measures for:

**Default Rate**

Measures the proportion of loans marked as defaulted within the dataset.

**Delinquency Rate**

Measures the proportion of loans with recorded delinquency days greater than zero.

**Total Loan Exposure**

Measures the total loan amount represented in the portfolio.

**Average Credit Score**

Measures the average credit score across the analyzed loans.

---

## 🗄️ SQL Analysis

MySQL was used as the analytical database layer.

The SQL work covers activities such as:

* Database and table creation
* Data querying and filtering
* Aggregation of portfolio metrics
* Default and delinquency analysis
* Credit-score analysis
* KPI preparation

The SQL script used for the project is available in:

`sql/creditpulse_analysis.sql`

---

## 📁 Project Structure

```text
CreditPulse/
│
├── README.md
│
├── sql/
│   └── creditpulse_analysis.sql
│
├── powerbi/
│   └── Credit_Risk_Analytics_Dashboard.pbix
│
└── screenshots/
    └── Credit_Risk_Analytics_Dashboard.jpg
```

> The underlying dataset is not included in this repository.

---

## 🚀 How to Explore the Project

### SQL

1. Open MySQL Workbench.
2. Connect to your MySQL instance.
3. Run the SQL script:

```text
sql/creditpulse_analysis.sql
```

### Power BI

1. Open:

```text
powerbi/Credit_Risk_Analytics_Dashboard.pbix
```

2. If required, configure the MySQL connection to the local database used for the project.
3. Refresh the dataset.
4. Explore the dashboard visuals and risk metrics.

---

## 💡 Business Relevance

CreditPulse demonstrates how structured data analysis can support credit-risk monitoring by bringing together:

* Portfolio exposure
* Credit quality
* Delinquency
* Default behavior
* KPI reporting
* Risk segmentation

The workflow reflects common analytical tasks involved in extracting data, monitoring portfolio performance, investigating anomalies, and communicating findings through dashboards.

---

## 🧠 Skills Demonstrated

* SQL
* MySQL
* Data Analysis
* Credit Risk Analysis
* Portfolio Analysis
* Data Cleaning & Transformation
* KPI Development
* DAX
* Power BI
* Data Visualization
* Analytical Problem Solving
* Business Reporting

---

## 📌 Project Outcome

CreditPulse transforms a loan portfolio dataset into an interactive credit-risk monitoring solution using **SQL and Power BI**, demonstrating an end-to-end workflow from data extraction and analysis to business-focused reporting.

---

### Author

**Revanth Reddy Bommala**

*BSc — Artificial Intelligence & Data Science*
