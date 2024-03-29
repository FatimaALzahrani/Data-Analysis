<div class="tab-content w-100">
<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<h2 id="introduction">Introduction</h2>

<h3 id="circle-presentation">Circle Presentation</h3>

<p>🇫🇷&nbsp;Circle is a French brand of eco-responsible and ethical sportswear.</p>

<p>🤸🏽&nbsp;They produce high performance and comfortable clothing for running, yoga and training.</p>

<p>♻️&nbsp;They focus on circularity by selling clothing made from recycled materials that is collected and processed 100% in Europe.</p>

<p>💵&nbsp;They sell their products either to B2C customers through their website or to B2B customers through their sales team.</p>

<p>🔎&nbsp;It is essential to properly monitor stocks to avoid shortages, prioritise production and avoid selling out-of-stock products to B2B customers.</p>

<h3 id="purchase-team">Purchase Team</h3>

<p>🎯&nbsp;The objectives of the purchasing team are to:</p>

<ul>
<li>
<p>control stockouts</p>
</li>
<li>
<p>anticipate future sales</p>
</li>
<li>
<p>place the right orders to the production team that supplies the garments</p>
</li>
</ul>

<p>In particular, they would like to have an overview of the current stock situation for each product including its out-of-stock rate, the delivery forecast and the estimated number of days of stock left.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/02-Aggregation_Functions/01-Data-Request-Circle-Inventory-Management-asset-1-Untitled.png" alt=""></p>

<p>Let’s focus on inventory management.</p>

<p>The goal is to monitor stock to avoid stockouts and to order the right products at the right time.</p>

<p>It is important to anticipate future sales in order to estimate the right level of stocking.</p>

<h3 id="objective">Objective</h3>

<p>🥅&nbsp;The objective of this exercise is to query Circle’s stock data in SQL to perform relevant analyses. In this exercise, you will be able to:</p>

<ul>
<li>
<p>improve your SQL skills</p>
</li>
<li>
<p>use BigQuery</p>
</li>
<li>
<p>better understand inventory management requirements</p>
</li>
</ul>

<p><strong>The different steps of the exercise are:</strong></p>

<p><strong>1 - Data exploration and cleaning</strong></p>

<p>Understanding the structure of the tables, defining the primary keys and cleaning the data.</p>

<p><strong>2 - Data enrichment</strong></p>

<p>Adding new columns: descriptive dimensions/categories and KPI/metrics.</p>

<h2 id="data-import">Data Import</h2>

<ul>
<li>
<p>Copy the <a href="https://docs.google.com/spreadsheets/d/19cDDybWRQrWkGpGJfL6Yp63zkHXEtQRn_SNXySUm6sI/edit#gid=0" target="_blank">15 - circle_sales</a> Google Sheet on your Drive</p>
</li>
<li>
<p>Open the BigQuery console and create a dataset called <strong>course15</strong> located in ❗<code>eu (multiple regions in European Union)</code></p>
</li>
<li>
<p>Create the circle_stock table on your BigQuery project from <code>15 - circle_sales</code> &gt; <a href="https://docs.google.com/spreadsheets/d/19cDDybWRQrWkGpGJfL6Yp63zkHXEtQRn_SNXySUm6sI/edit#gid=0" target="_blank">stock sheet</a></p>
</li>
<li>
<p>Create the circle_sales table on your BigQuery project from <code>15 - circle_sales</code> &gt; <a href="https://docs.google.com/spreadsheets/d/19cDDybWRQrWkGpGJfL6Yp63zkHXEtQRn_SNXySUm6sI/edit#gid=1009765988" target="_blank">sales sheet</a></p>
</li>
</ul>

<p>💁🏽&nbsp;<u>_Help_</u> - <a href="https://cloud.google.com/bigquery/docs/external-data-drive#creating_and_querying_a_permanent_external_table" target="_blank">Google documentation</a> to create a table from Google Sheet. In advanced options, don’t forget to add 1 to the <em><strong>Header rows to skip</strong></em> option.</p>

<details>
<summary>📚 Data dictionary</summary>

<p><strong>Stock</strong>
In the stock table there is one row per product with all the associated information about its the stock.
A product is determined by the combination of:</p>
<ul>
<li><u>**model_id** </u>- the unique identifier of the model</li>
<li><u>**color** </u>- the acronym of the color of the product</li>
<li><u>**size** </u>- the size of the product (XS, S, M, L, XL, or XXL)
You have additional information about the product such as:</li>
<li><u>**model_name** </u>- the name of the model corresponding to the model_id</li>
<li><u>**color_name** </u>- the name of the color corresponding to the color acronym</li>
<li><u>**new** </u>- if the product has been recently added to the catalog. It might have been recently added to the catalog without having been stocked yet.</li>
<li><u>**price** </u>- the price of the product in €
Finally, you have information about the stock:</li>
<li><u>**stock** </u>- the quantity of products available in the warehouse</li>
<li><u>**forecast_stock** </u>- the quantity of products available in the warehouse + the quantity already ordered by the production team which will be delivered to the warehouse soon</li>
</ul>

