
Adventure Works Azure End-To-End Data Engineering Project
========================================================

Created a Full Azure Cloud Data Engineering Pipeline
---------------------------------------------------
This project demonstrates enterprise-level data ingestion, transformation, modeling, 
and reporting using the Azure ecosystem + Power BI.

Data Flow Steps
===============

1️⃣ Ingestion – Bronze Layer
---------------------------
- Uploaded raw AdventureWorks CSV files into Azure Data Lake Storage (ADLS)
- Stored in the /bronze container
- Kept original structure unchanged
- Acts as the raw landing zone

2️⃣ Transformation – Silver Layer
---------------------------------
Performed data cleaning and standardization:

- Column renaming
- Removal of unwanted fields
- Data type corrections
- Filtering invalid or null rows
- Converted CSV → Parquet for optimization
- Stored processed files in /silver/sales_2017.parquet

3️⃣ Semantic Modeling – Gold Layer
----------------------------------
Prepared curated, analytics-ready data using Azure Synapse Serverless SQL.

Two major components created:

External Tables
- Directly read Parquet files from ADLS
- Provide fast access for Power BI

Gold Views
- Business logic added
- Example: multiply = OrderLineItem * OrderQuantity
- Used for generating KPIs and metrics

4️⃣ Analytics – Power BI
------------------------
Connected Power BI using Import Mode for faster performance.

Built multiple analytics visuals and KPIs:

- Total Customers
- Total Sales (computed using DAX measure)
- Product Category Count
- Monthly Sales Trend
- Sales by Territory
- Sales by Product Category

Power BI Dashboard Highlights
=============================

KPI Cards
---------
- Total Customers
- Number of Products
- Number of Categories
- Total Sales (Sum of multiply)

Visuals Included
----------------
- Monthly Sales Trend (Line Chart)
- Sales by Product Category (Bar Chart)
- Customer Demographics (optional)
- Sales Distribution by Territory

