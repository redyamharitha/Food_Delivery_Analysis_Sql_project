# 🍔 Online Food Delivery SQL Project

## 📌 Project Overview

The **Online Food Delivery SQL Project** is a MySQL-based relational database project designed to manage and analyze the operations of an online food delivery platform.

The database manages customers, restaurants, menu items, orders, payments, delivery partners, addresses, and customer reviews.

The project demonstrates practical SQL skills including database design, table relationships, joins, aggregation, subqueries, views, indexes, stored procedures, triggers, and business analysis.

---

## 🎯 Project Objectives

- Design a relational database for an online food delivery platform.
- Store and manage customer, restaurant, menu, order, payment, and delivery information.
- Establish relationships between multiple database entities.
- Perform business-oriented data analysis using SQL.
- Identify customer and restaurant performance.
- Analyze order trends, revenue, payments, and reviews.
- Demonstrate advanced SQL concepts.
- Improve database performance using indexes.
- Create reusable views and stored procedures.

---

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Database Tool:** MySQL Workbench
- **Version Control:** Git & GitHub

---

## 🗄️ Database Tables

The database contains the following tables:

| Table | Description |
|---|---|
| `customers` | Stores customer information |
| `restaurants` | Stores restaurant information |
| `menu` | Stores food items and their prices |
| `orders` | Stores customer order information |
| `order_items` | Stores individual items belonging to orders |
| `payments` | Stores payment information |
| `delivery_partners` | Stores delivery partner information |
| `addresses` | Stores customer delivery addresses |
| `reviews` | Stores customer reviews and ratings |

---

## 🔗 Database Relationships

The major relationships in the database include:

- One customer can place many orders.
- One customer can have multiple addresses.
- One restaurant can have many menu items.
- One restaurant can receive many orders.
- One order can contain multiple menu items.
- One order has a payment record.
- One delivery partner can handle multiple orders.
- One customer can write multiple reviews.
- One restaurant can receive multiple reviews.

The `order_items` table connects orders and menu items.

---

## 🧠 SQL Concepts Demonstrated

### Basic SQL

- `SELECT`
- `WHERE`
- `ORDER BY`
- `DISTINCT`
- `LIMIT`
- `LIKE`
- `BETWEEN`
- `IN`
- `INSERT`
- `UPDATE`
- `DELETE`

### Database Design

- Primary Keys
- Foreign Keys
- `NOT NULL`
- `UNIQUE`
- `CHECK`
- `DEFAULT`
- `AUTO_INCREMENT`

### Aggregate Functions

- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`

### Data Analysis

- `GROUP BY`
- `HAVING`
- `CASE`

### Joins

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- Multiple-table joins

### Advanced SQL

- Subqueries
- `EXISTS`
- `NOT EXISTS`
- `ANY`
- `ALL`
- Views
- Indexes
- Stored Procedures
- Triggers

---

## 📊 Business Analysis

The database can be used to answer real-world business questions such as:

### 👥 Customer Analysis

- Who are the highest-spending customers?
- Which customers place the most orders?
- Which customers have never placed an order?
- What is the average customer spending?

### 🏪 Restaurant Analysis

- Which restaurant generates the highest revenue?
- Which restaurants receive the most orders?
- Which restaurant has the highest average rating?
- What is the average order value for each restaurant?

### 🍕 Food Analysis

- Which food items are ordered most frequently?
- Which food categories are most popular?
- What is the average price of food items by category?

### 📦 Order Analysis

- What is the total number of orders?
- What is the average order value?
- How many orders were delivered?
- How many orders were cancelled?
- What is the cancellation rate?

### 💳 Payment Analysis

- Which payment method is most commonly used?
- How many payments were successful?
- How many payments are pending or refunded?

### 🚴 Delivery Analysis

- Which delivery partners handle the most orders?
- What is the average delivery partner rating?
- How are orders distributed among delivery partners?

---
## 🔥 Example SQL Queries

### 1. Top Customers by Spending

```sql
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;
```

### 2. Restaurant Revenue

```sql
SELECT
    r.restaurant_name,
    SUM(o.total_amount) AS total_revenue
FROM restaurants r
JOIN orders o
    ON r.restaurant_id = o.restaurant_id
WHERE o.status = 'Delivered'
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY total_revenue DESC;
```

### 3. Order Status Analysis

```sql
SELECT
    status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY status
ORDER BY total_orders DESC;
```

### 4. Cancellation Rate

```sql
SELECT
    ROUND(
        SUM(
            CASE
                WHEN status = 'Cancelled' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM orders;
```

---

## 👁️ Views

The project includes reusable SQL views for reporting and analysis.

### `customer_orders`

Provides customer and order-related information.

### `customer_spending`

Provides customer-level spending and order information.

### `order_summary`

Provides a summarized view of order-related information for easier analysis.

---

## ⚡ Database Optimization

Indexes are used on frequently accessed columns to improve query performance.

The project also uses MySQL's `EXPLAIN` statement to understand query execution plans and analyze query performance.

---

## ⚙️ Stored Procedures

The project includes stored procedures for reusable database operations.

### `get_all_customers`

Retrieves all customer records from the database.

### `get_customer_orders`

Retrieves order information for a specific customer.

### `get_restaurant_revenue`

Calculates revenue generated by restaurants.

---

## 🔔 Triggers

The project includes triggers to automate specific database operations.

### `after_order_update`

Automatically performs an action when order information is updated.

### `before_review_insert`

Automatically performs an action before a new review is inserted.

---

## 📁 Project Structure

```text
online-food-delivery-sql-project/
│
├── README.md
│
└── sql/
    └── food_delivery_db.sql
```

---

## 🚀 How to Run the Project

### 1. Install MySQL

Install MySQL Server and MySQL Workbench.

### 2. Download the SQL File

Open the following file from this repository:

```text
sql/food_delivery_db.sql
```

### 3. Open MySQL Workbench

Open the `food_delivery_db.sql` file in MySQL Workbench.

### 4. Execute the SQL Script

Run the complete SQL script.

The script creates the database, tables, relationships, sample data, views, stored procedures, triggers, and indexes.

### 5. Explore the Database

After executing the script, select the `food_delivery_db` database and run SQL queries to explore the data and perform business analysis.

---

## 📚 Key Learning Outcomes

Through this project, I gained practical experience in:

- Relational database design
- Database normalization
- Primary and foreign key relationships
- SQL joins
- Aggregate functions
- Subqueries
- Conditional logic
- Views
- Indexes
- Stored procedures
- Triggers
- Business-oriented SQL analysis

---

## 🛠️ Technologies Used

- **MySQL**
- **SQL**
- **MySQL Workbench**
- **Git**
- **GitHub**

---

## 🔗 Database Relationships

The major relationships in the database include:

- One customer can place many orders.
- One customer can have multiple addresses.
- One restaurant can have many menu items.
- One restaurant can receive many orders.
- One order can contain multiple menu items.
- One order has a payment record.
- One delivery partner can handle multiple orders.
- One customer can write multiple reviews.
- One restaurant can receive multiple reviews.

The `order_items` table connects orders and menu items.

---

## 🗺️ Entity Relationship Diagram

The following ER diagram represents the database structure and relationships between the major entities in the online food delivery system.

![Online Food Delivery ER Diagram](documentation/ER_Diagram.png)

## 👨‍💻 Author

**Naresh R**

MCA Graduate | SQL | Python | Power BI | Data Analytics

---

⭐ This project demonstrates practical SQL and relational database skills through a real-world food delivery use case.

