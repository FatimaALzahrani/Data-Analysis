<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>To obtain our financial reports, we have aggregated several data sources and performed many successive transformations. It is not easy to clearly identify how the different steps are related to each other.</p>

<p>However, having a good overview is essential for:</p>

<ul>
<li>
<p>Orchestration - restarting the data flow to have an up-to-date analysis when new information arrives in the data sources.</p>
</li>
<li>
<p>Maintenance - identify where a bug is coming from, what are the associated impacts, correct it and restart the data pipeline</p>
</li>
<li>
<p>Evolution - identify the possibility of improving and enriching the data pipeline to meet new business needs.</p>
</li>
</ul>

<h4 id="1---first-we-will-determine-the-data-lineage-of-our-financial-transformation-pipeline-to-gain-insight-and-understanding">1 - First, we will determine the data lineage of our financial transformation pipeline to gain insight and understanding.</h4>

<h4 id="2---next-we-will-use-scheduled-queries-to-automatically-orchestrate-and-execute-our-data-pipeline-transformation">2 - Next, we will use scheduled queries to automatically orchestrate and execute our data pipeline transformation.</h4>

<h3 id="objective">Objective</h3>

<p>The objective of this exercise is, through the example of financial monitoring, to:</p>

<ul>
<li>
<p>understand the importance of data lineage</p>
</li>
<li>
<p>create your first data lineage visualization</p>
</li>
<li>
<p>create your first SQL orchestration</p>
</li>
</ul>

<h2 id="1---data-lineage">1 - Data Lineage</h2>

<ol>
<li>
<p>List the different successive data sources, tables and views needed to go from your 3 data sources (gwz_sales, gwz_product and gwz_ship) to your financial day report (gwz_finance_day).</p>

<details>
<summary>Solution 🔓</summary>

<ul>
<li><em>gwz_sales</em></li>
<li><em>gwz_product</em></li>
<li><em>gwz_sales_margin</em></li>
<li><em>gwz_orders</em></li>
<li><em>gwz_ship</em></li>
<li><em>gwz_orders_operational</em></li>
<li><em>gwz_finance_day</em></li>
</ul>
</details>

<p>When a view A calls another table/view B, we say that there is a dependency from A to B.</p>
</li>
<li>
<p>Add all dependencies to previous view listing.</p>

<details>
<summary>Solution 🔓</summary>

<ul>
<li>gwz_sales</li>
<li>gwz_product</li>
<li>gwz_sales_margin
<ul>
<li>gwz_sales</li>
<li>gwz_product</li>
</ul>
</li>
<li>gwz_orders
<ul>
<li>gwz_sales_margin</li>
</ul>
</li>
<li>gwz_ship</li>
<li>gwz_orders_operational
<ul>
<li>gwz_orders</li>
<li>gwz_ship</li>
</ul>
</li>
<li>gwz_finance_day
<ul>
<li>gwz_orders_operational</li>
</ul>
</li>
</ul>
</details>

<p>This list of data is not very clear and visual. We create a graph to better understand the lineage of the data. We call it a Directed Acrylic Graph (DAG).</p>
</li>
<li>
<p>Complete the following DAG with the correct view/table name</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/03-Gwz-Finance-Data-Lineage-With-DAG-And-Orchestration-asset-1-Untitled.png" alt=""></p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/03-Gwz-Finance-Data-Lineage-With-DAG-And-Orchestration-asset-2-Untitled.png" alt=""></p>
</details>
</li>
</ol>

<p>🎉 Congratulations, you have completed your first DAG to understand data lineage. 🎉</p>

<h2 id="2---data-orchestration">2 - Data Orchestration</h2>

<p>You have understood the data lineage and the different transformations. Now we will be able to perform an orchestration.</p>

<h3 id="a---view-only-vs-viewtable">A - View only vs View+Table</h3>

<p>In challenge 2 of Joins and Testing course, we registered queries as tables.</p>

<p>During development, it is easier to use the <strong>view only</strong> method and it saves time when updating and evolving the view. This is because it is not necessary to recalculate the tables every time.</p>

<p>However, when the development of the data pipeline is complete, it is time to ask whether it is more interesting to use the view alone or the tables to save the application.</p>

<p><code>gwz_sales_margin</code><strong>&amp;</strong> <code>gwz_finance_day</code></p>

