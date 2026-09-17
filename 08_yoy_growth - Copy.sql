USE superstore_analysis;

SELECT YEAR(order_date) AS years, MONTH(order_date) AS months, 
	SUM(sales) AS month_sales,
	LAG (SUM(sales),12) OVER(ORDER BY YEAR(order_date) , MONTH(order_date)) AS some_month_last_year,
    SUM(sales) - LAG (SUM(sales),12) OVER(ORDER BY YEAR(order_date) , MONTH(order_date)) AS sales_defferent
FROM superstore_sales
GROUP BY MONTH(order_date), YEAR(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);