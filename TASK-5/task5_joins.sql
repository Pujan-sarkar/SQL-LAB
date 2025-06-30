USE ecommerce_store;

-- 1️⃣ INNER JOIN: Orders with their customer names
SELECT 
    Orders.order_id,
    Customers.name AS customer_name,
    Orders.total_amount,
    Orders.status
FROM Orders
INNER JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- 2️⃣ LEFT JOIN: All customers with any matching orders (include customers with no orders)
SELECT 
    Customers.customer_id,
    Customers.name,
    Orders.order_id,
    Orders.total_amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 3️⃣ RIGHT JOIN: All orders, including those with no matching customer (rare in this schema, but for example)
SELECT 
    Orders.order_id,
    Orders.total_amount,
    Customers.name AS customer_name
FROM Orders
RIGHT JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- 4️⃣ FULL OUTER JOIN: Combine LEFT + RIGHT to simulate FULL JOIN in MySQL (which doesn’t support it directly)
SELECT 
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.total_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id

UNION

SELECT 
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.total_amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- 5️⃣ JOIN 3 TABLES: Orders + Customers + Payments
SELECT 
    o.order_id,
    c.name AS customer_name,
    p.method,
    p.amount,
    p.status
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Payment p ON o.order_id = p.order_id;

-- 6️⃣ CROSS JOIN: All possible combinations of products and categories (not practical in business logic)
SELECT 
    Products.name AS product_name,
    Categories.category_name
FROM Products
CROSS JOIN Categories;

-- 7️⃣ SELF JOIN: Customers from same city (showing pairs of customers living in the same address)
SELECT 
    A.name AS customer_1,
    B.name AS customer_2,
    A.address
FROM Customers A
JOIN Customers B ON A.address = B.address AND A.customer_id <> B.customer_id;
