USE superstore_analysis;
SELECT COUNT(customer_id) AS total_customer,
	SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    (SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) / COUNT(customer_id)) * 100 AS retention_percentage
FROM(
SELECT customer_id, COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales
GROUP BY customer_id
ORDER BY total_orders
) AS customer_orders;