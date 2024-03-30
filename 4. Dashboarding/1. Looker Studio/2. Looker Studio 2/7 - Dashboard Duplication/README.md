<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p><a href="https://lookerstudio.google.com/u/0/reporting/28369da9-839e-436b-b721-a7e87b71def0/page/p_qgyz9jyr0c" target="_blank">Solution</a></p>

<p><br></p>

<h2 id="introduction">Introduction</h2>

<p>There are many <strong>reasons</strong> for <strong>duplication</strong> of tables or pages.</p>

<ul>
<li>
<p>Different countries or business units</p>
</li>
<li>
<p>Additional <strong>measures</strong> for point-in-time analysis</p>
</li>
<li>
<p>Different <strong>time granularity</strong> for analysis</p>
</li>
<li>
<p>Different levels of <strong>dimensional</strong> granularity.</p>
</li>
</ul>

<p>Yet duplication is a nightmare for data teams. It increases the time spent on low value-added tasks:</p>

<ul>
<li>
<p>maintenance of dashboards</p>
</li>
<li>
<p>debugging in case of <strong>errors</strong> or <strong>renaming</strong> of columns</p>
</li>
<li>
<p>adding new metrics, dimensions, granularities</p>
</li>
<li>
<p>evolution of the <strong>chart</strong>.</p>
</li>
</ul>

<p>In this exercise, we will see how to limit duplication where possible. We will once again work with data from Greenweez media.</p>

<ol>
<li>
<p>Make a copy of the <a href="https://lookerstudio.google.com/reporting/65991f9c-3751-4674-9ece-ab8ba3309e04" target="_blank">De-duplication</a> dashboard and rename it with your first name. When copying the report, perform the following process in order to have editing rights on the data source.</p>

<p>When you created your new data sources, the calculated ROAS field may not have been created. The ROAS field is often used in charts.</p>
</li>
<li>
<p>Create the <code>ROAS column</code> at the source level on your data source. Add it to the corresponding graph to get the same visualisation as on this <a href="https://lookerstudio.google.com/reporting/65991f9c-3751-4674-9ece-ab8ba3309e04" target="_blank">original page</a>. You should add it only on the main results page.</p>

<details>
<summary>Hint</summary>

<p>The ROAS is the ratio between the <code>sum of turnover</code> and the <code>sum of cost</code></p>
</details>

<details>
<summary>Solution</summary>

<p><strong>Add calculated field ROAS</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-1-Untitled.png" alt=""></p>

<p><strong>Add ROAS on the page main results on the relevant charts</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-2-Untitled.png" alt=""></p>

<p><strong>Final result</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-3-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h2 id="clicks--impressions">Clicks &amp; Impressions</h2>

<p>The media team sometimes wants to analyse click and impression statistics. So your new hire has duplicated the main results page. She called this page <strong>Clicks and Impressions</strong> and changed the metrics in some of the charts to show clicks and impressions. This meets the business need. However, it generates unnecessary duplication.</p>

<p>We will look at how to remove this duplicate page using optional metrics and pre-filtered links. The goal is to add all the necessary information to the main results page to remove the <strong>Clicks &amp; Impressions</strong> page.</p>

<p>You can view the <strong>Clicks &amp; Impressions</strong> page to evaluate your recruit’s work.</p>

<p><br></p>

<h3 id="add-optional-metrics">Add optional metrics</h3>
</li>
<li>
<p>First, create the <code>CTR ratio</code> at the source level. Don’t forget to set the default data type to percentage!</p>

<details>
<summary>Hint</summary>

<p>The Click-Through-Rate is the ratio between the sum of click and the sum of impression</p>
</details>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-4-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Then, on the main results page, add in the appropriate graphs the relevant optional metrics (clicks, impressions or CTR) to be able to mimic the Clicks &amp; Impressions page.</p>

<details>
<summary>Hint</summary>

<p><strong>On scorecard nb_session</strong> - activate optional metrics and add impression in the optional metrics
<strong>On scorecard nb_transcation</strong> - activate optional metrics and add click in the optional metrics
<strong>On time series chart</strong> - add click, impression and CTR in the optional metrics
<strong>On the table chart</strong> - activate optional metrics and add impression, click and CTR in the optional metrics</p>
</details>

<details>
<summary>Solution</summary>