<p><strong>Sales</strong>
In the sales table, each row corresponds to a day that a given product was sold. In other words, the sales table contains information about product sales aggregated by date</p>
<ul>
<li><u>**date_date** </u>- the date of the sales</li>
<li><u>**product_id**</u> - the unique identifier of the product. Corresponding to the concatenation of the model_id, the color and the size in stock table</li>
<li><u>**qty** </u>- the total quantity of product_id sold on that day</li>
</ul>
</details>

<h2 id="1---data-exploration-and-cleaning">1 - Data Exploration and Cleaning</h2>

<h3 id="a---primary-key-identification">A - Primary Key Identification</h3>

<p>The first step is to understand the structure of the table and identify the primary key.</p>

<ol>
<li>
<p>First, run <code>SELECT</code> queries to display the <code>circle_stock</code> and <code>circle_sales</code> tables. Explore and understand the structure of these tables. How many columns are there? How many rows? Can you understand what data each of the columns contain?</p>
</li>
<li>
<p>What is the primary key for the <code>circle_sales</code> table? Use a <code>GROUP BY</code> clause to confirm it is the primary key.</p>

<details>
<summary>Reminder - What is a primary key?</summary>

<p>A primary key is a UNIQUE identifier for a each row in a table. It means that the primary key column (or a combination of columns) should not have any duplicate values. Previously you were using the <code>SELECT DISTINCT</code> clause to search for duplicate values and <code>WHERE column is NOT NULL</code> to confirm that the column does not have any missing values. You can also achieve this by using the <code>GROUP BY</code> and <code>HAVING</code> clauses, namely, by grouping all the potential primary key values, then counting how many values there are in each of the groups, and finally filtering those groups that have 2 or more values (<code>HAVING number_of_values_in_group &gt;= 2</code>). Your goal is to have no primary key value groups that would have 2 or more occurences, because that signals duplication of values in the column.</p>
</details>
</li>
<li>
<p>Is <strong>model</strong> the primary key of the <code>circle_stock</code> table? How can you confirm this?</p>
</li>
<li>
<p>Let’s consider a specific model with duplicates, for example SH003P02-SL01-M. Select all the rows in the <code>circle_stock</code> table matching this model, order them by <code>color</code> and <code>size</code>. Can you explain why there are duplicates in this model? Can you guess what the true primary key of the table is?</p>
</li>
<li>
<p>Could the combination of <code>model</code>, <code>color</code> and <code>size</code> columns be the primary key of the <code>circle_stock</code> table? How can you confirm this?</p>

<h3 id="b---table-cleaning">B - Table Cleaning</h3>

<p>The combination of <code>model</code>, <code>color</code> and <code>size</code> columns is a primary key for the <code>circle_stock</code> table. However, it is not very practical to have three columns to identify a product and a row. Moreover, in the <code>circle_sales</code> table, products are identified by the <code>product_id</code> column which is the concatenation of the <code>model</code>, <code>color</code> and <code>size</code> with the delimiter “_”. We will therefore create a new <code>product_id</code> column in the <code>circle_stock</code> table as well.</p>
</li>
<li>
<p>Return a new <code>product_id</code> column from the <code>circle_stock</code> table by concatenating the <code>model</code>, <code>color</code> and <code>size</code> columns. Use the “AS” statement to give this new column a name- <code>product_id</code>. Your concatenated <code>product_id</code> should follow this pattern - <code>BR001P1-JL02-W_BL_S</code>. Double check the returned results before you follow with the next steps.</p>
</li>
<li>
<p>Check that <code>product_id</code> is a primary key for the <code>circle_stock</code> table. What can you tell?</p>
</li>
<li>
<p>Identify the rows where <code>product_id</code> (your newly concatenated column) <code>IS NULL</code>.</p>
</li>
<li>
<p>We want to fill NULL values in the <code>size</code> column so that there are no NULL values in our new <code>product_id</code> column. Use the <code>IFNULL</code> function and set “no-size” to be the default value for the size column. You should not have any more NULL values in <code>product_id</code>. Now, is the <code>product_id</code> column a primary key for the <code>circle_stock</code> table?</p>

