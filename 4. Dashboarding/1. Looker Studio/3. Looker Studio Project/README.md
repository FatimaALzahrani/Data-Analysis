<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>Today, you are a Data Analysis duo, working for the Customer Success team for Airbnb.</p>

<p>You have access to 2 datasets to build a story on the <strong>main reasons why some hosts are renting more than others</strong>:</p>

<ul>
<li>
<p><a href="http://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sairbnb!3slisting" target="_blank">listing</a> table</p>
</li>
<li>
<p><a href="http://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sairbnb!3scalendar" target="_blank">calendar</a> table</p>
</li>
</ul>

<details>
<summary>Data Dictionary 📚</summary>

<p><em>In the listing table, we have one line per rental:</em></p>
<ul>
<li><em>id - the ID of the rental</em></li>
<li><em>room_type - the type of rental (e.g., entire home, private room)</em></li>
<li><em>host_response_time - the average response time displayed in Airbnb to customers</em></li>
<li><em>review_scores_value - the average review score for the rental</em>
<em>In the calendar table, we have one entry per rental and per day:</em></li>
<li><em>listing_id - the ID of the rental</em></li>
<li><em>date - the date of the rental or non-rental</em></li>
<li><em>available - a boolean indicating the availability of the rental</em></li>
<li><em>price - the price for the specific date</em></li>
</ul>
</details>

<p>We recommend alternating analysis and KPI calculations in BigQuery with data exploration on Looker Studio.</p>

<p>You should start by:</p>

<ol>
<li>
<p>Understanding the available data by exploring the schemas and some extracts of the datasets.</p>
</li>
<li>
<p>Joining the tables to create a single source for analysis.</p>
</li>
<li>
<p>Exploring the data as is, without additional transformation, to get an idea of the main metrics and analysis you will be able to perform.</p>
</li>
<li>
<p>Returning to SQL if you want to perform more advanced calculations.</p>
</li>
<li>
<p>Testing out different chart types to effectively communicate your story.</p>
</li>
<li>
<p>Adding comments and annotations in Looker Studio to enhance your storytelling.</p>
</li>
</ol>

<details>
<summary>Hint</summary>

<p>You can study the correlation between availability and other metrics such as date, price, average score, and answer time.
You can study the price evolution depending on the period (date range).
The data presented for Airbnb are those of the city of Paris.</p>
</details>

<p>At the end of the day, a few groups will have the opportunity to present their work and share their story with the rest of the batch.</p>


</div>
</div>