USE ecommerce_store;

-- 1️⃣ Count total number of orders
SELECT COUNT(*) AS total_orders FROM Orders;

-- 2️⃣ Find total amount spent by each customer
SELECT 
    customer_id,
    SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id;

-- 3️⃣ Find average product price per category
SELECT 
    category_id,
    ROUND(AVG(price), 2) AS avg_price
FROM Products
GROUP BY category_id;

-- 4️⃣ Count number of products in each category
SELECT 
    category_id,
    COUNT(*) AS product_count
FROM Products
GROUP BY category_id;

-- 5️⃣ Find total quantity sold for each product
SELECT 
    product_id,
    SUM(quantity) AS total_quantity_sold
FROM OrderItems
GROUP BY product_id;

-- 6️⃣ Find customers who have placed more than 1 order
SELECT 
    customer_id,
    COUNT(order_id) AS order_count
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- 7️⃣ Find average order amount for each status
SELECT 
    status,
    ROUND(AVG(total_amount), 2) AS avg_order_amount
FROM Orders
GROUP BY status;

-- 8️⃣ Count number of orders per day
SELECT 
    DATE(order_date) AS order_day,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY DATE(order_date);

-- 9️⃣ Total revenue from each payment method
SELECT 
    method,
    SUM(amount) AS total_revenue
FROM Payment
GROUP BY method;

-- 🔟 Find most sold product by quantity
SELECT 
    product_id,
    SUM(quantity) AS total_quantity
FROM OrderItems
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 1;
