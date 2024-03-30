<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<hr>

<p><a href="https://lookerstudio.google.com/u/0/reporting/f9133221-8dfc-4de6-9f6b-98ccee48f97c" target="_blank">Solution</a></p>


<p>In this exercise, you will learn how to identify and modify the data source of a graph.</p>

<p>We will work with Greenweez sales and orders data.</p>

<p>Here are the tables <strong><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse21!3sgwz_sales" target="_blank">gwz_sales</a></strong> and <a href="http://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse21!3sgwz_orders" target="_blank">gwz_orders</a> that we will use as data sources. You can open them on Bigquery and look at the schema and preview to get familiar with the table structure and understand the different columns.</p>

<details>
<summary>Documentation</summary>

<p><u>_**gwz_sales**_</u>
You have a line for each product in an order:</p>
<ul>
<li><em>date_date: the date of the sales.</em></li>
<li><em>orders_id: the id of the transaction made on the website.</em></li>
<li><em>products_id: the id of the purchased product. Only one product id per transaction.</em></li>
<li><em>customers_id: the id of the client who performed the transaction.</em></li>
<li><em>sgt: the customer segment at the time of the transaction.</em></li>
<li><em>country: the country where the purchase was made.</em></li>
<li><em>department: the department where the purchase was made.</em></li>
<li><em>transporter: the transporter/carrier associated with the order.</em></li>
<li><em>code: the name of the discount code if the customer has used one.</em></li>
<li><em>category 1/2: different levels of categories to classify the product from top level 1 and secondary level 2.</em></li>
<li><em>promo_name: the name of the promotion if the product was purchased with a promotion.</em></li>
<li><em>pdt_name: the name of the product.</em></li>
<li><em>qty: the quantity of products purchased</em></li>
<li><em>turnover: the turnover associated with the product - price of the product * qty</em></li>
<li><em>margin: the margin associated with the purchase of the product</em>
<u>_**gwz_orders**_</u>
You have a line for each order:</li>
<li><em>date_date: the date of the sales.</em></li>
<li><em>orders_id: the id of the transaction made on the website.</em></li>
<li><em>customers_id: the id of the client who performed the transaction.</em></li>
<li><em>sgt: the customer segment at the time of the transaction.</em></li>
<li><em>country: the country where the purchase was made.</em></li>
<li><em>department: the department where the purchase was made.</em></li>
<li><em>transporter: the transporter/carrier associated with the order.</em></li>
<li><em>code: the name of the discount code if the customer has used one.</em></li>
<li><em>turnover: the turnover associated with the order.</em></li>
<li><em>margin: the margin associated with the order.</em></li>
</ul>
</details>

<p>Open the <a href="https://lookerstudio.google.com/u/0/reporting/cc171e90-1a00-4212-9a68-f84517452722/page/bAP6C" target="_blank">Chart data source</a> dashboard, make a copy and rename it with your first name.</p>

<p><u>_Note_</u> - To avoid (or correct) Looker Studio errors such as “Failed To Get Data” when copying the dashboard, you can perform the following process when selecting data sources.</p>

<details>
<summary>Screenshots</summary>

<p><strong>1. Select the data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/04-Find-And-Change-Data-Source-asset-1-Untitled.jpeg" alt=""></p>

<p><strong>2. Click on Create a data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/04-Find-And-Change-Data-Source-asset-2-Untitled.jpeg" alt=""></p>

<p><strong>3. Select Bigquery</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/04-Find-And-Change-Data-Source-asset-3-Untitled.png" alt=""></p>

<p><strong>4. Select the relevant table</strong>
Select the project <strong>data-analyst-bootcamp</strong>, select the dataset <strong>course21</strong>, then select the <strong>relevant table</strong> depending on the dashboard and click on <strong>connect</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/04-Find-And-Change-Data-Source-asset-4-Untitled.png" alt=""></p>

<p><strong>5. Click on **add to report.</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/04-Find-And-Change-Data-Source-asset-5-Untitled.png" alt=""></p>

<p><strong>6. Copy the report</strong>
Once your data sources are ok, <strong>copy the report.</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/04-Find-And-Change-Data-Source-asset-6-Untitled.png" alt=""></p>

</details>

<ol>
<li>
<p>Select the scorecards and make sure the data source is correct for each scorecard.</p>

<details>
<summary>💁🏽&nbsp;Help - How to identify the data source name</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/04-Find-And-Change-Data-Source-asset-7-Untitled.jpeg" alt=""></p>

</details>
</li>
<li>
<p>The following graphs are mixed with the <strong>gwz_sales</strong> and <strong>gwz_orders</strong> data sources. For each one, identify the data source and place it in the right place.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/04-Find-And-Change-Data-Source-asset-8-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>The following charts exist with <strong>gwz_sales</strong> as the data source. Copy them and change the data source to <strong>gwz_orders</strong>. What can you say about the last 3 graphs?</p>

<details>
<summary>Solution 🔓</summary>

<p><em>For the first two charts, it is ok. However, for the three last ones, some columns of the chart exists in</em> <em><strong>gwz_sales</strong><strong>but don’t in_ _**gwz_orders**</strong>. Either it shows an error message or it arbitrarily replaces with other columns from</em> <em><strong>gwz_orders</strong>__.</em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/04-Find-And-Change-Data-Source-asset-9-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>In view mode, filter the following scorecards and timeline chart with the filters <strong>sgt</strong> and <strong>category</strong>.</p>

<p>In view mode, filter the following dashboards and timeline with the <strong>sgt</strong> and <strong>category</strong> filters.</p>

<p>Describe what is going on.</p>

<p>In edit mode, look at the filter data sources.</p>

<details>
<summary>Solution 🔓</summary>

<ul>
<li>By filtering on <strong>sgt</strong>, all charts are filtered. This is logical, as the <strong>sgt</strong> column exists in both tables.</li>
<li>When filtering on category_1, we only filter on the <strong>gwz_sales</strong> chart since the category_1 column does not exist in <strong>gwz_orders.</strong>.
The sgt filter has <strong>gwz_orders</strong> as its data source. However, it correctly filters the <strong>gwz_sales</strong> graph.
<em>The sgt filter has</em> <em><strong>gwz_orders</strong></em> <em>as a data source. This column does not exist in gwz_orders.</em></li>
</ul>
</details>
</li>
</ol>



</div>
</div>