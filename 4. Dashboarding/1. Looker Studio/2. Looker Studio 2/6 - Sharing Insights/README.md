<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p><br></p>

<h3 id="relevant-links-for-this-challenge">Relevant links for this challenge</h3>

<p><a href="https://lookerstudio.google.com/u/0/reporting/70558526-6948-406e-bdc4-6cab93a61ecd/page/bAP6C" target="_blank">Looker Studio</a></p>

<p><br></p>

<h2 id="introduction">Introduction</h2>

<p>It is essential to communicate your ideas about data across the company or with partners. Many people share screenshots, Excel files or bullet points on Google slides. This can be time consuming to prepare, not interactive, not always clear and not very secure.</p>

<p>Fortunately, Looker studio offers solutions to share your data analysis very easily.</p>

<ul>
<li>
<p>Scheduling the email to be sent</p>
</li>
<li>
<p>Pre-filtered link</p>
</li>
</ul>

<p>In this exercise, we will see how to do this. You will be working on the Greenweez Media team dashboard.</p>

<p><br></p>

<h2 id="context">Context</h2>

<h3 id="greenweez-presentation">Greenweez Presentation</h3>

<p>🪴&nbsp;Greenweez is an organic e-commerce website.</p>

<p>🏷️&nbsp;It sells to B2C customers various products for a healthier and more sustainable lifestyle.</p>

<p>💻&nbsp;Greenweez only sells online and does not have a physical shop. To make itself known and attract new customers, online advertising is essential.</p>

<p>📺&nbsp;This is the role of the media team.</p>

<p><br></p>

<h3 id="media-team">Media Team</h3>

<p>The media team manages online advertising and the various acquisition channels to maximise acquisition within a limited budget.</p>

<p>The main tasks of the media acquisition team are:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-1-Untitled.png" alt=""></p>

<p>Here are the main KPIs to track for the media team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-2-Untitled.png" alt=""></p>

<p><br></p>

<h3 id="dashboard-use">Dashboard Use</h3>

<p>The media team uses this dashboard to monitor paid media acquisition performance on the paid source, channel and campaign with different time granularities (<code>year</code>, <code>month</code>, <code>week</code>).</p>

<ol>
<li>
<p>Make a copy of the <a href="https://lookerstudio.google.com/reporting/70558526-6948-406e-bdc4-6cab93a61ecd" target="_blank">Media dashboard</a> dashboard and rename it with your first name. When copying the report, perform the following process in order to have editing rights on the data source.</p>

<details>
<summary>Screenshot</summary>

<p><em>The tables on the screenshots are not the same as in this exercise. But the process is the same.</em>
<strong>1 - Select the data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-3-Untitled.jpeg" alt=""></p>

<p><strong>2 - Click on Create a data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-4-Untitled.jpeg" alt=""></p>

<p><strong>3 - Select Bigquery</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-5-Untitled.png" alt=""></p>

<p><strong>4 - Select the relevant table</strong>
Select the project <strong>data-analyst-bootcamp</strong>, select the dataset of the <strong>current course</strong>, select the <strong>relevant table</strong> depending on the dashboard and click on <strong>connect</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-6-Untitled.png" alt=""></p>

<p><strong>5 - Click on add to report</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-7-Untitled.png" alt=""></p>

<p><strong>6 - Copy the report</strong>
Once your data sources are ok, <strong>copy the report</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-8-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Quickly analyse the main results page. Understand the meaning of the different graphs and the main information of this dashboard.</p>

<p><strong>Warning</strong>: when copying the report, you might lose the calculated field <code>ROAS</code> so you should add it again to the data source and replace the charts where you have a metric <code>Record Count</code> by the newly-calculated ROAS</p>

<details>
<summary>Hint</summary>

<p>ROAS formula is: <code>SUM(turnover)/SUM(cost)</code></p>
</details>

<p><br></p>

<h2 id="download-report">Download Report</h2>

<h3 id="download-usage">Download Usage</h3>

