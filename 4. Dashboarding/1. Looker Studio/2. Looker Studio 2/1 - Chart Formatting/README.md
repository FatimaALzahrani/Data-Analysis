<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<p><a href="https://lookerstudio.google.com/u/0/reporting/e7a986c7-39af-4c3e-a05b-178fd33370d5/page/bAP6C" target="_blank">Solution</a></p>

<p><br></p>

<h3 id="-relevant-links-for-this-challenge">🔗 Relevant links for this challenge</h3>

<p><a href="https://lookerstudio.google.com/reporting/69f205fa-b316-4b2b-947f-d9dc34030e74" target="_blank">Looker Studio</a></p>

<h3 id="data-sources">Data Sources</h3>

<p><a href="http://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse22!3sasso_engagement" target="_blank">asso_engagement</a></p>

<p><a href="http://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse22!3sasso_accounting" target="_blank">asso_accounting</a></p>

<p><a href="http://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse22!3sasso_website" target="_blank">asso_website</a></p>

<p><a href="http://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse22!3sasso_crm" target="_blank">asso_crm</a></p>

<p><a href="http://console.cloud.google.com/bigquery?ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse22!3sasso_collect" target="_blank">asso_collect</a></p>

<h3 id="final-result-of-the-formatting-of-the-charts">Final result of the formatting of the charts:</h3>

<p><a href="https://drive.google.com/file/d/1EOIfDelmCRdx_RUh1pSlG95z6MQah9jG/view?usp=drive_link" target="_blank">Chart Formatting Example</a></p>

<p><br></p>

<p>In this exercise, you will work on modifying the style of the charts.</p>

<p>The correct formatting of your chart is essential to enable proper visualisation and understanding of the data by the business team.</p>

<p>Poor data visualisation will lead to inaccurate analysis, confusion, and prevent user adoption of the dashboard.</p>

<p>Even if you have done all the previous steps of the modern data stack process correctly (identifying the business need, understanding the data source, extracting and loading, transforming, defining the chart), poor chart formatting can ruin all your efforts.</p>

<p>We will use AssoConnect data on product engagement.</p>

<p><br></p>

<h2 id="introduction">Introduction</h2>

<h3 id="assoconnect-presentation">AssoConnect Presentation</h3>

<p>🌐&nbsp;AssoConnect is a management software dedicated to associations. It develops several software services:</p>

<ul>
<li>
<p>accounting software to control accounts and finances 💶</p>
</li>
<li>
<p>a payment solution 💳</p>
</li>
<li>
<p>a CRM tool to manage contacts and communication 📩</p>
</li>
<li>
<p>a web interface to help associations create and maintain their website 🌐</p>
</li>
</ul>

<p>Interested associations can do a free trial and if this is successful, they become paying customers. 🫂</p>

<p><br></p>

<h2 id="product-team">Product Team</h2>

<p>The product team is responsible for optimising the product to make it easier to use, increase conversion and increase the perceived value to customers. The main tasks of this team are:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/01-Chart-Formatting-asset-1-Untitled.png" alt=""></p>

<h3 id="objectives">Objectives</h3>

<p>In Looker Studio, you will start to use the style tab to properly format graphics.</p>

<p>There are many, many options for formatting graphics. It can be a little confusing at first. Don’t worry, you don’t need to understand and master them all right away. The only way to learn is to practice and stay curious.</p>

<p>Step by step, you will improve and become master in chart formatting. 🦸🏻‍♀️🦸🏿‍♂️</p>

<p><br></p>

<h3 id="data-discovery">Data Discovery</h3>

<p>In this exercise, we will work with the AssoConnect engagement data.</p>

<p>Open the <a href="https://lookerstudio.google.com/reporting/69f205fa-b316-4b2b-947f-d9dc34030e74" target="_blank">Chart formatting</a> Looker Studio. Look at the different tables - <code>asso_engagement</code>, <code>asso_collect</code>, <code>asso_crm</code>, <code>asso_accounting</code>, <code>asso_website</code>.</p>

<p>Charts format pdf: <a href="https://drive.google.com/file/d/1EOIfDelmCRdx_RUh1pSlG95z6MQah9jG/view?usp=drive_link" target="_blank">chart formatting solution</a></p>

<ol>
<li>
<p>Understand the structure of the table and the link between them.</p>

<details>
<summary>Data Dictionary 📚</summary>

