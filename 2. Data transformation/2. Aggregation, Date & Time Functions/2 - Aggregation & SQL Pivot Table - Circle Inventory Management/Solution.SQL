## 1 - Stock Aggregation
-- Total stock statistics
SELECT 
    COUNT(*) AS total_products,
    SUM(in_stock) AS total_products_in_stock,
    1 - AVG(in_stock) AS shortage_rate,
    SUM(stock_value) AS total_stock_value,
    SUM(stock) AS total_stock
FROM `inductive-seat-389220.course15.circle_stock_kpi` 

-- Aggregated by model_type
SELECT 
    model_type,
    COUNT(*) AS total_products,
    SUM(in_stock) AS total_products_in_stock,
    1 - AVG(in_stock) AS shortage_rate,
    SUM(stock_value) AS total_stock_value,
    SUM(stock) AS total_stock
FROM `inductive-seat-389220.course15.circle_stock_kpi` 
GROUP BY model_type

-- Aggregated by model_type and model_name
SELECT 
    model_type,
    model_name,
    COUNT(*) AS total_products,
    SUM(in_stock) AS total_products_in_stock,
    1 - AVG(in_stock) AS shortage_rate,
    SUM(stock_value) AS total_stock_value,
    SUM(stock) AS total_stock
FROM `inductive-seat-389220.course15.circle_stock_kpi` 
GROUP BY model_type, model_name
ORDER BY total_stock_value DESC

## 2 - Sales Aggregation
-- Determine top products sold
CREATE TABLE inductive-seat-389220.course15.Top_products AS
SELECT product_id, SUM(qty) AS total_quantity_sold
FROM `inductive-seat-389220.course15.circle_sales`
GROUP BY product_id
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- Adding 'top products' column to circle_stock_kpi table
CREATE TABLE inductive-seat-389220.course15.circle_stock_kpi_Top AS
SELECT *,
       0 AS top_products
FROM `inductive-seat-389220.course15.circle_stock_Kpi`;

-- Update top_products column
UPDATE inductive-seat-389220.course15.circle_stock_kpi_top
SET top_products = 1
WHERE product_id IN (SELECT product_id FROM inductive-seat-389220.course15.top_products)

-- Estimating daily product sales and days of stock remaining
CREATE TABLE inductive-seat-389220.course15.circle_sales_daily AS
SELECT product_id,
       SUM(qty) AS qty_91,
       AVG(qty) AS avg_daily_qty_91
FROM inductive-seat-389220.course15.circle_sales
WHERE date_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 91 DAY)
GROUP BY product_id;

