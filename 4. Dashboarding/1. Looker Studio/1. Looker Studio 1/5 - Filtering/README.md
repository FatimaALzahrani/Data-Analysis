<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<hr>

<p><a href="https://lookerstudio.google.com/u/0/reporting/3847b2bd-58d7-4911-85f7-3a938e9c41cf/page/bAP6C" target="_blank">Solution</a></p>

<hr>

<p>In this exercise, you will learn more about filtering:</p>

<ul>
<li>
<p>understand how filtering works in Looker Studio</p>
</li>
<li>
<p>create your first basic filters</p>
</li>
<li>
<p>understand how to use grouping to limit the filter to specific charts</p>
</li>
<li>
<p>Understand the concept of page level and report level which is useful for filtering</p>
</li>
</ul>

<p>For this exercise, we will use the Greenweez sales dashboard. The commercial advertising team uses this dashboard a lot to track performance.</p>

<p><br></p>

<h2 id="introduction">Introduction</h2>

<h3 id="greenweez-presentation">Greenweez Presentation</h3>

<p>🌐&nbsp;Greenweeez is an organic e-commerce website.</p>

<p>🪴&nbsp;It sells to B2C customers products allowing a healthier, more reasonable and more respectful lifestyle.</p>

<p>📊&nbsp;Monitoring of sales activity is essential to achieve the objectives.</p>

<p><br></p>

<h3 id="trade-marketing-team">Trade Marketing Team</h3>

<p>Here are the main missions of the trade marketing team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-1-Untitled.png" alt=""></p>

<p>The team uses data to monitor business activity. They monitor order volume by customer segment, promotion and category to identify sales opportunities and prevent financial loss. It is also important to monitor the profitability of the commercial advertisements.</p>

<p><br></p>

<h3 id="business-needs">Business Needs</h3>

<p>The business marketing team wants to monitor sales and business activity.</p>

<p><strong>1 - Global sales</strong></p>

<p>Their first need is to have a global view of sales with:</p>

<ul>
<li>
<p>the main KPI in scorecards</p>
</li>
<li>
<p>the day-to-day evolution of the turnover and the margin in percentage</p>
</li>
</ul>

<p><strong>2 - Sales by segment</strong></p>

<p>Their second need is to have a vision of sales by segment. The objective is to detect growth opportunities or downward trends by segment. The team can then react quickly by creating relevant discount codes and commercial operations.</p>

<p><strong>3 - Sales by categories</strong></p>

<p>Their final need is to analyse sales by category and by product. The goal is to detect growth opportunities or downward trends in specific categories. The team can then react quickly by creating relevant promotions on certain categories or highlighting certain products.</p>

<p><br></p>

<h3 id="dashboard-copy">Dashboard Copy</h3>

<p>Go to the <a href="https://datastudio.google.com/u/0/reporting/1c77e745-9b64-4962-8519-6f804bd5902a/page/bAP6C" target="_blank">Filtering</a> Looker Studio dashboard. Make a copy and rename it with your first name.</p>

<p><u>_Note_</u> <em>- To prevent (or correct) Looker Studio errors such as</em> <em><strong>“Failed To Get Data”</strong></em> <em>when copying the dashboard, you can perform the following process below when selecting the data sources.</em></p>

<details>
<summary>Screenshot</summary>

<p><strong>1. Select the data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-2-Untitled.jpeg" alt=""></p>

<p><strong>2. Click on Create a data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-3-Untitled.jpeg" alt=""></p>

<p><strong>3. Select Bigquery</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-4-Untitled.png" alt=""></p>

<p><strong>4. Select the relevant table</strong>
Select the project <strong>data-analyst-bootcamp</strong>, select the dataset <strong>course21</strong>, select the <strong>relevant table</strong> depending on the dashboard and click on <strong>connect</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-5-Untitled.png" alt=""></p>

<p><strong>5. Click on add to report</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-6-Untitled.png" alt=""></p>

<p><strong>6. Copy the report</strong>
Once your data sources are ok, <strong>copy the report</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-7-Untitled.png" alt=""></p>

</details>

<p><a href="http://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse21!3sgwz_orders" target="_blank">gwz_orders</a> is the table used as data source in this exercise. You can open <a href="http://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse21!3sgwz_orders" target="_blank">gwz_orders</a> on Bigquery and look at the schema and preview if you want to understand the structure of the table better.</p>

<p><br></p>

<h2 id="sales-global">Sales Global</h2>

<h3 id="renaming-of-fields">Renaming of Fields</h3>

