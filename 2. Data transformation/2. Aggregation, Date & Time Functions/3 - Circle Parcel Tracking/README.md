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

<p>🚚&nbsp;Circle ships the clothes from its warehouse to its customers in parcels. It is very important for the logistics and shipping team to track these parcels:</p>

<ul>
<li>
<p>on a global level. This is done to gather transport and delay statistics in order to improve and control the shipping process.</p>
</li>
<li>
<p>on a single parcel level. This is done to anticipate problems and to answer customer service requests about specific orders.</p>
</li>
</ul>

<h3 id="logistics-and-shipping-team">Logistics and shipping Team</h3>

<p>The main tasks of the logistics and shipping team are:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/02-Aggregation_Functions/04-Circle-Parcel-Tracking-asset-1-Untitled.png" alt=""></p>

<p>👉🏽&nbsp;Let’s focus on tracking deliveries and controlling parcels.</p>

<p>🥅&nbsp;The goal is to monitor order shipments to the customer, prevent problems and identify optimisation opportunities.</p>

<p>The main KPIs of the Logistics and shipping team are:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/02-Aggregation_Functions/04-Circle-Parcel-Tracking-asset-2-Untitled.png" alt=""></p>

<h3 id="objective">Objective</h3>

<p>🎯&nbsp;The objective of this exercise is to query Circle’s parcel data in SQL to perform relevant analyses. In this exercise, you will be able to:</p>

<ul>
<li>
<p>improve your SQL skills</p>
</li>
<li>
<p>use BigQuery</p>
</li>
<li>
<p>better understand the needs of the Logistics and shipping team</p>
</li>
</ul>

<p>The different steps of the exercise are:</p>

<p><strong>1 - Data exploration →</strong> understand the structure of the tables, define the primary keys.</p>

<p><strong>2 - Data enrichment →</strong> add dimensions and KPIs needed to analyse parcel delivery</p>

<p><strong>3 - Data aggregation &amp; analysis →</strong> perform the aggregation to analyse parcel delivery</p>

<h3 id="data-import">Data Import</h3>

<ul>
<li>
<p>Copy the <a href="https://docs.google.com/spreadsheets/d/1qhHVVdi6Z8PnD62QJtbnEjyX8d35sho573XwoasrYBk/edit#gid=0" target="_blank">15 - circle_parcel</a> Google Sheet on your drive</p>
</li>
<li>
<p>In the <strong>course15</strong> dataset, create the <code>cc_parcel</code> table in your BigQuery project from <a href="https://docs.google.com/spreadsheets/d/1qhHVVdi6Z8PnD62QJtbnEjyX8d35sho573XwoasrYBk/edit#gid=0" target="_blank">parcel_sheet</a></p>
</li>
<li>
<p>In the <strong>course15</strong> dataset, create the <code>cc_parcel_product</code> table in your BigQuery project from <a href="https://docs.google.com/spreadsheets/d/1qhHVVdi6Z8PnD62QJtbnEjyX8d35sho573XwoasrYBk/edit#gid=0" target="_blank">parcel_product_sheet</a></p>
</li>
</ul>

<p>💁🏽&nbsp;<u>_Help_</u> - <a href="https://cloud.google.com/bigquery/docs/external-data-drive#creating_and_querying_a_permanent_external_table" target="_blank">Google documentation</a> to create a table from Google Sheet. In the advanced options, don’t forget to add 1 to the <em><strong>Header rows to skip option</strong></em>.</p>

<details>
<summary>📚 Data dictionary</summary>

<p><strong>Parcel</strong></p>

<p>In the <strong>parcel</strong> table, each row is a parcel with all its associated logistics and transport information:</p>

<ul>
<li><u>**parcel_id** </u>- the unique identifier of the parcel</li>
<li><u>**parcel_tracking**</u> - the tracking link given by the carrier/transporter. Certainly not valid anymore</li>
<li><u>**transporter** </u>- the name of the transporter</li>
<li><u>**priority** </u>- the priority of the parcel. <strong>High</strong> if it is an important order or an important customer. <strong>Low</strong> if the importance is very low and <strong>medium</strong> otherwise.</li>
<li><u>**date_purchase** </u>- the date of the order</li>
<li><u>**date_shipping** </u>- the date the parcel is shipped from the warehouse. It is given to the carrier/transporter.</li>
<li><u>**date_delivery** </u>- the date of parcel delivery to the customer by the transporter</li>
<li><u>**date_cancelled** </u>- parcel cancellation date. Due to problems or delays during the preparation of the parcel or, more often, during transport, the parcel may be cancelled.</li>
</ul>

