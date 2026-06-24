drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercentage NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
)

--data exploration

--count of rows
select COUNT(*) from zepto;

--sample data
select * from zepto
limit 10;

--null values
select * from zepto
where name iS NULL
OR
category iS NULL
OR
mrp iS NULL
OR
discountPercentage iS NULL
OR
availableQuantity iS NULL
OR
discountedSellingPrice iS NULL
OR
weightInGms iS NULL
OR
outOfStock iS NULL
OR
quantity iS NULL;


--different product categories
select DISTINCT category 
from zepto
ORDER BY category;

--products in stock vs out of stock
select outOfStock,COUNT(sku_id)
from zepto
group by outOfStock;

--product names present multiple times
select name ,COUNT(sku_id) as "Number of SKUs"
from zepto
group by name
HAVING COUNT(sku_id) > 1
order by COUNT(sku_id) DESC;

--DATA CLEANING

--products with price = 0
select * from zepto
where mrp = 0 OR discountedSellingPrice = 0;
--deletethe row
delete from zepto
where sku_id = 3830;

--convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto;

ALTER table zepto
RENAME COLUMN discountPercentage TO discountPercent;

-- Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

--What are the Products with High MRP but Out of Stock
select DISTINCT mrp,outOfStock
from zepto
where mrp > 300 AND outOfStock = TRUE
ORDER BY mrp DESC;

--Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--  Find all products where MRP is greater than ₹500 and discount is less than 10%.
select DISTINCT name,mrp,discountPercent
from zepto
where mrp > 500 AND discountPercent < 10
order by mrp DESC ,discountPercent DESC;

-- Identify the top 5 categories offering the highest average discount percentage.
select category,
ROUND(AVG(discountPercent),2) AS avg_discount
from zepto
group by category
order by avg_discount
limit 5;

-- Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

--Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;