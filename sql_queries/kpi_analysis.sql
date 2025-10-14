WITH revenue_cte AS (
  SELECT DATE_TRUNC('month', o.order_date) AS month,
         SUM(oi.quantity * oi.unit_price) AS revenue
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  GROUP BY 1
),
cost_cte AS (
  SELECT DATE_TRUNC('month', o.order_date) AS month,
         SUM(oi.quantity * oi.unit_price * 0.7) AS cost
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  GROUP BY 1
)
SELECT r.month,
       r.revenue AS total_revenue,
       c.cost AS total_cost,
       ROUND((r.revenue - c.cost)/NULLIF(r.revenue,0)*100,2) AS profit_margin_pct
FROM revenue_cte r
JOIN cost_cte c USING (month)
ORDER BY r.month;