<p><strong>On scorecard nb_session</strong> - activate optional metrics and add impression in the optional metrics
<strong>On scorecard nb_transcation</strong> - activate optional metrics and add click in the optional metrics
<strong>On time series chart</strong> - add click, impression and CTR in the optional metrics
<strong>On the table chart</strong> - - activate optional metrics and add impression, click and CTR in the optional metrics
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-5-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>In the display mode, the “main results” page uses the optional settings to display the same results as the “clicks and views” page.</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-6-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h3 id="edit-summary-page--add-the-redirection-link">Edit Summary Page &amp; Add the Redirection Link</h3>

<p>You want to save this page view with a pre-filtered link and add a redirect link to the summary page. Let’s start by editing the summary page.</p>
</li>
<li>
<p>Copy and paste the <u>_descriptive bloc main results_</u>. Edit it to describe the information on the “clicks &amp; impressions” page.</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-7-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Save the view of question 5 on the “main results” page as a pre-filtered link. On the summary page, in the newly-created “clicks &amp; impressions” descriptive block, add a hyperlink to the “<strong>link here”</strong> text to redirect to the pre-filtered link. Check that it works correctly.</p>

<details>
<summary>Solution</summary>

<p>Copy <strong>the pre-filtered link on page Main results</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-8-Untitled.jpeg" alt=""></p>

<p><strong>Adding an hyperlink on page Summary</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-9-Untitled.jpeg" alt=""></p>

</details>

<p>The media team can now use the summary page to access click and impression results. It opens the main results page with the filter selection. The “clicks &amp; impressions” page is no longer useful. We will remove it later.</p>

<p><br></p>

<h2 id="sea-non-branded---google">SEA non-branded - Google</h2>

<p>The media team often wants to analyse the filtered statistics on the SEA-unbranded channel and the Adwords paid source with channel granularity. So your new hire duplicated the main results page. You called the page <strong>SEA non-branded - Google</strong>. You changed the dimension in the table from <code>paid_source</code> to <code>channel</code> and set the default filter on the page to <code>Adwords</code> for <code>paid_source</code> and <code>unbranded</code> SEA for the <code>channel</code> group. This meets the business need. However, it generates unnecessary duplication.</p>

<p>We will look at how to remove this duplicated page using drilling and pre-filtered links. The goal is to add all the necessary information to the main results page to remove the <strong>SEA non-branded - Google</strong> page.</p>

<p>You can check the <strong>SEA unbranded - Google</strong> page to see how well your recruit is doing.</p>

<p><br></p>

<h3 id="add-drill-down-on-the-table-chart">Add Drill-down on the Table Chart</h3>
</li>
<li>
<p>On the main results page, add a drill-down on the table with <code>paid_source</code>, <code>channel_grouping</code>, <code>channel</code> and <code>campaign</code>.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-10-Untitled.jpeg" alt=""></p>

</details>
</li>
<li>
<p>In view mode, on the “<strong>main results”</strong> page, use the drill-down and the filter controls to display the same results as the “<strong>SEA non-branded - Google”</strong> page.</p>

<p>In the view mode, on the “main results” page, use the drill down and filter controls to display the same results as on the “<strong>SEA non-branded - Google”</strong> page.</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-11-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h3 id="edit-summary-page--add-the-redirection-link-1">Edit Summary Page &amp; Add the Redirection Link</h3>

<p>You want to save this page view with a pre-filtered link and add a redirect link to the summary page. Let’s start by editing the summary page.</p>
</li>
<li>
<p>Copy and paste the <u>_descriptive bloc main results_</u>. Edit it to describe the information related to the “<strong>SEA non-branded - Google”</strong> page.</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-12-Untitled.jpeg" alt=""></p>

</details>
</li>
<li>
<p>Save the view of question 9 on the “<strong>main results”</strong> page as a pre-filtered link. On the “summary” page, in the newly created descriptive “<strong>SEA non-branded Google”</strong> block , add a hyperlink to the “<strong>link here”</strong> text to redirect to the pre-filtered link.</p>

<details>
<summary>Solution</summary>

<p>Copy <strong>the pre-filtered link on page Main results</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-13-Untitled.jpeg" alt=""></p>

<p><strong>Adding an hyperlink on page Summary</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-14-Untitled.png" alt=""></p>

</details>

