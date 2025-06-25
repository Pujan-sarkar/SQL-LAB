# Task 1 & 2: E-Commerce Store SQL Project

## Task 1: Database Setup and Schema Design

**Domain**: E-Commerce Store

### 🎯 Objective
To design and create a relational database schema for managing an E-commerce system. The task focuses on learning how to structure entities and define relationships using SQL with appropriate constraints and normalization techniques.

### 🛠 Tools Used
- MySQL Workbench (ER diagram & schema design)

### 📁 Files Included
- `schema.sql` – SQL file to create the database and tables.
- `task2.sql` – SQL file with sample data and CRUD operations.

### 🧾 Entities and Relationships

**Entities:**
- Customers
- Categories
- Products
- Orders
- OrderItems
- Payment
- Shipping

**Relationships:**
- Customers → Orders (1:N)
- Orders → OrderItems (1:N)
- Products → OrderItems (1:N)
- Products → Categories (M:1)
- Orders → Payment, Shipping (1:1)

### 🔐 Constraints
- Primary and Foreign Keys on all tables to maintain integrity.

### 📈 ER Diagram (Text)
```
[Customers] ---< [Orders] >--- [OrderItems] >--- [Products] ---< [Categories]
                   |                          |
                   v                          v
               [Payment]                  [Shipping]
```

### ✅ Outcome
A normalized and structured SQL schema for a scalable E-Commerce backend with basic data inserted and updated for real-world functionality.
