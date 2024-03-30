<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<hr>

<p><a href="https://lookerstudio.google.com/reporting/708cfa54-2f61-4d26-9505-f309c9790a59" target="_blank">Solution</a></p>

<hr>

<p>When using a BI tool, it is essential to understand the concept of metrics, dimensions and aggregation.</p>

<p>The objective of this exercise is to become familiar with all these concepts.</p>

<h2 id="circle-return">Circle Return</h2>

<p>In this section, we will work with Circle’s data about <em><strong>return</strong></em>.</p>

<h3 id="introduction-about-circle-and-their-return-data">Introduction about Circle and their Return Data</h3>

<p>Circle is producing ethical clothes 👚 for its customers.</p>

<p>Quality and customer satisfaction is key. 🔑</p>

<p>Therefore, it is essential to track the reasons for returns in order to analyse quality or product issues and correct them as soon as possible.</p>

<p>The production team would love to have:</p>

<ul>
<li>
<p>a global vision of the <strong>percentage of returns</strong> per model and per reason</p>
</li>
<li>
<p>a product file in which they can have an <strong>global overview of a specific product</strong> in one look</p>
</li>
</ul>

<ol>
<li>
<p>Here is the <a href="https://docs.google.com/spreadsheets/d/1T7Y83kKYWrvYZ7ZOsbx-WBdDge89AQpp62BuTms1_qE/edit#gid=1244166382" target="_blank">circle_return</a> table that we will use as a data source. Open it to familiarise yourself with the table and understand the different columns.</p>

<details>
<summary>Documentation</summary>

<p><em>In the table return, we have one line per product returned :</em></p>
<ul>
<li><em><strong>date_return</strong></em> <em>- the date of the return</em></li>
<li><em><strong>model name</strong></em> <em>- the model_name corresponding the returned product</em></li>
<li><em><strong>model type</strong></em> <em>- the model_type corresponding the returned product - either a crop top, a short, a t-shirt, a legging, ..</em></li>
<li><em><strong>size</strong></em> <em>- the size of the returned product</em></li>
<li><em><strong>reason -</strong></em> <em>the reason of the return</em></li>
<li><em><strong>return_qty</strong></em> <em>- the quantity returned</em></li>
<li><em><strong>return_value</strong></em> <em>- the associated value with the returned quantity</em></li>
<li><em><strong>total_sales_qty</strong></em> <em>- the total sales made on the same model_name during the total period - useful to calculate return_ratio</em></li>
</ul>

</details>

<h2 id="metric--dimension">Metric &amp; Dimension</h2>

<h3 id="dimension">Dimension</h3>

<p>A <strong>dimension</strong> describes - it is often a textual value / a date or an identifier.<br>
It is used to categorise, to do analyses by group or by segment.</p>

<p><u>_Example_</u> - <em>customer_segment, product_segment, business_unit, category, date_date, subscription_type, products_id, deal_stage, …</em></p>

<p>Open the <a href="https://lookerstudio.google.com/u/0/reporting/7804508f-9303-4ace-8ea3-8446eff1e028/page/p_yabbvhb4zc/edit" target="_blank">Metrics &amp; Dimension</a> Looker studio report</p>

<p>In this exercise, all instructions will be found and executed directly on the Looker studio dashboard.</p>
</li>
<li>
<p>Identify the dimensions of the <strong>circle_return</strong> table.</p>

<h3 id="metric">Metric</h3>

<p>A metric measures - it is a value that can be calculated: sum, average, percentage…<br>
It is therefore often a figure, a number or an amount.<br>
<u>_Example_</u> <em>- turnover, qty, session_nb, conversion_rate, stock_qty, delivery_time, …</em></p>
</li>
<li>
<p>Identify the metrics of the <strong>circle_return</strong> table.</p>

<h2 id="aggregation">Aggregation</h2>

<h3 id="definition">Definition</h3>

<p><strong>Business definition</strong> - Determine <strong>values/KPIs</strong> by <strong>aggregating them</strong> by <strong>category/segment.</strong><br>
<strong>Technical definition</strong> - Quantify <strong>metrics</strong> by <strong>aggregating them</strong> <strong>by dimension</strong>.</p>

<p><u>_Example_</u></p>

<ul>
<li>
<p><strong>Business need</strong> - Determine the <strong>total</strong> <strong>quantity returned</strong> <strong>per day</strong></p>
</li>
<li>
<p><strong>Technical solution</strong> - Calculate the <strong>sum</strong> of <strong>return_qty</strong> by <strong>date_return</strong></p>
</li>
</ul>

<p><strong>Dimension</strong> is date_return and <strong>Metric</strong> is return_qty</p>

<p><u>_Note_</u> <em>- It is like a pivot table in</em> <a href="https://docs.google.com/spreadsheets/d/1T7Y83kKYWrvYZ7ZOsbx-WBdDge89AQpp62BuTms1_qE/edit#gid=1244166382" target="_blank">Google Sheet</a><em>or a group by on date_return in SQL</em></p>

<p><br></p>

<p><strong>Questions 3 to 6</strong> - Open Looker studio. For each business need (and the associated table), determine the <strong>dimension</strong> and <strong>metrics</strong>.</p>

<p><br></p>

<h3 id="aggregation-functions">Aggregation Functions</h3>

<p>You can have different aggregation types:</p>

<ul>
<li>SUM, AVG, MIN, MAX, COUNT, COUNT_DISTINCT</li>
</ul>

<p><u>_Example :_ </u></p>

