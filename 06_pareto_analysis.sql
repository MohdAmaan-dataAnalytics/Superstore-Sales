USE superstore_analysis;
SELECT SUM(total_spend) AS total_spend, 
		SUM(total_spend) / 2296919 * 100 AS pct_of_revenue
FROM (
	SELECT customer_id, SUM(sales) AS total_spend
	FROM  superstore_sales
	GROUP BY customer_id
    HAVING total_spend >= 15000
    ORDER BY total_spend DESC
) AS high_value_customer;