<p><strong>Parcel_product</strong></p>

<p>In the <strong>parcel_product</strong> table, each row is a product (more specifically- the name of the product model) in a given parcel.</p>

<ul>
<li><u>**parcel_id**</u> - the unique identifier of the parcel. Serves as a link to the <strong>parcel</strong> table</li>
<li><u>**model_name** </u>- the name of the product model in the parcel</li>
<li><u>**qty** </u>- the quantity of the specific product model in a given parcel</li>
</ul>
</details>

<h2 id="1---data-exploration">1 - Data Exploration</h2>

<ol>
<li>
<p>Explore and understand the structure of both tables. How many columns are there? How many rows? Can you understand what data each of the columns contain?</p>
</li>
<li>
<p>What is the primary key of the <code>cc_parcel</code> table?</p>
</li>
<li>
<p>What is the primary key of <code>cc_parcel_product</code> table?</p>

<h2 id="2---data-enrichment">2 - Data Enrichment</h2>

<h3 id="parcel-status">Parcel Status</h3>

<p>The parcel may be at different stages of the delivery process:</p>

<ul>
<li>
<p>If <code>date_cancelled</code> is not null, it means that the status of the parcel is <em><strong>Cancelled</strong></em>.</p>
</li>
<li>
<p>If <code>date_shipping</code> is null (and <code>date_cancelled</code> is also null), it means that the parcel has not been shipped from the warehouse. It is in preparation in the warehouse. The status of the parcel is <em><strong>In progress</strong></em>.</p>
</li>
<li>
<p>If the <code>date_delivery</code> is null (and the <code>date_shipping</code> is not null and the <code>date_cancelled</code> is null), it means that the parcel is in transit by the carrier. It has already been shipped but not yet delivered. The status of the parcel is <em><strong>In Transit</strong></em>.</p>
</li>
<li>
<p>If the <code>date_delivery</code> is not null, it means that the parcel has already been delivered. The status of the parcel is <em><strong>Delivered</strong></em>.</p>
</li>
</ul>
</li>
<li>
<p>In the <code>cc_parcel</code> table, add a new <code>status</code> column that contains the delivery status of the parcel by using the <code>CASE WHEN</code> clause. Save the results in a new table <strong><code>cc_parcel_kpi</code></strong>.</p>

<h3 id="delivery-kpi">Delivery KPI</h3>

<p>The Logistics &amp; Shipping team wants to calculate and control:</p>

<ul>
<li>
<p><code>expedition_time</code> - time between purchase and shipping</p>
</li>
<li>
<p><code>transport_time</code> - time between purchase and delivery</p>
</li>
<li>
<p><code>delivery_time</code> - time between shipping and delivery</p>
</li>
</ul>

<details>
<summary>❓Refresher on KPI definitions for logistics</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/02-Aggregation_Functions/04-Circle-Parcel-Tracking-asset-3-Untitled.png" alt=""></p>

</details>

<h3 id="fields-creation">Fields Creation</h3>
</li>
<li>
<p>First, we need to make sure that the <code>date_purchase</code>, <code>date_shipping</code>, <code>date_delivery</code> and <code>date_cancelled</code> columns are in the correct format. Check the <code>cc_parcel_kpi</code> schema in BigQuery to confirm this. If the dates are not in date format, use the <code>PARSE_DATE()</code> function to format them. Save the data with the correctly formated columns as <strong><code>cc_parcel_kpi</code></strong>.</p>

<details>
<summary>💁🏽&nbsp;Help - How to use PARSE_DATE()?</summary>

<ul>
<li><em><a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/date_functions#parse_date" target="_blank">PARSE_DATE documentation</a></em></li>
<li><em><a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/format-elements#format_elements_date_time" target="_blank">FORMAT_STRING documentation</a>__to create the correct format string required as the first argument to PARSE_DATE()</em></li>
</ul>
</details>
</li>
<li>
<p>Add the 3 columns <code>expedition_time</code>, <code>transport_time</code> and <code>delivery_time</code> to the <code>cc_parcel_kpi</code> table and save the results as <strong><code>cc_parcel_kpi</code></strong>. Use <code>DATE_DIFF()</code>.</p>

