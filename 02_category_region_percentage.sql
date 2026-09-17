USE superstore_analysis;

SELECT category,
	SUM(sales) AS category_sales,
    (SUM(sales) / (SELECT SUM(sales) FROM superstore_sales)) * 100 AS percentage
FROM superstore_sales
GROUP BY category;

SELECT region,
	SUM(sales) AS region_sales,
    (SUM(sales) / (SELECT SUM(sales) FROM superstore_sales)) * 100 AS percentage
FROM superstore_sales
GROUP BY region;

SELECT region, category,
	SUM(sales) AS region_sales,
    (SUM(sales) / (SELECT SUM(sales) FROM superstore_sales)) * 100 AS percentage
FROM superstore_sales
GROUP BY region, category
ORDER BY region_sales DESC;