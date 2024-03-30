<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>In this exercise, you will connect to your first business tools. You will create your first <strong>Sync</strong> with Census to export enriched data from your BigQuery data platform to this business tool.</p>

<p>We will be working with data from the Circle Stock.</p>

<h2 id="use-case">Use Case</h2>

<h3 id="circle-presentation">Circle Presentation</h3>

<p>👕 Circle is a French eco-responsible and ethical sportswear brand.</p>

<p>🤸🏽 They produce technical, high-performance and comfortable clothing for Running, Yoga and Training.</p>

<p>♻️ They pay particular attention to circularity, with clothes which are recyclable and made from recycled materials, 100% collected, processed and manufactured in Europe.</p>

<p>🚩&nbsp;It is essential to keep track of stock to avoid shortages, place the right orders with suppliers and avoid overstocking.</p>

<p>👥&nbsp;This is the job of the purchasing team.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/03-Census-Circle-Stock-asset-1-Untitled.png" alt=""></p>

<h3 id="actionable-insights">Actionable Insights</h3>

<p>In the previous BI exercises, you have created a <strong><a href="https://lookerstudio.google.com/u/0/reporting/c1d935fd-7831-4777-a021-2662421bd47d/page/bAP6C" target="_blank">Stock monitoring</a></strong><em>**</em> dashboard.</p>

<p>You have run an analysis in which you identified 2 main <strong>actionable suggestions</strong>:</p>

<ol>
<li>
<p>Identify products at risk of shortage</p>
</li>
<li>
<p>Detect of overstocked products</p>
</li>
</ol>

<p>This involves carrying out the following commercial actions</p>

<ul>
<li>
<p>placing appropriate orders with the suppliers</p>
</li>
<li>
<p>stop highlighting out-of-stock products on the website</p>
</li>
<li>
<p>prioritizing the stocking of out-of-stock products in the warehouse</p>
</li>
<li>
<p>adding promotions for overstocked products</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/03-Census-Circle-Stock-asset-2-Untitled.png" alt=""></p>

<h3 id="objective">🎯&nbsp;Objective</h3>

<p>These business actions require the implementation of data flows to business tools such as:</p>

<ul>
<li>
<p>export low stock products to the supply tool</p>
</li>
<li>
<p>export low stock products to the merchandising tool</p>
</li>
<li>
<p>export products to be stocked in priority to the warehouse</p>
</li>
<li>
<p>export overstocked products to the promotion tool.</p>
</li>
</ul>

<p>The objective of this exercise is to use Census &amp; reverse ETL to set up the relevant data exports.</p>

<p><br></p>

<h3 id="data-import">Data Import</h3>

<ol>
<li>
<p>Data import</p>

<ul>
<li>
<p>Create a new dataset in BigQuery ‘course27’</p>
</li>
<li>
<p>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse27!3scc_stock_prediction" target="_blank">cc_stock_prediction</a> table on your BigQuery project</p>
</li>
</ul>

<p>💁🏽&nbsp;<u>_Help_</u> - <a href="https://cloud.google.com/bigquery/docs/managing-tables#copying_a_single_source_table" target="_blank">Google documentation</a> to copy a table on BigQuery</p>

<p><br></p>

<h3 id="procurement-tool">Procurement Tool</h3>
</li>
<li>
<p>Copy <a href="https://docs.google.com/spreadsheets/d/17NtQDcQ4PyFd3ABzI7Eronyn7xNN25AVvpViq-8W41g/edit#gid=0" target="_blank">circle_procurement_tool</a> and rename it with your firstname. This spreadsheet is used by the purchasing team to place orders with suppliers.</p>

<p>The procurement team is charged with managing the stock. However, they currently have no visibility over the average daily sale, meaning that they cannot know for how many more days will the stock last (<code>nb_days_stock_remaining</code>). This makes it difficult to order the right quantities and the right products. We could export this data from the warehouse to the <code>circle_procurement_tool</code> Google Sheet to help the procurement team better manage their supplier orders.</p>
</li>
<li>
<p>Add a new empty sheet called <code>sales_prediction</code></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/03-Census-Circle-Stock-asset-3-Untitled.png" alt=""></p>