<details>
<summary>💁🏽 Help - How to use DATE_DIFF()?</summary>

<ul>
<li><em><a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/date_functions#date_diff" target="_blank">DATE_DIFF documentation</a></em></li>
<li>To use <code>DATE_DIFF</code>, the arguments must be in date format. Use the previous question to correctly format the date in the date_diff function.</li>
</ul>
</details>

<h2 id="3---data-aggregation--analysis">3 - Data aggregation &amp; analysis</h2>

<p>The logistics team would like to obtain statistics on shipments, transportation and delivery times in order to analyse them at different levels of granularity.</p>
</li>
<li>
<p>Run some aggregation functions on the <code>cc_parcel_kpi</code> table to obtain the following global statistics:</p>

<ul>
<li>
<p>number of parcels</p>
</li>
<li>
<p>average shipping time with 2 digits after the decimal point</p>
</li>
<li>
<p>average transport time with 2 digits after the decimal point</p>
</li>
<li>
<p>average delivery time with 2 digits after the decimal point</p>
</li>
</ul>

<p>Save the result in <strong><code>cc_parcel_kpi_global</code></strong>.</p>

<p>💁🏽&nbsp;<u>_Help_</u><em>- Use <code>ROUND()</code> to limit the number of digits after decimal point</em></p>
</li>
<li>
<p>Calculate the same statistics for each carrier separately from the <code>cc_parcel_kpi</code> table. How do the different carriers compare with each other? Save the results in <strong><code>cc_parcel_kpi_transporter</code></strong> table.</p>
</li>
<li>
<p>Calculate the same statistics for each priority level separately from the <code>cc_parcel_kpi</code> table. How do the different times compare among different levels of parcel priority? Save the results in <strong><code>cc_parcel_kpi_priority</code></strong>.</p>
</li>
<li>
<p>Now, we would like to compute the ratio between the delivery time and the transport time. This way, we will know the impact of the transport time across the different levels of parcel priority. Re-use the same query as in the step above, but add a new column that uses <code>SAFE_DIVIDE</code> to compute the ratio. Save the results in <strong><code>cc_parcel_kpi_priority</code></strong>.</p>

<p>The logistics team would like to see the evolution of this global KPI over the months.</p>
</li>
<li>
<p>Add a new <code>month_purchase</code> column to the <code>cc_parcel_kpi</code> table that extracts the month from the <code>date_purchase</code> column by using the <code>EXTRACT()</code> function. Save the results as <strong><code>cc_parcel_kpi</code></strong>.</p>

<details>
<summary>💁🏽&nbsp;Help - How to use EXTRACT()?</summary>

<ul>
<li>To find the BigQuery documentation about EXTRACT —&gt; <em><strong>Google it!</strong></em></li>
<li><em>To use EXTRACT(), the function argument has to be in the date format</em></li>
</ul>
</details>
</li>
<li>
<p>By querying the <code>cc_parcel_kpi</code> table, display the evolution of the average shipping, transport and delivery times across all the months. How do the metrics change over the months? Save the results in the <strong><code>cc_parcel_kpi_month</code></strong> table.</p>

<h3 id="delay">Delay</h3>

<p>A parcel is considered late if the total <code>delivery_time</code> is longer than 5 days. The logistics team would like to analyse the <code>delay_rate</code> of parcels on a global level.</p>
</li>
<li>
<p>Perform the various transformation steps to achieve the analysis desired by the logistics team.</p>

<details>
<summary>💁🏽&nbsp;Help - step by step process</summary>

<ul>
<li><em>Edit the query you wrote to create the <code>cc_parcel_kpi</code> table. Add the code for a new <strong>delay</strong> column.</em></li>
<li><em>Use <code>DATE_DIFF()</code> function.</em></li>
<li><em>NULL value in <strong>delay</strong> column if <strong>date_delivery</strong> is NULL.</em></li>
<li><em>Add a new <strong>delay_rate</strong> column (average global delay) to the <code>cc_parcel_kpi_global</code> table.</em></li>
</ul>

</details>
</li>
</ol>

<p>You’re doing great! 💪🏽</p>


</div>
</div>