drop table  if exists zepto;
create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR (120),
name VARCHAR (150) NOT NULL,
mrp NUMERIC(8,2),
discountpercent NUMERIC (5,2),
availablequantity INTEGER ,
discountedsellingprice NUMERIC (8,2),
weightinGms INTEGER,
outofstock BOOLEAN ,
quantity INTEGER
);

--data exploration

--count of rows
SELECT COUNT(*) FROM zepto;

--sample data
SELECT * FROM zepto LIMIT 10;

--null values
SELECT * FROM zepto 
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
discountedsellingprice IS NULL
OR
weightingms IS NULL
OR
outofstock IS NULL
OR
quantity IS NULL;

-- different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- products in stock vs out of stock
SELECT outofstock , COUNT (sku_id)
FROM zepto
GROUP BY outofstock;

--product names present multiple times 
SELECT name , COUNT (sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name 
HAVING COUNT (sku_id)> 1
ORDER BY count (sku_id) DESC;

--data cleaning 

-- products with price = 0
SELECT * FROM zepto
WHERE  mrp = 0 OR discountedsellingprice = 0;

DELETE FROM zepto
WHERE mrp = 0;

-- convert paise to rupees 
UPDATE zepto 
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice / 100.0;

SELECT mrp, discountedsellingprice FROM zepto;


--Q1. Find the top 10 best-value products based on the discount percentage.

SELECT DISTINCT name , mrp , discountpercent
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;

--Q2.What are the products with High MRP but Out of Stock.

SELECT DISTINCT name , mrp
FROM zepto
WHERE outofstock = TRUE and mrp > 300
ORDER BY mrp DESC;

--Q3. Calculate Estimated Revenue for each category

SELECT category,
SUM (discountedsellingprice * availablequantity) AS total_revenue 
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than Rs.500 and Discount is less than 10%.

SELECT DISTINCT name , mrp , discountpercent
FROM zepto
WHERE mrp > 500 AND discountpercent < 10
ORDER BY mrp DESC , discountpercent DESC;

--Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT category , 
AVG (discountpercent) AS average_discount
FROM zepto
GROUP BY category
ORDER BY average_discount DESC
LIMIT 5;
select*from zepto;
--Q6. Find the price per gram for products above 100g and sort by best values.

SELECT DISTINCT name , weightingms, discountedsellingprice, 
ROUND (discountedsellingprice / weightingms ,2) AS price_per_gram 
FROM zepto
WHERE weightingms >= 100
ORDER BY price_per_gram;

--Q7. Group the products into categories like low , Medium , Bulk.

SELECT DISTINCT name , weightingms,
CASE WHEN weightingms < 1000  THEN 'Low'
     WHEN weightingms < 5000 THEN ' Medium'
	 ELSE 'Bulk'
	 END AS weight_Category
FROM zepto;	 

--Q8. What is the Total Inventory Weight Per Category

SELECT category,
SUM (weightingms * availablequantity) AS total_weight
FROM zepto 
GROUP BY category
ORDER BY total_weight;