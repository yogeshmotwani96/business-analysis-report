Entities
- customers(customer_id, customer_name, region)
- orders(order_id, customer_id, order_date, total_amount)
- order_items(order_item_id, order_id, product_id, quantity, unit_price)
- products(product_id, product_name, category, list_price)
- payments(payment_id, order_id, payment_date, amount, method)

Relationships
- customer 1-to-many orders
- order 1-to-many order_items
- products referenced by order_items
- order 1-to-1 payment