<ul>
<li>
<p><strong>Business need</strong>- Determine the <strong>total</strong> of<strong>qty returned</strong> per <strong>day</strong></p>
</li>
<li>
<p><strong>Technical solution</strong> - Calculate the <strong>sum</strong> of <strong>return_qty</strong> by <strong>date_return</strong></p>
</li>
</ul>

<p><strong>Dimension</strong> is date_return, <strong>Metric</strong> is return_qty and <strong>Aggregation</strong> function is SUM.</p>

<p><br></p>

<p><strong>Questions 7 to 12</strong> - Open Looker studio. For each business need (and the associated table), determine the <strong>dimension</strong> and the <strong>metrics</strong>.</p>

<p><br></p>

<p>🎉 Congratulations, you have identified your first dimensions, metrics and aggregations on Looker Studio. 🎉</p>

<p>Copy the dashboard, go into edit mode and click on each chart to ensure that you have correctly identified the <strong>dimension</strong>, <strong>metric</strong> and <strong>aggregation function</strong>.</p>

<p><u>_Note_</u> <em>-</em> To avoid (or correct) Looker Studio errors such as <strong>“Failed To Get Data “</strong> when copying the dashboard, you can perform the following process when selecting data sources.</p>

<details>
<summary>Screenshot</summary>

<p><strong>1. Select the data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/02-Metrics-Dimension-asset-1-Untitled.jpeg" alt=""></p>

<p><strong>2. Click on Create a data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/02-Metrics-Dimension-asset-2-Untitled.jpeg" alt=""></p>

<p><strong>3. Select Bigquery</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/02-Metrics-Dimension-asset-3-Untitled.png" alt=""></p>

<p><strong>4. Select the relevant table</strong>
Select the project <strong>data-analyst-bootcamp</strong>, select the dataset <strong>course21</strong>, select the <strong>relevant table</strong> depending on the dashboard and click on <strong>connect</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/02-Metrics-Dimension-asset-4-Untitled.png" alt=""></p>

<p><strong>5. Click on **add to report</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/02-Metrics-Dimension-asset-5-Untitled.png" alt=""></p>

<p><strong>6. Copy the report</strong>
Once your data sources are ok, <strong>copy the report</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/02-Metrics-Dimension-asset-6-Untitled.png" alt=""></p>

</details>

<h2 id="greenweez-sales">Greenweez Sales</h2>

<p>Go to the second page of Looker Studio entitled “<strong>Table Creation”</strong>.</p>

<p>In this section, we will work with Greenweez sales data.</p>

<p><u>Note</u> - If you need more context on Greenweez sales data, check out the exercise (and solution) <a href="https://kitt.lewagon.com/camps/1080/challenges?path=02-Data-Sourcing%2F01-GS-Finance%2F03-Performance-Greenweez" target="_blank">Performance Greenweez</a> completed in week 1 of the bootcamp using Google Sheets.</p>

<p>Identify and understand the different columns in the table.</p>

<details>
<summary>Documentation</summary>

<p><em>In this table, you have one row for each product composing an order :</em></p>
<ul>
<li><em>date_date: the date of the sales</em></li>
<li><em>orders_id: the id of the transaction made on the website</em></li>
<li><em>products_id: the id of the product bought. One product_id per transaction</em></li>
<li><em>customers_id: the id of the client who made the transaction</em></li>
<li><em>sgt: the segment of the customers at the moment of the transaction</em></li>
<li><em>country: the country where the purchase was made</em></li>
<li><em>departement: the department where the purchase was made</em></li>
<li><em>transporter: the transporter associated with the order</em></li>
<li><em>code: the name of the discount code if the client used one</em></li>
<li><em>category 1/2: different category level to classify the product from the top level 1 and the secondary level 2</em></li>
<li><em>promo_name: the name of the promo if the product was bought in promo</em></li>
<li><em>pdt_name: the name of the product</em></li>
<li><em>qty: the quantity of product bought</em></li>
<li><em>turnover: the turnover associated with the product - price of the product * qty</em></li>
<li><em>margin: the margin associated with the product purchase</em></li>
</ul>
</details>
</li>
</ol>

<p>13 - Determine the dimensions of the <strong>gwz_sales</strong> table.</p>

<p>14 - Determine the metrics of the <strong>gwz_sales</strong> table.</p>

<p>In edit mode, click on the <strong>gwz_sales</strong> table, check if you have identified the correct dimension and metric columns in the table.</p>

<h3 id="table-creation">Table Creation</h3>

<p>Now, we’ll give you the business need in a sentence and you’ll need to create the associated table. You will need to choose the right <strong>dimension</strong>, the right <strong>metric</strong> and the right <strong>aggregation function.</strong></p>

<p><br></p>

<p><strong>Questions 15 to 25</strong> - In questions<strong>15 through 25</strong>, you have only one sentence describing the business need. You must translate it into a table:</p>

<ul>
<li>
<p>Identify the dimension(s) corresponding to the business need</p>
</li>
<li>
<p>Identify the metric corresponding to the business need</p>
</li>
<li>
<p>Identify the aggregation function corresponding to the business need</p>
</li>
<li>
<p>Complete the chart with the correct dimension, metric and aggregation function.</p>
</li>
</ul>

<p>🎉 Congratulations, you have created your first tables on Looker studio.🎉</p>

<p>You have a better understanding of the notion of dimension and metric in Looker studio. For now, you have only worked with charts. In the next exercise, you will start using different charts.</p>


</div>
</div>