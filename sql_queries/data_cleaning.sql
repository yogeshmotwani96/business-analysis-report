-- Cleaning and validation examples
WITH ranked AS (
  SELECT o.*, ROW_NUMBER() OVER (
    PARTITION BY customer_id, order_date, total_amount ORDER BY order_id
  ) rn
  FROM orders o
)
SELECT * FROM ranked WHERE rn > 1;

UPDATE order_items oi
SET unit_price = p.list_price
FROM products p
WHERE oi.product_id = p.product_id
  AND oi.unit_price IS NULL;
