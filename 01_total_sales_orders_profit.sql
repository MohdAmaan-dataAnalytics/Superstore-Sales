USE superstore_analysis;

SELECT SUM(sales) AS total_sales
FROM superstore_sales;

SELECT SUM(profit) AS total_profit 
FROM superstore_sales
WHERE profit NOT IN(
	SELECT profit 
    FROM superstore_sales
    WHERE profit LIKE '%-%'
);


SELECT SUM(profit) AS total_profit 
FROM superstore_sales
WHERE profit >= 0;

SELECT SUM(profit) AS total_profit 
FROM superstore_sales;

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales;