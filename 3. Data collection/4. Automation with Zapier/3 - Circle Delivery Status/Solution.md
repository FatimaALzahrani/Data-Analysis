<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>The supply team tracks delivery statuses for all products and orders. <br>
Today they receive statuses by email and update rows by hand, first the Date column and second the Delivery status.</p>

<p>The team wants to analyse time between statuses but they don’t know how to do it and doesn’t want to change the way they work.</p>

<ol>
<li>
<p>Copy their <a href="https://docs.google.com/spreadsheets/d/1jyGLihx6NMING6c7IWHPUPYNRJr_17Mlpl2bcAtA7JM/edit?usp=sharing" target="_blank">Google Sheet</a> and observe data.</p>
</li>
<li>
<p>What information you need to perform such analysis?</p>

<p>We need to pass from state to event data.</p>

<p>For the past orders and products the only way is to review all email received and note the info somewhere.</p>
</li>
<li>
<p>Create a new Google Sheets that will contain all events when statuses are updated.</p>
</li>
<li>
<p>Create the automation workflow with Zappier to help the team.</p>

<p>First we need to use “New or Updated Spreadsheet Row” trigger with Delivery status as Trigger Column.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/03-Circle-Delivery-Status-asset-1-Untitled.png" alt=""></p>

<p>Then we need to create a new row in the new Google Sheet with order_id, product_id, date and status info. Such as all analyses are now possible!</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/03-Circle-Delivery-Status-asset-2-Untitled.png" alt=""></p>
</li>
<li>
<p>What is the main risk with your solution?</p>

<p>Supply team needs to be careful and complete information correctly, especially the Date Column.</p>

<p>Otherwise it will distort the results! Data gouvernance is such important subject!!</p>
</li>
</ol>


</div>
</div>