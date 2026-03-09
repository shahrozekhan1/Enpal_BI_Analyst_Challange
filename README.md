<div align="center">

# 📊 Cohort Analysis by Marketing Channel

**A Power BI report for tracking lead conversion across channels, funnel stages, and time.**

[![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=for-the-badge)](.)
[![Analysis](https://img.shields.io/badge/Type-Cohort%20Analysis-blue?style=for-the-badge)](.)

</div>

---

## 🎯 What This Report Answers

> Three questions drive this analysis:

| # | Question | Visual |
|---|---|---|
| 1️⃣ | **How is each cohort developing?** | Cohort heatmap — conversion rate by month & elapsed time |
| 2️⃣ | **What are the trends in time-to-conversion?** | Cumulative conversion curve with safe reading window |
| 3️⃣ | **Where should we deep dive?** | Channel scatter plot — volume vs. rate vs. timing |

---

## 🗂️ Report Structure

<details>
<summary><b>📄 Page 1 — Cohort Analysis</b></summary>
<br>

| Visual | Chart Type | What It Shows |
|---|---|---|
| 🟦 Cohort Conversion Rate | Pivot Heatmap | Rows = cohort month · Columns = months since creation · Values = conversion rate % |
| 🔵 Channel vs. Conversion Rate | Scatter Chart | X = avg conversion date · Y = rate · Size = lead volume · Color = channel |
| 🔻 Sales Funnel | Funnel Chart | Lead count at each pipeline stage |
| 🔘 Marketing Channel | Slicer | Filters all visuals on the page |

</details>

<details>
<summary><b>📄 Page 2 — Time-to-Conversion & Channel Trends</b></summary>
<br>

| Visual | Chart Type | What It Shows |
|---|---|---|
| 📈 Leads & Conversion Rate Over Time | Combo Chart | Monthly lead volume (bars) + conversion rate % (line) |
| 🌊 Cumulative Conversion Curve | Area Chart | Days since creation → % of leads converted · Use to set safe reading cutoff |
| ⏱️ Avg Days to Convert | Bar Chart | Average `DAYS_TO_SUCCESS` per marketing channel |
| 👥 Lead Volume by Channel | Bar Chart | Total leads created per channel |
| 🔘 Funnel Step | Slicer | Filters by sales stage |

</details>

---

## 🔢 Data Dictionary

| Field | Type | Description |
|---|---|---|
| `COHORT_MONTH` | Date | Month the lead was created — defines the cohort |
| `Months_Since_Creation` | Integer | Elapsed months since lead creation |
| `Cohort Conv Rate %` | Measure | Conversion rate for a cohort at a given elapsed month |
| `DAYS_TO_SUCCESS` | Integer | Days from lead creation to conversion |
| `Cumulative Success %` | Measure | Running % of leads converted by day N |
| `MARKETING_CHANNEL` | String | Channel that sourced the lead |
| `SALES_FUNNEL_STEPS` | String | Furthest pipeline stage reached |
| `AVG_DATE_CONVERT` | Date | Average conversion date per channel |
| `CONVERSION_RATE_PCT` | Float | Overall conversion rate per channel |

---

## 🏗️ Data Model

```
Cohort_Analysis
├── LEAD_ID             (grain: one row per lead)
├── MARKETING_CHANNEL
├── AVG_DATE_CONVERT
└── CONVERSION_RATE_PCT

Time_Conversion
├── LEAD_ID
├── COHORT_MONTH
├── MONTHS_SINCE_CREATION
├── SALES_FUNNEL_STEPS
├── DAYS_TO_SUCCESS
└── Cumulative Success %   (calculated measure)
```

---

## 🚀 How to Use

```bash
# 1. Open the report
cohort_analysis.pbip  →  Power BI Desktop

# 2. Refresh data
Home → Refresh  (ensure data source credentials are configured)
```

**Then:**

1. 🔘 Use the **Marketing Channel slicer** on Page 1 to filter the cohort heatmap by channel
2. 🔘 Use the **Funnel Step slicer** on Page 2 to isolate pipeline stages
3. 🌊 Reference the **cumulative conversion curve** to pick a safe observation window
4. 🔵 Spot outliers in the **scatter chart** — unusually high/low rate or slow conversion timing

---

## ⚠️ Known Limitations

> Keep these in mind when interpreting results:

- **No lead-lost flag** — cohorts that haven't matured will show artificially low conversion rates. Use the cumulative curve to determine how many months of seasoning are needed before a cohort's rate is stable.
- **Recent cohorts are incomplete** — the last 1–2 months should be treated as immature and filtered or annotated when presenting.
- **Use averages, not sums, for `DAYS_TO_SUCCESS`** — totals are skewed by channel volume and are not meaningful for cross-channel comparison.

---

## 🛠️ Requirements

- [Power BI Desktop](https://powerbi.microsoft.com/desktop/) — latest version recommended
- Access to the underlying data source *(contact the data owner for credentials)*

---

## 📁 Files

```
📦 cohort_analysis
 ┣ 📊 cohort_analysis.pbip     ← Main Power BI report
 ┗ 📄 README.md                ← You are here
```

---

<div align="center">

*Prepared for the Part 2 live session — Cohort Analysis by Marketing Channel*

</div>
