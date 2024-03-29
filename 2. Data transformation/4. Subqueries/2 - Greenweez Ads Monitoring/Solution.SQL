## 1 - Table Exploration
# 1. How many columns are there? How many rows? Can you understand what data each of the columns contain?
# gz_adwords table : 7 rows and 3711 columns
# gz_bing table : 7 rows and 244 columns
# gz_criteo table : 7 rows and 578 columns
# gz_facebook table : 7 rows and 1074 columns
# gz_orders table : 5 rows and 109569 columns
# gz_sessions table : 6 rows and 1855125 columns

# 2. create a primary key test only for the gz_orders and gz_sessions tables.
SELECT orders_id,COUNT(*) AS nb
FROM `inductive-seat-389220.Day4_Week2_Ch2.gz_orders` 
GROUP BY orders_id
HAVING COUNT(*)>1

SELECT session_id,COUNT(*) AS nb
FROM `inductive-seat-389220.Day4_Week2_Ch2.gz_sessions` 
GROUP BY session_id
HAVING COUNT(*)>1

## 2 - Links and Relationships between Tables
# ERD
## * Key :
-- Primary keys: `date_date` and `campaign_key`
-- Join keys: `date_date` and `campaign_key`
## * Relationship : 
-- - Zero to many with `gz_session`: A campaign ID with a very low cost and coverage could potentially create 0 sessions, while most campaigns generate many sessions.

# Session
## * Key :
-- Primary key: `session_id`
-- Join key: `date_date` and `campaign_key` for ads table & `session_id` for `gz_orders`
## * Relationship :
-- - ads_tables - 1 with ads_table: If a session is generated on a date with a `campaign_key`, you should find a corresponding row in one of the 4 ad cost tables. 
-- - gz_orders - 0 or 1: If the session does not generate an order, the `session_id` will not be present in `orders_table`. On the contrary, if the session generates an order, there will be a single row in `orders_table` with the corresponding `session_id`.

# Orders
## * Key :
-- Primary key: `orders_id`
-- Join key: `session_id` for `gz_session`
## * Relationship :
-- One with `gz_session` if `session_id` IS NOT NULL and 0 if `session_id` IS NULL. If `session_id` is not null, it means that there is a corresponding row in `gz_session`.

## 3 - Table Transformation and Analysis - Join & Test
# 4.On what key would you join the gz_order and gz_session tables? Do you anticipate any issues with the joining procedure? 
-- ANS = in session_id 
# 5. 61826 ROWS
SELECT
  o.*,
  s.campaign_key,
  s.campaign,
  s.channel_grouping,
  s.channel
FROM
  `inductive-seat-389220.Day4_Week2_Ch2.gz_orders`  o
INNER JOIN
  `inductive-seat-389220.Day4_Week2_Ch2.gz_sessions` s
ON
  o.session_id = s.session_id;
# 6.109569 ROWS
SELECT
  o.*,
  s.campaign_key,
  s.campaign,
  s.channel_grouping,
  s.channel
FROM
  `inductive-seat-389220.Day4_Week2_Ch2.gz_orders`  o
LEFT JOIN
  `inductive-seat-389220.Day4_Week2_Ch2.gz_sessions` s
ON
  o.session_id = s.session_id;
# 7.1855125
SELECT
  o.*,
  s.campaign_key,
  s.campaign,
  s.channel_grouping,
  s.channel
FROM
  `inductive-seat-389220.Day4_Week2_Ch2.gz_orders`  o
RIGHT JOIN
  `inductive-seat-389220.Day4_Week2_Ch2.gz_sessions` s
ON
  o.session_id = s.session_id;
# 8. 1902868 ROWS
SELECT
  o.*,
  s.campaign_key,
  s.campaign,
  s.channel_grouping,
  s.channel
FROM
  `inductive-seat-389220.Day4_Week2_Ch2.gz_orders`  o
FULL OUTER JOIN
  `inductive-seat-389220.Day4_Week2_Ch2.gz_sessions` s
ON
  o.session_id = s.session_id;
# 9. INNER JOIN is better one in this case
# 10. DONE from save result as bigquery table 
# 11.
SELECT * FROM inductive-seat-389220.Day4_Week2_Ch2.gz_adwords
UNION ALL
SELECT * FROM inductive-seat-389220.Day4_Week2_Ch2.gz_bing
UNION ALL
SELECT * FROM inductive-seat-389220.Day4_Week2_Ch2.gz_criteo
UNION ALL
SELECT * FROM inductive-seat-389220.Day4_Week2_Ch2.gz_facebook;

