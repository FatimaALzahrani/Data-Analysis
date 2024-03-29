<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>💡&nbsp;Running your queries requires the computing power of your BigQuery data platform.</p>

<p>BigQuery will charge you for running these queries. Therefore, each query has a cost. 💸</p>

<p>Depending on the type of your query, how you write it, and the query parameters you choose, the cost of the query can vary significantly. 📈📉</p>

<p>In addition, beyond cost alone, complex queries can take a long time to process and result in a poor customer experience when analyzing the data.</p>

<p>In this exercise, we will see:</p>

<ul>
<li>
<p>how to analyze the cost and resource requirements of a query</p>
</li>
<li>
<p>how to optimize the way you write your query to reduce cost and improve performance</p>
</li>
<li>
<p>how to implement partitioning to reduce cost and improve performance.</p>
</li>
</ul>

<h2 id="1---cost-and-bytes-billed">1 - Cost and Bytes Billed</h2>

<p>When you run a query, you can see some information about the query by going to the <code>job information tab:</code></p>

<ul>
<li>
<p>duration of the request</p>
</li>
<li>
<p>amount of bytes processed</p>
</li>
<li>
<p>amount of bytes billed</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-1-Untitled.png" alt=""></p>

<ol>
<li>
<p>Run the following query and go to the job information tab to analyze the following key information:</p>

<ul>
<li>
<p>bytes processed</p>
</li>
<li>
<p>bytes billed</p>
</li>
<li>
<p>duration</p>
</li>
</ul>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="o">*</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">WHERE</span> <span class="mi">1</span><span class="o">=</span><span class="mi">1</span>
</code></pre></div>    </div>

<p>Note - Don’t pay attention to the 1=1 condition. This is to make sure that you did not execute the exact same query in the previous exercise. Bigquery can store the result of the query, “query_result”, in the cache, which would lead to a duration of 0 seconds and 0 bytes processed in the job information. 🤦🏼&zwj;♀️</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-2-Untitled.png" alt=""></p>
</details>
</li>
<li>
<p>Run the exact same application again. Go to the information tab. What information do you find about the bytes processed, billed and the duration of the request?</p>

<details>
<summary>Solution 🔓</summary>

<p>You have zeros for all 3 fields. The result is stored in the cache memory. The result is stored in a temporary table. So when you run the query again, Bigquery doesn’t need to reprocess and recalculate the data.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-3-Untitled.png" alt=""></p>

<p>If your query is cached and you can’t access the billed bytes, you can just make an unnecessary change in your query, for example change your WHERE condition from_ <code>1=1</code> to <code>2=2</code> which is still TRUE. The WHERE condition has changed, therefore, the query is not cached and BigQuery will process the data again. 
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-4-Untitled.png" alt=""></p>
</details>
</li>
<li>
<p>Run the following query and go to the job information tab to analyze the key information.</p>

<p>Are the bytes processed and bytes billed equal? Can you explain why?</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="o">*</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_ship_17`</span>
<span class="k">WHERE</span> <span class="mi">1</span><span class="o">=</span><span class="mi">1</span>
</code></pre></div>    </div>

<details>
<summary>Solution 🔓</summary>

<p>For any request, no matter how small, BigQuery charges a minimum of 10MB of billed bytes. Here, your request processed 6MB which is less than 10MB. Therefore, BigQuery will charge you 10MB. 💳
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-5-Untitled.jpeg" alt=""></p>
</details>
</li>
<li>
<p>Do the same with the following request.</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="o">*</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_mail_17`</span>
<span class="k">WHERE</span> <span class="mi">1</span><span class="o">=</span><span class="mi">1</span>
</code></pre></div>    </div>

<details>
<summary>Solution 🔓</summary>

<p>The request is very small, BigQuery loads the minimum 10MB of bytes charged.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-6-Untitled.png" alt=""></p>
</details>
</li>
</ol>

<h2 id="2---column-selection">2 - Column Selection</h2>

<p>You may have forgotten, but in Course 6 on Data Storage and the Data Platform, we saw that data is stored in column-oriented tables in BigQuery.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-7-Untitled.png" alt=""></p>

<p>The columns are stored in different partitions, different servers. Therefore, if you select only one specific column, BigQuery will not have to process the other columns. The cost and performance of the query will be lower.</p>

<p>Let’s try this with the following <strong>gwz_sales_17</strong> query:</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="o">*</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">WHERE</span> <span class="mi">1</span><span class="o">=</span><span class="mi">1</span>
</code></pre></div></div>

<p>We saw earlier that there were 145MB bytes processed.</p>

