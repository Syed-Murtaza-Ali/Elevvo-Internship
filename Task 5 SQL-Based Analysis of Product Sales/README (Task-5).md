# Task 5: SQL-Based Product Sales Analysis

## Executive Summary
This task focuses on analysing product sales data using SQL to uncover trends, top performers, and regional sales distribution. The analysis highlights:
- **TV soundtrack tracks** (e.g., The Office, Heroes, Lost) are the top-selling products by revenue.  
- **United States and Canada** lead in revenue contribution, followed by several European countries.  
- **Monthly revenue in 2009** remained steady, with no significant spikes or dips.  
- A **bonus ranking analysis** using SQL window functions identified the top three tracks per country, though many ties occurred due to small sample sizes.

---

## Methodology
The analysis was performed using **SQLite SQL queries** on the following tables:  
- **Invoice**  
- **InvoiceLine**  
- **Track**  
- **Album**  
- **Artist**

Key techniques used:
- **JOINs** to combine product and sales information.  
- **SUM() aggregations** to calculate revenue.  
- **strftime('%Y-%m')** to group sales by month.  
- **RANK() OVER(PARTITION BY ...)** window function to generate country-specific leaderboards.  

---

## Key Findings
### 1. Top-Selling Products  
- TV soundtrack tracks generated the highest revenue.  
- Top tracks each earned **$3.98**, while another tier earned **$1.99** each.  

### 2. Revenue by Region  
- **United States**: $523.06  
- **Canada**: $303.96  
- **Europe** (France, Germany, UK) also contributed significantly.  

### 3. Monthly Performance  
- Revenue in **2009** was consistent, with no major sales fluctuations.  

### 4. Top Tracks per Country  
- Many countries had **ties** for top track revenue due to single-unit purchases (e.g., $0.99).  
- Example: In Argentina, multiple tracks shared **rank 1** with $0.99 revenue.  

---

## Insights & Recommendations
- **Product Focus:** Leverage the popularity of TV soundtracks by offering curated bundles or themed promotions.  
- **Regional Strategy:** Prioritise marketing in **USA and Canada**, while exploring growth in **France, Brazil, and Germany**.  
- **Seasonality & Testing:** Since revenue is stable, experiment with **A/B pricing** or cross-selling strategies.  
- **Future Work:** Extend analysis with **interactive dashboards**, and explore performance by **genres and artists**.  

---

## Files
- `task-5-sql-analysis.sql` → SQL queries used for the analysis.  
- `task-5-report.pdf` → Detailed report including visuals and findings.  

---

## How to Run
1. Import the provided SQLite database (`chinook.db` or demo dataset).  
2. Run the queries in `task-5-sql-analysis.sql`.  
3. Review the aggregated outputs and replicate visuals from the report.  

---

## Conclusion
This SQL-driven analysis provides clear insights into product performance, regional revenue distribution, and sales consistency. The results can guide **marketing strategies, pricing experiments, and future analytical extensions**.
