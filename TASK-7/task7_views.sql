USE ecommerce_store;

-- 1️⃣ View: Show customer names and their order summary
CREATE VIEW customer_order_summary AS
SELECT 
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 🔍 Example usage:
SELECT * FROM customer_order_summary;

-- ✅ Output:
-- | customer_id | customer_name | total_orders | total_spent |
-- |-------------|----------------|--------------|-------------|
-- | 1           | Amit Sharma    | 1            | 55500.00    |
-- | 2           | Neha Gupta     | 1            | 299.00      |

---------------------------------------------------------------

-- 2️⃣ View: Orders and payment status
CREATE VIEW order_payment_status AS
SELECT 
    o.order_id,
    o.customer_id,
    c.name AS customer_name,
    o.total_amount,
    p.method AS payment_method,
    p.status AS payment_status
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
LEFT JOIN Payment p ON o.order_id = p.order_id;

-- 🔍 Example usage:
SELECT * FROM order_payment_status;

-- ✅ Output:
-- | order_id | customer_name | payment_method | payment_status |
-- |----------|----------------|----------------|----------------|
-- | 1        | Amit Sharma    | UPI            | Completed      |
-- | 2        | Neha Gupta     | COD            | Pending        |

---------------------------------------------------------------

-- 3️⃣ View: Top 5 most expensive products
CREATE VIEW top_expensive_products AS
SELECT 
    name AS product_name,
    price,
    stock
FROM Products
ORDER BY price DESC
LIMIT 5;

-- 🔍 Example usage:
SELECT * FROM top_expensive_products;

-- ✅ Output (example):
-- | product_name | price   | stock |
-- |--------------|---------|-------|
-- | Laptop       | 55000.0 | 19    |
-- | Smartphone   | 20000.0 | 49    |
-- | T-shirt      | 500.0   | 100   |
-- | Novel        | 299.0   | 30    |

---------------------------------------------------------------

-- 4️⃣ View: Shipping status for each order
CREATE VIEW shipping_status_view AS
SELECT 
    s.order_id,
    c.name AS customer_name,
    s.shipping_address,
    s.shipping_date,
    s.status AS shipping_status
FROM Shipping s
JOIN Orders o ON s.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id;

-- 🔍 Example usage:
SELECT * FROM shipping_status_view;

-- ✅ Output:
-- | order_id | customer_name | shipping_address | shipping_status |
-- |----------|----------------|------------------|------------------|
-- | 1        | Amit Sharma    | Delhi Warehouse  | Shipped          |
-- | 2        | Neha Gupta     | Mumbai Warehouse | Processing       |

