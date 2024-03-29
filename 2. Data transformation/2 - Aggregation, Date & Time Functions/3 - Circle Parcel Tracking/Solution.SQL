# 1 - Data Exploration
## 1.
-- parcel_product : 199 row and 3 columns
SELECT *
FROM `inductive-seat-389220.course15.cc_parcel_product` 
-- parcel : 49 row and 8 columns
SELECT *
FROM `inductive-seat-389220.course15.cc_parcel` 

## 2.
-- parcel_id
SELECT 
  parcel_id
 ,count(*) AS count
FROM `inductive-seat-389220.course15.cc_parcel` 
GROUP BY
  parcel_id
HAVING count>1
ORDER BY count DESC

##3. 
-- parcel_product : parcel_id + model_name
SELECT 
  parcel_id
  ,model_name
 ,count(*) AS count
FROM `inductive-seat-389220.course15.cc_parcel_product` 
GROUP BY
  parcel_id
  ,model_name
HAVING count>1
ORDER BY count DESC

# 2 - Data Enrichment
## 4.
CREATE TABLE inductive-seat-389220.course15.cc_parcel_kpi AS(
  SELECT *,
  CASE
    WHEN date_cancelled IS NOT NULL THEN 'Cancelled'
    WHEN date_shipping IS NULL THEN 'In Progress'
    WHEN date_delivery IS NULL THEN 'In Transit'
    WHEN date_delivery IS NOT NULL THEN 'Delivered'
  END AS status
FROM `inductive-seat-389220.course15.cc_parcel` 
)

## 5.
CREATE OR REPLACE TABLE inductive-seat-389220.course15.cc_parcel_kpi AS(
SELECT
  parcel_id
  ,parcel_tracking
  ,transporter
  ,priority
  ,PARSE_DATE("%B %e, %Y", date_purchase ) AS date_purchase
  ,PARSE_DATE("%B %e, %Y", date_shipping) AS date_shipping
  ,PARSE_DATE("%B %e, %Y", date_delivery) AS date_delivery
  ,PARSE_DATE("%B %e, %Y", date_cancelled ) AS date_cancelled
  ,status
FROM `inductive-seat-389220.course15.cc_parcel_kpi`
)

## 6.
CREATE OR REPLACE TABLE inductive-seat-389220.course15.cc_parcel_kpi AS(
SELECT
  parcel_id
  ,parcel_tracking
  ,transporter
  ,priority
  ,PARSE_DATE("%B %e, %Y", date_purchase) AS date_purchase
  ,PARSE_DATE("%B %e, %Y", date_shipping) AS date_shipping
  ,PARSE_DATE("%B %e, %Y", date_delivery) AS date_delivery
  ,PARSE_DATE("%B %e, %Y", date_cancelled) AS date_cancelled
  ,CASE
    WHEN date_cancelled IS NOT NULL THEN 'Cancelled'
    WHEN date_shipping IS NULL THEN 'In Progress'
    WHEN date_delivery IS NULL THEN 'In Transit'
    WHEN date_delivery IS NOT NULL THEN 'Delivered'
  END AS status
  ,DATE_DIFF(PARSE_DATE("%B %e, %Y", date_shipping),PARSE_DATE("%B %e, %Y", date_purchase),DAY) AS expedition_time
  ,DATE_DIFF(PARSE_DATE("%B %e, %Y", date_delivery),PARSE_DATE("%B %e, %Y", date_shipping),DAY) AS transport_time
  ,DATE_DIFF(PARSE_DATE("%B %e, %Y", date_delivery),PARSE_DATE("%B %e, %Y", date_purchase),DAY) AS delivery_time
FROM `inductive-seat-389220.course15.cc_parcel`
)

# 3 - Data aggregation & analysis
## 7.
CREATE TABLE inductive-seat-389220.course15.cc_parcel_kpi_global AS(
SELECT
  COUNT(*) AS nb_parcel
  ,ROUND(AVG(expedition_time),2) AS expedition_time
  ,ROUND(AVG(transport_time),2) AS transport_time
  ,ROUND(AVG(delivery_time),2) AS delivery_time
FROM `inductive-seat-389220.course15.cc_parcel_kpi`
)

