SELECT customer_name,
       COUNT(order_id)   AS total_orders,
       SUM(total_price)  AS total_spent
FROM Cleaned_sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM Cleaned_sales;
SELECT customer_name,
       ROUND(AVG(total_price), 2) AS avg_order_value
FROM Cleaned_sales
GROUP BY customer_name
ORDER BY avg_order_value DESC
LIMIT 10;
SELECT customer_name, SUM(total_price) AS total_spent
FROM Cleaned_sales
GROUP BY customer_name
HAVING SUM(total_price) > (
    SELECT AVG(cust_total)
    FROM (SELECT SUM(total_price) AS cust_total
          FROM Cleaned_sales
          GROUP BY customer_name) t
)
ORDER BY total_spent DESC;
SELECT customer_name,
       SUM(total_price) AS total_spent,
       CASE
         WHEN SUM(total_price) >= 50000 THEN 'High Value'
         WHEN SUM(total_price) >= 20000 THEN 'Medium Value'
         ELSE 'Low Value'
       END AS customer_segment
FROM Cleaned_sales
GROUP BY customer_name
ORDER BY total_spent DESC;
SELECT region, category,
       SUM(total_price) AS revenue,
       COUNT(order_id)  AS orders
FROM Cleaned_sales
GROUP BY region, category
ORDER BY revenue DESC;
SELECT order_id, STR_TO_DATE(order_date, '%d-%m-%Y') AS order_date_fixed
FROM Cleaned_sales
LIMIT 10;
