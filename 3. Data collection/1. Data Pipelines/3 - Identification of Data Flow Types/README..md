<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<h2 id="introduction">Introduction</h2>

<h3 id="data-flow-type">Data Flow Type</h3>

<p>There are different types of data flows to meet different business needs:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/03-Data-Flow-Types-Identification-asset-1-Untitled.png" alt=""></p>

<h3 id="data-flow-tools">Data Flow Tools</h3>

<p>There are many different EL tools for different types of data flows:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/03-Data-Flow-Types-Identification-asset-2-Untitled.png" alt=""></p>

<p>We will focus on different business use cases 🚀</p>

<p>For each use case, the objective of the exercise is to:</p>

<ul>
<li>
<p>identify the <strong>business tools</strong> involved in the data flow</p>
</li>
<li>
<p>identify the frequency of synchronization required - <em>real time, hourly or daily</em></p>
</li>
<li>
<p>determine the types of data flows relevant to the requirement - <code>Tools → Tools</code> or <code>Tools → Data</code></p>
</li>
<li>
<p>select the different <strong>EL</strong> tools available to meet the requirement.</p>
</li>
</ul>

<h2 id="1---circle-business-case">1 - Circle Business Case</h2>

<p>Here is an overview of some of the business tools used by Circle.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/03-Data-Flow-Types-Identification-asset-3-Untitled.png" alt=""></p>

<h3 id="a---circle-use-case-1---prospects-tracking-">A - Circle Use Case 1 - Prospects Tracking 📊</h3>

<p>Circle does B2B prospecting to sell their clothing to resellers and companies. They send emails with a B2B acquisition form to prospects (using Typeform). When a prospect fills out the form, it creates a customer record in the sales team’s funnel tracking tool (Trello). The prospect is then included at the beginning of the sales funnel and the sales team can have appropriate communication and follow-up. Circle does not yet have a highly available data team or a data platform.</p>

<ol>
<li>
<p>Answer these questions:</p>

<ul>
<li>
<p>What <strong>business tools</strong> are involved in this use case?</p>
</li>
<li>
<p>What is the relevant frequency of synchronization - <em>real time, hourly, daily</em>?</p>
</li>
<li>
<p>Which type of data flow should be implemented - <code>Tools → Tools</code> or <code>Tools → Data</code>?</p>
</li>
<li>
<p>What types of EL tools can be used for this use case, taking into account the characteristics of the company - Zapier, n8n, make, whaly, stitch, Fivetran, Airbyte, Airflow, Kafka?</p>
</li>
</ul>

<p>Did you answer the same as your buddy?</p>
</li>
</ol>

<h3 id="b---circle-use-case-2---return-monitoring-">B - Circle Use Case 2 - Return Monitoring 🔎</h3>

<p>The company ships clothes to B2C customers. If there is a problem with size or quality, the customer can request a return and refund by filling a form with the order number (using Typeform). The process is currently very manual, with only one person responsible for handling the customer’s request. For each request, the person must:</p>

<ul>
<li>
<p>complete the “<strong>Return monitoring”</strong> file which is on Google Sheet</p>
</li>
<li>
<p>inform the <strong>Customer service</strong> via Slack to make a refund</p>
</li>
<li>
<p>update the “<strong>Stock monitoring”</strong> file on Google Sheet to allow the returned product to be sold again</p>
</li>
<li>
<p>update the “<strong>Finance”</strong> report file on Google Sheet to report the loss or refund of a product</p>
</li>
</ul>

<p>The data team of Circle is not very available and they have no data platform yet.</p>

<ol>
<li>
<p>Answer these questions:</p>

<ul>
<li>
<p>What <strong>business tools</strong> are involved in this use case?</p>
</li>
<li>
<p>What is the relevant frequency of synchronization - <em>real time, hourly, daily</em>?</p>
</li>
<li>
<p>Which type of data flow should be implemented - <code>Tools → Tools</code> or <code>Tools → Data</code>?</p>
</li>
<li>
<p>What types of EL tools can be used for this use case, taking into account the characteristics of the company - Zapier, n8n, make, whaly, stitch, Fivetran, Airbyte, Airflow, Kafka?</p>
</li>
</ul>

