<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<h2 id="introduction">Introduction</h2>

<h3 id="greenweez-presentation">Greenweez Presentation</h3>

<p>🪴&nbsp;Greenweeez is a leading online marketplace for organic products.</p>

<p>🏷️&nbsp;It sells organic, ecological and sustainable produce to B2C customers with the aim to faciliate responsible consumption and a healthier lifestyle.</p>

<p>⚖️&nbsp;Monitoring the financial health of the company is essential to ensure a sufficient level of profitability.</p>

<h3 id="finance-team">Finance Team</h3>

<p>Here are the main missions of the finance team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/05-Gwz-Finance-Key-And-Relationship-Diagram-asset-1-Untitled.png" alt=""></p>

<p>Here are the main KPIs for the finance team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/05-Gwz-Finance-Key-And-Relationship-Diagram-asset-2-Untitled.png" alt=""></p>

<h3 id="objective">Objective</h3>

<p>The objective is to join financial data tables to get an overview of the daily costs and revenue and track the profitability of the business over time.</p>

<p>In this exercise, you will be able to:</p>

<ul>
<li>
<p>practice joining tables</p>
</li>
<li>
<p>better understand the needs of finance team</p>
</li>
</ul>

<p>Joins in SQL allow you to combine data from two or more tables into a single connected set. The basic idea behind a join is to match rows from one table to rows from another table based on some shared columns.</p>

<p>To do this, SQL compares each row in one table with every row in another table to see if they match. If there is a match, the rows are combined into a single set, which can then be further filtered, sorted, or manipulated as needed.</p>

<p>To perform joins between tables, you have to know the primary key of each table and the foreign keys that can be used to connect them. Without identifying the keys, you won’t be able to join any tables!</p>

<h3 id="data-import">Data Import</h3>

<p>Create a new&nbsp;<em><strong>course16</strong></em>&nbsp;dataset in your BigQuery project located in ❗<code>eu (multiple regions in European Union)</code></p>

<ul>
<li>
<p>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgwz_product" target="_blank">gwz_product</a> table into the new dataset.</p>
</li>
<li>
<p>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgwz_sales" target="_blank">gwz_sales</a> table into the new dataset.</p>
</li>
<li>
<p>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgwz_ship" target="_blank">gwz_ship</a> table into the new dataset.</p>
</li>
</ul>

<p>💁🏽&nbsp;<u>_Help_</u> - <a href="https://cloud.google.com/bigquery/docs/managing-tables#copying_a_single_source_table" target="_blank">Google documentation</a> to copy a table</p>

<p>To help with the task, we’ve summarized the information about the keys:</p>

<h4 id="product">Product</h4>

<ul>
<li>
<p>Primary key - <code>products_id</code></p>
</li>
<li>
<p>Foreign_key - <code>product_id</code> for <code>gwz_sales</code></p>
</li>
</ul>

<h4 id="sales">Sales</h4>

<ul>
<li>
<p>Primary key - <code>orders_id</code>, <code>products_id</code></p>
</li>
<li>
<p>Foreign_keys - <code>orders_id</code> for <code>gwz_ship</code> and <code>product_id</code> for <code>gwz_product</code></p>
</li>
</ul>

<h4 id="ship">Ship</h4>

<ul>
<li>
<p>Primary key - <code>orders_id</code></p>
</li>
<li>
<p>Foreign_key - <code>orders_id</code> for <code>gwz_sales</code></p>
</li>
</ul>

<h2 id="1---join-queries---building-joins">1 - Join queries - Building Joins</h2>

<p>In the upcoming steps, we will ask you to join tables in order to create a financial tracker.</p>

<h3 id="sales-and-product-join">Sales and Product Join</h3>

<p>The goal is to set up a financial tracker comparing revenue to costs. To do this, we need to calculate the product margin. Product margin is the difference between the amount that the products were sold for (turnover) and their purchase cost (purchase price (of a single product) * quantity). We could try to join <code>gwz_sales</code> and <code>gwz_product</code> to calculate the purchase cost and then the margin.</p>