<details>
<summary>🔎&nbsp;Detail of the cost of the request</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-8-Untitled.png" alt=""></p>
</details>

<ol>
<li>
<p>Now, just select the products_id column. Run the query. Go to the information tab. What information do you find about the bytes processed, billed and the duration of the request?</p>

<details>
<summary>Solution 🔓</summary>

<p>The processed bytes are only 8.9MB and the duration 1s instead of 145MB and 5s
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-9-Untitled.png" alt=""></p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="n">products_id</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">WHERE</span> <span class="mi">1</span><span class="o">=</span><span class="mi">1</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Now select the orders_id and products_id columns. Run the query. Go to the information tab. What information do you find about the bytes processed, billed and the duration of the request?</p>

<details>
<summary>Solution 🔓</summary>

<p>The processed bytes are 17.8MB and the duration is 2s. When you have 2 columns selected instead of one, you double the amount of data processed and the duration of the query.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-10-Untitled.png" alt=""></p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="n">orders_id</span>
<span class="p">,</span><span class="n">products_id</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">WHERE</span> <span class="mi">1</span><span class="o">=</span><span class="mi">1</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Now select the “orders_id” and “products_id” columns and filter only on “customers_id”=143176. Run the query. Go to the information tab. What information do you find about the bytes processed, billed and the duration of the request?</p>

<details>
<summary>Solution 🔓</summary>

<p>The bytes processed are 26.7 MB, which is three times more than with a single column. The customers_id column is not in the select, but it is in the WHERE statement. Bigquery also needs to process the customers_id column to filter on the relevant customers_id.</p>

<p>Duration is 0 because in this query most of the time is used to display the result in the user interface. Here, there are only 65 rows to display since we filtered on a single customer_id instead of over 1,100,000. The duration is therefore 0 even if it is 3 columns instead of 1 or 2.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-11-Untitled.png" alt=""></p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="n">orders_id</span>
<span class="p">,</span><span class="n">products_id</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">WHERE</span> <span class="mi">1</span><span class="o">=</span><span class="mi">1</span>
<span class="k">AND</span> <span class="n">customers_id</span> <span class="o">=</span> <span class="mi">143176</span>
</code></pre></div>      </div>
</details>
</li>
</ol>

<h2 id="3---row-filtering-partition-and-clustering">3 - Row Filtering, Partition and Clustering</h2>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-7-Untitled.png" alt=""></p>

<h3 id="a---row-filtering">A - Row Filtering</h3>

<p>The data is stored in a column-oriented table in BigQuery. If we select only a few columns, BigQuery should only process the selected columns and should not process and bill the whole table.</p>

<p>What happens if we only select a specific row?</p>

<p>Let’s try with this <strong>gwz_sales_17</strong> query:</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="o">*</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">WHERE</span> <span class="mi">1</span><span class="o">=</span><span class="mi">1</span>
</code></pre></div></div>

<p>We saw previously there were 145MB bytes processed.</p>

<details>
<summary>🔎&nbsp;Detail of the cost of the request</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-13-Untitled.png" alt=""></p>
</details>

<ol>
<li>
<p>Now, still select all columns but filter on date_date = “2021-08-01”. Run the query. Go to the information tab. What information do you find about the bytes processed, billed and the duration of the request?</p>

<p>Compare with gwz_sales_17.</p>

<details>
<summary>Solution 🔓</summary>

<p>The bytes processed are always 145MB. The data is partitioned into columns, not rows. Even if you select only a limited number of rows, BigQuery has to process all rows to gather information from different columns.</p>

<p>The duration is 0 because in this query, most of the time is used to display the result in the user interface. Here, there are only 6444 rows to display since we filtered on a specific date instead of more than 1 100 000 rows. So the duration is 0 even if all columns should be displayed.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-14-Untitled.png" alt=""></p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="o">*</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">WHERE</span> <span class="n">date_date</span> <span class="o">=</span> <span class="nv">"2021-08-01"</span>
</code></pre></div>      </div>
</details>

<h3 id="b---partitioning">B - Partitioning</h3>

<p>It’s a bit of a shame to have to go through the whole table when we only want the data for a specific date.</p>

<p>But guess what? We have a solution. It’s called partitioning.</p>

<p>📖&nbsp;When you use partition, you tell Google BigQuery that it would be relevant to partition rows based on a specific row. BigQuery will then perform row partitioning in addition to column partitioning.</p>

<p>💡&nbsp;By filtering on that specific column, BigQuery will not have to process all the data but only the filtered rows.</p>

<p>You can only <a href="https://cloud.google.com/bigquery/docs/partitioned-tables#date_timestamp_partitioned_tables" target="_blank">partition on one specific</a> column. It can be:</p>

