```markdown
# Let’s do your first queries with an example very similar to the one in the morning class.

We will work on the ‘customers’ table from Greenweez 🪴

## 1 - Import Data to BigQuery

We want to import the following table to BigQuery from a Google Sheets document.

1- Make a copy of the Google Sheets document that you name “YOUR NAME - Challenge 1 SQL”
2- Could the column ‘name‘ serve as a primary key for this table? What about the column ‘surname‘? If not, identify the most relevant primary key for the table.

### Solution 🔓
The column ‘name’ does not contain unique values. For example, there are 2 instances of ‘Paul‘. The column ‘surname’ also does not contain unique values as there are 2 instances of ‘Martin‘. The primary key for SQL tables is the unique identifier of a row. Therefore, the most relevant column to serve as the primary key for this table is ‘id’.

3- Open the BigQuery console and create a dataset called course14 located in ❗eu (multiple regions in European Union)
- ⚠️Make sure that you create the dataset in the BigQuery project that you created yourself and not in the Le Wagon BigQuery project (data-analytics-bootcamp)
- Follow the Google documentation about How to create a dataset
4- In your new course14 dataset, click on + Create table

5- Select the following parameters:
  - Create table from Drive
  - Paste the URL of your Google Sheets document
  - File format = Google Sheet
  - Destination table name = gwz_customers
  - Schema: Auto-detect
  - Advanced options -> Header rows to skip = 1

Congratulations, you imported your first table into BigQuery! 🎉

## 2 - Standard SQL Queries

Now let’s practice writing some standard SQL queries.

6- Select the columns id, name and surname from your table and run the query. How many rows are returned?
7- Using SELECT DISTINCT clause, select the name column. How many rows are returned? Do the same with columns surname and id. Based on the number of rows returned in each of the cases, can you conclude if any of these columns could serve as a primary key for this table?

8- Select rows where number_of_orders is equal to 3. How many rows are returned?
9- Select rows where number_of_orders is equal or greater than 3 OR creation_date is after ‘2022-09-01’. How many rows are returned?
10- Select rows where number_of_orders is equal or greater than 3 AND creation_date is after ‘2022-01-01’. How many rows are returned?
11- Select rows where surname ends with “s”. How many rows are returned?
12- Using IN statement, select rows where name is in the following list - ("Paul","George"). How many rows are returned?
13- name is not a very clear column title. Rename the name column as firstname using the AS statement

💁🏽 _Note_ - Renaming a column with the AS statement does not change its name in the original table. The column name will be altered only in the returned results field.

14- Select all columns in the table and order the rows by decreasing total_turnover.
15- Return a new column is_customers with value 1 if the number_of_orders is greater than zero and value 0 otherwise by using the IF statement.
16- Return the columns id, name, surname and nb_of_orders, in addition to your new is_customers column and order by ascending id.
17- Return a new segment column which contains the values ‘New’ if the nb_of_orders is equal to 0, ‘Occasional’ if the nb_of_orders is 1 or 2 and ‘Frequent’ if the number of orders is greater or equal to 3. Use CASE WHEN clause. In addition, return the id, name,surname, nb_of_orders and your new is_customers column and order by ascending id.
18- Return a new average_basket column to show the average basket value for each of the customers. To achieve this, divide the total_turnover by the number_of_orders. Try using the / operator. If you encounter an error, use SAFE_DIVIDE instead.
In addition, return the id, name,surname, nb_of_orders, total_turnover and your new is_customers column and order by ascending id.
19- In the previous query, add a WHERE clause to return rows where customers have a NULL average_basket. How many rows are returned?
- Now use the WHERE clause to exclude customers with a NULL avg_basket. How many rows are returned?

💁🏽 _Note_ - The average_basketcolumn doesn’t exist in the gwz_customerstable. Therefore BigQuery does not recognize it in the WHERE clause. You need to repeat the SAFE_DIVIDEfunction in the WHEREclause.

You finished your first SQL challenge! 🎉
```
