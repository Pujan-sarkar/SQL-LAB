USE ecommerce_store;

-- 1️⃣ Stored Procedure: Get all orders by a specific customer (IN parameter)
DELIMITER //

CREATE PROCEDURE GetOrdersByCustomer(IN cust_id INT)
BEGIN
    SELECT 
        o.order_id,
        o.order_date,
        o.total_amount,
        o.status
    FROM Orders o
    WHERE o.customer_id = cust_id;
END;
//

DELIMITER ;

-- 🔍 Usage:
-- CALL GetOrdersByCustomer(1);

---------------------------------------------------------------

-- 2️⃣ Stored Function: Get total orders placed by a customer
DELIMITER //

CREATE FUNCTION TotalOrdersByCustomer(cust_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE order_count INT;
    SELECT COUNT(*) INTO order_count
    FROM Orders
    WHERE customer_id = cust_id;
    RETURN order_count;
END;
//

DELIMITER ;

-- 🔍 Usage:
-- SELECT TotalOrdersByCustomer(1);

---------------------------------------------------------------

-- 3️⃣ Stored Procedure: Insert a new product (with IN parameters)
DELIMITER //

CREATE PROCEDURE AddNewProduct(
    IN p_name VARCHAR(100),
    IN p_description TEXT,
    IN p_price DECIMAL(10,2),
    IN p_stock INT,
    IN p_category INT
)
BEGIN
    INSERT INTO Products(name, description, price, stock, category_id)
    VALUES(p_name, p_description, p_price, p_stock, p_category);
END;
//

DELIMITER ;

-- 🔍 Usage:
-- CALL AddNewProduct('Tablet', '10-inch display tablet', 15000.00, 30, 1);

---------------------------------------------------------------

-- 4️⃣ Stored Function: Get total revenue for a given payment method
DELIMITER //

CREATE FUNCTION TotalRevenueByMethod(method_name VARCHAR(50))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(10,2);
    SELECT SUM(amount) INTO total_revenue
    FROM Payment
    WHERE method = method_name;
    RETURN total_revenue;
END;
//

DELIMITER ;

-- 🔍 Usage:
-- SELECT TotalRevenueByMethod('UPI');
