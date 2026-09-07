# Brazilian E-Commerce Big Data Analysis Using Hive

## Project Overview

This project analyzes the Brazilian E-Commerce Public Dataset by Olist using Hadoop Hive.

The dataset contains approximately 100,000 orders from an e-commerce platform and includes multiple connected transactional tables such as orders, order items, payments, reviews, products, and sellers.

The objective is to use Big Data technologies to analyze e-commerce transactions and generate useful business insights.

## Dataset

**Dataset:** Brazilian E-Commerce Public Dataset by Olist

**Source:** Kaggle

The dataset contains information from approximately 100,000 orders made between 2016 and 2018.

### Main Tables

- Orders
- Order Items
- Order Payments
- Order Reviews
- Products
- Sellers

### Table Relationships

The tables are connected through common identifiers:

- `orders.order_id` → `order_items.order_id`
- `orders.order_id` → `order_payments.order_id`
- `orders.order_id` → `order_reviews.order_id`
- `order_items.product_id` → `products.product_id`
- `order_items.seller_id` → `sellers.seller_id`

This relational structure allows transactional analysis using Hive JOIN operations.

## Business Problem

E-commerce businesses need to understand their transactions, product performance, payment behavior, and customer satisfaction.

This project addresses questions such as:

1. Do late deliveries correspond to lower customer review scores?
2. Which product categories generate the highest sales?
3. Which payment methods are most commonly used?
4. How can connected transactional data be analyzed using Hive?

## Technologies Used

- Hadoop
- Hive
- HDFS
- SQL
- Google Cloud / Hortonworks Sandbox environment

## Hive Analysis

The project includes Hive SQL queries for:

### 1. Transactional JOIN Analysis

Connects orders, order items, products, and customer reviews to demonstrate how multiple transactional tables can be analyzed together.

### 2. Delivery Performance

Compares late and on-time orders with their average customer review scores.

### 3. Product Category Sales

Identifies the top product categories based on number of items sold and total sales.

### 4. Payment Method Analysis

Compares payment methods based on transaction count, total payment value, and average payment value.

## Key Findings

- Late and on-time orders both received average review scores of approximately 4.1.
- Health & Beauty was the highest-selling product category by total sales among the analyzed categories.
- Credit cards were the dominant payment method by both transaction count and total payment value.
- Hive JOIN operations allow multiple transactional datasets to be combined for business analysis.

## Project Files

`olist_hive_analysis.sql` contains the Hive SQL queries used for the analysis and demonstration.

## How to Run

1. Upload the Olist CSV datasets into HDFS.
2. Create the Hive database and tables.
3. Load the datasets into the corresponding Hive tables.
4. Execute the queries in `olist_hive_analysis.sql`.
5. Review the generated results.

## Conclusion

This project demonstrates how Hadoop Hive can be used to process and analyze large-scale transactional e-commerce data. The analysis combines multiple connected tables to identify patterns in delivery performance, product sales, payment methods, and customer reviews.
