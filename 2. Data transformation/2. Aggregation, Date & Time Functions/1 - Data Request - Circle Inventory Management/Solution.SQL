## 1 - Data Exploration and Cleaning
#  1.How many columns are there? How many rows? Can you understand what data each of the columns contain?
-- circle_sales table has 3 columns and 20679 rows and the primary key is product_id, and mean of each column is : 
-- date_date - the date of the sales
-- product_id - the unique identifier of the product. Corresponding to the concatenation of the model_id, the color and the size in stock table
-- qty - the total quantity of product_id sold on that day
SELECT * 
FROM `inductive-seat-389220.course15.circle_sales` 

-- circle_stock table has 9 columns and 468 rows and the primary key is model_id, and mean of each column is : 
-- model_id - the unique identifier of the model
-- color - the acronym of the color of the product
-- size - the size of the product (XS, S, M, L, XL, or XXL) You have additional information about the product such as:
-- model_name - the name of the model corresponding to the model_id
-- color_name - the name of the color corresponding to the color acronym
-- new - if the product has been recently added to the catalog. It might have been recently added to the catalog without having been stocked yet.
-- price - the price of the product in € Finally, you have information about the stock:
-- stock - the quantity of products available in the warehouse
-- forecast_stock - the quantity of products available in the warehouse + the quantity already ordered by the production team which will be delivered to the warehouse soon
SELECT * 
FROM `inductive-seat-389220.course15.circle_stock` 

# 2.What is the primary key for the circle_sales table? Use a GROUP BY clause to confirm it is the primary key.
-- ANS : there is no any primary key becuse no any column all values is unique 
SELECT product_id, COUNT(product_id)
FROM `inductive-seat-389220.course15.circle_sales` 
GROUP BY product_id
HAVING COUNT(product_id) >= 2

# 3. Is model the primary key of the circle_stock table? How can you confirm this?
SELECT DISTINCT model_id
FROM `inductive-seat-389220.course15.circle_stock` 

# 4. Let’s consider a specific model with duplicates, for example SH003P02-SL01-M. Select all the rows in the circle_stock table matching this model, order them by color and size. Can you explain why there are duplicates in this model? Can you guess what the true primary key of the table is?
-- ANS : The duplicates in model `SH003P02-SL01-M` likely represent different color or size variations. The true primary key could be a combination of `model`, `color`, and `size` to uniquely identify each product unit.
SELECT *
FROM `inductive-seat-389220.course15.circle_stock` 
WHERE model_id="SH003P02-SL01-M"
ORDER BY color,size DESC

# 5.Could the combination of model, color and size columns be the primary key of the circle_stock table? How can you confirm this?
-- ANS : Yes , by this 
SELECT 
  COUNT(DISTINCT CONCAT(model_name," - ",color, " - ",size)) As unique_id,
  COUNT(model_id) As num_all_rows
FROM `inductive-seat-389220.course15.circle_stock` 

# 6.Return a new product_id column from the circle_stock table by concatenating the model, color and size columns. Use the “AS” statement to give this new column a name- product_id. Your concatenated product_id should follow this pattern - BR001P1-JL02-W_BL_S. Double check the returned results before you follow with the next steps.
SELECT 
  CONCAT(model_id, '_', color, '_', size) AS product_id , *
FROM `inductive-seat-389220.course15.circle_stock` 

# 7.Check that product_id is a primary key for the circle_stock table. What can you tell?
-- ANS : number of rows is 468 and number of unique row 462 , so no yet
SELECT 
    COUNT(DISTINCT CONCAT(model_id, '_', color, '_', size, 'no-size')) AS unique_product_ids,
    COUNT(*) AS total_rows
FROM `inductive-seat-389220.course15.circle_stock` 

# 8.Identify the rows where product_id (your newly concatenated column) IS NULL.
SELECT CONCAT(model_id, '_', color, '_', size) AS product_id
FROM `inductive-seat-389220.course15.circle_stock` 
WHERE CONCAT(model_id, '_', color, '_', size) IS NULL;

# 9.We want to fill NULL values in the size column so that there are no NULL values in our new product_id column. Use the IFNULL function and set “no-size” to be the default value for the size column. You should not have any more NULL values in product_id. Now, is the product_id column a primary key for the circle_stock table?
-- ANS = Yess ,becuse number of rows is 468 and number of unique row 468
SELECT 
    COUNT(DISTINCT CONCAT(model_id, '_', color, '_', IFNULL(size, 'no-size'))) AS unique_product_ids,
    COUNT(*) AS total_rows
FROM `inductive-seat-389220.course15.circle_stock` 

## 2 - Data Enrichment
# 10.Adding a _**product_name**_ column
CREATE TABLE inductive-seat-389220.course15.circle_stock_Name AS
SELECT *,
       CONCAT(model_name, ' ', color_name, ' - Size ', IFNULL(size, 'no-size')) AS product_name
FROM `inductive-seat-389220.course15.circle_stock` 

# 11.Adding a _**model_type**_ column
CREATE TABLE inductive-seat-389220.course15.circle_stock_Cat AS
SELECT *,
  CASE
      WHEN REGEXP_CONTAINS(LOWER(model_name), r'(tour de cou|tapis|gourde)') THEN 'Accessories'
      WHEN REGEXP_CONTAINS(LOWER(model_name) ,r'(t-shirt)') THEN 'T-shirt'
      WHEN REGEXP_CONTAINS(LOWER(model_name) ,r'(brassière|crop-top)') THEN 'Crop-top'
      WHEN REGEXP_CONTAINS(LOWER(model_name) ,r'(legging)') THEN 'Legging'
      WHEN REGEXP_CONTAINS(LOWER(model_name) ,r'(short)') THEN 'Short'
      WHEN REGEXP_CONTAINS(LOWER(model_name) ,r'(débardeur|haut)') THEN 'Top'
  END AS model_type
FROM `inductive-seat-389220.course15.circle_stock_Name` 

# 12.Check that each product has an associated model_type
SELECT *
FROM `inductive-seat-389220.course15.circle_stock_Cat` 
WHERE model_type IS NULL

SELECT 
  CASE
   WHEN REGEXP_CONTAINS(LOWER(model_name) ,r'(brassiere|crop-top)') THEN 'Crop-top'
   ELSE model_type
  END AS model_type
FROM `inductive-seat-389220.course15.circle_stock_Cat` 

# 13.Adding an _**in_stock**_ column for the shortage rate
SELECT If(stock>0,1,0) AS in_stock
FROM `inductive-seat-389220.course15.circle_stock_Cat` 

# 14.Adding a _**stock_value**_ column
CREATE TABLE inductive-seat-389220.course15.circle_stock_Kpi AS
SELECT *, If(stock>0,1,0) AS in_stock,
  ROUND(stock * price, 2) AS stock_value
FROM `inductive-seat-389220.course15.circle_stock_Cat` 