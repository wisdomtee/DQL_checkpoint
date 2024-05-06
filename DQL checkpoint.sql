SELECT * FROM customers;


SELECT product_name, category 
FROM products 
WHERE price BETWEEN 5000 AND 10000;


SELECT * 
FROM products 
ORDER BY price DESC;



SELECT 
    COUNT(order_id) AS total_orders,
    AVG(amount) AS average_amount,
    MAX(amount) AS highest_amount,
    MIN(amount) AS lowest_amount
FROM orders;


SELECT 
    product_id,
    COUNT(order_id) AS num_orders
FROM order_details
GROUP BY product_id;



SELECT 
    customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 2;



SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(order_id) AS num_orders
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2020
GROUP BY EXTRACT(MONTH FROM order_date);



SELECT 
    products.product_name,
    customers.customer_name,
    orders.order_date
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
JOIN customers ON orders.customer_id = customers.customer_id;



SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '3 months'
AND order_date < CURRENT_DATE - INTERVAL '2 months'


SELECT  customer_id
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);


