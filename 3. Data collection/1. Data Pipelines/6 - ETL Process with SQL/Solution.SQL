# 2.1
SELECT *
FROM `inductive-seat-389220.course12.gwz_product` AS p
LEFT JOIN `inductive-seat-389220.course12.gwz_sales` AS s
ON p.products_id = s.products_id

# 2.2
SELECT p.products_id,
  date_date,
  turnover,
  purchase_price,
  qty, 
  purchase_price*qty AS products_costs
FROM `inductive-seat-389220.course12.gwz_product` AS p
LEFT JOIN `inductive-seat-389220.course12.gwz_sales` AS s
ON p.products_id = s.products_id

# 2.3
SELECT 
  date_date,
  ROUND(SUM(turnover),2) AS total_turnover,
  ROUND(SUM(purchase_price*qty),2)  AS total_products_costs,
  ROUND(SUM(qty),2) AS number_of_products
FROM `inductive-seat-389220.course12.gwz_product` AS p
LEFT JOIN `inductive-seat-389220.course12.gwz_sales` AS s
ON p.products_id = s.products_id
WHERE date_date IS NOT NULL
GROUP BY date_date
ORDER BY date_date ASC

# 2.4
CREATE OR REPLACE TABLE `inductive-seat-389220.course12.finance_day`AS (
  SELECT 
  date_date,
  ROUND(SUM(turnover),2) AS total_turnover,
  ROUND(SUM(purchase_price*qty),2)  AS total_products_costs,
  ROUND(SUM(qty),2) AS number_of_products
FROM `inductive-seat-389220.course12.gwz_product` AS p
LEFT JOIN `inductive-seat-389220.course12.gwz_sales` AS s
ON p.products_id = s.products_id
WHERE date_date IS NOT NULL
GROUP BY date_date
ORDER BY date_date ASC
)

# 2.5
-- DONE scheduler