<ul>
<li>
<p>a time column such as date, datetime, timestamp</p>
</li>
<li>
<p>a column of integers</p>
</li>
<li>
<p>the ingestion time in Bigquery which is automatically calculated by BigQuery</p>
</li>
</ul>

<p>Partitioning is only useful if you have a lot of rows in each partition, otherwise it is a bad idea. Creating many partitions increases the query time of BigQuery which has to open many different partitions. Therefore, it can increase the processing time if it is not used properly.</p>
</li>
<li>
<p>Create an empty partition table called “gwz_sales_17_partitioned” and add all the data from the “gwz_sales” table to it. You can watch the video tutorial below with the different steps</p>

<ul>
<li>
<p>create an empty table with one column and partition the table on this column</p>
</li>
<li>
<p>run a query with the overwrite option to save the result in your partitioned table.</p>
</li>
</ul>
</li>
<li>
<p>Select all columns of gwz_sales_17_partitioned and filter on date_date = “2021-08-01”. Compare the processed byte and the duration.</p>

<details>
<summary>Solution 🔓</summary>

<p>With the partition table, BigQuery processed much less data than without partitioning.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-16-Untitled.png" alt=""></p>
</details>
</li>
</ol>

<h1 id="4---billing-by-volume-rather-than-complexity">4 - Billing by Volume rather than Complexity</h1>

<p>💡&nbsp;BigQuery charges for the volume of data processed but does not care about the complexity of the queries and the resource required to run them.</p>

<ol>
<li>
<p>Run the following query. What information do you find about the bytes processed, billed and the duration of the request? Also go to the execution details tab to look at the slot time consumed.</p>

<details>
<summary>💁🏽&nbsp;Help - How to find the “slot time consumed” information?</summary>

<p>Bigquery can parallelize your calculation on several servers. The slot time consumed represents the equivalent in time of your calculation on a single server.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-17-Untitled.jpeg" alt=""></p>
</details>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="o">*</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_campaign_17`</span> <span class="n">t1</span>
<span class="k">WHERE</span> <span class="mi">2</span><span class="o">=</span><span class="mi">2</span>
</code></pre></div>    </div>

<details>
<summary>Solution 🔓</summary>

<p><strong>Duration</strong> - 0 sec
<strong>Bytes processed</strong> - 370KB (very few)
<strong>Slot time consumed</strong> - 42ms
Bigquery can parallelize your calculation on several servers. The slot time consumed represents the equivalent in time of your calculation on a single server.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-18-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-19-Untitled.png" alt=""></p>
</details>
</li>
<li>
<p>Do the same with the next query. It may take some time to complete.</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="o">*</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_campaign_17`</span> <span class="n">t1</span>
<span class="k">INNER</span> <span class="k">JOIN</span> <span class="nv">`course17.gwz_campaign_17`</span> <span class="n">t2</span> <span class="k">ON</span> <span class="n">t1</span><span class="p">.</span><span class="n">campaign_name</span><span class="o">=</span><span class="n">t1</span><span class="p">.</span><span class="n">campaign_name</span>
</code></pre></div>    </div>

<details>
<summary>Solution 🔓</summary>

<p>We have an error on our query in the join. The condition <code>t1.campaign_name = t1.campaign_name</code> is by definition always <code>TRUE</code>. Therefore, we have performed a CROSS JOIN. Instead of <strong>7698</strong> rows in the source table, we get that number <strong>squared</strong> in the result with <strong>59,259,204</strong> rows. This is unnecessary.</p>

<p>However, this is a very long and complex calculation for Bigquery. It requires a lot of resources. The calculation consumed a slot time of <strong>4min35</strong> instead of 42ms. However, the bytes processed are exactly the same, so the billing is the same.</p>

<p><strong>Duration</strong> - 19 sec
<strong>Bytes processed</strong> - 370KB (very few)
<strong>Slot time consumed</strong> - 4min35
Bigquery can parallelize your calculation on several servers. The slot time consumed represents the equivalent in time of your calculation on a single server.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-20-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-21-Untitled.png" alt=""></p>
</details>
</li>
</ol>

<h2 id="bonus">Bonus</h2>

<h3 id="join-request">Join Request</h3>

<p>During a join request, the analysis of the processed bytes can be a bit trickier.</p>

<h3 id="cost-when-join">Cost when Join</h3>

<ol>
<li>
<p>Select all columns in “gwz_orders_17” and analyze how many bytes are processed.</p>

<p>Select orders_id, ship_cost and log_cost in “gwz_ship_17” and analyze how many bytes are processed.</p>

