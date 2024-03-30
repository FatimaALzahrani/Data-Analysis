<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<hr>

<p><a href="https://lookerstudio.google.com/u/0/reporting/8eeff710-083b-4308-92cc-2838ae4f5da6/page/p_ilq7sorr0c/edit" target="_blank">Solution</a></p>

<hr>

<p>In this exercise, we will see how to create a calculated field on Looker studio.</p>

<p>We will work with data from Greenweez mail.</p>

<p><br></p>

<h3 id="quick-article">Quick Article</h3>

<ol>
<li>
<p>First read this quick article on <a href="https://medium.com/data-school/data-layers-in-data-studio-6ad52c3a9612" target="_blank">data sources and calculated fields</a>.</p>

<p><br></p>

<h3 id="data-preparation">Data Preparation</h3>
</li>
<li>
<p>Make a copy of the <a href="https://datastudio.google.com/u/0/reporting/9a988ade-b78d-43dc-90c9-b36cc29db60a/page/bAP6C" target="_blank">23 - Calculated fields</a> dashboard and rename it with your first name. When copying the report, perform the following process in order to have modification rights on the data source.</p>

<details>
<summary>Screenshot</summary>

<p><strong>1 - Select the data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-1-Untitled.jpeg" alt=""></p>

<p><strong>2 - Click on Create a data source</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-2-Untitled.jpeg" alt=""></p>

<p><strong>3 - Select Bigquery</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-3-Untitled.png" alt=""></p>

<p><strong>4 - Select the relevant table</strong>
Select the project <strong>data-analyst-bootcamp</strong>, select the dataset of the <strong>current course</strong>, select the <strong>relevant table</strong> depending on the dashboard and click on <strong>connect</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-4-Untitled.png" alt=""></p>

<p><strong>5 - Click on add to report</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-5-Untitled.png" alt=""></p>

<p><strong>6 - Copy the report</strong>
<em>Once your data sources are ok,</em> <em><strong>copy the report</strong></em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-6-Untitled.png" alt=""></p>

</details>

<p>Go on the first page of the dashboard - <u>_Standard calculations_</u></p>
</li>
<li>
<p>Identify and understand the different columns in the <code>gz_mail</code> table.</p>

<details>
<summary>Data Dictionary 📚</summary>

<p><em>In this table, you have one row for each newsletter</em></p>
<ul>
<li><em>date_date : the date when the newsletter was sent</em></li>
<li><em>journey_id : the unique identifier of the newsletter</em></li>
<li><em>journey_name : the name of the newsletter</em></li>
<li><em>sent_nb : the number of mails sent for the newsletter</em></li>
<li><em>opening_nb : the number of openings for the newsletter</em></li>
<li><em>click_nb : the number of clicks for the newsletter</em></li>
<li><em>nb_sessions : the number of sessions for the newsletter</em></li>
<li><em>turnover : the total turnover for the newsletter</em></li>
</ul>
</details>

<p><br></p>

<h2 id="standard-calculated-fields">Standard Calculated Fields</h2>

<p>We will see how to add standard calculated fields.</p>

<p><br></p>

<h3 id="add-a-new-metric">Add a New Metric</h3>
</li>
<li>
<p>Directly on the chart table, add a new metric calculated <code>diff_click_session</code> which is the difference between <code>click_nb</code> and <code>nb_sessions</code>.</p>

<details>
<summary>Hint</summary>

<p>diff_click_session = click_nb - nb_session</p>
</details>

<details>
<summary>Solution</summary>

<p><strong>Add a metric</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-7-Untitled.jpeg" alt=""></p>

<p><strong>Create a field</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-8-Untitled.jpeg" alt=""></p>

<p><strong>Calculate the field</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-9-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h3 id="add-a-new-dimension">Add a New Dimension</h3>
</li>
<li>
<p>Directly on the chart table, add a new calculated dimension <code>IS_BELGIUM</code> (in capital letters) which determines whether a newsletter comes from Belgium or not.</p>

<p><u>_**Note**_</u><em>-  Newsletters from Belgium have</em> <code>__nlbe__</code><em>in their name</em></p>

<p><u>_**Note**_</u><em>****</em> <em>- You can use</em> <em><a href="https://support.google.com/looker-studio/answer/9366283?hl=en" target="_blank">CONTAINS_TEXT()</a>__function from Looker studio (LIKE does not work)</em></p>

<details>
<summary>Hint </summary>

<p>The calculated field should say : IF the journey_name CONTAINS “<em>nlbe</em>” THEN 1 ELSE 0</p>
</details>

<details>
<summary>Solution</summary>

<p><strong>Add a dimension</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-10-Untitled.jpeg" alt=""></p>

<p><strong>Create a field</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-11-Untitled.jpeg" alt=""></p>

<p><strong>Calculate the field</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-12-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>How would you add a drop-down list filter on the <code>is_belgium</code><strong>** field</strong>?**</p>

<details>
<summary>Hint</summary>

<p>The question refers to where you would calculate the new field : chart-level or source-level</p>
</details>

