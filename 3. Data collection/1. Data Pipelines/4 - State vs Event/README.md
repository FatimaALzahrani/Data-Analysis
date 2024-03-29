<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<h2 id="1---data-storage---state-vs-event-table">1 - Data Storage - State vs Event Table</h2>

<p>The same data can be stored in either a state table or an event table. The format of the table and the information available in each are not necessarily the same.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/04-State-VS-Event-asset-1-Untitled.png" alt=""></p>

<p>In this exercise, you will see that play out. You will follow several events will follow one another and determine the final state of the table when storing the event:</p>

<ul>
<li>
<p>in a state table, or</p>
</li>
<li>
<p>in an event table</p>
</li>
</ul>

<p>Open the Google sheet <a href="https://docs.google.com/spreadsheets/d/1fl_lCcwOONph9NgWXQeq3xSqFQl4oJU3VPprkxPc6uw/edit?usp=sharing" target="_blank">State vs Event Table</a>, make a copy of it.</p>

<p>### A - Example - Parcel Tracking</p>

<p>Remember the example from the lecture about the parcel’s journey:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/04-State-VS-Event-asset-2-Untitled.png" alt=""></p>

<ol>
<li>
<p>Go to the sheet <code>Example - Shipping tracking</code><strong>.</strong> Look at the example and understand the difference in storage between State and Event table.</p>

<h3 id="b---circle---funnel-analysis">B - Circle - Funnel Analysis</h3>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/04-State-VS-Event-asset-3-Untitled.png" alt=""></p>
</li>
<li>
<p>Go to the sheet <code>Circle funnel</code>. From the list of successive events related to the acquisition funnel, determine the final state of the <code>acquisition funnel</code> if you store the event:</p>

<ul>
<li>
<p>in a state table</p>
</li>
<li>
<p>in an event table</p>
</li>
</ul>

<h3 id="c---greenweez---product-catalog-monitoring">C - Greenweez - Product Catalog Monitoring</h3>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/04-State-VS-Event-asset-4-Untitled.png" alt=""></p>
</li>
<li>
<p>Go to the <code>Greenweez Catalog</code> sheet. From the list of successive product events, determine the final status of the catalogue if you store the event:</p>

<ul>
<li>
<p>in a state table</p>
</li>
<li>
<p>in an event table</p>
</li>
</ul>
</li>
</ol>

<h2 id="2---business-needs---state-vs-event-table">2 - Business Needs - State vs Event Table</h2>

<p>Depending on the business needs:</p>

<ul>
<li>
<p>state table can be sufficient on its own (current state analysis)</p>
</li>
<li>
<p>historization of state table can be sufficient (evolutions over time)</p>
</li>
<li>
<p>state table with log is often necessary (detailed analysis)</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/04-State-VS-Event-asset-5-Untitled.png" alt=""></p>

<p>### A - Circle - Funnel Analysis</p>

<p>For Circle funnel, you have received a request:</p>

<p><em>“I want to have the current view of my funnel. This will help me identify the current status of my different prospects so that I can take appropriate action. For example, I could recontact all prospects that stopped before the call stage with a dedicated communication.”</em></p>

<ol>
<li>
<p>Determine the appropriate table format (state, state history, event) to meet the need.</p>

<p>You have just received another request:</p>

<p><em>“I want to analyse more closely the conversion rate and the time between each step. I want to see how it evolves month after month to see if performance is increasing or decreasing at each stage of the process.”</em></p>
</li>
<li>
<p>Determine the appropriate table format (state, state history, event) to meet the need.</p>

<h3 id="b---greenweez---product-catalogue-monitoring">B - Greenweez - Product Catalogue Monitoring</h3>

<p>For Greenweez product catalogue, the request received is the following:</p>

<p><em>“I want to have the current view of my catalogue to see how many products in each category are on promotion. I want to have the current price as well as the information on certain products so I can betteer monitor prices and promotions.”</em></p>
</li>
<li>
<p>Determine the appropriate table format (state, state history, event) to meet the need.</p>

<p>Another request you received was this one:</p>

<p><em>“I want to compare the evolution of my product catalogue over time and compare it from one day to the next. I am mainly interested in the trend and evolution of the catalogue.”</em></p>
</li>
<li>
<p>Determine the appropriate table format (state, state history, event) to meet the need.</p>
</li>
</ol>

<h2 id="3---data-transfer-methods">3 - Data Transfer Methods</h2>

<p>There are different methods of data transfer depending on the needs of the company and the technical requirements.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/04-State-VS-Event-asset-6-Untitled.png" alt=""></p>

<p>### A - Greenweez - Product Catalog Monitoring</p>

<p>For Greenweez product catalogue, a data transfer request was received:</p>

<p><em>“We want to get the product database from SQL to BigQuery for analytical purposes and centralization of the data platform. We need the current view of the product database every hour. The table is not very big so there is not really a concern for server resources.”</em></p>

<ol>
<li>
<p>What method of data transfer do you recommend to meet the business needs and technical requirements?</p>

<p>Note: (optional) - We could use a federated query to connect BigQuery directly to SQL Server. If you are curious about federated queries, you can look at the following documentation - <a href="https://cloud.google.com/bigquery/docs/cloud-sql-federated-queries" target="_blank">Federated queries documentation</a></p>

<p>After that, you stumbled upon this request:</p>

<p><em>“We want to analyse the evolution of our catalogue over time with a granularity by day. We want to compare several days among them as well. We don’t have access to the event table, only to the state table.”</em></p>
</li>
<li>
<p>In the previous question, we export the <code>current_state</code> of the product table to BigQuery on an hourly basis. What additional action do we need to meet this need?</p>

<p>Note:(optional) - We could use “Schedule query” to take a snapshot of the product table and historize it on a daily basis using a <code>date_snapshot</code> column. If you are curious about Scheduled queries, you can look at the following documentation - <a href="https://cloud.google.com/bigquery/docs/scheduling-queries" target="_blank">Schedule query documentation</a></p>

<h3 id="b---circle---funnel-analysis-1">B - Circle - Funnel Analysis</h3>

<p>Circle has the following need:</p>

<p><em>“The current view of the funnel analysis is available as a table of states in a Google Sheet. However, we would like to save each progress report to calculate and analyse the conversion and time between each step over time. What kind of export method can we use to do this?”</em></p>
</li>
<li>
<p>What method of data transfer do you recommend to meet the following business needs and technical requirements?</p>

<p>On top of that, Circle wants to resolve this business need:</p>

<p><em>“We would like to use trigger-based CDC to record this data from Google Sheet to BigQuery. The volume of data is small.”</em></p>
</li>
<li>
<p>Can you think of EL tools to do this?</p>
</li>
</ol>



</div>
</div>