<ol>
<li>
<p>On the <strong>Sales Global</strong> page, in edit mode, analyse the different dashboards (except the % margin) to understand the aggregation function used and the KPI displayed.</p>

<p><u>_Note_</u><em>- The % margin is a calculated field. We will cover this topic in the third Looker Studio course.</em></p>

<p>In edit mode, by clicking to the left of a field, you can change the name of the field.</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-8-Untitled.jpeg" alt=""></p>

</details>
</li>
<li>
<p>Change the name of the 2nd and 4th dashboard to nb transaction and Avg basket. This will be easier to understand for the business team.</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-9-Untitled.jpeg" alt=""></p>

</details>

<p><br></p>

<h3 id="playing-with-filters">Playing with Filters</h3>

<p>In view mode, use the different filters on the left, to filter the page on several parameters.</p>

<details>
<summary>Note - If necessary, you can reset the filters to their default values by clicking on the reset button at the top right.</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-10-Untitled.jpeg" alt=""></p>

</details>
</li>
<li>
<p>What is the total turnover of <strong>new</strong> customers in <strong>FRANCE</strong> 🇫🇷? Use the <strong>country</strong> and <strong>sgt</strong> filters.</p>

<details>
<summary>Solution 🔓</summary>

<p><em>95.7k€</em></p>
</details>
</li>
<li>
<p>What is the total turnover related to <strong>DPD home</strong> on August 7, 2021 in <strong>FRANCE</strong> 🇫🇷? Filter by <strong>country</strong> and <strong>carrier/transporter</strong>.</p>

<details>
<summary>Solution 🔓</summary>

<p>10.0<em>k€</em></p>
</details>

<p><br></p>

<h3 id="adding-your-first-filters">Adding your First Filters</h3>

<p>The trade marketing team would like to filter on department and specific discount codes. We will create these filters.</p>
</li>
<li>
<p>In edit mode, copy and paste the filter on the country and add a filter on the department value just below.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-11-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>In edit mode, add a new filter code just below the carrier/transporter.</p>

<p>This time, do not copy and paste. Click on <code>Add a control &gt;&gt; Drop-down list button</code> to insert a  <strong>code</strong> filter.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-12-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-13-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h3 id="filter-metrics--sorting">Filter Metrics &amp; Sorting</h3>

<p>When you use the <strong>code</strong> filter, you have a metric displayed next to the code name. And the codes are sorted in a certain order.</p>

<details>
<summary>Screenshot</summary>

<p><em>In this case, avg % margin is the metric displayed and it is ordered from the highest % margin to the lowest. “Null” corresponds to orders with no discount code.</em></p>
</details>
</li>
<li>
<p>Change the metric to display the nb of transaction. And order the code name by decreasing number of transaction.</p>

<details>
<summary>Style formatting (Optional)</summary>

<p>You can eventually go to the Style tab to have the same display style of other filters
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-14-Untitled.png" alt=""></p>

</details>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-15-Untitled.png" alt=""></p>

</details>

<p>Play with the filter code and department to see how they work.</p>

<p><br></p>

<h3 id="default-filter-values">Default Filter Values</h3>

<p>The trade marketing team is in charge of the France business activity. They would like the charts to be filtered by default on France only.</p>
</li>
<li>
<p>In edit mode, choose a default selection France for the <strong>country</strong> filter.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-16-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Return to view mode. Filter on BELGIQUE and SUISSE (Belgium 🇧🇪&nbsp;and Switzerland 🇨🇭) to see the result in these countries. Now reset the filter. Make sure that the default value for the country filter is FRANCE.</p>

<p>When you use a filter, it filters the entire page. All graphics on the page are affected. However, sometimes it is useful to limit the filter to specific graphics. In the next section we will see how to do this using the <strong>group</strong> feature.</p>

<p><br></p>

<h2 id="sales-by-segment">Sales by Segment</h2>

<p>Reset the filters to their default values and go to the second page <strong>Sales by Segment</strong>.</p>

<p>In this section, we will understand the concept of grouping items. We will apply these concepts to filters. We will also learn about chart filtering.</p>

<p>The client team wants to have the statistics of the different segments with:</p>

<ul>
<li>
<p>main scorecards for each segment</p>
</li>
<li>
<p>detailed line graphs of daily sales and daily margin percentage by segment.</p>
</li>
</ul>

<p><br></p>

<h2 id="grouping">Grouping</h2>

<h3 id="definition">Definition</h3>

