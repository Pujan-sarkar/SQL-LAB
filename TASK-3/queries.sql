USE ecommerce_store;

-- 1. SELECT * FROM a table (Customers)
SELECT * FROM Customers;

-- 2. SELECT specific columns (Product name and price)
SELECT name, price FROM Products;

-- 3. WHERE condition: Orders placed by customer_id = 1
SELECT * FROM Orders WHERE customer_id = 1;

-- 4. WHERE with AND: Orders by customer_id = 1 and status = 'Delivered'
SELECT * FROM Orders 
WHERE customer_id = 1 AND status = 'Delivered';

-- 5. WHERE with OR: Customers in Delhi or Mumbai
SELECT * FROM Customers 
WHERE address = 'Delhi' OR address = 'Mumbai';

-- 6. LIKE operator: Find products with name containing 'Lap'
SELECT * FROM Products 
WHERE name LIKE '%Lap%';

-- 7. BETWEEN operator: Products priced between 100 and 1000
SELECT * FROM Products 
WHERE price BETWEEN 100 AND 1000;

-- 8. ORDER BY: Products sorted by price ascending
SELECT * FROM Products 
ORDER BY price ASC;

-- 9. ORDER BY descending: Latest orders first
SELECT * FROM Orders 
ORDER BY order_date DESC;

-- 10. LIMIT: Show only 2 cheapest products
SELECT * FROM Products 
ORDER BY price ASC
LIMIT 2;

-- 11. = vs IN: Orders with status 'Pending' or 'Confirmed'
-- Using IN
SELECT * FROM Orders 
WHERE status IN ('Pending', 'Confirmed');

-- 12. Aliasing: Show product name as 'Item', price as 'Cost'
SELECT name AS Item, price AS Cost 
FROM Products;

-- 13. DISTINCT: Get unique order statuses
SELECT DISTINCT status FROM Orders;

-- 14. JOIN: Order details with customer names
SELECT 
    Orders.order_id,
    Customers.name AS customer_name,
    Orders.total_amount,
    Orders.status
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- 15. JOIN with WHERE and ORDER
SELECT 
    Orders.order_id,
    Customers.name AS customer_name,
    Orders.order_date
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
WHERE Orders.status = 'Delivered'
ORDER BY Orders.order_date DESC;
