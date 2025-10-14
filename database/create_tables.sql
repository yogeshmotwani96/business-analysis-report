-- PostgreSQL-flavored DDL.

CREATE TABLE customers (
  customer_id   INT PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  region        VARCHAR(20)  NOT NULL
);

CREATE TABLE products (
  product_id   INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category     VARCHAR(50)  NOT NULL,
  list_price   NUMERIC(10,2) NOT NULL
);

CREATE TABLE orders (
  order_id     INT PRIMARY KEY,
  customer_id  INT NOT NULL REFERENCES customers(customer_id),
  order_date   DATE NOT NULL,
  total_amount NUMERIC(12,2) NOT NULL
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id      INT NOT NULL REFERENCES orders(order_id),
  product_id    INT NOT NULL REFERENCES products(product_id),
  quantity      INT NOT NULL CHECK (quantity > 0),
  unit_price    NUMERIC(10,2) NOT NULL
);

CREATE TABLE payments (
  payment_id   INT PRIMARY KEY,
  order_id     INT NOT NULL UNIQUE REFERENCES orders(order_id),
  payment_date DATE NOT NULL,
  amount       NUMERIC(12,2) NOT NULL,
  method       VARCHAR(20) NOT NULL
);
