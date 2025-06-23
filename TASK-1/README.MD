# Task 1: Database Setup and Schema Design  
**Domain**: E-Commerce Store

---

## 🎯 Objective  
To design and create a relational database schema for managing an E-commerce system. The task focuses on learning how to structure entities and define relationships using SQL with appropriate constraints and normalization techniques.

---

## 🛠 Tools Used  
- **MySQL Workbench**  
  MySQL Workbench is used for ER diagram design and schema modeling.

---

## 📁 Files Included

- `schema.sql` – SQL file to create the database and all necessary tables.  
- `er-diagram.png` – Visual representation of the schema as an ER diagram.

---

## 🧾 Entities and Relationships  

### Entities:

- **Customers**: Stores information about customers who register and purchase from the store.  
- **Categories**: Classification for products (e.g., electronics, clothing).  
- **Products**: Details about each item available in the store.  
- **Orders**: Tracks customer orders including status and date.  
- **OrderItems**: Line items in each order, representing multiple products.  
- **Payment**: Stores payment transaction details for orders.  
- **Shipping**: Stores shipping-related data for customer orders.

---

### Relationships:

- One **Customer** can place many **Orders** (1:N).  
- One **Order** can contain multiple **OrderItems** (1:N).  
- One **Product** can appear in multiple **OrderItems** (1:N).  
- One **Product** belongs to one **Category** (M:1).  
- One **Order** has one **Payment** and one **Shipping** record (1:1).

---

## 🔐 Constraints

- **Primary Keys** for all tables to ensure uniqueness.  
- **Foreign Keys** to enforce relationships between:

  - `Orders.customer_id → Customers.customer_id`  
  - `Products.category_id → Categories.category_id`  
  - `OrderItems.order_id → Orders.order_id`  
  - `OrderItems.product_id → Products.product_id`  
  - `Payment.order_id → Orders.order_id`  
  - `Shipping.order_id → Orders.order_id`  

---

## 📈 ER Diagram (Text Description)

[Customers] ---< [Orders] >--- [OrderItems] >--- [Products] ---< [Categories]
| |
v v
[Payment] [Shipping]
