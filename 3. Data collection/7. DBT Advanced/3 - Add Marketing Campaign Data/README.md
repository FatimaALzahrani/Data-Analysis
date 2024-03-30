<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>To embark on the challenges presented in this new lecture, it’s imperative to grasp the fundamental concepts introduced in the exercises corresponding to the previous lecture.</p>

<p>The tasks in this lecture will build upon the exercises from the preceding one, introducing increased complexity and depth. It is strongly recommended to first complete challenges 1, 2, 3, 4, and 5 from the previous lecture with solutions.</p>

<p>Prioritize finishing the exercises from the preceding lecture to establish a solid foundation before tackling these new challenges.</p>

<p>The marketing team collects data from their advertising campaigns.</p>

<p>The finance team wants to access the costs and benefits of each advertising campaign to update their daily financial report.</p>

<h2 id="1---add-the-source">1 - Add the Source</h2>

<ol>
<li>
<p>Copy the following tables in your&nbsp;<code>gz_raw_data</code>&nbsp;dataset into your own BigQuery project:</p>

<ul>
<li>
<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sgz_raw_data!3sraw_gz_adwords" target="_blank">raw_gz_adwords</a></p>
</li>
<li>
<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sgz_raw_data!3sraw_gz_bing" target="_blank">raw_gz_bing</a></p>
</li>
<li>
<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sgz_raw_data!3sraw_gz_criteo" target="_blank">raw_gz_criteo</a></p>
</li>
<li>
<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sgz_raw_data!3sraw_gz_facebook" target="_blank">raw_gz_facebook</a></p>
</li>
</ul>

<p><em><strong>Help -</strong> <a href="https://cloud.google.com/bigquery/docs/managing-tables#copying_a_single_source_table" target="_blank">Google documentation</a></em>&nbsp;to copy a table</p>
</li>
<li>
<p>Add the source to your  <code>schema.yml</code> in dbt cloud</p>
</li>
<li>
<p>Generate staging models with the automatic process</p>
</li>
<li>
<p>Clean the staging models</p>

<ul>
<li>
<p>rename&nbsp;<code>campaing_name</code>&nbsp;correctly</p>
</li>
<li>
<p>cast&nbsp;<code>ads_cost</code>&nbsp;from string to float64</p>
</li>
</ul>
</li>
<li>
<p>Build all your staging sources</p>
</li>
</ol>

<h2 id="2---createint_campaignssqlmodel">2 - Create&nbsp;<code>int_campaigns.sql</code>&nbsp;Model</h2>

<p>We want to aggregate all the campaign costs referenced in the different tables into an intermediate campaign model.</p>

<ol>
<li>
<p>Make sure all the columns have the same name across the different tables, same for datatype.</p>
</li>
<li>
<p>Use UNION ALL to build one single table from the different staging models.</p>

<details>
<summary>Hint</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> <span class="o">*</span>
<span class="k">FROM</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="s1">'...'</span><span class="p">)}}</span>
<span class="k">UNION</span> <span class="k">ALL</span> 
<span class="k">SELECT</span> <span class="o">*</span>
<span class="k">FROM</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="s1">'...'</span><span class="p">)}}</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Build your model or <code>build with upstream</code> dependencies if you haven’t built the staging model yet. The lineage should look like this:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/03-Marketing-Campaign-Data-asset-1-Capture_decran_2023-09-26_a_19.01.13.png" alt=""></p>
</li>
<li>
<p>Add tests and description to <code>schema.yml</code></p>

<ul>
<li>
<p>Test primary key</p>
</li>
<li>
<p>Add relevant tests to other columns</p>
</li>
</ul>
</li>
</ol>

<h2 id="3---createint_campaigns_daysqlmodel">3 - Create&nbsp;<code>int_campaigns_day.sql</code>&nbsp;Model</h2>

<p>You want to create an aggregated version of <code>int_campaigns</code> model for each day.</p>

<ol>
<li>
<p>Perform the transformations to create the following table:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/03-Marketing-Campaign-Data-asset-2-Capture_decran_2023-09-26_a_19.04.52.png" alt=""></p>

<details>
<summary>Hint</summary>

<p>Your lineage should look like this: 
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/03-Marketing-Campaign-Data-asset-3-Capture_decran_2023-09-26_a_19.05.42.png" alt=""></p>

</details>
</li>
<li>
<p>Add tests and description to <code>schema.yml</code></p>
</li>
</ol>

<h2 id="4---create-finance_campaigns_daysql-mart-model">4 - Create <code>finance_campaigns_day.sql</code> Mart Model</h2>

<ol>
<li>
<p>Join the <code>int_campaigns_day</code> model with <code>finance_days</code>model from the previous lecture.</p>

<p>We want to compute the <code>ads_margin</code> column requested by marketing and finance team.</p>

<blockquote>
<p>📌 Ads margin = operational margin - ads cost</p>
</blockquote>

<p>Your preview should look like this:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/03-Marketing-Campaign-Data-asset-4-Capture_decran_2023-09-27_a_11.05.55.png" alt=""></p>
</li>
<li>
<p>Add tests and description to <code>schema.yml</code></p>
</li>
<li>
<p>Check your lineage.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/03-Marketing-Campaign-Data-asset-5-Capture_decran_2023-09-26_a_19.16.53.png" alt=""></p>
</li>
</ol>

<h2 id="5---create-finance_campaigns_monthsql-mart-model">5 - Create <code>finance_campaigns_month.sql</code> Mart Model</h2>

<p>The finance team ask you to deliver the same table but aggregated for each month.</p>

<ol>
<li>
<p>Write the query and build the model.</p>

<p>Your preview should look like this:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/03-Marketing-Campaign-Data-asset-6-Capture_decran_2023-09-26_a_19.11.37.png" alt=""></p>

<p>And your lineage like this  🎊:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/03-Marketing-Campaign-Data-asset-7-Capture_decran_2023-09-27_a_11.04.34.png" alt=""></p>
</li>
<li>
<p>Merge to main with a pull request</p>
</li>
<li>
<p>Run the job in production environment</p>

<p>Look at your lineage in production</p>
</li>
</ol>

<h2 id="apply-some-modification-without-building-the-complete-workflow">Apply some Modification without Building the Complete Workflow.</h2>

<p>Someone in charge of <code>facebook</code> raw data told you they changed the name of the <code>paid_source </code>and they ask you to update the mart data especially <code>finance_campaigns_day</code> before the next schedule update.</p>

<ol>
<li>
<p>Define a new job corresponding to this task with a single command. Your job should be the lightest as possible in term of computation (to do not rerun models that don’t change).</p>

<details>
<summary>Hint</summary>

<p>You should you a <code>+</code> symbol in your instruction</p>
</details>

<p>🎉 Congratulations, you have created a complete automated data pipeline for financial reporting. 🎉</p>
</li>
</ol>



</div>
</div>