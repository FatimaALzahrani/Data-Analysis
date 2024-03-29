#1. On what key would you join gwz_sales and gwz_product tables to calculate the purchase cost and the margin?
-- products_id

#2. Perform a LEFT JOIN between the gwz_sales and the gwz_product tables
SELECT
  s.date_date
  ,s.orders_id
  ,s.products_id
  ,s.turnover
  ,s.qty
  ,p.purchase_price
FROM `inductive-seat-389220.course16.gwz_sales` AS s
LEFT JOIN `inductive-seat-389220.course16.gwz_product` AS p 
ON s.products_id=p.products_id 

#3.
SELECT 
  orders_id
  ,products_id
  ,COUNT(*) AS nb
FROM `inductive-seat-389220.course16.gwz_sales_margin`
GROUP BY
  orders_id
  ,products_id
HAVING nb>=2
ORDER BY nb DESC

#4.
SELECT
  s.date_date
  ,s.orders_id
  ,s.products_id
  ,s.qty
  ,s.turnover
  ,p.purchase_price
  ,ROUND(s.qty*p.purchase_price,2) AS purchase_cost
  ,s.turnover - ROUND(s.qty*p.purchase_price,2) AS margin
FROM `inductive-seat-389220.course16.gwz_sales` AS s
LEFT JOIN `inductive-seat-389220.course16.gwz_product` AS p 
ON s.products_id = p.products_id

#5.
SELECT
  s.date_date
  ,s.orders_id
  ,s.products_id
  ,s.qty
  ,s.turnover
  ,p.purchase_price
  ,ROUND(s.qty*p.purchase_price,2) AS purchase_cost
  ,s.turnover - ROUND(s.qty*p.purchase_price,2) AS margin
FROM `inductive-seat-389220.course16.gwz_sales` AS s
RIGHT JOIN `inductive-seat-389220.course16.gwz_product` AS p 
ON s.products_id = p.products_id

#6.
-- LEFT JOIN

#8.
 SELECT 
   orders_id
   ,products_id
   ,purchase_price
 FROM `inductive-seat-389220.course16.gwz_sales_margin`
 WHERE purchase_price IS NULL 

 #10.
 SELECT
   date_date
   ,orders_id
   ,ROUND(SUM(qty),2) AS qty
   ,ROUND(SUM(turnover),2) AS turnover
   ,ROUND(SUM(purchase_cost),2) AS purchase_cost
   ,ROUND(SUM(margin),2) AS margin
 FROM `inductive-seat-389220.course16.gwz_sales_margin`
 GROUP BY 
   date_date
   ,orders_id
 ORDER BY
   date_date
   ,orders_id

#11.
SELECT
   orders_id
   ,COUNT(*) AS nb
 FROM `inductive-seat-389220.course16.gwz_orders`
 GROUP BY
   orders_id
 HAVING nb>=2
 ORDER BY nb DESC

#12.
CREATE TABLE inductive-seat-389220.course16.gwz_orders_operational AS(
SELECT
   o.date_date
   ,o.orders_id
   ,o.qty
   ,o.turnover
   ,o.purchase_cost
   ,o.margin
   ,s.shipping_fee
   ,s.log_cost
   ,s.ship_cost
 FROM `inductive-seat-389220.course16.gwz_orders` AS o
 LEFT JOIN `inductive-seat-389220.course16.gwz_ship` AS s 
 ON o.orders_id = s.orders_id
 ORDER BY
   date_date
   ,orders_id
)

#13.
CREATE OR REPLACE TABLE inductive-seat-389220.course16.gwz_orders_operational AS(
SELECT
  date_date,
  orders_id
  ,COUNT(*) AS nb
  , SUM(qty) AS qty 
  ,ROUND(SUM(turnover),0) AS turnover 
  ,ROUND(SUM(purchase_cost),0) AS purchase_cost 
  ,ROUND(SUM(margin),0) AS margin 
  ,ROUND(SUM(shipping_fee),0) AS shipping_fee 
  ,ROUND(SUM(log_cost),0) AS log_cost 
  ,ROUND(SUM(ship_cost),0) AS ship_cost 
--  ,ROUND(SUM(operational_margin),0) AS operational_margin  
FROM `inductive-seat-389220.course16.gwz_orders_operational`
GROUP BY
  orders_id,date_date
HAVING nb>=2
ORDER BY nb DESC
)

#14.
SELECT
 o.date_date
  ,o.orders_id
  ,o.qty
  ,o.turnover
  ,o.purchase_cost
  ,o.margin
  ,s.shipping_fee
  ,s.log_cost
  ,s.ship_cost
  ,o.margin + s.shipping_fee - (s.log_cost + s.ship_cost) AS operational_margin 
FROM `inductive-seat-389220.course16.gwz_orders` o
LEFT JOIN `inductive-seat-389220.course16.gwz_ship` s ON o.orders_id = s.orders_id
ORDER BY
  date_date
  ,orders_id

#15.
CREATE TABLE inductive-seat-389220.course16.gwz_finance_day AS (
SELECT
  date_date
  ,SUM(qty) AS qty 
  ,ROUND(SUM(turnover),0) AS turnover 
  ,ROUND(SUM(purchase_cost),0) AS purchase_cost 
  ,ROUND(SUM(margin),0) AS margin 
  ,ROUND(SUM(shipping_fee),0) AS shipping_fee 
  ,ROUND(SUM(log_cost),0) AS log_cost 
  ,ROUND(SUM(ship_cost),0) AS ship_cost 
--  ,ROUND(SUM(operational_margin),0) AS operational_margin  
FROM `inductive-seat-389220.course16.gwz_orders_operational`
GROUP BY
  date_date
ORDER BY
  date_date DESC
)

#16. 
CREATE OR REPLACE TABLE inductive-seat-389220.course16.gwz_finance_day AS (
SELECT
 date_date
,COUNT(orders_id) AS nb_transaction
,SUM(qty) AS qty 
,ROUND(SUM(turnover),0) AS turnover 
,ROUND(AVG(turnover),1) AS average_basket
,ROUND(SUM(turnover)/COUNT(orders_id),1) AS average_basket_bis
,ROUND(SUM(purchase_cost),0) AS purchase_cost 
,ROUND(SUM(margin),0) AS margin 
,ROUND(SUM(shipping_fee),0) AS shipping_fee 
,ROUND(SUM(log_cost),0) AS log_cost 
,ROUND(SUM(ship_cost),0) AS ship_cost 
-- ,ROUND(SUM(operational_margin),0) AS operational_margin  
FROM `inductive-seat-389220.course16.gwz_orders_operational`
GROUP BY
date_date
ORDER BY
date_date DESC
)