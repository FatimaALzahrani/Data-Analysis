<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<h3 id="data-import">Data Import</h3>

<p>Create a new&nbsp;<em><strong>course17</strong></em>&nbsp;dataset in your BigQuery project located in ❗<code>eu (multiple regions in European Union)</code></p>

<ul>
<li>
<p>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_sales_17" target="_blank">gwz_sales_17</a> table into the new dataset.</p>
</li>
<li>
<p>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_ship_17" target="_blank">gwz_ship_17</a> table into the new dataset.</p>
</li>
<li>
<p>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_campaign_17" target="_blank">gwz_campaign_17</a> table into the new dataset.</p>
</li>
<li>
<p>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_nps_17" target="_blank">gwz_nps_17</a> table into the new dataset.</p>
</li>
</ul>

<p>💁🏽&nbsp;<u>_Help_</u> - <a href="https://cloud.google.com/bigquery/docs/managing-tables#copying_a_single_source_table" target="_blank">Google documentation</a> to copy a table</p>

<h2 id="1---using-subqueries-instead-of-saving-intermediate-aggregations-into-tables">1 - Using Subqueries instead of Saving Intermediate Aggregations into Tables</h2>

<p>💡&nbsp;Previously, whenever we wanted to perform a simple data transformation step, we saved the results of this transformation into an intermediate table. This meant that your datasets quickly became overpopulated with intermediate tables which take up space and make it more complicated to navigate through the dataset structure. By using subqueries, we can avoid this issue. Subqueries allow you to insert an intermediate transformation step directly into another query without the need to create intermediate tables.</p>

<h2 id="greenweez-finance-monitoring">🌱&nbsp;Greenweez Finance Monitoring</h2>

<h3 id="a---sales-and-shipping-join">A - Sales and Shipping Join</h3>

<p>Yesterday, you joined the sales and shipping tables in order to create a financial monitoring report. We will perform the same joining procedure today with the new tables. As a reminder, we performed the following steps which you should replicate now:</p>

<ul>
<li><strong>STEP 1:</strong> Aggregate <code>gwz_sales_17</code> on the <code>orders_id</code> and <code>date_date</code> columns and save the results into the <strong><code>gwz_orders</code></strong> table.</li>
</ul>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/pfs6r9m3dxqpu0cj5mkp254ow0b0" alt=""></p>

</details>

<ul>
<li><strong>STEP 2:</strong> Join <code>gwz_orders</code> and <code>gwz_ship_17</code>  on <code>orders_id</code> and save the results in the <strong><code>gwz_orders_operational</code></strong> table.</li>
</ul>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/01-Subqueries-asset-2-Untitled.png" alt=""></p>
</details>

<ol>
<li>
<p>Instead of running <strong>two separate queries</strong> and creating the intermediate <code>gwz_orders</code> table, use a <code>WITH AS</code> clause to perform this operation in one query. Save the results in the <strong><code>gwz_orders_join</code></strong> table.</p>

<p>To do so, remember that your SQL query will consist of 2 parts. The first part will use the <code>WITH AS</code> clause and create a temporary set with an alias name. In the second part, you will reference this temporary set by its alias name when joining it with another table.</p>

<h3 id="b---orders-and-ads-join">B - Orders and Ads Join</h3>

<p>Next, we would like to join the <code>gwz_orders_join</code> and <code>gwz_campaign_17</code> tables to include ads cost into our financial report. We needed three steps to perform this operation:</p>

<ul>
<li>
<p><strong>STEP 1:</strong> Aggregate <code>gwz_orders_join</code> on <code>date_date</code> and save this in the <strong><code>gwz_campaign_orders</code></strong> intermediate table.</p>
</li>
<li>
<p><strong>STEP 2:</strong> Aggregate <code>gwz_campaign_17</code> on <code>date_date</code> and save it in the <strong><code>gwz_campaign_date</code></strong> intermediate table.</p>
</li>
<li>
<p><strong>STEP 3:</strong> Join the <code>gwz_campaign_orders</code> and <code>gwz_campaign_date</code> tables on <code>date_date</code> to gather all order and ads statistics.</p>
</li>
</ul>
</li>
<li>
<p>Instead of running <strong>three separate queries</strong> and creating the intermediate <code>gwz_campaign_orders</code> and <code>gwz_campaign_date</code> tables, use a <code>WITH AS</code> clause to perform this operation in one query. Save the results in the <strong><code>gwz_campaign_join</code></strong> table.</p>