<p>💁🏽&nbsp;<u>_Note_</u><em>- If you don’t know the <code>IFNULL()</code> function, Google it</em> 😉</p>

<h2 id="2---data-enrichment">2 - Data Enrichment</h2>

<p>In this part of the exercise, the objective is to transform the raw <code>circle_stock</code> table into a clean and enriched <code>circle_stock_kpi</code> table.</p>

<ul>
<li><strong>circle_stock</strong></li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/02-Aggregation_Functions/01-Data-Request-Circle-Inventory-Management-asset-2-Untitled.png" alt=""></p>

<ul>
<li><strong>circle_stock_kpi</strong></li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/02-Aggregation_Functions/01-Data-Request-Circle-Inventory-Management-asset-3-Untitled.png" alt=""></p>

<h4 id="adding-a-_product_name_-column"><strong>Adding a</strong> <u>_**product_name**_ </u><strong>column</strong></h4>

<p>We want to add the <code>product_name</code> column which is the concatenation of the <code>model_name</code>, the <code>color_name</code> and <code>size</code> in the following format: <code>model_name + " " + color_name + " - Size " + size</code> (e.g. <code>Brassière Level Up Black - Size L</code>).</p>
</li>
<li>
<p>Select all the columns from the <code>circle_stock</code> table. In addition to the <code>product_id</code> column, add the <code>product_name</code> column using the <code>CONCAT()</code> function. Don’t forget to handle <code>NULL</code> values in the <code>size</code> column again. Check your <code>product_name</code> column follows the above format before you continue with the next steps. Run the query and save the result of the query in a new <strong><code>circle_stock_name</code></strong> table.</p>

<h4 id="adding-a-_model_type_-column">Adding a <u>_**model_type**_ </u>column</h4>

<p>The purchase team wants to analyse the stock and filter it by different model types. They want to classify the models into the following <code>model_type</code>:</p>

<ul>
<li>
<p>Accessories for “Tour de cou” (neckband in 🇬🇧), “Tapis” (mat in 🇬🇧) or “Gourde” (flask in 🇬🇧)</p>
</li>
<li>
<p>T-shirt for “T-shirt”</p>
</li>
<li>
<p>Crop-top for “Brassière” (bra in 🇬🇧) and “Crop-top”</p>
</li>
<li>
<p>Legging for “Legging”</p>
</li>
<li>
<p>Short for “Short”</p>
</li>
<li>
<p>Top for “Débardeur” or “Haut” (tank top in 🇬🇧)</p>
</li>
</ul>
</li>
<li>
<p>Using <code>CASE WHEN</code> and <a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/string_functions#regexp_contains" target="_blank"><code>REGEXP_CONTAINS()</code></a>, create a new <code>model_type</code> column from the <code>circle_stock_name</code> table and store the result in a new <code>circle_stock_cat</code> table. Your new <code>circle_stock_cat</code> table should contain all the same columns as the <code>circle_stock_name</code> table + the new <code>model_type</code> column.</p>

<p>💁🏽&nbsp;<u>_Help_</u><em>- To avoid typographical problems due to capitalisation, you can also use the <code>LOWER()</code> function.</em></p>
</li>
<li>
<p>Check that each product has an associated <code>model_type</code>. If not, try to find a solution to correct this and overwrite the corrected result in <code>circle_stock_cat</code>.</p>

<p>💁🏽&nbsp;<u>_Help_</u><em>- You can use the <code>REPLACE()</code> function to remove the accent of è</em></p>

<h4 id="adding-an-_in_stock_--column-for-the-shortage-rate">Adding an <u>_**in_stock**_ </u> column for the shortage rate</h4>

<p>The purchase team wants to analyse the shortage rate and the stock value.</p>
</li>
<li>
<p>Return a column <code>in_stock</code> from <code>circle_stock_cat</code> which is 0 if the product is out of stock and 1 if the product has a positive stock.</p>

<h4 id="adding-a-_stock_value_--column">Adding a <u>_**stock_value**_ </u> column</h4>
</li>
<li>
<p>Return a column <code>stock_value</code> from <code>circle_stock_cat</code> and save the results in a new <strong><code>circle_stock_kpi</code></strong> table. Your new <code>circle_stock_kpi</code> table should include all the columns from <code>circle_stock_cat</code> + the <code>in_stock</code> and <code>stock_value</code> columns.</p>

<p>💁🏽&nbsp;<u>_Note_</u><em>-</em> You can use the <code>ROUND()</code> function to limit the number of digits and make the result easier to read. However, the result will be approximate.</p>
</li>
</ol>

<p>Well done!! 🙌🏽</p>



</div>
</div>