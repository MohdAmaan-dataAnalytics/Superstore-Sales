USE superstore_analysis;

SELECT YEAR(order_date) AS years, MONTH(order_date) AS months, 
	SUM(sales) AS month_sales,
	LAG (SUM(sales)) OVER(ORDER BY YEAR(order_date) , MONTH(order_date)) AS previous_month_sales,
    SUM(sales) - LAG (SUM(sales)) OVER(ORDER BY YEAR(order_date) , MONTH(order_date)) AS sales_defferent
FROM superstore_sales
GROUP BY MONTH(order_date), YEAR(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);