<ul>
<li>
<p>aggregate <code>gwz_orders_join</code> on <code>date_date</code> in a subquery using the <code>WITH AS</code> clause and give it an alias <code>orders_date</code></p>
</li>
<li>
<p>aggregate <code>gwz_campaign_17</code> on <code>date_date</code> using a second <code>WITH AS</code> clause and give it an alias <code>campaign_date</code></p>
</li>
<li>
<p>join&nbsp;<code>orders_date&nbsp;</code>and <code>campaign_date</code> on <code>date_date</code> to aggregate all order and ad statistics for each day</p>
</li>
</ul>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/01-Subqueries-asset-3-Untitled.png" alt=""></p>
</details>

<h2 id="2---using-subqueries-instead-of-saving-simple-intermediate-transformations-into-tables">2 - Using Subqueries instead of Saving Simple Intermediate Transformations into Tables</h2>

<p>💡&nbsp;Often when we perfomed simple successive transformations, we stored the results of each of the transformations in a single table. If the transformations are not too complex, it is better to use subqueries instead.</p>

<h3 id="a---margin-calculation">A - Margin Calculation</h3>

<p>📑&nbsp;We want to calculate sales margin metrics from the <code>gwz_sales_17</code> table. We are interested in calculating 3 metrics: <code>margin</code>, <code>margin_percent</code> and <code>margin_level</code>.</p>

<p><code>margin_level</code> identifies the products with low or high margin, i.e. less than 5% or more than 40%. The metrics need to be calculated successively. Instead of using successive tables, we will use subqueries.</p>
</li>
<li>
<p>Calculate the 3 metrics <code>margin</code>, <code>margin_percent</code> and <code>margin_level</code> from the <code>gwz_sales_17</code> table. Instead of creating intermediate tables, use the <code>WITH AS</code> clause to perform this operation in one query.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/01-Subqueries-asset-4-Untitled.png" alt=""></p>
</details>

<h3 id="b---categorisation-of-promotions">B - Categorisation of Promotions</h3>

<p>From the <strong>gwz_sales_17</strong> table, we want to calculate <code>promo_percent</code> and sort the results by the <code>promo_type</code> column. This can be achieved in 3 steps:</p>

<ul>
<li>
<p>Calculate the <code>promo_value</code> based on <code>turnover_before_promo</code> and <code>turnover</code> in the first step.</p>
</li>
<li>
<p>Calculate the <code>promo_percent</code> based on the <code>promo_value</code> and the <code>turnover</code> in the second step.</p>
</li>
<li>
<p>In the third step, add a <code>promo_type</code> column based on the values in <code>promo_percent</code>.</p>
</li>
</ul>

<p>To define the <code>promo_type</code> column, please use the following information:</p>

<ul>
<li>
<p>If <code>promo_name</code> contains “DLC” (”Date Limite de Consommation” in 🇫🇷 or “Best Before Date” in 🇬🇧) or “DLUO” in lower or upper case, then “short-lived”.</p>
</li>
<li>
<p>If <code>promo_percent</code> <strong>≥30%</strong> and NOT “short-lived”, then “High promo”. 🔴</p>
</li>
<li>
<p>If <code>promo_percent</code> <strong>&lt;10%</strong> then “Low promo”. 🟢</p>
</li>
<li>
<p>If <code>promo_percent</code> <strong>≥10% AND &lt;30%</strong> then “Medium promo”. 🟠</p>
</li>
</ul>
</li>
<li>
<p>Instead of using 3 intermediate tables, use <code>WITH AS</code> clause to perform this operation in one query.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/01-Subqueries-asset-5-Untitled.png" alt=""></p>
</details>
</li>
</ol>

<h2 id="3---using-subqueries-instead-of-join">3 - Using Subqueries instead of Join</h2>

