<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<h2 id="warehouse-tool">Warehouse Tool</h2>

<ol>
<li>
<p>Copy <a href="https://docs.google.com/spreadsheets/d/1zPu7yZwCB5PqRBuSI8Qiicwt8ivs9fPJAP8XZrQw4GY/edit#gid=1880787142" target="_blank">circle_warehouse_tool</a> and rename it with your first name. This spreadsheet is used by the logistics team to evaluate the product forecasts that will be delivered soon.</p>

<p>We want to tell the logistics team which products have a priority for storage. Instead of exporting the <code>stock</code> or <code>nb_day_stock</code> columns for each product, we want to export only the low stock products to the warehouse tool. To do this, we will use the segmentation functionality on Census.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/04-Census-Segment-Circle-Stock-asset-1-Untitled.png" alt=""></p>

<h2 id="create-a-model-and-a-segment">Create a Model and a Segment</h2>

<h3 id="create-a-model">Create a Model</h3>
</li>
<li>
<p>On the left menu bar, select <strong>Define &gt; Models</strong></p>
</li>
<li>
<p>Click <strong>New SQL Query</strong></p>
</li>
<li>
<p>Under <strong>Model Name</strong>, enter <code>cc_stock_prediction</code></p>
</li>
<li>
<p>Write the query to select all columns from the <code>cc_stock_prediction</code> table</p>
</li>
<li>
<p>Select <strong>Preview Results</strong>. If your query has been successfully written, you’ll see a Model Results window at the bottom with records from the cc_stock_prediction table like below.</p>

<p><img src="https://lh7-us.googleusercontent.com/_za0hRnU-2tt-FWtHUB_XHvR5p1tqDSZqPOzOnJAMaPfVM7DbTeppCP5V80mrgrCdMZ8RLGuGOeAUubHlv_zkgVdr6yeKCbCV5B-jfzthDFwO1tQfYVpMGiWZ_Sktdm-q-isw_1OjhFJGBZwMypBopU" alt=""></p>

<p>Don’t forget to click <strong>Save Model !</strong></p>

<p><br></p>

<h3 id="create-an-entity">Create an Entity</h3>
</li>
<li>
<p>On the left menu bar, select <strong>Define &gt; Entities</strong></p>
</li>
<li>
<p>Click <strong>+ Add an Entity</strong></p>
</li>
<li>
<p>On the <strong>Models window</strong> on the right, click <strong>+ Create Entity</strong> next to <code>cc_stock_prediction</code> .</p>
</li>
<li>
<p>Under <strong>Specify Schema Columns</strong>, select <strong>product_id</strong> as the <strong>Unique ID</strong> for your entity.</p>
</li>
<li>
<p>Click <strong>Save Entity</strong></p>

<p><br></p>

<h3 id="create-a-segment">Create a Segment</h3>
</li>
<li>
<p>On the left menu bar, select <strong>Activate &gt; Audience Hub</strong></p>
</li>
<li>
<p>Click <strong>+ Add a Segment</strong></p>
</li>
<li>
<p>Under <strong>Segment Name:</strong></p>

<ul>
<li>
<p>Enter <code>low_stocks</code> <strong>.</strong></p>
</li>
<li>
<p>Click <code>cc_stock_prediction</code> <strong>Attributes</strong></p>
</li>
<li>
<p>Select all the products that have zero stock or less than 3 days of stock remaining (<code>nb_days_stock</code>)..</p>
</li>
<li>
<p>On the line next to the attributes, ensure that <strong>OR</strong> is displaying (not AND).</p>
</li>
</ul>

<details>
<summary>💁🏽&nbsp;Hint - To have an OR clause, click on the AND clause and change it to OR in cc_stock_prediction. </summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/04-Census-Segment-Circle-Stock-asset-2-Untitled.png" alt=""></p>

</details>

<p>Once done successfully, the window should mimic the following.</p>

<p><img src="https://lh7-us.googleusercontent.com/0DVhY3jozbwp_FF8C3lAxD8u3sZmOfCv9GF8mps2uFrZ8jjd-btRVRWFXtagOLd10WH--otrDhrXW4LmXN75itIxnrlOpgXe53Lo9XFEiiLwy8lfpPjvVTkU7FCzonxNQkAYU5oAaOQ8wkEGVOSG4R8" alt=""></p>

<p>Again, don’t forget to click <strong>Save Segment</strong>. 🙂</p>

<p><br></p>

<h3 id="export-segment-to-warehouse-tool">Export Segment to Warehouse Tool</h3>

<p>Now we want to export this segment to the Google Sheet of the warehouse tool to prioritize the storage of <code>low_stocks</code> products.</p>
</li>
<li>
<p>To Select an <strong>Existing Source</strong> go under <strong>Source</strong>, select <strong>cc_stock_prediction</strong>  and under <strong>Segment</strong>, select <strong>low_stock</strong></p>

<p>💁🏽&nbsp;<em>Hint - Go back to the previous exercise if you don’t remember the process.</em></p>
</li>
<li>
<p>On the <code>circle_warehouse_tool</code> Google Sheet, create a new empty <code>low_stock</code> sheet. This will be the destination sheet for the ETL reverse export.</p>

<p><br></p>

