 TASK 3: SQL FOR DATA ANALYSIS
 E-Commerce Database

1. SELECT
SELECT * FROM customers;

2. WHERE
SELECT *
FROM customers
WHERE city = 'Hyderabad';

3. ORDER BY
SELECT *
FROM products
ORDER BY price DESC;

4. GROUP BY + SUM
SELECT category, SUM(price) AS total_price
FROM products
GROUP BY category;

5. GROUP BY + AVG
SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category;

6. JOIN - Customers and Orders
SELECT
    orders.order_id,
    customers.customer_name,
    customers.city,
    orders.order_date,
    orders.order_status
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id;

7. JOIN - Four Tables
SELECT
    customers.customer_name,
    products.product_name,
    products.category,
    order_items.quantity
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id;

8. SUBQUERY
SELECT product_name, price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

9. VIEW
CREATE VIEW customer_orders AS
SELECT
    customers.customer_name,
    customers.city,
    orders.order_id,
    orders.order_date,
    orders.order_status
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id;

View output
SELECT * FROM customer_orders;

10. INDEX
CREATE INDEX idx_orders_customer_id
ON orders(customer_id);