<ol>
<li>
<p>How many rows are there in the source table? Run gwz_sales_margin and look at the run (execution) details tab. The company needs a daily financial report. How often should you update the data? Would you prefer to use the view_only or table method to save the output (remember the previous lesson on views and tables)?</p>

<details>
<summary>Solution 🔓</summary>

<p>There are more than 1,300,000 rows in the source table gwz_sales_margin. In the execution details tab, we see that some steps of the calculation take 1 or more seconds. The queries use a lot of data.</p>

<p>In addition, the financial tracking report only needs to be updated once a day, so freshness is not essential. Therefore, it would be better to store <strong>gwz_sales_margin</strong> with the table method rather than with the view only.</p>

<p><strong>gwz_finance_day</strong> calls several views in succession. Furthermore, this will be the table used and requested by the finance team several times a day for their analysis. It therefore seems logical to store the final result in a 
<strong>table</strong> rather than in a <strong>view only</strong> to avoid recalculating each time and improve the performance of the queries to obtain the data.</p>
</details>

<p>Let’s imagine we are in the development process: run the <code>gwz_sales_margin</code><strong>&amp;</strong> <code>gwz_finance_day</code> using the view-only method.</p>

<p>Not let’s imagine we validated the code. We are now ready to change <code>gwz_sales_margin</code> and <code>gwz_finance_day</code> from view-only backup method to table saving method.</p>
</li>
<li>
<p>Change the saving method for <strong>gwz_sales_margin</strong> and <strong>gwz_finance_day</strong></p>

<ul>
<li>Rename the 2 views with suffixe <strong>_view</strong></li>
</ul>

<details>
<summary>💁🏽&nbsp;Note - Editing/Renaming a view</summary>

<details>
<summary>Open and edit the view in details tab</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/03-Gwz-Finance-Data-Lineage-With-DAG-And-Orchestration-asset-3-Untitled.jpeg" alt=""></p>

</details>
<details>
<summary>Save the view with the right option</summary>

<ul>
<li><em>use</em> <u>_save view_</u><em>if you update the view without renaming it</em></li>
<li><em>use</em> <u>_save view_</u><em>as if you need to save it in a new view with another name</em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/03-Gwz-Finance-Data-Lineage-With-DAG-And-Orchestration-asset-4-Untitled.png" alt="">
/details&gt;</li>
</ul>
</details>

<ul>
<li>
<p>Delete the old view <strong>without</strong> the suffix</p>
</li>
<li>
<p>Run the query and save the result in the <strong>gwz_sales_margin</strong> and <strong>gwz_finance_day</strong> tables.</p>
</li>
</ul>

<h3 id="b---transformation-orchestration">B - Transformation Orchestration</h3>

<p>Here is the DAG of the data pipeline - the tables have a red outline.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/03-Gwz-Finance-Data-Lineage-With-DAG-And-Orchestration-asset-5-Untitled.png" alt=""></p>

<p>The source data tables (in <strong>blue</strong> - gwz_sales, gwz_product, gwz_ship) are updated every morning at 6:50am by the fantastic EL process you set up with <strong>Fivetran</strong>.</p>

<p>However, we have decided to use the table saving method for gwz_sales_margin and gwz_finance_day in order to reduce the computational cost and improve the performance demand. These two tables will not be updated automatically.</p>

<p>So you will have to log in every morning at 7am to recalculate the results with the new daily data so that the finance team can have the numbers ready when they start work in the morning.</p>

<p>You’re not too keen on waking up every morning to do manual updates 🤨 Mmmh, guess what! We may have a solution to save your sleep!</p>

<p>The person who wakes up for you in the morning is called<strong>Scheduled Query</strong>!</p>

</details>
</li>
<li>
<p>Create a scheduled query called <strong>gwz_sales_margin_update</strong> to run <strong>gwz_sales_margin_view</strong> every morning at 7am and overwrite the <strong>gwz_sales_margin</strong> table with the updated data. Use today at 7am as the start date.</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> <span class="o">*</span> <span class="k">FROM</span> <span class="nv">`course16.gwz_sales_margin_view`</span>
</code></pre></div>    </div>