<p>Perform a join between “gwz_orders_17” and “gwz_ship_17” to add “log_cost” and “ship_cost” to orders. Run the query and analyze the number of bytes processed.</p>

<p>What can you tell?</p>

<details>
<summary>Solution 🔓</summary>

<p>In the join, you add the processed bytes from the two source tables.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-22-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-23-Untitled.png" alt=""></p>
</details>

<h3 id="request-execution-details">Request Execution Details</h3>

<p>You have the job information tab, where you get information about processed bytes, billed bytes and duration. In the <strong>execution details tab</strong>, you can get additional information about the different steps of the calculation.</p>

<details>
<summary>👀&nbsp;Look at the execution details information</summary>

<h3 id="parallelisation-ratio">Parallelisation Ratio</h3>
<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-24-Untitled.jpeg" alt=""></p>

<p>You can examine the ratio of <strong>consumed slot time</strong> to <strong>elapsed time</strong>. This is an indicator of the level of parallelization. It can be interpreted as the average number of servers used to parallelize the computation during the entire request.</p>

<h3 id="calculation-stages">Calculation Stages</h3>
<p>You can examine the different steps of the calculation. Here it is quite simple since you mainly have select without group by, join, aggregation, column calculation, subqueries or window function.</p>

<p>If you want to analyze this with a more complex request, you can test this one: 👇🏽</p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="n">o1</span><span class="p">.</span><span class="n">orders_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="k">COUNT</span><span class="p">(</span><span class="n">o2</span><span class="p">.</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">orders_number</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_orders_17`</span> <span class="n">o1</span>
<span class="k">LEFT</span> <span class="k">JOIN</span> <span class="nv">`course17.gwz_orders_17`</span> <span class="n">o2</span> <span class="k">ON</span> <span class="n">o1</span><span class="p">.</span><span class="n">customers_id</span> <span class="o">=</span> <span class="n">o2</span><span class="p">.</span><span class="n">customers_id</span> <span class="k">AND</span> <span class="n">o1</span><span class="p">.</span><span class="n">orders_id</span><span class="o">&gt;=</span><span class="n">o2</span><span class="p">.</span><span class="n">orders_id</span>
<span class="k">GROUP</span> <span class="k">BY</span> <span class="n">o1</span><span class="p">.</span><span class="n">orders_id</span>
</code></pre></div>      </div>
<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-25-Untitled.png" alt=""></p>
</details>

<p>💡&nbsp;During the exercises, feel free to look at the execution details if you want to understand a little more about how the servers compute the different requests.</p>
</li>
<li>
<p>(optional) You can redo this exercise from the beginning but analyze the run details tab instead of the job information tab.</p>

<h3 id="clustering">Clustering</h3>
</li>
<li>
<p>(optional) Read the <a href="https://cloud.google.com/bigquery/docs/clustered-tables" target="_blank">documentation about clustering</a></p>
</li>
<li>
<p>(optional) Do some clustering tests on a new table “gwz_sales_clustered”.</p>
</li>
</ol>

<h2 id="have-you-already-done-everything">Have you already done everything?</h2>

<p>Create an account on <a href="https://www.hackerrank.com/domains/sql?filters%5Bstatus%5D%5B%5D=unsolved&amp;badge_type=sql" target="_blank">Hacker rank</a> and perform as many challenges as you can.</p>

<details>
<summary>Note -  ➡️❗Indications on how to use Hacker rank ❗⬅️</summary>

<ul>
<li>Don’t forget to put <code>**;**</code> at the end of you request</li>
<li>
<p>Use the filter on the right to select the most relevant subdomains challenges</p>

<ul>
<li>
<p><strong>Course 6</strong> —&gt; <u>_Basic select_</u> and eventually <u>_Advanced select_</u></p>
</li>
<li>
<p><strong>Course 7</strong> —&gt; <u>_Aggregation_</u></p>
</li>
<li>
<p><strong>Course 8</strong> —&gt; <u>_Basic join_</u> and potentially <u>_Advanced join_</u></p>
</li>
<li>
<p><strong>Course 9</strong> —&gt; <u>_Everything_</u> 😉</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-26-Untitled.jpeg" alt=""></p>
</li>
<li>
<p>❓🤔 You can look at the discussion tab to have some hints from other users 🤔❓</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-27-Untitled.jpeg" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/04-Cost-And-Partition-asset-28-Untitled.png" alt=""></p>
</li>
</ul>

</details>

<p>If you prefer, you can also deep-dive into today’s datasets to make further analysis.</p>



</div>
</div>