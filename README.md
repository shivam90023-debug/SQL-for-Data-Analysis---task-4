# SQL-for-Data-Analysis---task-4
SQL queries in a SQL file + screenshots of output

We performed data exploration to understand the dataset’s structure, distribution, and quality:

Row Count: Checked the total number of product records.

Sample Records: Displayed the first 10 rows to get a snapshot of the dataset.

Null Values Check: Detected missing or incomplete data in key columns (like price, weight, etc.).

Distinct Categories: Listed all unique product categories to understand product diversity.

Stock Status: Counted how many products were in stock vs out of stock.

Duplicate Names: Identified product names appearing multiple times (duplicate SKUs).

These steps helped assess data completeness, consistency, and uniqueness.

🧹 3. Data Cleaning and Transformation

Data cleaning ensured that our dataset was accurate and ready for analysis.

a. Invalid Price Handling

Identified and removed products where MRP or selling price was 0 (invalid records).

b. Unit Conversion

Converted price data from paise to rupees by dividing by 100 for accurate monetary values.

c. Consistency Checks

Ensured all columns had valid non-null values and logical consistency (e.g., no negative prices).

After cleaning, the dataset was standardized and reliable for business analysis.

📊 4. Business and Analytical Insights

We then performed multiple SQL-based analyses to derive actionable insights for business decision-making.

🔹 Q1. Top 10 Best Value Products

Found the top 10 products with the highest discount percentages.

Insight: Helps marketing teams identify best deals and popular discounted items.

🔹 Q2. High-Value Products Out of Stock

Identified products with MRP > ₹300 that were out of stock.

Insight: Indicates potential lost sales opportunities or items with high demand but low availability.

🔹 Q3. Estimated Revenue by Category

Calculated total potential revenue for each product category:
discountedsellingprice × availablequantity

Insight: Reveals which product categories generate maximum revenue potential.

🔹 Q4. Expensive Products with Low Discount

Found products with MRP > ₹500 but discount < 10%.

Insight: Highlights premium products that may need better discounting strategies.

🔹 Q5. Top 5 Categories with Highest Average Discount

Calculated the average discount percentage per category and ranked them.

Insight: Helps understand which categories offer best overall deals to customers.

🔹 Q6. Price Per Gram Analysis

Computed price per gram for items weighing over 100g:
price per gram = discountedsellingprice / weightinGms

Insight: Evaluates value for money — useful for pricing and competitive analysis.

🔹 Q7. Product Categorization by Weight

Created a weight classification system:

Low (<1000g)

Medium (1000–4999g)

Bulk (≥5000g)

Insight: Helps segment products for packaging, shipping, and storage analysis.

🔹 Q8. Total Inventory Weight by Category

Calculated the total weight of stock available per category:
total_weight = weightinGms × availablequantity

Insight: Useful for inventory logistics, warehouse space planning, and supply chain efficiency.

🧮 5. Key Learnings and Outcomes

Applied SQL-based data exploration, cleaning, and transformation on a real-world dataset.

Derived business-driven insights such as:

Top performing categories

Inventory optimization

Discount and revenue trends

Improved data accuracy through data quality checks and standardization.

Created a foundation for further visualization in Power BI / Tableau dashboards.

📈 6. Tools and Technologies Used

Database: PostgreSQL

Language: SQL

Data Handling: DDL (Data Definition Language) & DML (Data Manipulation Language)

Skills Applied:

Data Cleaning

Aggregation & Grouping

Conditional Logic (CASE statements)

Business Insight Generation

🧠 7. Summary

This project demonstrates the complete SQL lifecycle — from data creation, exploration, and cleaning to business insight generation.
It mirrors a real-world retail analytics workflow, helping businesses understand:

Which products perform best

How discounts impact sales potential

Which categories dominate revenue and stock levels
