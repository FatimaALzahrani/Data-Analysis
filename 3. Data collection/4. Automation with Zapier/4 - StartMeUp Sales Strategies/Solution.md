<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<h2 id="starmeup-sales-strategies">StarMeUp Sales Strategies</h2>

<p>StartMeUp wants to treat its incoming leads differently, depending on their qualification and attributes. Your colleague from the Sales team fills in a SpreadSheet every day manually, after the demos he has done, with the email address of the prospect who attended the demo, in column A.</p>

<ol>
<li>
<p>Create a copy of <a href="https://docs.google.com/spreadsheets/d/1HZVKxiA2hHILkkgOO7E84JBvIcyk7Qi1hOOC24CtiP8/edit?usp=sharing" target="_blank">this file</a> in your drive so that you can access it for the rest of the exercise.</p>

<p>This is how the marketing team would like to divide their leads, for each new lead that attended a demo.</p>

<ul>
<li>
<p>Path A: The lead is a highly qualified lead (Score above 90).</p>
</li>
<li>
<p>Path B: The lead is moderately qualified (Score between 50 and 90).</p>
</li>
<li>
<p>Path C: The lead is very poorly qualified (Score below 50).</p>
</li>
</ul>
</li>
<li>
<p>Translate this into a Zap, starting with a Trigger involving the Google Sheet application, giving the lead a score and then creating three different Paths, meeting the conditions outlined above.</p>

<p><em>Notes: To score the leads, use a “Tool By Zapier” (I’ll let you guess which one!)</em></p>

<p>Let’s create a new Zap, whose trigger involves the “Google Sheets” application and the “New Spreadsheet Row” event. In fact, as soon as your colleague from the Sales team enters a new contact in column A (post-demo), this will create a new row and therefore trigger the Zap.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-1-image7.png" alt=""></p>

<p>Then connect your Drive - Google Sheet account and choose the right spreadsheet.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-2-image5.png" alt=""></p>

<p>Then test the Trigger: you end up with a Test sample, including an “email address” variable (from column A of the spreadsheet).</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-3-image3.png" alt=""></p>

<p>Let’s then use a Lead Scoring system capable of giving a score to an email address. This tool exists within Zapier “Lead Score by Zapier” and is developed in partnership with the tool Madkudu, which - thanks to their database and lead scoring models - is able to give a quality score to a lead.</p>

<p>So in action and second step of the Zap “Lead Score by Zapier” is chosen with the event “Find Person and Company Information”. Then we finish the configuration in this way (input = Email = sample variable from the SpreadSheet).</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-4-image10.png" alt=""></p>

<p>Test the step and identify the presence of a score in the Test output.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-5-image6.png" alt=""></p>

<p>Now let’s create the 3 different Paths whose condition involves the score - output from the previous step. Choose a “Paths by Zapier” step and add a new Path so that you have 3 Paths, right off the bat. Click on each of the Paths and name them and configure them in this way (by choosing the right variable = “Properties Customer Fit Score”).</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-6-image9.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-7-image15.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-8-image1.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-9-image2.png" alt=""></p>

<p>Do not hesitate to test the 3 Paths at the end of each configuration to make sure that everything works correctly.</p>
</li>
<li>
<p>Think, without building Zaps, about relevant marketing actions for each group of leads. These marketing actions should be technically feasible from Zapier (using external tools or “Tools by Zapier” or natively integrated applications).</p>

<blockquote>
<p>Example: Path B → The lead is pushed into a newsletter type campaign, hosted on MailChimp.</p>
</blockquote>
</li>
<li>
<p>Now let’s build Path A in a concrete way by taking up the Zap. This is what the marketing team wants to achieve:</p>

<blockquote>
<p>For highly qualified leads, push them into a LemList campaign, where the body of the email evokes the name of the prospect’s company, as well as its industry (2 personalization parameters making the email more “custom”).</p>
</blockquote>

<ul>
<li>
<p>You can <a href="https://www.youtube.com/watch?v=pcdQJa_ltXw&amp;t=401s" target="_blank">watch this video</a> to learn how to use the product. We won’t upload any lead by hand, we will connect zappier to lemlist in your workflow.</p>
</li>
<li>
<p>The {{Industry}} variable cannot be found in the variables provided by LemList. You can simply create it from the body of the mail itself.</p>
</li>
</ul>

<p>Let’s go back to the LemList menu, and click again on “Create your First Campaign”. Let us guide you (Campaign name, Schedule, etc.). Select Blank Email and write the content of the email like this:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-10-image13.png" alt=""></p>

<p>Then click on “Save” despite the “Warning” message appearing on the screen concerning the Custom Variable created in the body of the email.</p>
</li>
<li>
<p>Add a Zapier step pushing the lead into the campaign in question. Check that everything has worked properly!</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-11-image12.png" alt=""></p>

<p>Then set up the task using the data (variables) from the Trigger step and the Score by Zapier step. Choose the right campaign in which you want to push your prospect (i.e. the campaign we just created). As you will have understood, the “Score by Zapier” step gives - in addition to a score - enriched information on the contact and his company, which we re-use here (First Name, Company Name).</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-12-image4.png" alt=""></p>

<p>Note here that First Name = No Data. There is indeed a risk that the enriched variables will not be filled in for each data set that will pass through the Zap. It is therefore recommended to go to LemList and configure default values, in the case where the variable has no values (for the 3 variables used in the body of the email: First Name, Company Name and Industry).</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-13-image14.png" alt=""></p>

<p>Let’s go back to Zapier and fill in the last variable ({{industry}}) which is a Custom Variable.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-14-image8.png" alt=""></p>

<p>We then test the whole thing, and go back to the LemList campaign to confirm the presence of the Test prospect in the campaign. Also check that the variables have been filled in correctly.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/04-StartMeUp-Sales-Strategies-asset-15-image11.png" alt=""></p>

<p>This seems to be the case! The copywriting and defaults could be reworked slightly to make the wording sound more natural.</p>
</li>
</ol>


</div>
</div>