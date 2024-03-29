<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong><br>
___</p>

<p>In the previous exercise, you have <strong>transformed</strong> the <code>circle_stock</code> table into a clean and enhanced <code>circle_stock_kpi</code> table.</p>

<ul>
<li><strong>circle_stock</strong></li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/02-Aggregation_Functions/02-Aggregation-SQL-Pivot-Table-Circle-Inventory-Management-asset-1-Untitled.png" alt=""></p>

<ul>
<li><strong>circle_stock_kpi</strong></li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/02-Aggregation_Functions/02-Aggregation-SQL-Pivot-Table-Circle-Inventory-Management-asset-2-Untitled.png" alt=""></p>

<p>The enriched <code>circle_stock_kpi</code> table can now be used to perform an in-depth analysis of stock statistics (stock, shortage, stock_value) by <code>model_name</code>, <code>model_type</code>, <code>product_name</code>, <code>size</code>.</p>

<p>🎯&nbsp;In this exercise, you will continue to build on the data cleaning and data enrichment you did in the previous exercise.<br>
🥅&nbsp;The objective is to address the needs of the purchasing team:</p>

<ul>
<li>
<p>display <strong>stock and shortage statistics:</strong></p>

<ul>
<li>
<p>globally</p>
</li>
<li>
<p>by <code>model_type</code></p>
</li>
<li>
<p>by <code>model</code></p>
</li>
<li>
<p>by <code>product</code></p>
</li>
</ul>
</li>
<li>
<p>identify the <strong>top products</strong></p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/02-Aggregation_Functions/02-Aggregation-SQL-Pivot-Table-Circle-Inventory-Management-asset-3-Untitled.png" alt=""></p>

<ul>
<li>calculate the estimated <strong>number of days of stock</strong> remaining for the <strong>top products</strong></li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/02-Aggregation_Functions/02-Aggregation-SQL-Pivot-Table-Circle-Inventory-Management-asset-4-Untitled.png" alt=""></p>

<p>We will perform data aggregation to complete this analysis. This is the equivalent of the pivot table in Google Sheets.</p>

<h2 id="1---stock-aggregation">1 - Stock Aggregation</h2>

<ol>
<li>
<p>Run aggregation functions (<code>COUNT()</code>, <code>SUM()</code>, <code>AVG()</code>) on the <code>circle_stock_kpi</code> table to return the following values:</p>

<ul>
<li>
<p>the total number of products</p>
</li>
<li>
<p>the total number of products in stock</p>
</li>
<li>
<p>the shortage rate</p>
</li>
<li>
<p>the total stock value</p>
</li>
<li>
<p>the total stock</p>
</li>
</ul>
</li>
<li>
<p>Return the same metrics aggregated by <code>model_type</code> using the <code>GROUP BY</code> clause.</p>
</li>
<li>
<p>Return the same metrics aggregated by <code>model_type</code> and <code>model_name</code>. Sort the results by <code>total_stock_value</code> calculated previously in <strong>descending</strong> order.</p>

<h2 id="2---sales-aggregation">2 - Sales Aggregation</h2>

<p>The purchasing team would like to identify the top 10 products sold&nbsp;in order to monitor stock shortages for these products.</p>

<p>They would also like to know the average sales volumes last month for each product in order to estimate the remaining inventory by product in terms of days.</p>

<p>This could help better estimate future sales and reduce out-of-stocks.</p>

<h3 id="determine-top-products">Determine top products</h3>
</li>
<li>
<p>Using the <code>circle_sales</code> table, list the 10 products that were the most sold in terms of quantity. Save the result in a new <code>top_products</code> table.</p>

<h3 id="adding-top-products-column-to-the-circle_stock_kpi-table">Adding ‘top products’ column to the <code>circle_stock_kpi</code> table</h3>
</li>
<li>
<p>Add a new column <code>top_products</code> to the <code>circle_stock_kpi</code> table that contains the value <code>0</code> in each row. Save the results of the query in a new <strong><code>circle_stock_kpi_top</code></strong> table.</p>
</li>
<li>
<p>Update the <code>top_products</code> column of the <code>circle_stock_kpi_top</code> table by setting it to 1 if the product can be found in the <code>top_products</code> table.</p>

