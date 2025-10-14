WITH metrics AS (
  SELECT DATE_TRUNC('month', o.order_date) AS month,
         COUNT(DISTINCT o.order_id) AS total_orders,
         COUNT(DISTINCT o.customer_id) AS unique_customers,
         SUM(oi.quantity * oi.unit_price) AS revenue
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  GROUP BY 1
)
SELECT month, total_orders, unique_customers, revenue,
       ROUND(revenue/NULLIF(total_orders,0),2) AS avg_order_value
FROM metrics
ORDER BY month;
