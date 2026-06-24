#  🛒 Zepto E-Commerce SQL Data Analysis Project

## 📌 Project Overview

This project is a real-world SQL Data Analytics case study based on Zepto's e-commerce inventory dataset. It demonstrates how data analysts work with raw business data to perform data exploration, cleaning, and business analysis using SQL.

The project focuses on analyzing product inventory, pricing, discounts, stock availability, and revenue opportunities to generate actionable business insights.
<img width="961" height="649" alt="image" src="https://github.com/user-attachments/assets/cbc1d618-7d27-460a-8d51-a8813cb3b49d" />

## 🎯 Objectives

* Build and manage an e-commerce inventory database.
* Perform Exploratory Data Analysis (EDA).
* Clean and transform raw inventory data.
* Generate business insights using SQL queries.
* Practice real-world data analyst workflows.

## 📂 Dataset Information

The dataset contains product inventory data scraped from Zepto's product listings. Each record represents a unique SKU (Stock Keeping Unit) with details such as:

* SKU ID
* Product Name
* Category
* MRP (₹)
* Discount Percentage
* Selling Price (₹)
* Available Quantity
* Product Weight
* Stock Status
* Package Quantity

## 🛠️ Project Workflow

### 1. Database and Table Creation

* Designed and created a PostgreSQL database.
* Defined appropriate data types and constraints.
* CREATE TABLE zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

### 2. Data Import

* Imported CSV data into PostgreSQL.
* Resolved UTF-8 encoding issues for successful data loading.

### 3. Exploratory Data Analysis (EDA)

* Analyzed total records and product categories.
* Identified null values and duplicate products.
* Compared in-stock and out-of-stock inventory.
* Explored product distribution across categories.

### 4. Data Cleaning

* Removed invalid records with zero pricing.
* Converted prices from paise to rupees.
* Improved data consistency and quality.

### 5. Business Analysis

Generated valuable business insights such as:

* Top 10 highest discounted products
* High-value products currently out of stock
* Category-wise potential revenue analysis
* Products with low discounts despite high MRP
* Categories offering the best average discounts
* Price-per-gram analysis for value products
* Product segmentation based on weight
* Inventory weight distribution across categories

## 📊 Key Skills Demonstrated

* SQL Queries
* Data Cleaning
* Data Transformation
* Exploratory Data Analysis (EDA)
* Business Analytics
* PostgreSQL
* Inventory Analysis
* Revenue Analysis

## 🚀 Tools Used

* PostgreSQL
* pgAdmin
* SQL

## 📈 Outcome

This project showcases end-to-end SQL-based data analysis, helping develop practical skills in data cleaning, querying, and business intelligence using a real-world e-commerce dataset.

### 🔗 GitHub Repository

Add your repository link here:
https://github.com/your-username/your-repository-name
 
