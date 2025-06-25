USE ecommerce_store;

-- INSERTING INTO Categories
INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Books'),
('Clothing');

-- INSERTING INTO Products
INSERT INTO Products (name, description, price, stock, category_id) VALUES
('Smartphone', 'Latest Android smartphone', 20000.00, 50, 1),
('Laptop', '14-inch laptop with 16GB RAM', 55000.00, 20, 1),
('T-shirt', 'Cotton round-neck T-shirt', 500.00, 100, 3),
('Novel', 'Fiction novel - bestseller', 299.00, 30, 2);

-- INSERTING INTO Customers
INSERT INTO Customers (name, email, phone, address) VALUES
('Amit Sharma', 'amit@gmail.com', '9876543210', 'Delhi'),
('Neha Gupta', 'neha@gmail.com', NULL, 'Mumbai'), -- NULL phone
('Rohit Sen', 'rohit@gmail.com', '9834215678', NULL); -- NULL address

-- INSERTING INTO Orders
INSERT INTO Orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-06-20 10:00:00', 55500.00, 'Confirmed'),
(2, '2024-06-21 12:30:00', 299.00, 'Pending');

-- INSERTING INTO OrderItems
INSERT INTO OrderItems (order_id, product_id, quantity, price) VALUES
(1, 2, 1, 55000.00),
(1, 1, 1, 20000.00), -- Price may not match total, for demonstration
(2, 4, 1, 299.00);

-- INSERTING INTO Payment
INSERT INTO Payment (order_id, payment_date, amount, method, status) VALUES
(1, '2024-06-20 10:30:00', 55500.00, 'UPI', 'Completed'),
(2, NULL, 299.00, 'COD', 'Pending'); -- NULL payment date

-- INSERTING INTO Shipping
INSERT INTO Shipping (order_id, shipping_address, shipping_date, status) VALUES
(1, 'Delhi Warehouse', '2024-06-21 14:00:00', 'Shipped'),
(2, NULL, NULL, 'Processing'); -- NULLs for missing info

---------------------------------------------------
-- UPDATE examples
---------------------------------------------------

-- Update stock after purchase
UPDATE Products
SET stock = stock - 1
WHERE product_id = 2;

-- Update order status
UPDATE Orders
SET status = 'Delivered'
WHERE order_id = 1;

-- Set shipping address where it was missing
UPDATE Shipping
SET shipping_address = 'Mumbai Warehouse'
WHERE order_id = 2;

---------------------------------------------------
-- DELETE example
---------------------------------------------------

-- Delete a test customer with no orders
DELETE FROM Customers
WHERE customer_id = 3
AND customer_id NOT IN (SELECT customer_id FROM Orders);

---------------------------------------------------
-- NULL handling example with IS NULL
---------------------------------------------------

-- Fetch customers with no phone number
SELECT * FROM Customers WHERE phone IS NULL;

-- Fetch orders with pending payment
SELECT * FROM Payment WHERE payment_date IS NULL;
