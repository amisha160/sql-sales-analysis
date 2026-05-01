-- Create Database
CREATE DATABASE sales_analysis;
USE sales_analysis;

-- Create Table
CREATE TABLE sales (
    order_id INT,
    order_date DATE,
    ship_mode VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    region VARCHAR(50),
    category VARCHAR(50),
    sales FLOAT,
    quantity INT,
    profit FLOAT,
    discount FLOAT
);

-- Sample Data
INSERT INTO sales VALUES
(1, '2023-01-01', 'Second Class', 'Alice', 'Consumer', 'West', 'Technology', 200, 2, 50, 0.1),
(2, '2023-01-03', 'First Class', 'Bob', 'Corporate', 'East', 'Furniture', 500, 5, -20, 0.2),
(3, '2023-01-05', 'Standard Class', 'Charlie', 'Consumer', 'South', 'Office Supplies', 150, 3, 30, 0.05),
(4, '2023-01-07', 'Second Class', 'David', 'Home Office', 'West', 'Technology', 300, 4, 80, 0.15),
(5, '2023-01-10', 'Standard Class', 'Eva', 'Consumer', 'North', 'Furniture', 400, 2, -10, 0.25);

-- Total Sales
SELECT SUM(sales) AS total_sales FROM sales;

-- Sales by Category
SELECT category, SUM(sales) AS total_sales
FROM sales
GROUP BY category;

-- Profit Analysis
SELECT category, SUM(profit) AS total_profit
FROM sales
GROUP BY category;

-- Loss Making Orders
SELECT * FROM sales
WHERE profit < 0;

-- Top Customer
SELECT customer_name, SUM(sales) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC;