<h3 id="adding-a-business-tool-as-destination">Adding a Business Tool as Destination</h3>

<p>A reverse ETL tool links the value models of the data platform to the <strong>business tools</strong>. The second step is to determine <strong>a service (business tool) as a destination</strong>.</p>

<p>We will add the <code>circle_procurement_tool</code> Google Sheet as destination in Census.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/03-Census-Circle-Stock-asset-4-Untitled.png" alt=""></p>
</li>
<li>
<p>On the left menu bar, select <strong>Connect</strong> &gt; <strong>Sources :</strong></p>

<ul>
<li>
<p>Click <strong>+ Add a Destination</strong> and select <strong>Google Sheets</strong></p>
</li>
<li>
<p>Click <strong>Connect</strong>  and copy the email address shown on the <strong>New Destination</strong> window</p>
</li>
<li>
<p>Open the Google Sheets that you copied</p>
</li>
<li>
<p>Select <strong>File &gt; Share &gt; Share with Others</strong></p>
</li>
<li>
<p>Paste the email address, select Editor and click <strong>Send</strong></p>
</li>
</ul>
</li>
<li>
<p>Go back to the Census window, and click <strong>Confirm</strong></p>

<p><em>Census will test the connection settings, and will return the below if the connection tests successfully. If you come across any failure during this setup process, please ask for some assistance from the teaching team.</em></p>

<p><img src="https://lh7-us.googleusercontent.com/gAeBgTK4Jr_3l0LswE-8KQ71HeXyhOCoTbTFIW1G4pjGHaRELwnFeH5vegOt3dsL2mKMm9oD8MjK8ICC2uzfSet9S2xhLWwdpAKDF_k2NabYWjod2y2skb_Ae-iEqs9iBzOlvvcACUeZcM9fZ0tKa_U" alt=""></p>

<p>🎉 Congratulations. You have created your first destination on Census. 🎉</p>

<p><br></p>

<h3 id="create-a-synchronization">Create a Synchronization</h3>

<p>A reverse ETL tool <strong>synchronizes</strong> the value models from the data platform to the business tools. The third step is to program an orchestration between the source (data platform) and the destination (business tool).</p>

<p>We will create a <strong>synchronization</strong> on Census between the <code>cc_stock_prediction</code> table on BigQuery and <code>circle_procurement_tool</code>.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/03-Census-Circle-Stock-asset-5-Untitled.png" alt=""></p>
</li>
<li>
<p>Go to the left menu bar, select <strong>Activate &gt; Syncs</strong> and click <strong>+ Add a Sync</strong></p>
</li>
<li>
<p>To Select a Source:</p>

<ul>
<li>
<p><strong>Select a Warehouse Table</strong></p>
</li>
<li>
<p>Under <strong>Connection</strong>, select your BigQuery project</p>
</li>
<li>
<p>Under <strong>Dataset</strong>, select the circle dataset that you created.</p>
</li>
</ul>

<details>
<summary>💁🏽 Hint</summary>

<p>If you can’t see your newly created dataset, click <strong>Refresh</strong> underneath <strong>Table</strong>.</p>

</details>

<ul>
<li>Under <strong>Table</strong>, select the <code>cc_stock_prediction</code> `table.</li>
</ul>
</li>
<li>
<p>To <strong>Select a Destination :</strong></p>

<ul>
<li>
<p>Under <strong>Connection</strong>, select <strong>Google Sheets</strong></p>
</li>
<li>
<p>Under <strong>Object</strong>, select <code>sales_prediction</code></p>
</li>
</ul>

<details>
<summary>💁🏽 Hint </summary>

<p>If you can’t see your newly created sheet, click <strong>Refresh</strong> underneath <strong>Object</strong>.</p>
</details>
</li>
<li>
<p>Leave <strong>Select a Sync Behaviour</strong> with the default settings</p>
</li>
<li>
<p>Under <strong>Set Up Google Sheets Field Mappings:</strong></p>

<ul>
<li>
<p>Check the “Mapping Order” box</p>
</li>
<li>
<p>Click <strong>+ Add Mapping</strong></p>
</li>
<li>
<p>Select <code>product_id</code></p>
</li>
<li>
<p>On <strong>Destination field</strong> next to it, type <code>product_id</code> `and press <strong>Enter</strong></p>
</li>
<li>
<p>Repeat the process for <code>avg_daily_qty_91</code> and <code>nb_day_stock</code></p>
</li>
</ul>
</li>
<li>
<p><strong>Run a Test Sync</strong></p>

