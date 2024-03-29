<div class="tab-content w-100">
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

<p>🗣️&nbsp;Greenweez has many customers since it is a B2C platform. Targeted communication is essential to keep their large customer base engaged.</p>

<p>📧&nbsp;This is the role of the CRM team.</p>

<h3 id="crm-team">CRM Team</h3>

<p>The CRM team manages communication with the customer base. It allows to:</p>

<ul>
<li>
<p>create brand loyalty for customers</p>
</li>
<li>
<p>display commercial offers and ads to stimulate conversions</p>
</li>
<li>
<p>prevent churn by contacting at-risk clients</p>
</li>
</ul>

<p>Here are the main missions of the CRM team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/04-Data-Request-Mail-Greenweez-asset-1-Untitled.png" alt=""></p>

<p>Here are the main KPIs to track for the CRM team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/04-Data-Request-Mail-Greenweez-asset-2-Untitled.png" alt=""></p>

<h3 id="objective">Objective</h3>

<p>🥅&nbsp;The objective of this exercise is to query the Greenweez mail data in SQL and provide the Greenweez CRM team with relevant information.</p>

<p>🎯&nbsp;In this exercice, you will be able to:</p>

<ul>
<li>
<p>improve your SQL skills</p>
</li>
<li>
<p>use BigQuery</p>
</li>
<li>
<p>understand the needs of the CRM team better</p>
</li>
</ul>

<h3 id="data-import">Data Import</h3>

<ul>
<li>
<p>In BigQuery, open the ‘<strong>course14</strong>’ dataset</p>
</li>
<li>
<p>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse14!3sgwz_mail" target="_blank">gwz_mail</a> table into your BigQuery project</p>
</li>
</ul>

<p>💁🏽&nbsp;<u>_Help_</u> - To copy a table, read <a href="/f9515275ca93454aa409d92be29cd3af">instructions here</a> or on <a href="https://cloud.google.com/bigquery/docs/managing-tables#copying_a_single_source_table" target="_blank">Google documentation</a></p>

<details>
<summary>📚 Data dictionary</summary>

<p>Sometimes it can be quite difficult to understand what all the data in a table represent. This is where data dictionaries  come in handy. Data dictionaries are designed to help you understand better what information each of the columns contain. 
In the <code>gwz_mail</code> table, each row is a single mail campaign with its associated:</p>
<ul>
<li><u>**journey_id**</u> - unique identifier of the campaign (journey)</li>
<li><u>**journey_name**</u> - name of the campaign. It seems that there are naming conventions according to the type (newsletter, abandoned cart, back in stock), the country (France or Belgium) and the date of the campaign (prefix).</li>
<li><u>**sent_nb**</u> - the number of mails sent for the campaign</li>
<li><u>**opening_nb**</u> - the number of openings for the campaign</li>
<li><u>**click_nb**</u> - the number of clicks for the campaign</li>
<li><u>**turnover**</u> - the turnover generated after an email opening</li>
</ul>
</details>

<h2 id="1---basic-data-requests">1 - Basic Data Requests</h2>

<p>💽&nbsp;In the following steps, you will be asked to query relevant data for the CRM team.</p>

<h3 id="table-exploration">Table exploration</h3>

<ol>
<li>
<p>First, to understand the structure of the table, select all the information it contains. Remember you can do that by using the <code>SELECT</code> clause!</p>

<ul>
<li>
<p>How many columns are there?</p>
</li>
<li>
<p>How many rows are there?</p>
</li>
<li>
<p>Can you understand the meaning of each column?</p>
</li>
</ul>
</li>
<li>
<p>What is the primary key? How to identify it?</p>

<details open="">
<summary>Hint - Primary key 🗝️</summary>

<p>A primary key is a column, or a combination of several columns, that uniquely identify each row in a table. It must satisfy the following criteria:</p>

<ol>
<li>Each value in the primary key must be unique.</li>
<li>The primary key cannot contain null values.</li>
<li>There can only be one primary key per table.</li>
</ol>

<p>The primary key is important because it is used to create relationships between tables in a database. To ensure data integrity, it’s crucial to control that the primary key meets the criteria above.
To control the primary key, you can use the <code>SELECT DISTINCT</code> clause to identify if the values are unique. You can use <code>WHERE column IS NULL</code> to identify if there are any null values. It’s important to verify the primary key early in the analysis process to avoid data inconsistencies and errors later on.
Remember, you’ll be using the primary key for most of your database queries and operations, so it’s essential to ensure its accuracy and validity.</p>
</details>

