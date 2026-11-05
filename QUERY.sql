SELECT customer_name,
       COUNT(order_id)   AS total_orders,
       SUM(total_price)  AS total_spent
FROM Cleaned_sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;