<p>Downloading a static report is not a very good practice because:</p>

<ul>
<li>
<p>the data is not automatically refreshed with the latest figures</p>
</li>
<li>
<p>the figures in the report are not protected by an access control system.</p>
</li>
</ul>

<p>However, it can sometimes be very useful to</p>

<ul>
<li>
<p>to have a shared view of important information within a team or company</p>
</li>
<li>
<p>to report to a manager or the board of directors</p>
</li>
<li>
<p>to print a hard copy of the report for an important meeting</p>
</li>
<li>
<p>to export company results to shareholders</p>
</li>
</ul>

<p>Looker studio offers a solution to download your report in PDF format:</p>

<ul>
<li>
<p>with a link to the report so that people can access the latest data if required</p>
</li>
<li>
<p>with a password to protect access</p>
</li>
<li>
<p>with the ability to ignore the background to save ink when printing the report.</p>
</li>
</ul>

<p><br></p>

<h2 id="prepare-the-media-review">Prepare the Media Review</h2>

<p>The marketing team organises a fortnightly meeting where each team presents its main results and trends. To prepare for this meeting, each department prints out a summary sheet.</p>
</li>
<li>
<p>You are part of the media team and need to create the summary sheet.</p>

<p>Using the arrow at the top right, download the report:</p>

<ul>
<li>
<p>Select only the main results page.</p>
</li>
<li>
<p>In the advanced settings</p>

<ul>
<li>
<p>remove the background colour</p>
</li>
<li>
<p>add a link back to the report</p>
</li>
<li>
<p>add a password</p>
</li>
</ul>
</li>
</ul>

<p>Try opening the pdf in your browser. Is it password protected? Can you find the link to go back to the online report with the latest data <em>(certainly in the top left menu)</em>?</p>

<p><br></p>

<h2 id="schedule-email-delivery">Schedule Email Delivery</h2>

<h2 id="mail-scheduling-usage">Mail Scheduling Usage</h2>

<p>In many companies, most employees are glued to their mailboxes and meeting agendas. To get them to use data tools, it is therefore necessary to get their attention on the mailbox. Email scheduling is the perfect feature for this.</p>

<p>For example, it can be used for the following purposes:</p>

<ul>
<li>
<p>Scheduling a report to a manager or director.</p>
</li>
<li>
<p>Regular monitoring of a specific dashboard by the sales team</p>
</li>
<li>
<p>Reminding an employee to perform a specific task on a dashboard at a fixed frequency.</p>
</li>
</ul>

<p><br></p>

<h2 id="schedule-a-media-reporting-to-the-ceo">Schedule a Media Reporting to the CEO</h2>

<p>Every Monday at 8 o’clock, the CEO wants a report on the performance of the media.</p>
</li>
<li>
<p>Using the arrow at the top right, schedule an email to the CEO every Monday at 8am with only the main results page. Customise the subject line and message of the email. Send it to your address and your friend’s address.</p>

<p><u>_**Note**_</u><em>- you can change the time, if you are curious and want to see what the email looks like without waiting for the next Monday morning.</em></p>

<p><u>_**Note**_ </u><em>- You can only set one schedule at a time</em></p>

<h2 id="pre-filtered-link">Pre-filtered Link</h2>

<p>Pre-filtered links are a very useful and powerful option. The concept is quite simple. You generate a link that allows you to share your page report with someone. In addition, the link can save the current filter selection.</p>

<p>The benefits are numerous</p>

<ul>
<li>
<p>fresh data -&gt; up-to-date data when opening the dashboard</p>
</li>
<li>
<p>secure access -&gt; access to the dashboard requires the necessary rights</p>
</li>
<li>
<p>specific insights -&gt; filter selection is saved to highlight relevant insights</p>
</li>
<li>
<p>interactive graphics -&gt; possibility to deepen the analysis directly on the dashboard.</p>
</li>
</ul>

<p>The uses are numerous:</p>