<p>Look at this <a href="https://www.youtube.com/watch?v=hme1D8r_Wp8" target="_blank">quick video tutorial</a> on grouping with filter.</p>

<p><br></p>

<h3 id="use-case---grouping-to-limit-filtering-to-a-specific-graph">Use Case - Grouping to Limit Filtering to a Specific Graph</h3>

<p>So far, we have only created dashboards for the segment = <strong>New</strong>.</p>

<p>To do this:</p>

<ul>
<li>
<p>we created the 4 score cards</p>
</li>
<li>
<p>we created a new <strong>segment</strong> filter just above the 4 scorecards</p>
</li>
<li>
<p>we added a default value <strong>New</strong> to this filter</p>
</li>
<li>
<p>we grouped the 4 scorecards and the filter together</p>
</li>
</ul>

<details>
<summary>💁🏽&nbsp;Help - How to group the filter with the 4 scorecards</summary>

<ul>
<li>
<p>Select the filter and your 4 scorecards</p>
</li>
<li>
<p>either by selecting the filter and the 4 scorecards with your mouse</p>
</li>
<li>or by using CTRL/CMD+click successively on each chart</li>
<li>Right click with your mouse and select the <code>group</code> button</li>
</ul>
</details>

<p><u>_Note_</u><em>- Looker studio often has display bugs when grouping with a filter. To fix this bug, follow these steps: in</em> <em><strong>view mode</strong>__, change the value of your filter, then reset the filter to its default value, finally reload the page on your browser and it should be fine.</em></p>
</li>
<li>
<p>In the view mode, change the blue <strong>New</strong> filter to <strong>Occasional</strong>. See what happens. Are all charts updated or just the grouped scorecards? Reset the filter to its default value.</p>
</li>
<li>
<p>We want to add the same scorecards for <strong>Occasional</strong> segment.</p>

<ul>
<li>
<p>In edit mode, copy and paste the grouped scorecards corresponding to the <strong>New</strong> segment</p>
</li>
<li>
<p>Right click and select ungroup</p>
</li>
<li>
<p>Change the default value of the filter to <strong>Occasional</strong></p>
</li>
<li>
<p>Group again the filter and the 4 scorecards</p>
</li>
<li>
<p>Go back in view mode and make sure it is correct</p>
</li>
</ul>

<p><u>_Note_</u><em>- Looker studio often has display bugs when grouping with a filter. To fix this bug, follow these steps: in</em> <em><strong>view mode</strong>__, change the value of your filter, then reset the filter to its default value, finally reload the page on your browser and it should be fine.</em></p>

<details>
<summary>Style formatting (Optional)</summary>

<p>You can eventually change the color from blue to red for the filter and scorecard. Working with group chart is not practical. Follow this step, if you want to perform it more simply</p>
<ul>
<li>ungroup the charts</li>
<li>change the style using style tab</li>
<li>group again the charts</li>
</ul>
</details>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-17-Untitled.png" alt=""></p>

</details>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-18-Untitled.png" alt=""></p>

<p><br></p>

<h2 id="chart-filtering">Chart Filtering</h2>

<h3 id="definition-1">Definition</h3>

<p>Look at this <a href="https://support.google.com/looker-studio/answer/7326859?hl=en" target="_blank">documentation</a> on chart filtering.</p>

<p><br></p>

<h3 id="use-chart-filtering">Use Chart Filtering</h3>

<p>We want to add the dashboard for the <strong>Frequent</strong> segment but with a different method. We will use direct chart filtering instead of filter control.</p>
</li>
<li>
<p>Do not use copy and paste. In edit mode, use the <code>Add a chart &gt;&gt; Scorecard button</code>to add a new scorecard that displays turnover. Do the same with % margin, nb transaction and Avg basket.</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-19-Untitled.png" alt=""></p>

</details>

<p>You have the total metrics that are not filtered on the <strong>Frequent</strong> segment. To do this, we will create a chart filter.</p>
</li>
<li>
<p>In edit mode, add a chart filter to turnover scorecard:</p>

<ul>
<li>
<p>click on the turnover scorecard</p>
</li>
<li>
<p>at the bottom of the SET-UP tab, click on <code>Add a filter</code> button__</p>
</li>
</ul>

<p><u>_Note_ </u><em>- if you already created a filter before, click again at the bottom on</em> <code>_Create a filter_</code><em>button</em></p>

<ul>
<li>create a new filter called <strong>frequent_filter</strong> which includes <strong>sgt</strong> equal to <strong>Frequent</strong></li>
</ul>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-20-Untitled.jpeg" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-21-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Add the chart filter, on the 3 other scorecards.</p>