<h3 id="campaign-analysis">Campaign Analysis</h3>
</li>
<li>
<p>Your goal is to generate a clear overview of the largest campaigns in terms of emails sent. To achieve this, select the <code>journey_id</code>, <code>journey_name</code>, and <code>sent_nb</code> columns and order the results by decreasing <code>sent_nb</code> column.</p>
</li>
<li>
<p>Investigate how many distinct campaigns there are and if any of the campaigns have been repeated. To achieve this, select the <code>journey_name</code> column by using the <code>DISTINCT</code> clause.</p>
</li>
<li>
<p>You aim to look closer at the campaigns that have generated at least 10 000 openings. To achieve this, select the <code>journey_id</code>, <code>journey_name</code>, <code>sent_nb</code>, <code>opening_nb</code> columns and specify which rows exactly should be selected by using the <code>WHERE</code> clause. Finally, order your results by descending <code>opening_nb</code> to show the campaigns with the most openings at the top of the results table.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/0l5csa37ks6lva14ntcjosa4e2od" alt=""></p>

</details>
</li>
<li>
<p>You want to look at the top ten campaigns that generated the most clicks. To achieve this, select <code>journey_id</code>, <code>journey_name</code>, <code>sent_nb</code>, <code>opening_nb</code>, <code>click_nb</code>, order the results by decreasing <code>click_nb</code> and limit your results to 10 by using the <code>LIMIT</code> clause.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/u6cudax22ygtocro87ilo5ywzwly" alt=""></p>

</details>
</li>
<li>
<p>You are interested in one campaign in particular, namely the <code>210707_nl_happyhour</code> campaign. To look closer at the data from this campaign, select the <code>journey_id</code>, <code>journey_name</code>, <code>sent_nb</code>, <code>opening_nb</code>, <code>click_nb</code> columns and specify a condition to filter the rows by using the <code>WHERE</code> clause.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/04-Data-Request-Mail-Greenweez-asset-5-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Your goal is to see the largest campaigns in Belgium in terms of emails sent. To achieve this, select  <code>journey_id</code>, <code>journey_name</code>, <code>sent_nb</code>, <code>opening_nb</code>, <code>click_nb</code> columns and specify the rows you want to select with a <code>WHERE</code> clause (campaigns from Belgium have <code>_nlbe_</code> in their name that you can reference by using the <code>LIKE</code> and <code>%</code> expressions). Finally, order the results by decreasing <code>sent_nb</code>.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/n451bze4dzmy7vicczbhklywwpfl" alt=""></p>

</details>

<h2 id="2---data-exploration-for-the-crm-team">2 - Data Exploration for the CRM Team</h2>

<p>In the following steps, the CRM team will ask you to retrieve specific subsets of data according to their needs.</p>
</li>
<li>
<p>The CRM team only wants to analyse newsletters from France. They want to access all the campaign data for these newsletters and order it by the most mail sent. Let’s do this! 💪🏽</p>

<ul>
<li>
<p>select all the columns</p>
</li>
<li>
<p>use the <code>LIKE</code> clause to filter on French newsletters only</p>
</li>
<li>
<p>order the results by decreasing mail sent</p>
</li>
</ul>

<p>How many campaigns are returned?</p>

<details open="">
<summary>Help 💁🏽</summary>

<p>They are 4 types of campaigns:</p>
<ul>
<li>newsletters from France having <code>“_nl_”</code> in their name</li>
<li>newsletters from Belgium having <code>“_nlbe_”</code> in their name</li>
<li>abdandoned cart (from france or belgium) having <code>“relance_panier”</code> in their name</li>
<li>back in stock (from france or belgium) having <code>“back_in_stock”</code> in their name</li>
</ul>

<p><br>Use <code>LIKE</code> and <code>%</code> expressions together with the appropriate text pattern to only select newsletters from France</p>
</details>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/1th4bdip5q2h1e8qhv4wd7vpfiq1" alt=""></p>

</details>
</li>
<li>
<p>The CRM team would like to have the main KPIs of the mail statistics - <u>_opening_rate, click_rate, CTR (Click-through rate) and turnover per 1000 mails sent_</u>. Calculate these KPIs and return them as new columns in the results table.</p>

<p><u>**Hints** </u>💁🏽</p>

<ul>
<li>
<p>You can use <code>ROUND()</code> to display 1 or 2 digits after the number.</p>
</li>
<li>
<p>Don’t forget that these KPIs should only be calculated for the newsletters from France and not all the campaigns!</p>
</li>
</ul>

<details open="">
<summary>Help </summary>

