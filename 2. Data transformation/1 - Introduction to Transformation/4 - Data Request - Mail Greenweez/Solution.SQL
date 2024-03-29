# 1. 136 rows and 6 columns
SELECT *
FROM `inductive-seat-389220.course14.gwz_mail` 

# 2. journey_id is pk
SELECT DISTINCT journey_id
FROM `inductive-seat-389220.course14.gwz_mail` 
-- give me 136 unique rows mean all unique Also by check if any null
SELECT journey_id
FROM `inductive-seat-389220.course14.gwz_mail` 
WHERE journey_id is NULL

# 3.
SELECT journey_id, journey_name, sent_nb
FROM `inductive-seat-389220.course14.gwz_mail` 
ORDER BY sent_nb DESC

# 4. 
SELECT DISTINCT journey_name
FROM `inductive-seat-389220.course14.gwz_mail` 

# 5.
SELECT journey_id, journey_name, sent_nb, opening_nb
FROM `inductive-seat-389220.course14.gwz_mail` 
WHERE opening_nb>= 10000
ORDER BY opening_nb DESC

# 6. 
SELECT journey_id, journey_name, sent_nb, opening_nb, click_nb
FROM `inductive-seat-389220.course14.gwz_mail` 
ORDER BY click_nb DESC
LIMIT 10

# 7.
SELECT journey_id, journey_name, sent_nb, opening_nb, click_nb
FROM `inductive-seat-389220.course14.gwz_mail` 
WHERE journey_name LIKE '210707_nl_happyhour%'

# 8.
SELECT journey_id, journey_name, sent_nb, opening_nb, click_nb
FROM `inductive-seat-389220.course14.gwz_mail` 
WHERE journey_name LIKE '%_nlbe_%'
ORDER BY sent_nb DESC

# 9.
SELECT *
FROM `inductive-seat-389220.course14.gwz_mail` 
WHERE  journey_name LIKE "%nl%" AND journey_name NOT LIKE "%nlbe%"
ORDER BY sent_nb DESC

# 10.
SELECT 
  *
  ,ROUND(opening_nb/sent_nb*100,1) AS opening_rate
  ,ROUND(click_nb/sent_nb*100,2) AS click_rate
  ,ROUND(click_nb/opening_nb*100,1) AS CTR
  ,ROUND(turnover/sent_nb*1000,1) AS turnover_per_mille
FROM `inductive-seat-389220.course14.gwz_mail` 
WHERE journey_name LIKE "%nl%" AND journey_name NOT LIKE "%nlbe%"
ORDER BY sent_nb DESC

# 11.
SELECT 
  *
  ,ROUND(opening_nb/sent_nb*100,1) AS opening_rate
  ,ROUND(click_nb/sent_nb*100,2) AS click_rate
  ,ROUND(click_nb/opening_nb*100,1) AS CTR
  ,ROUND(turnover/sent_nb*1000,1) AS turnover_per_mille
FROM `inductive-seat-389220.course14.gwz_mail` 
WHERE journey_name LIKE "%nl%" AND journey_name NOT LIKE "%nlbe%" AND journey_name LIKE "%happyhour%"
ORDER BY sent_nb DESC


# 12.
SELECT 
    CAST(CONCAT(CONCAT("20",SUBSTR(journey_name ,0,2)),"-",SUBSTR(journey_name ,3,2),"-",SUBSTR(journey_name ,5,2)) AS DATE) AS date_date,
      *
  ,ROUND(opening_nb/sent_nb*100,1) AS opening_rate
  ,ROUND(click_nb/sent_nb*100,2) AS click_rate
  ,ROUND(click_nb/opening_nb*100,1) AS CTR
  ,ROUND(turnover/sent_nb*1000,1) AS turnover_per_mille
FROM 
    `inductive-seat-389220.course14.gwz_mail`  
WHERE 
    SUBSTR(journey_name, 1, 2) BETWEEN '00' AND '99' 
    AND SUBSTR(journey_name, 3, 2) BETWEEN '01' AND '12' 
    AND SUBSTR(journey_name, 5, 2) BETWEEN '01' AND '31'
    AND journey_name LIKE "%nl%" 
    AND journey_name NOT LIKE "%nlbe%" 
ORDER BY date_date 
