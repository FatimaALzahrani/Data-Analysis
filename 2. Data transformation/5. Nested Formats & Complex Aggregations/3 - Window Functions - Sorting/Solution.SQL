# 1.
SELECT * ,ROW_NUMBER() OVER(PARTITION BY customers_id ORDER BY date_date) AS rn
FROM `inductive-seat-389220.course17.gwz_orders_17`

# 2.
SELECT * , RANK() OVER(PARTITION BY customers_id ORDER BY date_date) AS rk
FROM `inductive-seat-389220.course17.gwz_orders_17`

# 3.
SELECT * ,
ROW_NUMBER() OVER(PARTITION BY customers_id ORDER BY date_date) AS rn,
 RANK() OVER(PARTITION BY customers_id ORDER BY date_date) AS rk
FROM `inductive-seat-389220.course17.gwz_orders_17`
WHERE customers_id IN (212497, 205343, 33690);

# 4.
CREATE TABLE inductive-seat-389220.course17.gwz_orders_17_rn AS (
WITH order_rn AS (
  SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY customers_id ORDER BY date_date) AS rn
    FROM `inductive-seat-389220.course17.gwz_orders_17`
    ORDER BY customers_id
),
order_is_new AS (
  SELECT
    *,
    CASE WHEN rn = 1 THEN 1 ELSE 0 END AS is_new
    FROM order_rn
)
SELECT date_date,customers_id,orders_id, rn, is_new
FROM order_is_new)

# 5. 
SELECT
  *,
  ROW_NUMBER() OVER(PARTITION BY customers_id ORDER BY date_date, orders_id) AS rn,
FROM `inductive-seat-389220.course17.gwz_sales_17`

# 6.
SELECT
  *,
  RANK() OVER(PARTITION BY customers_id ORDER BY date_date, orders_id) AS rk,
FROM `inductive-seat-389220.course17.gwz_sales_17`

# 7.
SELECT
  *,
  DENSE_RANK() OVER(PARTITION BY customers_id ORDER BY date_date, orders_id) AS ds_rk
FROM `inductive-seat-389220.course17.gwz_sales_17`

# 8.
SELECT
  date_date,customers_id,orders_id,
  ROW_NUMBER() OVER(PARTITION BY customers_id ORDER BY date_date, orders_id) AS rn,
  RANK() OVER(PARTITION BY customers_id ORDER BY date_date, orders_id) AS rk,
  DENSE_RANK() OVER(PARTITION BY customers_id ORDER BY date_date, orders_id) AS ds_rk
FROM `inductive-seat-389220.course17.gwz_sales_17`
WHERE customers_id IN (98869, 217071, 268263);

# 9.
CREATE TABLE course17.gwz_sales_17_ds_rk AS(
WITH sales_ds_rk AS (
  SELECT date_date,customers_id,orders_id,products_id,
    DENSE_RANK() OVER(PARTITION BY customers_id ORDER BY date_date, orders_id) AS ds_rk
FROM `inductive-seat-389220.course17.gwz_sales_17`
ORDER BY customers_id
),
sales_is_new AS (
  SELECT
    *,
    CASE WHEN ds_rk = 1 THEN 1 ELSE 0 END AS is_new
  FROM sales_ds_rk
)

SELECT *
FROM sales_is_new
)