<p><code>asso_engagement</code>
<em>In this table, we have aggregated by</em> <em><strong>association name</strong>__and</em> <em><strong>day</strong>__all the main KPIs regarding the adoption and engagement of each tool (collect, CRM, accounting, website).</em> 
<em>This is the main table as all the information is available in one place. However, to visualize the use and engagement of a specific tool, we may need to use the dedicated tables - asso_collect, asso_crm, asso_accounting, asso_website.</em>
<em>In asso_engagement, you have one line per association and per day:</em></p>
<ul>
<li><em><strong>date_date -</strong>__the date</em></li>
<li><em><strong>name</strong>__- the name of the association</em></li>
<li><em><strong>adoption</strong></em> <em>- 1 if it is the date of subscription of the association, null otherwise. This column can be added or counted to get the number of adoptions over a chosen period.</em></li>
<li><em><strong>trial</strong></em> <em>- 1 if it is the start date of the association’s trial, null otherwise. This column can be added or counted to get the number of trials over a chosen period.</em></li>
<li><em><strong>adoption_rate</strong></em> <em>- 1 if adoption is equal to 1, 0 if test is equal to 1 (and adoption is null) and null otherwise. This column can be averaged to obtain the adoption_rate over a chosen period. It is preferable to display it as a percentage.</em></li>
<li><em><strong>collect_nb</strong></em> <em>- the number of collections made by the association on that date. This is the main engagement KPI of the collect tool. We can add up this column to get the number of collections over a given period or association.</em></li>
<li><em><strong>crm_search</strong></em> <em>- the number of crm_search carried out by the association at that date. This is the main engagement KPI of the crm tool. We can add up this column to get the crm_search  performed over a given period or association.</em></li>
<li><em><strong>accounting_page</strong></em> <em>- the number of accounting_page produced by the association at that date. This is the main engagement KPI of the accounting tool. This column can be added up to get the number of accounting pages for a given period or association.</em></li>
<li><em><strong>web_page</strong></em> <em>- the number of web_page created by the association at that date. This is the main engagement KPI of the website tool. This column can be added up to get the number of web pages for a given period or association.</em>
<u>_**asso_collect**_</u><em>- The collection of information on the engagement. List of all collections made by association with date and collect_type. The column collect_type can allow us to use it as a dimension for the visualization of some graphs, which is not possible in the table asso_engagement.</em>
<u>_**asso_website**_</u><em>- The website information about engagement. List of all pages of the website visited by external users or edited by internal members of the association. Having the column page_type can allow us to use it as a dimension for the visualization of some graphs, which is not possible in the table asso_engagement.</em>
<u>_**asso_crm**_</u><em>- The crm information about engagement by association and by date.  Similar to the information already present in the asso_engagement table.</em>
<u>_**asso_accounting**_</u><em>- The accounting information about engagement by association and by date. Give the different pages used in the accounting tool. The fact of having the pages can allow us to make an analysis of the use by page which would not be possible with the aggregated table asso_engagement.</em></li>
</ul>
</details>
</li>
<li>
<p>Determine the dimensions of the different tables - <code>asso_engagement</code>, <code>asso_collect</code>, <code>asso_crm</code>, <code>asso_accounting</code>, <code>asso_website</code>.</p>
</li>
<li>
<p>Determine the metrics of the different tables - <code>asso_engagement</code>, <code>asso_collect</code>, <code>asso_crm</code>, <code>asso_accounting</code>, <code>asso_website</code>.</p>

<p>Copy the <a href="https://lookerstudio.google.com/reporting/69f205fa-b316-4b2b-947f-d9dc34030e74" target="_blank">Chart formatting</a> Looker Studio dashboard and rename it with your first name.</p>

<p>Switch to Edit mode to ensure that you have correctly identified the dimensions and metrics directly on the chart.</p>

<p><u>_**Note**_</u> <em>- To avoid (or correct) Looker Studio errors such as</em> <em><strong>“Failed To Get Data”</strong>__when copying the dashboard, you can perform the following process when selecting data sources.</em></p>

<p>You should add the tables in the following order when copying the report: <strong>asso_engagement</strong>, <strong>asso_accounting</strong>, <strong>asso_website</strong>, <strong>asso_crm</strong>, <strong>asso_collect.</strong></p>

<details>
<summary>Screenshots</summary>

<p><strong>1 - Select the data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/01-Chart-Formatting-asset-2-Untitled.jpeg" alt=""></p>

<p><strong>2 - Click on “Create a data source”</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/01-Chart-Formatting-asset-3-Untitled.jpeg" alt=""></p>

<p><strong>3 - Select Bigquery</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/01-Chart-Formatting-asset-4-Untitled.png" alt=""></p>

<p><strong>4 - Select the relevant table</strong>
Select the <strong>data-analyst-bootcamp</strong> project, select the <strong>dataset22</strong> dataset, select the relevant table according to the dashboard and click on <strong>connect</strong>.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/01-Chart-Formatting-asset-5-Untitled.png" alt=""></p>

<p>5 - Click on <strong>add to report.</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/01-Chart-Formatting-asset-6-Untitled.png" alt=""></p>

<p>6 - Copy the report
Once your data sources are ok, <strong>copy the report.</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/01-Chart-Formatting-asset-7-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h2 id="chart-formatting">Chart Formatting</h2>

<p>Now is the time to improve your dashboard design skills 🖌️🎨👩🏻‍🎨👨‍🎨</p>

<p>First read this article on <a href="https://medium.com/data-school/chart-types-in-data-studio-494b50c53033" target="_blank">Chart types in Looker Studio</a>.</p>

<p><strong>Video presentation of the exercise</strong> <em>- English</em></p>

<p><a href="https://drive.google.com/file/d/1C4W1z_OBuAltSVFIr_GJCJDYi7xSjjyx/view?usp=share_link" target="_blank">Video link here</a></p>
</li>
</ol>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/01-Chart-Formatting-asset-8-Presentation_-_Exercice_22_-_Chart_formatting.mp4" alt=""></p>

<p>In questions 3 to 11, you will have another opportunity to turn your graphics into more attractive graphics, giving them a facelift 💅🏾. Directly on Looker Studio, you will have to modify the left-hand graph to look more like the amazing graph on the right.</p>

<p>Don’t spend more than 10/15 minutes maximum on each graphic.</p>

<p>Additional Resources: <a href="https://medium.com/mlearning-ai/visualization-tips-for-data-story-telling-1e99cccbb8c7" target="_blank">Visualization Tip for Data Story Telling</a>.</p>



</div>
</div>