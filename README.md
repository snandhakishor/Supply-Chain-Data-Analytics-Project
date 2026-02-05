# Sales & Shipment Analytics Dashboard (Power BI)

## Project Overview
This project focuses on **end-to-end analytics for Sales and Shipment data** using **Dimensional Modelling** and **Power BI**. The goal is to transform raw transactional data into a clean analytical model and generate insightful, business-ready dashboards that support decision-making.

The project simulates a real-world BI workflow: from data modelling to visualization, with an emphasis on **star schema design**, **data integrity**, and **clear KPI reporting**.

---

## Objectives
- Design a **dimensional data model** suitable for analytical queries
- Analyze **sales performance** and **shipment efficiency**
- Build interactive **Power BI reports** for business users
- Demonstrate BI best practices for a **Data Analyst / BI role**

---
## Data Source
- Kaggle - https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis
- The CSV file was loaded into PostgreSQL using python for **dimensional modelling**

## Data Modelling Approach
The dataset was modelled using a **Star Schema**, separating **fact tables** from **dimension tables** to improve performance, scalability, and clarity. Relevant tables were formed from splitting a 53 columned denormalized table using SQL queries. 

### Fact Tables
- **fact_sales**  
  - Measures: Sales Amount, Quantity, Discount, Profit (if applicable)
  - Granularity: One row per product per order

- **fact_shipment**  
  - Measures: Shipment Cost, Delivery Time, Shipment Status
  - Granularity: One row per shipment

### Dimension Tables
- **DimCustomer** – Customer details, region, segment
- **dim_roducts** – Product name, category, department
- **Date table** was later added into the model inside Power BI desktop. This date table has active relationship with **fact_sales** and inactive relationship with **fact_shipment**

This design enables:
- Efficient filtering and slicing
- Clear business logic
- Easier DAX calculations

---

## Power BI Reports & Dashboards
The Power BI report includes multiple pages focused on different business questions.

### 1. Sales Overview Dashboard
- Total Sales, Profit, Quantity
- Sales trend over time
- Sales by Product Category & Sub-category
- Top / Bottom performing products

### 2. Product Performance
- Most profitable product 
- Top profitable and selling product category and department
- Products detailed table showing profit, sales and profit percentage

### 3. Shipment Dashboard
- Shipment volume over time
- Average delivery time
- Shipment mode performance
- Delayed vs on-time shipments

### 4. Regional & Customer Analysis
- Sales by region and city
- Customer segmentation insights
- High-value customers

Interactive features include:
- Slicers (Date, Region, Product, Customer)
- Drill-through and cross-filtering

---

## Key DAX Measures (Examples)
- Total Sales
- Average Delivery Time
- Sales Growth (YoY)
- Shipment Delay Percentage

All measures were created following **clear naming conventions** and reusable logic.

---

## Tools & Technologies
- **Power BI Desktop** – Data modelling & visualization
- **DAX** – Measures and calculated columns
- **Dimensional Modelling (SQL)** – Star schema design
- **CSV** – Data source 

---

## Business Insights Derived
- Identification of top-performing products and regions
- Shipment modes contributing to delivery delays
- Seasonal sales patterns
- Customer segments driving the majority of revenue

---

## Notes
This project is built for **learning, portfolio, and interview demonstration purposes**, following industry-standard BI practices.

