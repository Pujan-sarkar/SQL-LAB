# Task 8: Stored Procedures and Functions  
**Domain**: E-Commerce Store

---

## 🎯 Objective  
To modularize SQL logic using procedures and functions for better reuse, automation, and abstraction.

---

## 🛠 Tools Used  
- MySQL Workbench / SQLite Browser

---

## 📁 Files Included
- `task8_procedure_function.sql` – SQL code for stored procedures and functions

---

## 🧾 Stored Routines

### ✅ Procedures
1. **GetOrdersByCustomer(IN cust_id)** – Returns all orders for a given customer.
2. **AddNewProduct(...)** – Inserts a new product into the Products table using IN parameters.

### ✅ Functions
1. **TotalOrdersByCustomer(cust_id)** – Returns the count of orders made by a customer.
2. **TotalRevenueByMethod(method)** – Returns total revenue received via a specific payment method.

---

## 🔍 Key Concepts Practiced
- `IN` parameters
- `RETURN` in functions
- `CALL`ing procedures
- Conditional logic and aggregation inside functions

---

## ✅ Outcome
Learned how to define reusable SQL code blocks using `CREATE PROCEDURE` and `CREATE FUNCTION`, improving modularity and reusability in database operations.