<p>The media team can now use the “summary” page to access SEA non-branded Google results. It opens the “main results page” with the filter selection. The “SEA non-branded Google” page is no longer useful. We will remove it later.</p>

<p><br></p>

<h2 id="month-analysis">Month Analysis</h2>

<p>The media team often wants to analyse the filtered year-to-date statistics (1 January 2021 - 31 August 2021) with a month-by-month granularity on the time series graph. So your new recruit has duplicated the main results page. You have called the page <strong>Analysis by Month</strong>. You have changed the date dimension in the time series graph from <code>date_date</code> to <code>year-month</code> and set the default date range control to June 1, 2021 to August 21, 2021. This meets the business need. However, it generates unnecessary duplication.</p>

<p>We’ll look at how to remove this duplicate page using drilling and pre-filtered links. The objective is to add all the necessary information to the “main results” page in order to remove the “<strong>Monthly Analysis”</strong> page.</p>

<p>You can visit the “<strong>Monthly Analysis”</strong> page to review your recruit’s work.</p>

<p><br></p>

<h3 id="add-drill-down-on-the-table-chart-1">Add Drill-down on the Table Chart</h3>
</li>
<li>
<p>On the main results page, add a drill down on the time series graph with <code>Year_Month</code>, <code>Week</code> of the ISO year and <code>Date_date</code>.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-15-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>In view mode, on the “main results” page, use the drill-down and date range controls to display the same results as on the “Monthly Analysis” page.</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-16-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h3 id="edit-summary-page--add-the-redirection-link-2">Edit Summary Page &amp; Add the Redirection Link</h3>

<p>You want to save this page view with a pre-filtered link and add a redirect link to the summary page. Let’s start by editing the summary page.</p>
</li>
<li>
<p>Copy and paste the <u>_descriptive bloc main results_</u>. Edit it to describe the information related to the <strong>Month analysis</strong> page.</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-17-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Save the view of <strong>question 13</strong> on the “m<strong>ain results”</strong> page as a <strong>pre-filtered link</strong>. On the “summary” page, on the newly created <strong>Month analysis</strong> description block, add a hyperlink to the “<strong>link here”</strong> text to redirect to the pre-filtered link.</p>

<details>
<summary>Solution</summary>

<p>Copy <strong>the pre-filtered link on page Main results</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-18-Untitled.png" alt=""></p>

<p><strong>Adding an hyperlink on page Summary</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-19-Untitled.png" alt=""></p>

</details>

<p>The media team can now use the “summary” page to access the results of the monthly analysis. This opens the “main results” page with the filter selection. The “<strong>Monthly Analysis”</strong> page is no longer useful. We will remove it later.</p>

<h2 id="adding-the-cac-metrics">Adding the CAC Metrics</h2>

<p>The <code>CAC</code> is a very important measure for the media team to monitor. We want to calculate the aggregate measures at the data source level and add them to most charts in the optional measures.</p>
</li>
<li>
<p>Create the <code>CAC</code> (cost of acquisition) key figure at source level. Do not forget to set the default data type to € currency.</p>

<details>
<summary>Hint</summary>

<p>The <code>CAC</code> is the cost spent to generate a transaction.</p>
</details>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-20-Untitled.png" alt=""></p>

</details>

<p><strong>We would like to add it as an optional metrics on:</strong></p>

<ul>
<li>the last <code>scorecard</code> (<code>nb_transaction</code>), the <code>time series_chart</code> and the <code>table</code> chart.</li>
</ul>
</li>
<li>
<p>On the main results page, add the <code>CAC</code> metrics as optional metrics to the relevant charts.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-21-Untitled.png" alt=""></p>

</details>

<p>With your summary page and the pre-filtered link, all you have to do is make the change on the main result page. The other pages are no longer useful. Had you not created the “summary” page, you would have had to make the change on the other 3 pages to add the <code>CAC</code> to each chart. Creating a summary page with pre-filtered links allows you to limit duplication and save a lot of time in the future.</p>
</li>
<li>
<p>Remove unnecessary pages - <strong>Clicks &amp; Impressions, SEA non-branded - Google, Month analysis</strong>.</p>

<details>
<summary>Guiding Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/07-Dashboard-Duplication-asset-22-Untitled.jpeg" alt=""></p>

</details>

<p>🎉&nbsp;Congratulations on completing this exercise. 🎉</p>
</li>
</ol>



</div>
</div>