<p>💁🏽 Help - _<a href="https://cloud.google.com/bigquery/docs/scheduling-queries#set_up_scheduled_queries" target="_blank">Create a scheduled query</a> documentation</p>
</li>
<li>
<p>Go the <a href="https://cloud.google.com/bigquery/docs/scheduling-queries#viewing_a_scheduled_query" target="_blank">scheduled query tab</a> to view your new scheduled query. Trigger an immediate manual run of your query to test it by clicking on <a href="https://cloud.google.com/bigquery/docs/scheduling-queries#set_up_a_manual_run_on_historical_dates" target="_blank">Scheduled backfill</a> and choose option <code>run a one time transfer</code>.</p>
</li>
<li>
<p>Do the same for gwz_finance_day but at 7:10am to be sure that the update of gwz_sales is finished.</p>

<p>💁🏽 Help - <a href="https://cloud.google.com/bigquery/docs/scheduling-queries#set_up_scheduled_queries" target="_blank">Create a scheduled query</a> documentation and <a href="https://cloud.google.com/bigquery/docs/scheduling-queries#set_up_a_manual_run_on_historical_dates" target="_blank">Scheduled backfill</a> documentation</p>

<h3 id="b---test-scheduled-suery-with-a-new-data-update">B - Test Scheduled Suery with a New Data Update</h3>

<h4 id="data-import">Data Import</h4>
</li>
<li>
<p>New files with additional data from October 1, 2021 have been added. We want to update the source data <strong>gwz_sales</strong> and <strong>gwz_ship</strong> by overwriting them with the new updated files.</p>

<ul>
<li>
<p>delete in your own project <strong>gwz_sales</strong>, open table <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgwz_update_sales" target="_blank">gwz_update_sales</a> and make a copy of it named <strong>gwz_sales</strong> in your own project in course16 dataset.</p>
</li>
<li>
<p>delete in your own project gwz_ship, open table <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgwz_update_ship" target="_blank">gwz_update_ship</a> and make a copy of it named <strong>gwz_ship</strong> in your own project in course16 dataset.</p>
</li>
</ul>
</li>
<li>
<p>Successively trigger a manual execution of your 2 scheduled queries to first update <strong>gwz_sales_margin_update</strong> (and once ok - wait a few minutes), execute <strong>gwz_finance_day_update</strong> with the new data of October 1st 2021. Check if it worked correctly: select the rows of the <strong>gwz_finance_day</strong> table and order them  by date_date DESC.</p>

<p>💁🏽 Help - <a href="https://cloud.google.com/bigquery/docs/scheduling-queries#set_up_a_manual_run_on_historical_dates" target="_blank">Scheduled backfill</a> documentation</p>
</li>
<li>
<p>⚠️&nbsp;<strong>Pause your scheduled query</strong> ⚠️&nbsp;(Please please make sure to pause your scheduled query to avoid fees!)</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/03-Gwz-Finance-Data-Lineage-With-DAG-And-Orchestration-asset-6-Untitled.png" alt=""></p>
</li>
</ol>

<h2 id="bonus">Bonus</h2>

<h3 id="test-orchestration">Test Orchestration</h3>

<p>We have automatically executed the table update. But we did not run the tests. Yet, there could be errors either in the source data or in an update made in the views since the last test.</p>

<p>We understand that you’d rather party late at night than run a manual query early in the morning, so we’ll use our friend <strong>Scheduled Query</strong> to automate the tests.</p>

<ol>
<li>
<p>List all tests related to our dataflow tables</p>

<details>
<summary>Solution 🔓</summary>