<p><em>Census will test the sync, and will return the below if the connection tests successfully. If you come across any failure during this setup process, please ask for some assistance from the teaching team.</em></p>

<p><img src="https://lh7-us.googleusercontent.com/wF5SCXB2ztgjNQ0NamQ8q31631rSPXylLu7uqAmtEFDyDi5FXyHpDjh_e2VO4eRRVHBaIqO5xwGHgz3xxbAT3uPJYeADindW5bQ4QLaFhmtZ-tsy5N4n8zQNLHPN_I0iqfSNF4VFs1OSYYWPXBFNVOg" alt=""></p>
</li>
<li>
<p>Go to your Google Sheets, and check that a new row has been added.</p>

<p><img src="https://lh7-us.googleusercontent.com/dTIRx6DrkicBFeE9AcubzoQ1aeKcmddPGYzwPzRiVQAdXfm7RO6RidME5bOv3qxv7_eZPpEdtfSc4CwTmxi7g2ghBXnVbZuC2VblieGN7Pp68ab1hBVjxRnWFbu9HNRheTvbj03ZWEVki4-Wcx7vu0o" alt=""></p>

<p>🎉 Congratulations. You have created your first scheduled synchronization on Census. You are performing the first sync🎉</p>

<h3 id="select-the-schedule">Select the Schedule</h3>
</li>
<li>
<p>Open the configuration tab of your synchronization. Change it and rename it to <code>stock_sales_prediction</code>. Schedule it for 7am UTC daily.</p>

<h3 id="run-the-first-synchro">Run the First Synchro</h3>
</li>
<li>
<p>Click the <strong>Sync Now</strong> button to start the first sync. Check that the data is updated on the Google Sheet</p>

<p>🎉 Congratulations. You have created your first scheduled synchronization on Census. You are performing the first sync🎉</p>

<h3 id="update-the-business-tool">Update the Business Tool</h3>

<p>The data is now available in the business tool. Let’s add the <code>avg_daily_qty_91</code> and <code>nb_day_stock</code> columns to the <code>stock</code> sheet where the purchase team makes supplier orders.</p>
</li>
<li>
<p>Use a <code>vlook-up </code>to add the <code>avg_daily_qty_91</code> and <code>nb_day_stock</code> columns to the <code>stock</code> sheet.</p>

<p>The procurement team can now access the estimated remaining stock in <code>nb_days_stock</code> directly in the procurement tool. It is easier for them to order the right quantities and products.</p>

<p>🎉 Congratulations 🎉</p>

<h3 id="merchandising-tool">Merchandising Tool</h3>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/03-Census-Circle-Stock-asset-6-Untitled.png" alt=""></p>

<p>The marketing team currently cannot see the average daily sales and the estimated <code>nb_days_stock</code> remaining. Similar to the procurement team, they want to also consume the following data from the data warehouse:</p>

<ul>
<li>
<p>to highlight the best-selling products of the day</p>
</li>
<li>
<p>to decrease the display rank of products with low stock in order to limit the risk of shortage.</p>
</li>
</ul>

