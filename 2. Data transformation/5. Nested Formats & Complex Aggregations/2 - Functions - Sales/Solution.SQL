# 1.
SELECT
   *,
   ROUND((1 - (purchase_cost / turnover)) * 100, 1) AS margin_percent,
FROM `inductive-seat-389220.course17.gwz_sales_17` 

# 2.
CREATE FUNCTION course17.margin_percent(purchase_cost FLOAT64, turnover FLOAT64) AS (
   ROUND((1 - (purchase_cost / turnover)) * 100, 1)
)

# 3. 
SELECT
   date_date,
   orders_id,
   products_id,
   promo_name,
   turnover_before_promo,
   turnover,
   purchase_cost,
   course17.margin_percent(purchase_cost , turnover) AS margin_percent
FROM `inductive-seat-389220.course17.gwz_sales_17` 

# 4.
SELECT
   *,
   ROUND(((turnover_before_promo - turnover) / (turnover_before_promo))*100,0) AS promo_percent,
FROM `inductive-seat-389220.course17.gwz_sales_17` 

# 5.
CREATE FUNCTION course17.promo_percent(turnover_before_promo FLOAT64, turnover FLOAT64) AS (
   ROUND(((turnover_before_promo - turnover) / (turnover_before_promo))*100,0)
)

# 6. 
SELECT
   date_date,
   orders_id,
   products_id,
   promo_name,
   turnover_before_promo,
   turnover,
   purchase_cost,
   course17.margin_percent(purchase_cost , turnover) AS margin_percent,
   course17.promo_percent(turnover_before_promo , turnover) AS promo_percent
FROM `inductive-seat-389220.course17.gwz_sales_17` 
