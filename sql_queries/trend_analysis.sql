SELECT DATE_TRUNC('month', o.order_date) AS month,
       c.region,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY 1, 2
ORDER BY 1, 3 DESC;