<p>Did you answer the same as your buddy?</p>
</li>
</ol>

<h2 id="2---greenweez-business-case">2 - Greenweez Business Case</h2>

<p>Here is an overview of some of the business tools used by Greenweez:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/03-Data-Flow-Types-Identification-asset-4-Untitled.png" alt=""></p>

<h3 id="a---greenweez-use-case-3---customer-segment-️">A - Greenweez Use Case 3 - Customer Segment 🛍️</h3>

<p>Greenweez wants to calculate customer segments based on the frequency of purchase. This information comes from the sales made on the website.</p>

<p>The process is the following:</p>

<ul>
<li>
<p>create <strong>BI</strong> reporting dashboards on Looker Studio to analyse sales by type of customer segment and to have a better understanding of the commercial activity</p>
</li>
<li>
<p>send information to the <strong>CRM</strong> tool to carry out advertising campaigns personalised to customer segments</p>
</li>
<li>
<p>display discount codes on the <strong>Website</strong> that are customised to the customer segment</p>
</li>
<li>
<p>create different campaign audiences on <strong>Google Ads</strong> according to customer segments</p>
</li>
</ul>

<p>Greenweez has a data team, a data platform and a BI tool.</p>

<ol>
<li>
<p>Answer these questions:</p>

<ul>
<li>
<p>What are the <strong>business tools</strong> concerned by this use case?</p>
</li>
<li>
<p>What is the relevant synchronisation frequency - <em>real time, hourly, daily</em>?</p>
</li>
<li>
<p>What type of data flow should be implemented -  <code>Tools → Tools</code> or <code>Tools → Data</code>?</p>
</li>
<li>
<p>What types of <strong>EL tools</strong> can be used for this use case, taking into account the characteristics of the company - Zapier, n8n, Make, Whaly, Stitch, Fivetran, Airbyte, Airflow, Kafka?</p>
</li>
</ul>

<p>Did you answer the same as your buddy?</p>
</li>
</ol>

<h3 id="b---greenweez-use-case-4---sales-forecasting-">B - Greenweez Use Case 4 - Sales Forecasting 📈</h3>

<p>The company wants to have its sales over the last 30 days aggregated by <strong>product</strong> to properly track product <strong>performance</strong>.</p>

<p>This metric has appears in multiple sources:</p>

<ul>
<li>
<p><strong>BI</strong> and reporting about <strong>stock</strong> and <strong>shortage</strong> - assessment of remaining stock in days</p>
</li>
<li>
<p><strong>BI</strong> and reporting for <strong>marketing</strong> to create relevant trade marketing operations</p>
</li>
<li>
<p><strong>BI</strong> for merchandising team to calculate product scoring and have a relevant sort list of products</p>
</li>
<li>
<p><strong>CRM</strong> tool to recommend the relevant products in mailing</p>
</li>
<li>
<p><strong>Ads</strong> to determine the best products to use in<strong>advertising campaigns</strong></p>
</li>
</ul>

<ol>
<li>
<p>Answer these questions:</p>

<ul>
<li>
<p>What are the <strong>business tools</strong> concerned by this use case?</p>
</li>
<li>
<p>What is the relevant synchronisation frequency - real time, hourly, daily?</p>
</li>
<li>
<p>What type of data flow should be implemented -  <code>Tools → Tools</code> or <code>Tools → Data</code>?</p>
</li>
<li>
<p>What types of <strong>EL tools</strong> can be used for this use case, taking into account the characteristics of the company - Zapier, n8n, Make, Whaly, Stitch, Fivetran, Airbyte, Airflow, Kafka?</p>
</li>
</ul>

<p>Did you answer the same as your buddy?</p>
</li>
</ol>



</div>
</div>