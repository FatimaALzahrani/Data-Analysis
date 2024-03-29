<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">

<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<h2 id="introduction">Introduction</h2>

<h3 id="greenweez-presentation">Greenweez Presentation</h3>

<p>🪴&nbsp;Greenweeez is a leading online marketplace for organic products.</p>

<p>👥&nbsp;It sells organic, ecological and sustainable produce to B2C customers with the aim to faciliate responsible consumption and a healthier lifestyle.</p>

<p>🌐&nbsp;Greenweez operates only through its e-commerce website, meaning that it does not have a physical retail store. Therefore, to attract new customers online advertising is essential. This is the role of the media team at Greenweez.</p>

<h3 id="media-team">Media Team</h3>

<p>The media team manages online advertising and various acquisition channels to maximize acquisition within limited budget.</p>

<p>Here are the main missions of the media acquisition team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/02-Greenweez-Ads-Monitoring-asset-1-Untitled.png" alt=""></p>

<p>Here are the main KPIs to track for the media team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/02-Greenweez-Ads-Monitoring-asset-2-Untitled.png" alt=""></p>

<h3 id="objective">Objective</h3>

<p>The objective of this exercise is to transform and analyze the Greenweez ads data to meet the needs of the media team.</p>

<p>In this exercise you will be able to:</p>

<ul>
<li>
<p>practice writing SQL queries with join and group by statements</p>
</li>
<li>
<p>use BigQuery</p>
</li>
<li>
<p>experience a complete data transformation process</p>

<ul>
<li>
<p>table exploration and primary key identification</p>
</li>
<li>
<p>links and relationships between tables summarized in an ER diagram</p>
</li>
<li>
<p>data transformation, analysis and testing</p>
</li>
</ul>
</li>
<li>
<p>better understand the needs of the media team</p>
</li>
</ul>

<h3 id="data-import">Data Import</h3>

<p>In the <strong>course16</strong> dataset of your BigQuery project:</p>

<ul>
<li>
<p>Copy <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgz_adwords" target="_blank">gz_adwords</a> table.</p>
</li>
<li>
<p>Copy <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgz_bing" target="_blank">gz_bing</a> table.</p>
</li>
<li>
<p>Copy <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgz_criteo" target="_blank">gz_criteo</a> table.</p>
</li>
<li>
<p>Copy <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgz_facebook" target="_blank">gz_facebook</a> table.</p>
</li>
<li>
<p>Copy <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgz_orders" target="_blank">gz_orders</a> table.</p>
</li>
<li>
<p>Copy <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgz_sessions" target="_blank">gz_sessions</a> table.</p>
</li>
</ul>

<p>💁🏽&nbsp;<u>_Help_</u> - <a href="https://cloud.google.com/bigquery/docs/managing-tables#copying_a_single_source_table" target="_blank">Google documentation</a> to copy a table</p>

<h2 id="1---table-exploration">1 - Table Exploration</h2>

<ol>
<li>
<p>First, to explore and understand the structure of the tables, click on the <code>Schema</code> and <code>Preview</code> tabs in BigQuery. How many columns are there? How many rows? Can you understand what data each of the columns contain?</p>
</li>
<li>
<p>What are the primary keys for the different tables? To save time, create a primary key test only for the <code>gz_orders</code> and <code>gz_sessions</code> tables.</p>

<h2 id="2---links-and-relationships-between-tables">2 - Links and Relationships between Tables</h2>

<h3 id="schema---entity-relationship-diagram-erd">Schema - Entity Relationship Diagram (ERD)</h3>

<p>To better understand the relationship between relational databases, you should make an entity-relationship diagram (ERD).</p>

<p>The goal is to create the ERD for our 6 tables.</p>

<p>You could create it from the scratch, but that would take too much time, therefore we have started to create the ERD for you. Please take the time to complete it.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/02-Greenweez-Ads-Monitoring-asset-3-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/02-Greenweez-Ads-Monitoring-asset-4-Untitled.png" alt=""></p>
</li>
<li>
<p>With pencil and paper (or in your head), fill it in with:</p>