<p>💡&nbsp;It is possible to use subqueries in the WHERE condition or as columns in SELECT to combine information from several tables.</p>

<p>⚠️&nbsp;This is <strong>bad practice</strong>.</p>

<p>🧹&nbsp;It is cleaner and more efficient (in terms of speed and computational cost) to <strong>use a JOIN instead of a subquery</strong>.</p>

<p>For example, let’s assume we want to add the <code>transporter</code>, <code>log_cost</code> and <code>ship_cost</code> columns from the <code>gwz_ship_17</code> table to our <code>gwz_sales_17</code> table. It would be possible to achieve this by using subqueries as shown here:</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code>   <span class="k">SELECT</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="n">orders_id</span><span class="p">,</span>
<span class="n">products_id</span><span class="p">,</span>
<span class="o">###########</span>
<span class="c1">-- sales table --</span>
<span class="n">category_1</span><span class="p">,</span>
<span class="n">turnover</span><span class="p">,</span>
<span class="n">qty</span><span class="p">,</span>
<span class="c1">-- ship table --</span>
<span class="p">(</span><span class="k">SELECT</span> <span class="n">transporter</span> <span class="k">FROM</span> <span class="nv">`course17.gwz_ship_17`</span> <span class="n">t</span> <span class="k">WHERE</span> <span class="n">t</span><span class="p">.</span><span class="n">orders_id</span> <span class="o">=</span> <span class="n">s</span><span class="p">.</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">transporter</span><span class="p">,</span>
<span class="p">(</span><span class="k">SELECT</span> <span class="n">log_cost</span> <span class="k">FROM</span> <span class="nv">`course17.gwz_ship_17`</span> <span class="n">t</span> <span class="k">WHERE</span> <span class="n">t</span><span class="p">.</span><span class="n">orders_id</span> <span class="o">=</span> <span class="n">s</span><span class="p">.</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">log_cost</span><span class="p">,</span>
<span class="p">(</span><span class="k">SELECT</span> <span class="n">ship_cost</span> <span class="k">FROM</span> <span class="nv">`course17.gwz_ship_17`</span> <span class="n">t</span> <span class="k">WHERE</span> <span class="n">t</span><span class="p">.</span><span class="n">orders_id</span> <span class="o">=</span> <span class="n">s</span><span class="p">.</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">ship_cost</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span> <span class="n">s</span>
</code></pre></div></div>
<p>However, in the example below we can see how using JOIN allows us to build a better structured, cleaner and a more efficient query than using subqueries:</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code>   <span class="k">SELECT</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="n">s</span><span class="p">.</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">s</span><span class="p">.</span><span class="n">products_id</span>
<span class="o">###########</span>
<span class="c1">-- sales table</span>
<span class="p">,</span><span class="n">s</span><span class="p">.</span><span class="n">category_1</span>
<span class="p">,</span><span class="n">s</span><span class="p">.</span><span class="n">turnover</span>
<span class="p">,</span><span class="n">s</span><span class="p">.</span><span class="n">qty</span>
<span class="c1">-- ship table</span>
<span class="p">,</span><span class="n">t</span><span class="p">.</span><span class="n">transporter</span>
<span class="p">,</span><span class="n">t</span><span class="p">.</span><span class="n">log_cost</span>
<span class="p">,</span><span class="n">t</span><span class="p">.</span><span class="n">ship_cost</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span> <span class="n">s</span>
<span class="k">INNER</span> <span class="k">JOIN</span> <span class="nv">`course17.gwz_ship_17`</span> <span class="n">t</span> <span class="k">USING</span> <span class="p">(</span><span class="n">orders_id</span><span class="p">)</span>
</code></pre></div></div>

<h2 id="️in-conclusion">❗️In Conclusion</h2>

<p>When combining columns from multiple tables, using JOIN is in general preferable to subqueries due to its performance and maintainability advantages. In other words, “KISS” your queries.</p>

<p><u>_**Note**_</u> - KISS in the programming slang stands for <strong>“</strong><em><strong>Keep it simple, stupid!</strong></em><strong>”</strong></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/01-Subqueries-asset-6-Untitled.png" alt=""></p>

<p>Ready to continue? 🧠</p>


</div>
</div>