# 12.
SELECT *
FROM inductive-seat-389220.Day4_Week2_Ch2.gz_campaign  as c
JOIN inductive-seat-389220.Day4_Week2_Ch2.gz_orders_ga as o
ON o.campaign_key = c.campaign_key

# 13.
SELECT date_date , campaign_key,COUNT(orders_id) AS nb_transactions,SUM(turnover) AS total_turnover ,SUM(news) AS total_new_custcustomers
FROM inductive-seat-389220.Day4_Week2_Ch2.gz_orders_ga
GROUP BY date_date , campaign_key

SELECT COUNT(*) , COUNT(DISTINCT date_date)
FROM inductive-seat-389220.Day4_Week2_Ch2.gz_campaign_orders

# 14. 
SELECT *
FROM inductive-seat-389220.Day4_Week2_Ch2.gz_campaign  as c
INNER JOIN inductive-seat-389220.Day4_Week2_Ch2.gz_campaign_orders as o
ON o.campaign_key = c.campaign_key

# 15. 
CREATE TABLE inductive-seat-389220.Day4_Week2_Ch2.gz_campaign_join AS
SELECT
  c.*,
  IFNULL(co.total_turnover, 0) AS turnover,
  IFNULL(co.nb_transactions, 0) AS nb_transaction
FROM
  inductive-seat-389220.Day4_Week2_Ch2.gz_campaign c
LEFT JOIN
  inductive-seat-389220.Day4_Week2_Ch2.gz_campaign_orders co
ON
  c.campaign_key = co.campaign_key;


### D - Aggregation & Analysis
-- Step 1: Aggregate metrics by paid_source
CREATE TABLE inductive-seat-389220.Day4_Week2_Ch2.gz_campaign_ps AS (
SELECT 
  paid_source ,
  date_date,
  SUM(nb_transaction) AS nb_transaction,
  SUM(turnover) AS turnover,
  SUM(cost) AS cost,
  SUM(click) AS click,
  SUM(impression) AS impression , 
FROM `inductive-seat-389220.Day4_Week2_Ch2.gz_campaign_join`
GROUP BY paid_source,date_date 
)
-- Step 2: Calculate KPIs
CREATE TABLE inductive-seat-389220.Day4_Week2_Ch2.gz_campaign_ps_kpi AS (
  SELECT
    paid_source,
    date_date,
    CASE WHEN SUM(cost) > 0 THEN SUM(turnover) / SUM(cost) ELSE 0 END AS ROAS,
    CASE WHEN SUM(nb_transaction) > 0 THEN SUM(cost) / SUM(nb_transaction) ELSE 0 END AS CAC_orders,
    CASE WHEN SUM(impression) > 0 THEN (SUM(cost) / SUM(impression)) * 1000 ELSE 0 END AS CPM,
    CASE WHEN SUM(click) > 0 THEN SUM(cost) / SUM(click) ELSE 0 END AS CPC,
    CASE WHEN SUM(impression) > 0 THEN (SUM(click) / SUM(impression)) * 100 ELSE 0 END AS CTR
  FROM `inductive-seat-389220.Day4_Week2_Ch2.gz_campaign_ps`
  GROUP BY paid_source, date_date 
);


-- Step 3: Final query
WITH gz_campaign_ps AS (
SELECT
  paid_source
  ,EXTRACT(MONTH FROM date_date) AS month
  ,SUM(nb_transaction) AS nb_transaction
  ,ROUND(SUM(turnover),0) AS turnover
  ,ROUND(SUM(cost),0) AS cost 
  ,ROUND(SUM(click),0) AS click 
  ,ROUND(SUM(impression),0) AS impression 
FROM `inductive-seat-389220.Day4_Week2_Ch2.gz_campaign_join`
GROUP BY paid_source,month
)

SELECT
  paid_source
  ,month
  ,nb_transaction
  ,turnover
  ,cost 
  ,click 
  ,impression 
  ,ROUND(SAFE_DIVIDE(turnover,cost),2) AS ROAS
  ,ROUND(SAFE_DIVIDE(cost,nb_transaction),2) AS CAC_orders
  ,ROUND(SAFE_DIVIDE(cost,impression)*1000,2) AS CPM
  ,ROUND(SAFE_DIVIDE(cost,click),2) AS CPC
  ,ROUND(SAFE_DIVIDE(click,impression)*100,2) AS CTR
FROM gz_campaign_ps
ORDER BY paid_source,month