<ul>
<li>
<p>Primary Key for each table (PK)</p>
</li>
<li>
<p>Joining key between tables (JK)</p>
</li>
<li>
<p>Relationship between tables</p>
</li>
</ul>

<p>You have now completed the ERD by identifying the keys of all the tables in the Greenweez advertising dataset and by mapping out their relationships. The ERD is meant to help you correctly join the different tables together in the next steps, which will be crucial for creating a report.</p>

<h2 id="3---table-transformation-and-analysis---join--test">3 - Table Transformation and Analysis - Join &amp; Test</h2>

<p>The objective is to set up a monitoring report of the daily turnover generated by ads for each <code>paid_source</code> and each <code>campaign</code>.</p>

<h3 id="a---session-and-orders-join">A - Session and Orders Join</h3>

<p>To do this, we first need to identify the turnover and the number of orders generated by each of the campaigns. Therefore, we will start by joining the <code>gz_order</code> and <code>gz_session</code> tables.</p>
</li>
<li>
<p>On what key would you join the <code>gz_order</code> and <code>gz_session</code> tables? Do you anticipate any issues with the joining procedure?</p>
</li>
<li>
<p>Perform an inner join between the <code>gz_order</code> and <code>gz_session</code> tables.</p>

<p>Compare the number of rows in the <code>gz_order</code> and <code>gz_session</code> tables with the number of rows in the result.</p>
</li>
<li>
<p>Perform a left join between the <code>gz_order</code> and <code>gz_session</code> tables.</p>

<p>Compare the number of rows in the <code>gz_order</code> and <code>gz_session</code> tables with the number of rows in the result.</p>
</li>
<li>
<p>Perform a right join between the <code>gz_order</code> and <code>gz_session</code> tables.</p>

<p>Compare the number of rows in the <code>gz_order</code> and <code>gz_session</code> tables with the number of rows in the result.</p>
</li>
<li>
<p>Perform a full outer join between the <code>gz_order</code> and <code>gz_session</code> tables.</p>

<p>Compare the number of rows in the <code>gz_order</code> and <code>gz_session</code> tables with the number of rows in the result.</p>
</li>
<li>
<p>The different join methods return different of results. We need to choose the one that best meets our needs. The purpose of joining <code>gz_order</code> and <code>gz_session</code> tables is to add information to each order about their corresponding campaign to ultimately calculate KPIs for the different ad campaigns. So which JOIN method do you think is the most appropriate in this case?</p>
</li>
<li>
<p>Save the results of the INNER JOIN query in a <strong><code>gz_orders_ga</code></strong> table. Create a primary key test for it.</p>

<h3 id="b---campaign-aggregation">B - Campaign Aggregation</h3>

<p>The campaign information is distributed across 4 different tables according to different data sources: <code>gz_adwords</code>, <code>gz_bing</code>, <code>gz_criteo</code>, <code>gz_facebook</code>. The 4 tables follow the same structure. However, for our analysis it would be better to put all the campaign information together in a single <code>gz_campaign</code> table.</p>
</li>
<li>
<p>Use UNION ALL to combine all 4 ad data sources into a single table named <strong><code>gz_campaign</code></strong>.</p>
</li>
</ol>

<p>💁🏽&nbsp;<u>_Help_</u><em>-</em> <em><a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/query-syntax#set_operators" target="_blank">UNION ALL documentation</a></em></p>

<p>### C - Orders and Campaign Join</p>

<p>We have updated the ER Diagram with the 2 new tables, but it is incomplete.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/02-Greenweez-Ads-Monitoring-asset-7-Untitled.png" alt=""></p>

<ol>
<li>With pencil and paper (or in your head), fill it in with:</li>
</ol>

<ul>
<li>
<p>Primary Key for each table (PK)</p>
</li>
<li>
<p>Joining key between tables (JK)</p>
</li>
<li>
<p>Relationship between tables</p>
</li>
</ul>

<ol>
<li>
<p>On what key would you join the <code>gz_campaign</code> and <code>gz_orders_ga</code> tables to calculate the relevant ad metrics? Do you anticipate any issues?</p>
</li>
<li>
<p>Aggregate <code>gz_orders_ga</code> on <code>date_date</code> and <code>campaign_key</code>. Calculate the following aggregated metrics:</p>

