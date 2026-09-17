USE superstore_analysis;
SELECT customer_id, SUM(sales) AS total_spend
FROM superstore_sales
GROUP BY customer_id
HAVING SUM(sales) >	(
	SELECT AVG(total_spend)
	FROM (
		SELECT customer_id, SUM(sales) AS total_spend
		FROM superstore_sales
		GROUP BY customer_id
	) AS customer_totals
)
ORDER BY total_spend DESC;