# 1. Copy is Done

# 2. 
SELECT product_id
FROM `inductive-seat-389220.course15.circle_stock_cat`
GROUP BY product_id
HAVING COUNT(*) > 1 OR COUNT(product_id) = 0;

# 3.
SELECT CONCAT( model_id," - ", color," - ", size) AS pk
FROM `inductive-seat-389220.course15.circle_stock`
GROUP BY model_id, color, size
HAVING COUNT(*) > 1 OR COUNT(pk) = 0 ;

# 4.
SELECT model_type
FROM `inductive-seat-389220.course15.circle_stock_kpi`
WHERE model_type IS NULL;

# 5.
CREATE TABLE `inductive-seat-389220.course15.cc_stock_model_type` AS
SELECT 
    model_type,
    COUNT(*) AS nb_products,
    SUM(IF(stock> 0, 1, 0)) AS nb_products_in_stock,
    SUM(IF(stock <= 0, 1, 0)) / COUNT(*) AS shortage_rate,
    SUM(stock_value) AS total_stock_value
FROM `inductive-seat-389220.course15.circle_stock_kpi`
GROUP BY model_type;

# 6. 
SELECT model_type
FROM `inductive-seat-389220.course15.cc_stock_model_type`
GROUP BY model_type
HAVING COUNT(*) > 1 OR COUNT(model_type) = 0;

# 7. 
SELECT product_name
FROM `inductive-seat-389220.course15.circle_stock_kpi`
WHERE product_name IS NULL;

# 8.
SELECT stock_value
FROM `inductive-seat-389220.course15.circle_stock_kpi`
WHERE stock_value < 0;

UPDATE `inductive-seat-389220.course15.circle_stock_kpi`
SET stock_value = NULL
WHERE stock_value < 0;