<ul>
<li>
<p>number of transactions (orders)</p>
</li>
<li>
<p>sum of turnover</p>
</li>
<li>
<p>sum of new customers (<code>news</code>)</p>
</li>
</ul>

<p>Save the result as <strong><code>gz_campaign_orders</code></strong>.  Create a primary key test for the table called <code>gz_campaign_orders_pk</code>.</p>

<p>We need to perform a join between <code>gz_campaign</code> and <code>gz_campaign_orders</code> to gather all the campaign and order information in one table.</p>
</li>
<li>
<p>Perform an INNER join between the <code>gz_campaign</code> and <code>gz_campaign_orders</code> tables. Compare the number of rows in <code>gz_campaign</code> and <code>gz_campaign_orders</code> tables with the returned result from your join query. Try different join methods and compare the different results that you get from them.</p>
</li>
<li>
<p>Our goal is to analyse the performance and profitability of our paid ad campaigns. We don’t want to focus on campaigns that don’t have an associated cost and rank and therefore are not present in the <code>gz_campaign</code> table. Furthermore, we need to access the information about the revenue generated by these ad campaings, and this information can only be found in the <code>gz_campaign_orders</code> table. So which JOIN method would you choose?</p>
</li>
<li>
<p>Join the <code>gz_campaign</code> and <code>gz_campaign_orders</code> tables with a <strong>LEFT JOIN</strong>. You will notice that there are some NULL values in the <code>turnover</code> and <code>nb_transaction</code> columns. This occurs when a campaign has cost money, but has not generated any orders. Set the values of <code>turnover</code> and <code>nb_transaction</code> to be “0” instead of NULL for these cases. Save your result in the&nbsp;<strong><code>gz_campaign_join</code></strong>&nbsp;table.</p>

<p>💡Hint: Use <strong>IFNULL</strong> or <strong>CASE WHEN</strong></p>
</li>
</ol>

<p>### D - Aggregation &amp; Analysis</p>

<p>For our final report, the metrics to be calculated for each <code>paid_source</code> and each <code>campaign</code> are:</p>

<ul>
<li>
<p>turnover generated</p>
</li>
<li>
<p>number of orders</p>
</li>
<li>
<p>number of new orders (<code>news</code>)</p>
</li>
<li>
<p>cost</p>
</li>
<li>
<p>impressions</p>
</li>
<li>
<p>clicks</p>
</li>
<li>
<p>associated KPIs - ROAS, CAC, CPM, CPC, CTR</p>
</li>
</ul>

<ol>
<li>
<p>In the <code>gz_campaign_join</code> table, aggregate the above-mentioned order and ad metrics (not KPIs yet) by the <code>paid_source</code> column. Instead of saving the result in a new table, you will use this query as a subquery for the next step and alias it as <code>gz_campaign_ps</code> (ps for <code>paid_source</code>).</p>
</li>
<li>
<p>Add the code to calculate the KPIs and after you validate that it is working correctly, transform it into another subquery and alias it as <code>gz_campaign_ps_kpi</code>.</p>

<ul>
<li>ROAS, CAC new, CAC orders, CPM, CPC, CTR</li>
</ul>

<p>Run the query and answer the following questions:</p>

<ul>
<li>What conclusions can you draw from these results?</li>
<li>What could explain the differences in the ad and revenue metrics between the different paid sources?</li>
</ul>
</li>
<li>
<p>Run the final query by using the 2 subqueries <code>gz_campaign_ps</code> and <code>gz_campaign_kpi</code> and grouping the results by month.</p>

<p>🔎&nbsp;Analyse how the metrics change for each paid source over time.</p>

<ul>
<li>What conclusions can you draw from these results?</li>
<li>Which paid sources are performing well and which ones are underperforming?</li>
</ul>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/04-Subqueries/02-Greenweez-Ads-Monitoring-asset-9-Untitled.png" alt=""></p>
</details>
</li>
</ol>



</div>
</div>