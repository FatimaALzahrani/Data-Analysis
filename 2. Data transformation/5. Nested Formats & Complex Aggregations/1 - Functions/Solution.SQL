# 1.
SELECT 
   * 
   ,IF(journey_name LIKE "%nlbe%",1,0) AS mail_be
FROM `inductive-seat-389220.course17.gwz_mail_17` 
# 2.
CREATE FUNCTION  course17.is_mail_be(journey_name STRING) AS (
    IF(journey_name LIKE "%nlbe%",1,0)
)

# 3.
SELECT 
   *
   , course17.is_mail_be(journey_name) AS mail_be
FROM `inductive-seat-389220.course17.gwz_mail_17`

# 4.
CREATE FUNCTION course17.mail_type(journey_name STRING) AS (
    IF (journey_name LIKE "%nl%" OR journey_name LIKE "%nlbe%", "newsletter",
        IF (journey_name LIKE "%panier_abandonne%" OR journey_name LIKE "%abandoned_basket%", "abandoned_basket",
              IF (journey_name LIKE "%back_in_stock%", "back_in_stock", "unknown")
        )
    )
)
# 5.
SELECT 
    *,
    course17.mail_type(journey_name) AS mail_type
FROM `inductive-seat-389220.course17.gwz_mail_17`

# 6.
SELECT IF (global_note >= 9, 1, IF (global_note >= 7 AND global_note <= 8, 0, -1)) AS nps
FROM `inductive-seat-389220.course17.gwz_nps_17`


# 7.
CREATE FUNCTION course17.nps(global_note INT64) AS (
    IF (global_note >= 9, 1,
        IF (global_note >= 7 AND global_note <= 8, 0, -1)
    )
);

# 8.
SELECT date_date
    ,orders_id
    ,transporter
    ,global_note
    , course17.nps(global_note) AS nps
FROM `inductive-seat-389220.course17.gwz_nps_17`

# 9.
CREATE FUNCTION course17.delivery_mode(transporter STRING ) AS (
    IF(transporter LIKE "%Pickup%","Pickup","Home")
)

# 10.
CREATE FUNCTION course17.transporter_brand(transporter STRING ) AS (
    IF(transporter LIKE "%Dpd%","Dpd","Chrono")
)

# 11.
SELECT
    date_date
    ,orders_id
    ,course17.delivery_mode(transporter) AS delivery_mode
    ,course17.transporter_brand(transporter) AS transporter_brand
    ,transporter
    ,global_note
    , course17.nps(global_note) AS nps
FROM `inductive-seat-389220.course17.gwz_nps_17`

