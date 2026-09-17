USE superstore_analysis;

SELECT customer_id, SUM(sales) AS total_spend
FROM superstore_sales
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 10;

SELECT customer_id, 
       SUM(sales) AS total_spend,
       CASE
           WHEN SUM(sales) >= 17000 THEN 'High'
           WHEN SUM(sales) BETWEEN 10000 AND 17000 THEN 'Medium'
           ELSE 'Low'
       END AS customer_segment
FROM superstore_sales
GROUP BY customer_id
ORDER BY total_spend DESC;