<ul>
<li>
<p>share access to a dashboard</p>
</li>
<li>
<p>highlight a problem to be corrected as soon as possible</p>
</li>
<li>
<p>report to management the requested in-depth analysis of the drop in performance</p>
</li>
<li>
<p>save the regular selection of filters often used to perform analyses or duplications</p>
</li>
<li>
<p>avoid duplication of pages or charts on your dashboards.</p>
</li>
<li>
<p>….</p>
</li>
</ul>

<p><br></p>

<h2 id="roas--turnover-analysis">ROAS &amp; Turnover Analysis</h2>

<p>The <code>ROAS</code> and <code>turnover</code> were particularly good on 20 August. The media team manager asks you to analyse which channel explains these good results.</p>
</li>
<li>
<p>Use the interactivity of the timeline graph to select only 20 August. Which paid source has the highest <code>turnover</code>? What can you say about the <code>ROAS</code> of the paid source in relation to the overall period?</p>

<details>
<summary>Screenshot</summary>

<p><em>The main paid_source is adwords. The ROAS on the 20th August is 6.2€ wheras it was only 4.7€ on the overall period. It represent a huge increase.</em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-9-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>With the page filter at the top, select only Adwords as a paid source. On the table, scroll down to the channel level. Compare the revenue and <code>ROAS</code> generated by the <strong>SEA - Text - Google</strong> channel on 20 August against the overall period. What can you tell?</p>

<details>
<summary>Screenshot</summary>

<p>There was an over performance of the SEA text on the 20th August.</p>
<ul>
<li>huge increase of the ROAS of the SEA text - 8.7€ vs 3.1€</li>
<li>2nd channel in term of turnover instead of 4th
<strong>20th August only</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-10-Untitled.png" alt=""></li>
</ul>

<p><strong>Overall period</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-11-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>With the page filter at the top select only <strong>SEA - Text - Google</strong> as channel. On the table chart, drill-down to the campaign level. What can you say ?</p>

<p>With the page filter at the top, select only <strong>SEA - Text - Google</strong>  as the channel. In the table chart, drill-down to the campaign level. What can you tell?</p>

<details>
<summary>Screenshot</summary>

<p><em>The campaign “__<strong>SEA - TXT Couche”</strong></em> <em>has a very high ROAS. It generated 2.7k€ turnover with only 12€ cost. 2.7k is almost the difference of turnover between the 18th August and the 17th August —&gt; the exceptionnal performance of the campaign</em> <em><strong>SEA - TXT couche</strong>__explains the good turnover and ROAS the 18th August.</em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-12-Untitled.jpeg" alt=""></p>

</details>

<p>You want to share your analysis to the media team manager. You want your filter selection to be saved —&gt; Use pre-filtered link.</p>
</li>
<li>
<p>Using the arrow on the top right, copy the pre-filtered link of your analysis. Open it in a new tab and verify your filter selection is saved.</p>

<p>The media manager will see your analysis as relevant and can play with the filters to compare channels and periods.</p>

<p>🎉 Well done! It’s a good job and a relevant analysis 🎉</p>

<p><u>_**Note**_</u> -</p>

<p>The manager analysed the results a bit more as they seemed a bit surprising.</p>

<p>The manager added <code>nb_transactions</code> in the optional metrics and noticed that there were only 2 transactions involved in the “ATS -TXT - Layer” campaign.</p>

<p>The large turnover is explained by a large single order from a B2B customer.</p>

<p>This is an anomaly and not an improvement in the <code>ATS</code> KPI.</p>

<p>→ It is important to mark B2B orders and customers correctly in order to exclude large one-off B2B orders from our performance analysis. We also need to be careful not to over-analyse.</p>

<details>
<summary>Screenshot </summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/06-Sharing-Insights-asset-13-Untitled.png" alt=""></p>

</details>

<p>In the next exercise on duplication, we will also see how pre-filtered links can be very effective in avoiding duplication.</p>
</li>
</ol>



</div>
</div>