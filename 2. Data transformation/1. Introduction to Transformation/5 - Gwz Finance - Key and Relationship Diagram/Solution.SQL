# pk of sales
SELECT 
  orders_id
  ,products_id
  ,COUNT(*) AS nb
FROM `inductive-seat-389220.Course14.gwz_sales`
GROUP BY
  orders_id
  ,products_id
HAVING nb>=2
ORDER BY nb DESC

# pk of products
SELECT 
  products_id
  ,COUNT(*) AS nb
FROM `inductive-seat-389220.Course14.gwz_product`
GROUP BY
  products_id
HAVING nb>=2
ORDER BY nb DESC

# pk of ship
SELECT 
  orders_id
  ,COUNT(*) AS nb
FROM `inductive-seat-389220.Course14.gwz_ship`
GROUP BY
  orders_id
HAVING nb>=2
ORDER BY nb DESC

## ER
-- Sales
-- Primary key : orders_id + products_id
-- Join key : orders_id for gwz_ship and product_id for gwz_product
-- Relationship :
-- One (and only one) with gwz_product - product_id is unique in gwz_product
-- One (and only one) with gwz_ship - orders_id is unique in gwz_ship

-- Product
-- Primary key : products_id
-- Join key : product_id for gwz_sales
-- Relationship :
-- Zero or many with gwz_sales - product_id can appear 0 or many times in gwz_sales

-- Ship
-- Primary key : orders_id
-- Join key : orders_id for gwz_sales
-- Relationship :
-- One or many with gwz_sales - orders_id can appear at least 1 or many times in gwz_sales
