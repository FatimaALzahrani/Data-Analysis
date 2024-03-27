
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
