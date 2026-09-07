-- Olist E-Commerce Big Data Project
-- Hive SQL Analysis

USE olist_db;

-- 1. Transactional JOIN demonstration
SELECT o.order_id, o.order_status, o.order_purchase_timestamp, oi.product_id, oi.price, oi.freight_value, p.product_category_name,
 r.review_score FROM orders o JOIN order_items oi ON o.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id
LEFT JOIN order_reviews_clean r ON o.order_id = r.order_id LIMIT 20;

-- 2. Delivery performance vs customer satisfaction
SELECT CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Late' ELSE 'On Time' END AS delivery_status,
COUNT(DISTINCT o.order_id) AS total_orders, ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM orders o JOIN order_reviews_clean r ON o.order_id = r.order_id WHERE o.order_delivered_customer_date IS NOT NULL
AND o.order_estimated_delivery_date IS NOT NULL AND r.review_score BETWEEN 1 AND 5
GROUP BY CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Late' ELSE 'On Time' END;

-- 3. Top product categories by sales
SELECT p.product_category_name, COUNT(*) AS items_sold, ROUND(SUM(oi.price), 2) AS total_sales FROM order_items oi
JOIN products p ON oi.product_id = p.product_id GROUP BY p.product_category_name ORDER BY total_sales DESC LIMIT 10;

-- 4. Payment method analysis
SELECT payment_type, COUNT(*) AS payment_count, ROUND(SUM(payment_value), 2) AS total_payment_value,  ROUND(AVG(payment_value), 2) AS average_payment_value
FROM order_payments GROUP BY payment_type ORDER BY total_payment_value DESC;
