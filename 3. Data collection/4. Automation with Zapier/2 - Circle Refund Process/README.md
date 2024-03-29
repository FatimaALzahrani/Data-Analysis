<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>👚 Circle ships clothing to B2C customers.</p>

<p>If there is a problem with size or quality, the customer can request a return and refund by filling in a form with the order and product ids.</p>

<p>The process is very manual at the moment with one person in charge of handling this via a Google Sheet where returns are tracked.</p>

<p>When receiving a return, the person must:</p>

<ul>
<li>
<p>inform customer service</p>
</li>
<li>
<p>put the product back on sale in the computer stock (Google Sheet) so that it can be resold</p>
</li>
<li>
<p>inform the accounting and finance team in their google sheet to report the loss or refund of a product</p>
</li>
</ul>

<p>Circle does not yet have a highly available IT or data team.</p>

<ol>
<li>
<p>What type of flow should be put in place: between which tools, what data, at what frequency?</p>
</li>
<li>
<p>What type of tools can be used for this, taking into account the characteristics of the company?</p>
</li>
<li>
<p>Create a Google form to submit a refund. You will only need to request an <code>order_id</code> and a <code>product_id</code>. There is no need to collect emails as we can find this information from the <code>order_id</code>.</p>

<p>The form is called “Refund form”.</p>
</li>
<li>
<p>Create a Google Sheets to store all claims.<br>
You will create 3 columns: <code>Order_id</code>, <code>Product_id</code> and <code>Date</code>.<br>
Start a new Zapier workflow and connect your Google form to your Google Sheet with the corresponding columns.</p>
</li>
<li>
<p>Create a copy of this <a href="https://docs.google.com/spreadsheets/d/1plS9jdm7wOac3eLsjaipEOPQIcmfBryBsmFYf1KGp-Y/edit?usp=sharing" target="_blank">Google Sheet</a> and name it “Finance”.</p>

<p>This is the official Google Sheet for the finance team. When a new refund is submitted, we want to set the turnover column to 0 and the refund column to 1.</p>

<p>Complete your workflow with this task.</p>

<p>💁🏽 <em><strong>Tip</strong></em>: Why did we create the “Key” column? First you have to find the corresponding row</p>
</li>
<li>
<p>Create a copy of this <a href="https://docs.google.com/spreadsheets/d/19XY1JWNpTQF3M2BFJkZw-QpZqgG-WkqJQTj_2BTvIRY/edit?usp=sharing" target="_blank">Google Sheet</a> and name it “Supply”.</p>

<p>This is the official Google Sheet of the procurement team. When a new refund is submitted, we want to add +1 in the Remaining Items column.</p>

<p>Complete your workflow with this task.</p>
</li>
<li>
<p>When a product is released for sale, inform the sales team by email with the relevant product ID.<br>
Complete your workflow to execute this task.</p>

<p>💁🏽 <em><strong>Tip</strong></em>: We want to continue the workflow if a criterion is met…</p>

<p>Congratulations on updating the Circle refund process! 🎉</p>
</li>
</ol>



</div>
</div>