USE ecommerce_store;

-- 1️⃣ Scalar Subquery: Customer name who placed the highest value order
SELECT 
    (SELECT name 
     FROM Customers 
     WHERE customer_id = (
         SELECT customer_id 
         FROM Orders 
         ORDER BY total_amount DESC 
         LIMIT 1)) AS top_spender;

-- 2️⃣ Subquery in WHERE: Products from categories with more than 1 product
SELECT * FROM Products
WHERE category_id IN (
    SELECT category_id 
    FROM Products 
    GROUP BY category_id 
    HAVING COUNT(*) > 1
);

-- 3️⃣ Subquery with EXISTS: Customers who placed at least one order
SELECT * FROM Customers c
WHERE EXISTS (
    SELECT 1 FROM Orders o WHERE o.customer_id = c.customer_id
);

-- 4️⃣ Correlated Subquery: Orders that are above customer’s average order total
SELECT * FROM Orders o
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Orders
    WHERE customer_id = o.customer_id
);

-- 5️⃣ Subquery in FROM: Average order amount per customer (as a derived table)
SELECT 
    customer_id, 
    ROUND(avg_order, 2) AS average_order_value
FROM (
    SELECT 
        customer_id, 
        AVG(total_amount) AS avg_order
    FROM Orders
    GROUP BY customer_id
) AS avg_table;

-- 6️⃣ IN with Subquery: Products that were ordered
SELECT * FROM Products
WHERE product_id IN (
    SELECT DISTINCT product_id FROM OrderItems
);

-- 7️⃣ NOT EXISTS: Customers who have not placed any order
SELECT * FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o WHERE o.customer_id = c.customer_id
);

-- 8️⃣ Subquery in SELECT: Show each order with number of items in it
SELECT 
    o.order_id,
    o.customer_id,
    (SELECT COUNT(*) 
     FROM OrderItems oi 
     WHERE oi.order_id = o.order_id) AS item_count
FROM Orders o;