<p>We could export this data from the warehouse to the <code>circle_merchandising_tool</code> Google Sheet to help the purchase team to be more relevant in their merchandising.</p>
</li>
<li>
<p>Copy <a href="https://docs.google.com/spreadsheets/d/1iLNsk5-iCBZd14LyQH_x16XMZi5ATD797V-odoyUOFY/edit#gid=0" target="_blank">circle_merchandising_tool</a> and rename it with your first name. This Google Sheet is used by the marketing team to manage merchandising. It determines the order in which products are displayed on the site.</p>
</li>
<li>
<p>Following the steps that were provided from the <strong>Procurement tool</strong> above, help the merchandising team to set up a sync in Census into a copy of this sheet.</p>

<details>
<summary>💁🏽 Hints</summary>

<h3 id="adding-the-business-tool-as-destination">Adding the business tool as destination</h3>
<p>We will add the <code>circle_merchandising_tool</code> Google Sheet as a destination in Census.</p>

<ol>
<li>
<p>Go to the connection tab. Click on <strong>Add a service</strong> and Add a connection to your <code>circle_merchandising_tool</code> Google Sheet.</p>
</li>
<li>
<p>Edit the Google Sheet connection and rename it <code>circle_merchandising_tool</code> and save.</p>

<p><br></p>

<h3 id="create-the-sync">Create the Sync</h3>
<p>We will create a synchronization on Census between the <code>cc_stock_prediction</code> table on <strong>BigQuery</strong> and the <code>circle_merchandising_tool</code>.</p>
</li>
<li>Follow this process to create the <strong>Sync:</strong>
<ul>
<li>Open the <strong>Sync</strong> tab. Click on <strong>Create Sync</strong>.</li>
<li>Select BigQuery as the data source. Select the <code>cc_stock_prediction</code> table.</li>
<li>Create a new empty <code>sales_predition</code> sheet on the <code>circle_merchandising_tool</code> Google Sheet.</li>
<li>On Census, select <code>circle_merchandising_tool</code> and the <code>sales_prediction</code> sheet as the destination. In the “Which properties should be updated”__ section, select Mapping order and select the <code>product_id</code>, <code>avg_daily_qty_91</code>, <code>nb_days_stock</code> columns.</li>
<li>Run the test. Check that it adds a row to the <code>sales_prediction</code> sheet. If ok, click Next on the Census</li>
<li>Click on C<strong>reate a synchronization</strong>.</li>
</ul>
</li>
<li>
<p>Open the configuration tab of your synchronization. Edit it and rename it to <code>merchandising_sales_prediction</code>. Schedule it for 7am UTC daily. Click the <strong>Sync Now</strong> button to run the first sync. Check that the data is updated on the Google Sheet.</p>

<p><br></p>

<h3 id="update-the-business-tool">Update the business tool</h3>
<p>The data is now available in the business tool. Let’s add the <code>avg_daily_qty_91</code> and <code>nb_day_stock</code> columns in the merchandising sheet where merchandising defines the display rank of products.</p>
</li>
<li>
<p>Use a <code>vlook-up</code> to add the <code>avg_daily_qty_91</code> and <code>nb_day_stock</code> columns in the merchandising sheet.</p>

<p>The merchandising team now has the estimated <code>nb_days_stock</code> remaining directly in the merchandising tool. It is easier for them to manage the display rank of the products correctly.</p>
</li>
</ol>
</details>

<p>🎉 Congratulations🎉</p>
</li>
</ol>

<p>It would be possible to perform a similar export:</p>

<ul>
<li>
<p>for the <a href="https://docs.google.com/spreadsheets/d/1zPu7yZwCB5PqRBuSI8Qiicwt8ivs9fPJAP8XZrQw4GY/edit#gid=1880787142" target="_blank">warehouse tool</a> in order to prioritize the storage of low stock products</p>
</li>
<li>
<p>for the <a href="https://docs.google.com/spreadsheets/d/1htqmlIxTtkE2gx-HbDA-c3-IeWPGd1kHHg1XiZ-SAzI/edit#gid=0" target="_blank">promotion tool</a> to create a promotion on overstocked products</p>
</li>
</ul>

<p><em>More to come in the next exercise!</em></p>



</div>
</div>