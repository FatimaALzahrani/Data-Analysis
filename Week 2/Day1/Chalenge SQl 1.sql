-- Q6- 5 Rows
SELECT  id, name , surname
FROM `inductive-seat-389220.Course14.gwz_customers` 

-- Q7-  SELECT DISTINCT name return 4 rows , primary key must be id becuse all rows DISTINCT and return 5, but in name and surname return 4 so mewn there are some duplicate 
SELECT DISTINCT name 
FROM `inductive-seat-389220.Course14.gwz_customers` 

SELECT DISTINCT surname 
FROM `inductive-seat-389220.Course14.gwz_customers` 

SELECT DISTINCT id 
FROM `inductive-seat-389220.Course14.gwz_customers` 

SELECT * 
FROM `inductive-seat-389220.Course14.gwz_customers` 
WHERE id IS NULL

-- Q8- returned 2 Rows
SELECT * 
FROM `inductive-seat-389220.Course14.gwz_customers` 
WHERE number_of_orders=3

-- Q9- returned 3 Rows
SELECT * 
FROM `inductive-seat-389220.Course14.gwz_customers` 
WHERE number_of_orders>=3 OR creation_date>"2022-09-01"

-- Q10- returned one Rows
SELECT * 
FROM `inductive-seat-389220.Course14.gwz_customers` 
WHERE number_of_orders>=3 AND creation_date>"2022-01-01"

-- Q11- returned tow Rows where surname Davis and Dupuis
SELECT * 
FROM `inductive-seat-389220.Course14.gwz_customers` 
WHERE surname Like "%s"

-- Q12- returned 3 Rows
SELECT * 
FROM `inductive-seat-389220.Course14.gwz_customers` 
WHERE name IN ("Paul","George")

-- Q13- name is not a very clear column title. Rename the name column as firstname using the AS statement
SELECT id, name as firstname , surname
FROM `inductive-seat-389220.Course14.gwz_customers` 

-- Q14- Select all columns in the table and order the rows by decreasing total_turnover.
SELECT *
FROM `inductive-seat-389220.Course14.gwz_customers` 
ORDER BY total_turnover DESC

-- Q15- Return a new column is_customers with value 1 if the number_of_orders is greater than zero and value 0 otherwise by using the IF statement.
SELECT * , If(number_of_orders>0 , 1 , 0) as is_customers
FROM `inductive-seat-389220.Course14.gwz_customers` 

-- Q16- Return the columns id, name, surname and nb_of_orders, in addition to your new is_customers column and order by ascending id.
SELECT id, name, surname , number_of_orders , If(number_of_orders>0 , 1 , 0) as is_customers
FROM `inductive-seat-389220.Course14.gwz_customers` 
ORDER BY id

-- Q17- Return a new segment column which contains the values ‘New’ if the nb_of_orders is equal to 0, ‘Occasional’ if the nb_of_orders is 1 or 2 and ‘Frequent’ if the number of orders is greater or equal to 3. Use CASE WHEN clause. In addition, return the id, name,surname, nb_of_orders and your new is_customers column and order by ascending id.
SELECT id,
       name,
       surname,
       number_of_orders,
       CASE 
           WHEN number_of_orders = 0 THEN 'New'
           WHEN number_of_orders BETWEEN 1 AND 2 THEN 'Occasional'
           ELSE 'Frequent'
       END AS is_customers
FROM `inductive-seat-389220.Course14.gwz_customers` 
ORDER BY id ASC

-- Q18-Return a new average_basket column to show the average basket value for each of the customers. To achieve this, divide the total_turnover by the number_of_orders. Try using the / operator. If you encounter an error, use SAFE_DIVIDE instead.
SELECT id,
       name,
       surname,
       number_of_orders,
       total_turnover,
       SAFE_DIVIDE(total_turnover, number_of_orders) AS average_basket,
       CASE 
           WHEN number_of_orders = 0 THEN 'New'
           WHEN number_of_orders BETWEEN 1 AND 2 THEN 'Occasional'
           ELSE 'Frequent'
       END AS is_customers
FROM `inductive-seat-389220.Course14.gwz_customers` 
ORDER BY id ASC

-- Q19- returned one rows where number_of_orders and total_turnover is zero
SELECT id,
       name,
       surname,
       number_of_orders,
       total_turnover,
       SAFE_DIVIDE(total_turnover, number_of_orders) AS average_basket,
       CASE 
           WHEN number_of_orders = 0 THEN 'New'
           WHEN number_of_orders BETWEEN 1 AND 2 THEN 'Occasional'
           ELSE 'Frequent'
       END AS segment
FROM `inductive-seat-389220.Course14.gwz_customers` 
WHERE SAFE_DIVIDE(total_turnover, number_of_orders) IS NULL
ORDER BY id ASC