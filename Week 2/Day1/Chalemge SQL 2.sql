
-- Q3- Which column could serve as the primary key? How can you check that this column can serve as a primary key?
SELECT DISTINCT MODEL_ID
 FROM `inductive-seat-389220.course14.circle_stock`

SELECT *
 FROM `inductive-seat-389220.course14.circle_stock`
 WHERE MODEL_ID IS NULL

--  Q4- Open the table. Look at the schema. What are the different data types of the columns? Do you think the data types are accurate?
-- NO , STOCK must be INT64 , IN_STOCK must Boolean ,  DATE_CREATION must DATE , PRICE & STOCK_DAYS must Float 64
SELECT 
   CAST(STOCK as INT64) as STOCK,
   CAST(IN_STOCK as BOOLEAN) as IN_STOCK,
    CAST(STOCK_DAYS as FLOAT64) as STOCK_DAYS,
    CAST(DATE_CREATION as DATE) as DATE_CREATION,
   CASE 
      WHEN Price NOT LIKE '%[^0-9.]%' AND Price != '-----' THEN CAST(Price AS FLOAT64)
      ELSE NULL
   END AS Price
FROM `inductive-seat-389220.course14.circle_stock_ok`

-- Q5-Does STRING seem relevant for the MODEL_ID and MODEL_TYPE columns? 
-- ANS = Yes
SELECT MODEL_ID , MODEL_TYPE
FROM `inductive-seat-389220.course14.circle_stock`

-- Q6-Does STRING seem relevant for STOCK column?
-- ANS = No is int
SELECT STOCK
FROM `inductive-seat-389220.course14.circle_stock`

-- Q7-Use the CAST function to change the data type of the STOCK column to INT64.
SELECT 
   CAST(STOCK as INT64) as STOCK,
FROM `inductive-seat-389220.course14.circle_stock`

-- Q8-Which data type seems more relevant for the IN_STOCK column? Use CAST to assign this data type to the IN_STOCK column.
-- ANS = Boolean 
SELECT 
   CAST(IN_STOCK as BOOLEAN) as IN_STOCK,
FROM `inductive-seat-389220.course14.circle_stock`

-- Q9-Which data type seems more relevant for the DATE_CREATION column? Use the CAST function to change the data type of the column. What error are you experiencing and how could you correct it?
-- ANS= DATE , error = Invalid date: '2021-1014' , becuse the second row has worng date format 
SELECT 
   CASE 
      WHEN DATE_CREATION LIKE '____-__-__' THEN CAST(DATE_CREATION AS DATE)
      ELSE NULL
   END AS DATE_CREATION,
  FROM `inductive-seat-389220.course14.circle_stock`

-- Q10-The formatting error in the DATE_CREATION column has been corrected in the circle_stock_ok table. Therefore, run your previous query on the circle_stock_ok table instead and try to change the data type of DATE_CREATION again. Does it work now?
-- ANS = Yes
SELECT 
    CAST(DATE_CREATION as DATE) as DATE_CREATION,
FROM `inductive-seat-389220.course14.circle_stock_ok`

-- Q11-Which data type seems more relevant for the STOCK_DAYS column? Use CAST to assign this data type to the column.
-- FLOAT 
SELECT 
    CAST(STOCK_DAYS as FLOAT64) as STOCK_DAYS,
FROM `inductive-seat-389220.course14.circle_stock`

-- Q12-Which data type seems more relevant for the PRICE column? Use CAST to assign this data type. Are you experiencing an error? What could you do to avoid an error without correcting the bad value in the original table?
-- Float , error because one row has ---- as value and this not double , i fix error by case like following
SELECT 
   CASE 
      WHEN Price NOT LIKE '%[^0-9.]%' AND Price != '-----' THEN CAST(Price AS FLOAT64)
      ELSE NULL
   END AS Price
FROM `inductive-seat-389220.course14.circle_stock_ok`

-- Q13-Run a query to return all columns of the circle_stock_ok table cast into their correct data types. Save the returned result of the query in a new circle_stock_clean table.
CREATE TABLE `inductive-seat-389220.course14.circle_stock_clean` AS
SELECT 
   CAST(STOCK as INT64) as STOCK,
   CAST(IN_STOCK as BOOLEAN) as IN_STOCK,
   CAST(STOCK_DAYS as FLOAT64) as STOCK_DAYS,
   CAST(DATE_CREATION as DATE) as DATE_CREATION,
   CASE 
      WHEN Price NOT LIKE '%[^0-9.]%' AND Price != '-----' THEN CAST(Price AS FLOAT64)
      ELSE NULL
   END AS Price
FROM `inductive-seat-389220.course14.circle_stock_ok`;