<details>
<summary>Solution</summary>

<p><em>You should insert a new control field. In the control field, you should create a new field and recalculate the dimension</em> <em><strong>is_belgium</strong>__once again. It would be quite repetitive and tiring to do this on every charts. We will rather caclulate the field is_belgium on the data source level.</em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-13-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Open the data source listing and edit the <code>gz_mail</code> data source.</p>

<details>
<summary>Solution</summary>

<p><strong>1 - Data source listing</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-14-Untitled.png" alt=""></p>

<p><strong>2 - Edit gz_mail</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-15-Untitled.jpeg" alt=""></p>

</details>
</li>
<li>
<p>Add a new <code>is_belgium</code> field. Click on the <strong>Add a field</strong> button. Calculate and save the field. Return to the first page of the dashboard.</p>

<details>
<summary>Solution</summary>

<p><strong>Add a field</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-16-Untitled.jpeg" alt=""></p>

<p><strong>Calculate field</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-17-Untitled.jpeg" alt=""></p>

</details>
</li>
<li>
<p>Add a control filter with your newly created <code>is_belgium</code> column. In the table, replace the calculated dimension <code>IS_BELGIUM</code> with your new <code>is_belgium</code> column defined at the chart level.</p>

<details>
<summary>Solution</summary>

<p><strong>Add a control filter</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-18-Untitled.png" alt=""></p>

<p><strong>Replace IS_BELGIUM at the chart level by is_belgium at the data source level</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-19-Untitled.jpeg" alt=""></p>

</details>

<p>🎉 Congratulations! You have added calculated fields at the data source level. 🎉</p>

<h3 id="back-to-theory-">Back to Theory 🧐</h3>

<p>These are standard calculations with only a categorisation or an easy calculation without ratios. This can be useful when exploring the data or to give the company some autonomy when doing an in-depth analysis.</p>

<p>However, this should be done on an ad hoc basis and should not be systematically generalised. For these standard calculations, it is preferable to perform the transformation directly in the data warehouse (BigQuery). Using BigQuery allows :</p>

<ul>
<li>
<p>better governance with visibility of the transformation in our data lineage and therefore on our dbt documentation</p>
</li>
<li>
<p>control over the column with tests</p>
</li>
<li>
<p>respect for the naming conventions to ensure prevent having columns with duplicate names</p>
</li>
<li>
<p>reliability across different data sources if the calculation is performed several times</p>
</li>
</ul>

<p>Here is an interesting <a href="https://www.linkedin.com/posts/analyticsnerd_looker-studio-data-activity-7001520757008691200-qxuJ?utm_source=share&amp;utm_medium=member_android" target="_blank">article</a> from LinkedIn about the calculated fields on Looker studio.</p>

<p><br></p>

<h2 id="ratio-fields">Ratio Fields</h2>

<p>Go on the second page of the dashboard - <u>_Ratios_</u>.</p>

<p><br></p>

<h3 id="basic-example">Basic example</h3>

<p>For standard calculations, it is preferable to perform the transformation on the data warehouse. However, for a ratio calculation, it is necessary to perform it on the BI tool. Let’s look at this with the following questions.</p>

<p>In the first table, we want to calculate the average overall margin percentage for our two orders.</p>
</li>
<li>
<p>Directly at the chart level (<em>because you do not have editing rights at the data source level</em>), add the <code>margin_percent</code> metric to the table with <code>avg</code> as the aggregation. Does the result in the summary row seem relevant?</p>

<details>
<summary>Screenshot</summary>

<p><em>The aggregation is the average of 50% and 10% which returns 30%. However, it does not correspond to the global margin. The global margin is 105/250=42%. The problem is that the order</em> <em><strong>421</strong>__has a turnover of 200€ whereas orders_id</em> <em><strong>754</strong>__has a turnover of 50€.  The weight of orders 421 is 4 times the one from orders 754 when calculating the margin_percent. Averaging the ratio of each column gives the same weight to each order which is wrong.</em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-20-Untitled.jpeg" alt=""></p>

</details>

<p>When calculating the ratio and aggregating to different dimension levels, it is not possible to average the ratio. The average does not take into account the difference in weight of the different lines. We have to create the calculation directly on the BI tool to have correct results.</p>
</li>
<li>
<p>Directly on the graph, add a calculated metric <code>margin_percent_1</code> which is the division of the <code>margin</code> by the <code>turnover</code>. Choose average as the aggregation and percentage as the data type. Does the result in the summary row seem relevant to you?</p>

<details>
<summary>Screenshot</summary>

<p><em>The calculation is exactly the same as in the previous question. Therefore, the result is wrong. In next question we will perform the relevant calculation.</em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-21-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>The overall average <code>margin_percent</code> is the ratio of the sum of the <code>margin</code> (the total margin) to the sum of the <code>turnover</code> (the total turnover). Directly on the graph, add a calculated metric <code>margin_percent_2</code> which is the division of the sum of the margin by the sum of the turnover. Choose percentage as the data type. Does the result in the summary row seem relevant?</p>

