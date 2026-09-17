USE superstore_analysis;
SELECT product_name,
	SUM(sales) AS total_sales,
	SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY product_name
HAVING total_sales > 19000 AND total_profit < 0
ORDER BY total_sales DESC;