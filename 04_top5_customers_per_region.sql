SELECT *
FROM (
    SELECT *,
        RANK() OVER (PARTITION BY region ORDER BY total_sales DESC) AS rank_position
    FROM (
        SELECT customer_id, region, SUM(sales) AS total_sales
        FROM superstore_sales
        GROUP BY customer_id, region
    ) AS table_temp
) AS ranked_table
WHERE rank_position <= 5;