# Quick Exercise: Data Types and CAST Function

## 1 - Data Discovery

Open the `circle_stock` table and `circle_stock_ok` table in BigQuery. Copy them to your `course14` dataset, in your own project.

- Select all the columns of `circle_stock` table with an SQL query. Try to understand the meaning of the different columns. What is the number of rows?
- Which column could serve as the primary key? How can you check that this column can serve as a primary key?

#### Hint - Primary key 🗝️
- Open the table. Look at the schema. What are the different data types of the columns? Do you think the data types are accurate?
- There was a type conversion problem during the Extract&Load phase. STRING was assigned as the default data type to all columns. We need to fix this by using the CAST function.

## 2 - Data Type Conversion

The possible data types for this table are the following:

- `INT64`, `FLOAT64`, `BOOLEAN` for numeric type
- `DATE` for date type
- `STRING` for text type

- Does `STRING` seem relevant for the `MODEL_ID` and `MODEL_TYPE` columns?
- Does `STRING` seem relevant for `STOCK` column?

Use the CAST function to change the data type of the `STOCK` column to `INT64`.

- Which data type seems more relevant for the `IN_STOCK` column? Use CAST to assign this data type to the `IN_STOCK` column.
- Which data type seems more relevant for the `DATE_CREATION` column? Use the CAST function to change the data type of the column. What error are you experiencing and how could you correct it?

- The formatting error in the `DATE_CREATION` column has been corrected in the `circle_stock_ok` table. Therefore, run your previous query on the `circle_stock_ok` table instead and try to change the data type of `DATE_CREATION` again. Does it work now?

- Which data type seems more relevant for the `STOCK_DAYS` column? Use CAST to assign this data type to the column.
- Which data type seems more relevant for the `PRICE` column? Use CAST to assign this data type. Are you experiencing an error? What could you do to avoid an error without correcting the bad value in the original table?

- Run a query to return all columns of the `circle_stock_ok` table cast into their correct data types. Save the returned result of the query in a new `circle_stock_clean` table.


🎉 Congrats, you performed your first data types conversion and cleaning in SQL 🎉