<h3 id="select-segment-as-source">Select Segment as Source</h3>
</li>
<li>
<p>On Census, create a new synchronization. Open the <strong>Syncs</strong> tab and <strong>Create a Sync</strong>. Select BigQuery as the data source and the <code>cc_stock_prediction</code> table. You can see that a field segmentation appears. Select the <code>low_stock</code> segment.</p>

<p><br></p>

<h3 id="create-a-new-field-low_stock-in-destination">Create a New Field <code>low_stock</code> in Destination</h3>
</li>
<li>
<p>Select <code>circle_warehouse_tool</code> and the <code>low_stock</code> sheet as the destination. In the “Which properties should be updated?” section, select the Mapping order. Then select only the <code>product_id</code> column. Don’t save anything for the moment.</p>
</li>
<li>
<p>Click on Add Mapping and create a new field. Call up the <code>low_stock</code> field and set the value to <strong>1.</strong> Click <strong>Next</strong> and create the synchronization.</p>
</li>
<li>
<p>Run the synchronization now and check that the data is uploaded to the Google Sheet. How many rows are there on the <code>low stock</code> sheet? Did you get the right subset of products with <code>low_stock</code>?</p>

<p><br></p>

<h3 id="update-the-business-tool">Update the Business Tool</h3>

<p>The <code>low_stock</code> data is now available in the business tool. Let’s add the <code>low_stock</code> column in the <code>forecast storage</code> sheet to indicate to the logistics team the priority products to stock.</p>
</li>
<li>
<p>Use a google sheet formula to add the <code>low_stock</code> column in the <code>forecast_storage</code> sheet which is 1 if the product is <code>low_stock</code> and 0 otherwise.</p>

<details>
<summary>💁🏽&nbsp;Hint - how to populate fields in GS</summary>

<p>You can use different methods previously seen such as XLOOKUP, VLOOKUP and INDEX / MATCH.</p>
</details>

<p>The logistics team now has <code>low_stock</code> information, which allows priority products to be marked directly in the warehouse tool.</p>

<p>🎉 Congratulations, you have created and exported your first segment with Census.🎉</p>

<p><br></p>

<h2 id="promotion-tool">Promotion Tool</h2>

<p>Overstocked products can be a problem:</p>

<ul>
<li>
<p>in the case of food items, overstocking can lead to expiration, equally, with fashion items, we can lose out if we don’t sell them before they go out of fashion.</p>
</li>
<li>
<p>the storage costs on the warehouse are higher</p>
</li>
</ul>

<p>We want to tell the commercial team which products are overstocked so that we can create promotions on them. We will use segments to identify these products and export them to the purchase promotion tool.</p>
</li>
<li>
<p>Copy <a href="https://docs.google.com/spreadsheets/d/1htqmlIxTtkE2gx-HbDA-c3-IeWPGd1kHHg1XiZ-SAzI/edit#gid=0" target="_blank">circle_promotion_tool</a> and rename it with your first name. This spreadsheet is used by the commercial animation team to create product promotions.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/04-Census-Segment-Circle-Stock-asset-3-Untitled.png" alt=""></p>

<p><br></p>

<h2 id="create-an-overstocked-segment">Create an Overstocked Segment</h2>
</li>
<li>
<p>Create a new <code>overstocked products</code> segment to identify products with more than 200 estimated <code>stock_days</code> (<code>nb_days_stock</code>) in the <code>cc_stock_prediction</code> model. Save the segment.</p>

<p><br></p>

<h2 id="export-a-segment-to-the-warehouse-tool">Export a Segment to the Warehouse Tool</h2>

<p>Now we want to export this segment to the promotion tool Google Sheet to create a promotion for overstocked products.</p>
</li>
<li>
<p>Open the Connection tab and click on <strong>Add service</strong> to create a new destination to the <code>circle_promotion_tool</code> Google Sheet.</p>

<p>💁🏽&nbsp;<em>Hint - Go back to the previous exercise if you don’t remember the process.</em></p>
</li>
<li>
<p>On the <code>circle_promotion_tool</code> Google Sheet, create a new empty <code>overstocked_products</code> sheet. This will be the destination sheet for the reverse ETL export.</p>
</li>
<li>
<p>Create a new synchronization to export to the <code>overstocked_product</code> sheet the product of the segments with the <code>products_id</code> column and the <code>overstocked_products</code> column set to 1. Run the first synchronization.</p>

<h3 id="update-the-business-tool-1">Update the Business Tool</h3>

<p>The <code>overstocked_products</code> data is now available in the <code>sales</code> tool. Let’s add the <code>overstocked_products</code> columns in the <code>product catalogue</code> sheet to indicate to the commercial animation team on which products they should create.</p>
</li>
<li>
<p>Use a google sheet formula to add <code>overstocked_products</code> columns to the <code>product catalogue</code> of the sheet which equals 1 if the product is overstocked and 0 otherwise.</p>

<details>
<summary>💁🏽&nbsp;Hint - how to populate fields in GS</summary>

<p>You can use different methods previously seen such as XLOOKUP, VLOOKUP and INDEX / MATCH.</p>
</details>

<p>The commercial animation team now has the right information to create promotions on overstocked products.</p>

<p>The <code>stock_prediction</code> data is now valued and used directly in 4 different business tools by 4 different sales departments. Well done! 💪</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/04-Census-Segment-Circle-Stock-asset-4-Untitled.png" alt=""></p>
</li>
</ol>

<p>🎉 Congratulations, you have created a very complete and useful reverse ETL architecture.🎉</p>


</div>
</div>