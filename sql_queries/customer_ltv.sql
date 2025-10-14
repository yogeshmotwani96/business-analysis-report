SELECT c.customer_id, c.customer_name,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(oi.quantity * oi.unit_price) AS lifetime_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 1,2
ORDER BY lifetime_value DESC NULLS LAST;
