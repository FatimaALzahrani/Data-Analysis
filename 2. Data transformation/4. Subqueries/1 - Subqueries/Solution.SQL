# step 1
 SELECT  date_date,orders_id,
  ROUND(SUM(turnover),2) AS turnover,
  ROUND(SUM(turnover-purchase_cost),2) AS margin
  FROM `inductive-seat-389220.course17.gwz_sales_17`
  GROUP BY date_date,orders_id

# step 2
WITH subquery AS (
  SELECT  date_date,orders_id,
  ROUND(SUM(turnover),2) AS turnover,
  ROUND(SUM(turnover-purchase_cost),2) AS margin
  FROM `inductive-seat-389220.course17.gwz_sales_17`
  GROUP BY date_date,orders_id
)

SELECT o.date_date,
    o.orders_id,
    o.turnover,
    o.margin,
    s.shipping_fee,
    (s.log_cost + s.ship_cost) AS operational_cost
 FROM subquery as o
INNER JOIN `inductive-seat-389220.course17.gwz_ship_17` as s
USING(orders_id)

-- OR also
SELECT
o.date_date,
    o.orders_id,
    o.turnover,
    o.margin,
    s.shipping_fee,
    (s.log_cost + s.ship_cost) AS operational_cost
 FROM `inductive-seat-389220.course17.gwz_orders` as o
LEFT JOIN `inductive-seat-389220.course17.gwz_ship_17` as s
ON o.orders_id=s.orders_id

# 1. 
WITH orders_agg AS (
  SELECT
    date_date,
    orders_id,
    ROUND(SUM(turnover),2) AS turnover,
    ROUND(SUM(turnover-purchase_cost),2) AS margin
  FROM `inductive-seat-389220.course17.gwz_sales_17`
  GROUP BY date_date, orders_id
),
gwz_orders_join AS (
  SELECT
    o.date_date,
    o.orders_id,
    o.turnover,
    o.margin,
    s.shipping_fee,
    (s.log_cost + s.ship_cost) AS operational_cost
  FROM orders_agg o
  INNER JOIN `inductive-seat-389220.course17.gwz_ship_17` s ON o.orders_id = s.orders_id
)
SELECT * FROM gwz_orders_join;

## B - Orders and Ads Join
# 2.
WITH orders_date AS (
  SELECT
    date_date,
    ROUND(SUM(turnover), 2) AS turnover,
    ROUND(SUM(margin), 2) AS margin,
    SUM(shipping_fee) AS shipping_fee,
    SUM(operational_cost) AS operational_cost,
  FROM `inductive-seat-389220.course17.gwz_orders_join`
  GROUP BY date_date
),
campaign_date AS (
  SELECT
    date_date,
    ROUND(SUM(ads_cost), 2) AS ads_cost
  FROM `inductive-seat-389220.course17.gwz_campaign_17`
  GROUP BY date_date
),
gwz_campaign_join AS (
  SELECT
    o.date_date,
    o.turnover,
    o.margin,
    o.shipping_fee,
    o.operational_cost,
    c.ads_cost
  FROM orders_date o
  JOIN campaign_date c ON o.date_date = c.date_date
)
SELECT *
FROM gwz_campaign_join
ORDER BY date_date DESC

# 3.
WITH margin_metrics AS (
  SELECT
    orders_id,
    products_id,
    turnover,
    ROUND((turnover - purchase_cost), 2) AS margin,
    ROUND(((turnover - purchase_cost) / turnover) * 100, 2) AS margin_percent,
    CASE 
      WHEN ((turnover - purchase_cost) / turnover) * 100 < 5 THEN 'low'
      WHEN ((turnover - purchase_cost) / turnover) * 100 > 40 THEN 'high'
      ELSE 'medium'
    END AS margin_level
  FROM `inductive-seat-389220.course17.gwz_sales_17`
)
SELECT *
FROM margin_metrics
-- WHERE products_id = 79888 AND orders_id = 901691

# 4. 
WITH promo_metrics AS (
  SELECT
    orders_id,
    products_id,
    turnover,
    promo_name,
    ROUND((turnover_before_promo-turnover ), 2) AS promo,
    ROUND(((turnover_before_promo-turnover) / turnover) * 100, 2) AS promo_percent,
    CASE
      WHEN LOWER(promo_name) LIKE '%dlc%' OR LOWER(promo_name) LIKE '%dluo%' THEN 'short-lived'
      WHEN((((turnover_before_promo - turnover) / turnover) * 100)>=30) THEN 'High promo'
      WHEN((((turnover_before_promo - turnover) / turnover) * 100)<10) THEN 'Low promo'
      ELSE 'Medium promo'
    END AS promo_type
  FROM `inductive-seat-389220.course17.gwz_sales_17`
)
SELECT *
FROM promo_metrics
-- WHERE orders_id=932315 AND products_id=86805
-- WHERE orders_id=899051 AND products_id=83351

# 3 - Using Subqueries instead of Join
SELECT
  ### Key ###
  s.orders_id,
  s.products_id,
  ###########
  -- sales table
  s.category_1,
  s.turnover,
  s.qty,
  -- ship table
  t.transporter,
  t.log_cost,
  t.ship_cost
FROM `course17.gwz_sales_17` s
INNER JOIN `course17.gwz_ship_17` t USING (orders_id);