<ol>
<li>
<p>On what key would you join <code>gwz_sales</code> and <code>gwz_product</code> tables to calculate the purchase cost and the margin?</p>
</li>
<li>
<p>Perform a LEFT JOIN between the <code>gwz_sales</code> and the <code>gwz_product</code> tables to add the <code>purchase_price</code> column to the <code>gwz_sales</code> table. save the result in the <strong><code>gwz_sales_margin</code></strong> table.</p>
</li>
<li>
<p>Create a test on the primary key for the new <strong><code>gwz_sales_margin</code></strong> table. Save it under the name <code>gwz_sales_margin_pk</code>. A primary key should be a unique identifier, verify that this is the case.</p>
</li>
<li>
<p>Add <code>purchase_cost</code> and <code>margin</code> columns to the new <strong><code>gwz_sales_margin</code></strong> table and save the changes.<br>
To compute the <code>purchase_cost</code> you need to multiply the quantity by the purchase price.<br>
To compute the <code>margin</code> you can subtract the purchase cost from the turnover.</p>
</li>
<li>
<p>Count the number of rows in <code>gwz_sales_margin</code>. Edit the query which you wrote to create the <code>gwz_sales_margin</code> table by changing the LEFT JOIN statement to a RIGHT JOIN. How many rows are returned now? How do you interpret this difference in rows? Discuss with your buddy first! <strong>Do not save the result and do not update <code>gwz_sales_margin</code></strong>.</p>
</li>
<li>
<p>To not lose any sales data for our financial report, we would like to select all the rows from the <code>gwz_sales</code> table even if the product is no longer in the <code>gwz_product</code> catalog. What is the best JOIN to use in this case- LEFT JOIN, RIGHT JOIN or INNER JOIN? Discuss with your buddy how would these 3 join types affect the returned results in our scenario.</p>
</li>
<li>
<p>What happens if some <code>products_id</code> appear in <code>gwz_sales</code> but are not present in the <code>gwz_product</code> catalog? Would this pose a problem for calculating the margin? What can you do to detect the issue quickly?</p>
</li>
<li>
<p>Create a test for <code>gwz_sales_margin</code> that verifies that <code>purchase_price</code> is not NULL. <code>purchase_price</code> should not be NULL because otherwise we would have missing margin values. The test should return no data if it passed. Save the test as <code>gwz_sales_margin_pp_not_null</code>.</p>

<h3 id="sales-and-shipping-join">Sales and Shipping Join</h3>

<p>We want to calculate the operating margin.<br>
operating margin = product margin + the revenue from shipping (<code>shipping_fee</code>) - operating costs (<code>ship_cost</code> + <code>log_cost</code>).</p>
</li>
<li>
<p>Is it possible to join <code>gwz_sales</code> and <code>gwz_ship</code> to calculate the operating margin? On what key? What is the issue that would arise?</p>
</li>
<li>
<p>Sum up the <code>gwz_sales_margin</code> metrics (<code>qty</code>, <code>turnover</code>, <code>purchase_cost</code> and <code>margin</code>) for each <code>orders_id</code>. Also keep the <code>date_date</code> column which will be useful later. Save the result as <strong><code>gwz_orders</code></strong>.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/ns9h7lgnmzyaaz8ihjuz4cl8797m" alt=""></p>
</details>
</li>
<li>
<p>Add a primary key test for <code>gwz_orders</code>. Save it as <code>gwz_orders_pk</code></p>
</li>
<li>
<p>Perform a LEFT JOIN to add the columns from the <code>gwz_ship</code> table to the <code>gwz_orders</code> table. Save the result in the <strong><code>gwz_orders_operational</code></strong> table.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/03-Joins-Testing/03-Gwz-Finance-Join-asset-4-Untitled.png" alt=""></p>
</details>
</li>
<li>
<p>Do two tests on the <code>gwz_orders_operational</code> table:</p>

<ul>
<li>
<p>a primary key test</p>
</li>
<li>
<p>a test to check if there are no rows with a null value in the <code>shipping_fee</code>, <code>ship_cost</code> or <code>log_cost</code> columns</p>
</li>
</ul>
</li>
<li>
<p>Add the <code>operational_margin</code> column to <code>gwz_orders_operational</code> and overwrite the table with the new result.</p>

<p>💁🏽&nbsp;<em>Help - operating margin = product margin + the revenue from shipping (<code>shipping_fee</code>) - operating costs (<code>ship_cost</code> + <code>log_cost</code>)</em>.</p>

<h3 id="aggregation-for-daily-financial-monitoring">Aggregation for Daily Financial Monitoring</h3>
</li>
<li>
<p>Aggregate the financial KPIs from the <code>gwz_orders_operational_margin</code> table for each day and order the data by the most recent KPIs. Save the result into the <code>gwz_finance_day</code> table.</p>
</li>
<li>
<p>Add the following financial KPIs to the <code>gwz_finance_day</code> table and overwrite the <code>gwz_finance_day</code> table with the new results:</p>

<ul>
<li>
<p>number of transactions</p>
</li>
<li>
<p>average basket</p>
</li>
</ul>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/03-Joins-Testing/03-Gwz-Finance-Join-asset-5-Untitled.png" alt=""></p>
</details>
</li>
</ol>

<p>🎉 Congratulations, you have made your first joins and created a financial report to accurately monitor profitability over time. 🎉</p>



</div>
</div>