<details>
<summary>Please use the following query to perform the update (you will be introduced to the detailed <code>UPDATE</code> concept in the Advanced SQL lecture next week)</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">UPDATE</span> <span class="n">table_to_update</span>
<span class="k">SET</span> <span class="n">column_to_update</span> <span class="o">=</span> <span class="n">value</span>
<span class="k">FROM</span> <span class="n">table_to_compare_with</span>
<span class="k">WHERE</span> <span class="n">condition</span>
</code></pre></div>      </div>
</details>

<details>
<summary>Help- You can either:</summary>

<ul>
<li>Make an <a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/dml-syntax#update_statement" target="_blank">update request using FROM</a> between <code>circle_stock_kpi_top</code> and <code>top_products</code></li>
<li>Use a <a href="https://www.geeksforgeeks.org/sql-subquery/" target="_blank">subquery in the WHERE clause</a> of the update. It will filter out all the <code>products_id </code>from <code>circle_stock_kpi_top</code> which are in the <code>top_products</code> table.</li>
</ul>
</details>

<details>
<summary>Solution 🔓</summary>

<p><em>Solution 1 with FROM update</em></p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">UPDATE</span> <span class="nv">`course15.circle_stock_kpi_top`</span> <span class="n">s</span>
<span class="k">SET</span> <span class="n">s</span><span class="p">.</span><span class="n">top_products</span> <span class="o">=</span> <span class="mi">1</span>
<span class="k">FROM</span> <span class="nv">`course15.top_products`</span> <span class="n">p</span>
<span class="k">WHERE</span>
<span class="n">s</span><span class="p">.</span><span class="n">product_id</span> <span class="o">=</span> <span class="n">p</span><span class="p">.</span><span class="n">product_id</span>
</code></pre></div>      </div>
<p><em>Solution 2 with subquery in the WHERE clause</em></p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">UPDATE</span> <span class="nv">`project-name.course15.circle_stock_kpi_top`</span> <span class="n">s</span>
<span class="k">SET</span> <span class="n">s</span><span class="p">.</span><span class="n">top_products</span> <span class="o">=</span> <span class="mi">1</span>
<span class="k">WHERE</span> <span class="n">s</span><span class="p">.</span><span class="n">product_id</span> <span class="k">IN</span> <span class="p">(</span><span class="k">SELECT</span> <span class="n">product_id</span> <span class="k">FROM</span> <span class="nv">`project-name.course15.top_products`</span> <span class="n">p</span><span class="p">)</span>
</code></pre></div>      </div>
</details>

<h3 id="estimating-daily-product-sales-and-days-of-stock-remaining">Estimating daily product sales and days of stock remaining</h3>
</li>
<li>
<p>Assume it is October 1, 2021. From the <code>circle_sales</code> table, calculate the total quantity sold for each product over the last 91 days and name the new column <strong>qty_91</strong>. You can select the time range of 91 days by using the <code>DATE_SUB</code> function. Calculate another column <strong>avg_daily_qty_91</strong> that contains the average daily sales over the last 91 days for each of the products. Store the result in a new table <strong><code>circle_sales_daily</code></strong>.</p>
</li>
<li>
<p>The purchasing team is particularly interested in top products with low stock, i.e., less than 50, to know if they need to reorder these products. Would you prefer to use <code>stock</code> or <code>forecast_stock</code> to assess low inventory?</p>

<p>Identify these products from the <code>circle_stock_kpi_top</code> table and manually note their <code>products_id</code>.</p>
</li>
<li>
<p>For the 3 identified products, compare the <strong>avg_daily_qty_91</strong> from the <code>circle_sales_daily</code> table with the <strong>forecast_stock</strong> from the <code>circle_stock_kpi_top</code> table. For all these products, calculate the estimated <code>nb_days</code> of stock remaining.</p>

<p><u>_Help_</u><em>- To easily compare 2 queries on BigQuery, you can split one of them on the right pane of the screen and leave the other on the left pane -</em> <em><a href="https://cloud.google.com/bigquery/docs/bigquery-web-ui#working_with_tabs" target="_blank">split tabs documentation</a></em></p>
</li>
</ol>

<p>Keep going! 🧠</p>


</div>
</div>