<p>The main KPI to calculate are:</p>
<ul>
<li><code>opening_rate</code></li>
<li><code>click_rate</code> (based on <code>sent_nb</code>)</li>
<li><code>CTR</code> - Click Through Rate (based on <code>opening_nb</code>)</li>
<li><code>turnover_per_mille</code> which is the average turnover generated for 1000 mails sent</li>
</ul>

<p><br>Calculate these KPIs by using standard mathematical operations</p>
</details>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/04-Data-Request-Mail-Greenweez-asset-7-Untitled.png" alt=""></p>

</details>

<p>The CRM team tried a new commercial operation with a happy hour discount code sent via a newsletter. They made 2 versions: one was sent in the morning, the other was sent at noon.</p>
</li>
<li>
<p>Write a query to calculate the main KPIs for the two “happy hour” emails. Compare them.</p>

<p>What can you conclude about the performance of the two newsletter campaign versions?</p>

<p><u>_Hint_</u> - “happyhour” is in the <code>journey_name</code>.</p>

<p><u>_Note_</u> - <code>210630_nl_happy_hour_18h</code> is a wrong test done by the CRM team. You can ignore it.</p>

<details open="">
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/xq3myjpzld9inwvjrnb7sqq8kdbz" alt=""></p>

</details>

<h3 id="bonus">Bonus</h3>
</li>
<li>
<p>Add a new <code>date_date</code> column to the query from step 9 by extracting the campaign date from the <code>journey_name</code> column. Finally, order the results by ascending date.</p>

<p>Hints 💁🏽</p>

<ul>
<li>
<p><em>You can use</em> <code>_SUBSTR()_</code><em>,</em> <code>_CAST()_</code><em>and potentially</em> <code>_CONCAT()_</code><em>.</em></p>
</li>
<li>
<p><em>You can exclude rows that do not start with a number.</em></p>
</li>
</ul>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/04-Data-Request-Mail-Greenweez-asset-9-Untitled.png" alt=""></p>

</details>
</li>
</ol>



</div>
</div>
<div role="tabpanel" class="tab-pane px-5" id="challenge-submission">

<h4 class="mt-3 mb-4">Assignments</h4>
<div class="commit-card box-shadow-light bg-white px-3 py-2 mb-2">
<div class="commit-info d-flex align-items-center justify-content-between w-100">
<p class="small mb-0"><img class="img-avatar" src="https://avatars.githubusercontent.com/u/107775566?v=4"> <span class="text-dark font-weight-bold">FatimaALzahrani</span> uploaded about 1 month ago</p>
<div class="d-flex align-items-center">
<a target="blank" href="https://console.cloud.google.com/bigquery?sq=70374119533%3Aef592709186344ce9797973ef4825b5e">
<span class="fa fa-link" data-toggle="tooltip" title="Open link"></span>
</a>    </div>
</div>
</div>

<h4 class="my-4">You can resubmit an assignment if desired with the form below</h4>


<div class="box-shadow-light bg-white p-3">
<div data-controller="ajax-form">
<form class="simple_form w-100" id="new_challenge_submission" data-action="ajax:success->ajax-form#onPostSuccess ajax:error->ajax-form#onPostError" novalidate="novalidate" action="/camps/3447/challenge_submissions" accept-charset="UTF-8" data-remote="true" method="post">
<div class="form-group hidden challenge_submission_exercise_path"><input class="form-control hidden" value="03-Data-Transformation/01-Intro-To-Transformation/04-Data-Request-Mail-Greenweez" autocomplete="off" type="hidden" name="challenge_submission[exercise_path]" id="challenge_submission_exercise_path"></div>


<div class="form-group hidden challenge_submission_type"><input class="form-control hidden" value="UrlChallengeSubmission" autocomplete="off" type="hidden" name="challenge_submission[type]" id="challenge_submission_type"></div>
<div class="form-group url required challenge_submission_url w-100"><label class="url required" for="challenge_submission_url">Url <abbr title="required">*</abbr></label><input class="form-control string url required" required="required" aria-required="true" placeholder="https://github.com/lewagon" type="url" name="challenge_submission[url]" id="challenge_submission_url"></div>


<div class="form-group hidden challenge_submission_schooling_id"><input class="form-control hidden" value="39173" autocomplete="off" type="hidden" name="challenge_submission[schooling_id]" id="challenge_submission_schooling_id"></div>


<input type="submit" name="commit" value="Submit Assignment" class="btn btn-primary mt-3 mb-2 " data-disable-with="Submit Assignment">
</form></div>

</div>

</div>
<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">

