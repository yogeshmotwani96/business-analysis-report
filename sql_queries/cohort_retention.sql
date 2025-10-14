WITH first_orders AS (
  SELECT customer_id, MIN(order_date) AS first_date
  FROM orders GROUP BY 1
),
cohort AS (
  SELECT customer_id, DATE_TRUNC('month', first_date) AS cohort_month FROM first_orders
),
activity AS (
  SELECT customer_id, DATE_TRUNC('month', order_date) AS activity_month FROM orders
)
SELECT c.cohort_month, a.activity_month, COUNT(DISTINCT a.customer_id) AS active_customers
FROM cohort c
JOIN activity a USING (customer_id)
GROUP BY 1,2
ORDER BY 1,2;