<ul>
<li>gwz_sales_pk</li>
<li>gwz_product_pk</li>
<li>gwz_sales_margin_pk</li>
<li>gwz_sales_margin_column-purchase_price</li>
<li>gwz_orders_pk</li>
<li>gwz_ship_pk</li>
<li>gwz_orders_operational_pk</li>
<li>gwz_orders_operational_conservation-ship1 and ship2</li>
<li>gwz_orders_operational_column-ship</li>
</ul>
</details>
</li>
<li>
<p>Save this query as <strong>dataflow_finance_testing_view</strong> in the course16_test dataset. Run it and save the result in the dataflow_finance_testing table.</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">FORMAT_TIMESTAMP</span><span class="p">(</span><span class="nv">"%Y %B %C  %R"</span><span class="p">,</span><span class="k">CURRENT_TIMESTAMP</span><span class="p">())</span> <span class="k">AS</span> <span class="n">date_time</span>
<span class="p">,(</span><span class="k">SELECT</span> <span class="k">count</span><span class="p">(</span><span class="o">*</span><span class="p">)</span> <span class="k">FROM</span> <span class="nv">`course16_test.gwz_sales_pk`</span><span class="p">)</span> <span class="k">AS</span> <span class="n">sales_pk</span>
<span class="p">,(</span><span class="k">SELECT</span> <span class="k">count</span><span class="p">(</span><span class="o">*</span><span class="p">)</span> <span class="k">FROM</span> <span class="nv">`course16_test.gwz_product_pk`</span><span class="p">)</span> <span class="k">AS</span> <span class="n">product_pk</span>
<span class="p">,(</span><span class="k">SELECT</span> <span class="k">count</span><span class="p">(</span><span class="o">*</span><span class="p">)</span> <span class="k">FROM</span> <span class="nv">`course16_test.gwz_sales_margin_pk`</span><span class="p">)</span> <span class="k">AS</span> <span class="n">sales_margin_pk</span>
<span class="p">,(</span><span class="k">SELECT</span> <span class="k">count</span><span class="p">(</span><span class="o">*</span><span class="p">)</span> <span class="k">FROM</span> <span class="nv">`course16_test.gwz_sales_margin_column-purchase_price`</span><span class="p">)</span> <span class="k">AS</span> 
<span class="n">sales_margin_column_purchase_price</span>
<span class="p">,(</span><span class="k">SELECT</span> <span class="k">count</span><span class="p">(</span><span class="o">*</span><span class="p">)</span> <span class="k">FROM</span> <span class="nv">`course16_test.gwz_orders_pk`</span><span class="p">)</span> <span class="k">AS</span> <span class="n">orders_pk</span>
<span class="p">,(</span><span class="k">SELECT</span> <span class="k">count</span><span class="p">(</span><span class="o">*</span><span class="p">)</span> <span class="k">FROM</span> <span class="nv">`course16_test.gwz_ship_pk`</span><span class="p">)</span> <span class="k">AS</span> <span class="n">ship_pk</span>
<span class="p">,(</span><span class="k">SELECT</span> <span class="k">count</span><span class="p">(</span><span class="o">*</span><span class="p">)</span> <span class="k">FROM</span> <span class="nv">`course16_test.gwz_orders_operational_pk`</span><span class="p">)</span> <span class="k">AS</span> <span class="n">orders_operational_pk</span>
<span class="p">,(</span><span class="k">SELECT</span> <span class="k">count</span><span class="p">(</span><span class="o">*</span><span class="p">)</span> <span class="k">FROM</span> <span class="nv">`course16_test.gwz_orders_operational_column-ship`</span><span class="p">)</span> <span class="k">AS</span> <span class="n">orders_operational_column_ship</span>
<span class="p">,(</span><span class="k">SELECT</span> <span class="o">*</span> <span class="k">FROM</span> <span class="nv">`course16_test.gwz_orders_operational_conservation-ship1`</span><span class="p">)</span> <span class="o">=</span> <span class="p">(</span><span class="k">SELECT</span> <span class="o">*</span> <span class="k">FROM</span> <span class="nv">`course16_test.gwz_orders_operational_conservation-ship2`</span><span class="p">)</span> <span class="k">AS</span> <span class="n">orders_operational_conservation_ship</span>
</code></pre></div>    </div>
</li>
<li>
<p>Create a scheduled query called <strong>dataflow_finance_testing_update</strong> to run <strong>dataflow_finance_testing_view</strong> every morning at 7:30 am and to add to the <strong>dataflow_finance_testing</strong> table the latest test results. You save in the <strong>dataflow_finance_testing</strong> table all your synchro tests.</p>

<p>Trigger an immediate manual run of your Scheduled query to test it by clicking on <a href="https://cloud.google.com/bigquery/docs/scheduling-queries#set_up_a_manual_run_on_historical_dates" target="_blank">Scheduled backfill</a>.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/03-Gwz-Finance-Data-Lineage-With-DAG-And-Orchestration-asset-7-Untitled.png" alt=""></p>
</li>
<li>
<p>Analyze the result in<strong>dataflow_finance_testing</strong>. If there are errors, understand why, correct them and re-trigger an immediate manual execution of your scheduled query to see if the correction went through correctly.</p>
</li>
</ol>


</div>
</div>