## 8.
CREATE TABLE inductive-seat-389220.course15.cc_parcel_kpi_transporter AS(
SELECT
  COUNT(*) AS nb_parcel
  ,ROUND(AVG(expedition_time),2) AS expedition_time
  ,ROUND(AVG(transport_time),2) AS transport_time
  ,ROUND(AVG(delivery_time),2) AS delivery_time
FROM `inductive-seat-389220.course15.cc_parcel_kpi`
GROUP BY transporter
)

## 9.
CREATE TABLE inductive-seat-389220.course15.cc_parcel_kpi_priority AS(
SELECT
  COUNT(*) AS nb_parcel
  ,ROUND(AVG(expedition_time),2) AS expedition_time
  ,ROUND(AVG(transport_time),2) AS transport_time
  ,ROUND(AVG(delivery_time),2) AS delivery_time
FROM `inductive-seat-389220.course15.cc_parcel_kpi`
GROUP BY priority
)

## 10.
CREATE OR REPLACE TABLE inductive-seat-389220.course15.cc_parcel_kpi_priority AS(
SELECT
  COUNT(*) AS nb_parcel
  ,ROUND(AVG(expedition_time),2) AS expedition_time
  ,ROUND(AVG(transport_time),2) AS transport_time
  ,ROUND(AVG(delivery_time),2) AS delivery_time
  ,SAFE_DIVIDE(ROUND(AVG(transport_time),2),ROUND(AVG(delivery_time),2)) AS ratio_transport_delivery
FROM `inductive-seat-389220.course15.cc_parcel_kpi`
GROUP BY priority
)

## 11. 
CREATE OR REPLACE TABLE inductive-seat-389220.course15.cc_parcel_kpi AS(
SELECT
  parcel_id
  ,EXTRACT(MONTH FROM PARSE_DATE("%B %e, %Y", date_purchase)) AS month_purchase
  ,parcel_tracking
  ,transporter
  ,priority
  ,PARSE_DATE("%B %e, %Y", date_purchase) AS date_purchase
  ,PARSE_DATE("%B %e, %Y", date_shipping) AS date_shipping
  ,PARSE_DATE("%B %e, %Y", date_delivery) AS date_delivery
  ,PARSE_DATE("%B %e, %Y", date_cancelled) AS date_cancelled
  ,CASE
    WHEN date_cancelled IS NOT NULL THEN 'Cancelled'
    WHEN date_shipping IS NULL THEN 'In Progress'
    WHEN date_delivery IS NULL THEN 'In Transit'
    WHEN date_delivery IS NOT NULL THEN 'Delivered'
  END AS status
  ,DATE_DIFF(PARSE_DATE("%B %e, %Y", date_shipping),PARSE_DATE("%B %e, %Y", date_purchase),DAY) AS expedition_time
  ,DATE_DIFF(PARSE_DATE("%B %e, %Y", date_delivery),PARSE_DATE("%B %e, %Y", date_shipping),DAY) AS transport_time
  ,DATE_DIFF(PARSE_DATE("%B %e, %Y", date_delivery),PARSE_DATE("%B %e, %Y", date_purchase),DAY) AS delivery_time
    ,IF(date_delivery IS NULL,NULL,IF(DATE_DIFF(PARSE_DATE("%B %e, %Y", date_delivery),PARSE_DATE("%B %e, %Y", date_purchase),DAY)>5,1,0))    AS delay
FROM `inductive-seat-389220.course15.cc_parcel`
)

## 12.
CREATE OR REPLACE TABLE inductive-seat-389220.course15.cc_parcel_kpi_month AS(
SELECT
  COUNT(*) AS nb_parcel
  ,ROUND(AVG(expedition_time),2) AS expedition_time
  ,ROUND(AVG(transport_time),2) AS transport_time
  ,ROUND(AVG(delivery_time),2) AS delivery_time
FROM `inductive-seat-389220.course15.cc_parcel_kpi`
GROUP BY month_purchase
)

## 13.
CREATE TABLE inductive-seat-389220.course15.cc_parcel_kpi_global AS(
SELECT
  COUNT(*) AS nb_parcel
  ,ROUND(AVG(expedition_time),2) AS expedition_time
  ,ROUND(AVG(transport_time),2) AS transport_time
  ,ROUND(AVG(delivery_time),2) AS delivery_time
  ,ROUND(AVG(delay),2) AS delay_rate
FROM `inductive-seat-389220.course15.cc_parcel_kpi`
)
