USE superstore_analysis;
SELECT region,YEAR(order_date) AS year, 
	SUM(sales) AS total_sales,
    LAG(SUM(sales)) OVER(PARTITION BY region ORDER BY YEAR(order_date)) AS previous_year_sales,
    SUM(sales) - LAG(SUM(sales)) OVER(PARTITION BY region ORDER BY YEAR(order_date)) AS sales_defferent
FROM superstore_sales
GROUP BY region,year
ORDER BY region;