<p><u>_Note_</u><em>-</em> Only select the frequent_filter you just created. Do not create a new filter.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-20-Untitled.jpeg" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-23-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/05-Filtering-asset-24-Untitled.png" alt=""></p>

</details>

<p>🎉 Congratulations, you have created your first grouping filter and your first chart filter. 🎉</p>

<p><br></p>

<h2 id="sales-by-categories">Sales by Categories</h2>

<p>Reset the filters to their default values and go to the third page <strong>Sales by Categories</strong>.</p>

<p>Gwz_sales, <u>with one row per order and product</u>, is the source table for this page. Open gwz_sales on Bigquery and look at the schema and preview if you want to understand the structure of the table better.</p>

<p>In this section, we will understand the concept of page level and report level. We will apply these concepts to filters.</p>

<p><br></p>

<h2 id="page-level-vs-report-level">Page Level vs Report Level</h2>

<h3 id="definition-2">Definition</h3>

<p>Read <a href="https://support.google.com/looker-studio/answer/9188171?hl=en" target="_blank">this documentation</a> about page and report level.</p>

<p>Look at this<a href="https://www.youtube.com/watch?v=pyCCEJVpO-k" target="_blank">quick video tutorial</a> about page and report level on Looker Studio</p>

<p><br></p>

<h3 id="use-case---category-and-product-filter">Use Case - Category and Product Filter</h3>

<p>The filters category and product are only relevant for <strong>gwz_sales</strong> table. The columns are not present in <strong>gwz_orders</strong>. Therefore, the filters are only on page level.</p>
</li>
<li>
<p>Let’s do the <strong>category_1</strong> filter at the report level to check that it is useless</p>

<ul>
<li>
<p>Go to category_1 filter, right click and set it to report level</p>
</li>
<li>
<p>Return to <strong>Sales by segment</strong> page. Use the category 1 filter. Are the graphics filtered?</p>
</li>
<li>
<p>Return to <strong>Sales by category</strong> page and redo the category_1 page_level filter.</p>
</li>
</ul>

<p><br></p>

<h3 id="use-case---order-filter">Use Case - Order Filter</h3>

<p>The geography and order filters are relevant to both the <strong>gwz_sales</strong> and <strong>gwz_orders</strong> table. We want them to appear on every page. Therefore, the filters are at the report level.</p>
</li>
<li>
<p>Use the report level filters</p>

<ul>
<li>
<p>In view mode, on <strong>Sales by category</strong> page, filter on <strong>transporter</strong>=”DPD Home”</p>
</li>
<li>
<p>Return to <strong>Sales by segment</strong> page. What is the value of the carrier/transporter filter?</p>
</li>
</ul>

<p>When you select values on a filter at the report level, the filter selection will be saved when you navigate to different pages.</p>
</li>
<li>
<p>Change the filter at the page level</p>

<ul>
<li>
<p>In edit mode, on the <strong>Sales by Category</strong> page, set the carrier/transporter filter to the page level.</p>
</li>
<li>
<p>Return to the <strong>Sales by Segment</strong> page. Do you see the carrier/transporter filter?</p>
</li>
<li>
<p>Return to the <strong>Sales by Category</strong> page and put the carrier/transporter filter back on the report level.</p>
</li>
</ul>
</li>
<li>
<p>Make the filter code at the report level <em>(if it is not already there)</em>.</p>

<ul>
<li>
<p>On the <strong>Sales by Category</strong> page, do you see the filter code in the order information?</p>
</li>
<li>
<p>Go back to the first <strong>Sales global</strong> page. Do you see the filter code?</p>
</li>
</ul>

<p>At the beginning of the exercise, you created the <strong>filter code</strong> using the <code>Add Control &gt;&gt; Dropdown list Button</code> button. It defaults to creating a filter at the page level, not the report level.</p>

<ul>
<li>Make the filter <strong>code</strong> at the report level</li>
</ul>
</li>
</ol>

<p>Read the following Looker studio documentation about <a href="https://support.google.com/looker-studio/answer/9209580?hl=en" target="_blank">Arrange, group, and distribute components</a>. The article explains the grouping and the page/report level.</p>

<p>Read the following article about <a href="https://medium.com/data-school/different-ways-of-filtering-in-data-studio-5e7731c7ecab" target="_blank">Different ways of filtering in Looker studio</a> to make sure that you have understood the different concepts seen in this exercise.</p>



</div>
</div>