<p><u>_Note_</u><em>- you cannot choose the aggregation function, as it is already defined in your formula.</em></p>

<details>
<summary>Screenshot</summary>

<p><em>This time the result is correct. We obtain 42%. The weight of each orders were taken into account. We made the ratio between the sum of margin and the sum of turnover.</em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-22-Untitled.png" alt=""></p>

</details>

<p>By setting the SUM()/SUM() in the calculated report, the result is correct regardless of the aggregation level.</p>

<p>🎉 Congratulations! This concept is essential. Creating a calculated ratio is something you will use all the time in the BI tool. 🎉</p>

<p>Not everyone understands why SUM(margin) / SUM(turnover) should be used and why the first two methods are wrong.</p>

<p><br></p>

<h2 id="mailing-kpi">Mailing KPI</h2>

<p>Calculated ratios are usually important KPIs that will be used in many charts and often in many reports. Therefore, they are defined at source level and not at chart level.</p>

<p>Now let’s put this into practice to calculate the mail KPIs. We will define the mail KPI at the data source level rather than at the graph level.</p>

<p><br></p>

<h3 id="opening-rate">Opening rate</h3>

<p>Let’s calculate the opening rate</p>
</li>
<li>
<p>Open the list of data sources and edit the <code>gz_mail</code> data source.</p>

<details>
<summary>Solution</summary>

<p><strong>1 - Data source listing</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-23-Untitled.png" alt=""></p>

<p><strong>2 - Edit gz_mail</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-24-Untitled.jpeg" alt=""></p>

</details>
</li>
<li>
<p>Add a new Opening Rate field. Click the Add Field button. Calculate and save the field. Set the default data type to %. Return to the first page of the dashboard. Add it to the <code>gz_mail</code> table. Do you think the result is correct?</p>

<details>
<summary>Hint</summary>

<p>The opening rate is the ratio between the sum of opening_nb and the sum of sent_nb.</p>
</details>

<details>
<summary>Solution</summary>

<p><strong>Calculate field</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-25-Untitled.jpeg" alt=""></p>

<p><strong>Add percent as data type</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-26-Untitled.png" alt=""></p>

<p><strong>Result</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-27-Untitled.png" alt=""></p>

</details>

<h3 id="click-rate">Click Rate</h3>
</li>
<li>
<p>Calculate the click-through rate. Don’t forget to set the default data type to percent.</p>

<details>
<summary>Hint</summary>

<p>The click rate is the ratio between the sum of click_nb and the sum of sent_nb.</p>
</details>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-28-Untitled.png" alt=""></p>

</details>

<h3 id="ctr---click-through-rate">CTR - Click through Rate</h3>
</li>
<li>
<p>Calculate the CTR (click through rate) which is the ratio between <code>click_nb</code> and <code>opening_nb</code>. Don’t forget to set the default data type to percent.</p>

<h3 id="turnover-per-mille">Turnover per Mille</h3>
</li>
<li>
<p>Calculate the average turnover generated by 1000 sent mails. Don’t forget to set the default data type to €.</p>

<details>
<summary>Hint</summary>

<p>The turnover per mille is the ratio between the sum of turnover and the sum of sent_nb, multiplied by 1000.</p>
</details>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-29-Untitled.png" alt=""></p>

</details>

<h3 id="display-the-main-kpi">Display the main KPI</h3>
</li>
<li>
<p>Add a bar graph to compare the average open rate and CTR of the French and Belgian newsletter. How do you analyse the results? What would you do if you were the CRM manager of Greenweez?</p>

<details>
<summary>Screenshot</summary>

<p>The opening rate is similar even if slightly better for Belgium newsletter. However the CTR is much better for French newsletter. It could be interesting to make a formation of the Belgium team by the French team to improve the content of the newsletter inn order to improve the CTR.
<u>_**Note**_</u><em>- We could perform a Chi2 test to analyse if the difference are significant or not</em> 💡🧠
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-30-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Add a time series graph to show open rate, CTR and revenue per thousand per week (week of the ISO year). Add <code>click_rate</code> as an optional metric. How do you analyse the results?</p>

<details>
<summary>Screenshot</summary>

<p>There was a big drop in the turnover per mille the week between the 12th and 18th of July. however, the opening rate was good this week. It is due to a poor CTR and a poor conversion on the website after click. The content of the newsletter and the offer on the website were certainly not very appealing.
Then the turnover per mille increased again the next week. If we look on this period at the turnover per mille and the click rate, we can see that the click rate follow a similar curve which is logical. However, the turnover per mille increase much more in percentage during the period than the click rate which demonstrate an increase in the turnover generated after a click. The offer on the website were certainly more appealing to drive conversion and volume of turnover.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-31-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/04-Calculated-Field-asset-32-Untitled.png" alt=""></p>

</details>
</li>
</ol>

<p>🎉 Congratulations! You have calculated your first business KPI on Looker studio to perform an advanced analysis of your newsletter performance. 🎉</p>



</div>
</div>