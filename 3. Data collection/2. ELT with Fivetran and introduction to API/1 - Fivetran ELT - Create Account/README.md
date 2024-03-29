<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<h2 id="introduction">Introduction</h2>

<h3 id="objective-of-the-day">Objective of the Day</h3>

<p>Today’s goal is to create data pipelines from business tools to BigQuery. Greenweez needs to create a centralized data platform to model data and perform deep analysis. We will extract data from business tools using Fivetran.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-1-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-2-Untitled.png" alt=""></p>

<h3 id="objective-of-the-exercice">Objective of the Exercice</h3>

<p>→ Connect the sheet <a href="https://docs.google.com/spreadsheets/d/1mbGx2tzdBT1RyLgKFl8LW15ZYK_gdCzD7VHaE643CZ8/edit#gid=973304438" target="_blank">campaign</a> from the Google Sheet <a href="https://docs.google.com/spreadsheets/d/1mbGx2tzdBT1RyLgKFl8LW15ZYK_gdCzD7VHaE643CZ8/edit#gid=973304438" target="_blank">gwz_finance</a> to BigQuery using Fivetran.</p>

<h3 id="in-this-exercise-you-will">In this exercise, you will:</h3>

<ul>
<li>
<p>create your Fivetran account</p>
</li>
<li>
<p>make you first EL export with Fivetran by:</p>

<ul>
<li>
<p>connecting a destination (BigQuery datawarehouse)</p>
</li>
<li>
<p>connecting a source (”campaign” sheet)</p>
</li>
<li>
<p>setting up a connector with regular batch imports</p>
</li>
</ul>
</li>
</ul>

<h2 id="lets-do-it">Let’s Do It!</h2>

<ol>
<li>
<p>Open, copy and rename this Google sheet <a href="https://docs.google.com/spreadsheets/d/1mbGx2tzdBT1RyLgKFl8LW15ZYK_gdCzD7VHaE643CZ8/edit#gid=973304438" target="_blank">gwz_finance</a> to be the owner of the new Google Sheet</p>
</li>
<li>
<p>Go to <a href="https://www.fivetran.com/" target="_blank">Fivetran</a> and click on <strong>Get Started</strong></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-3-Untitled.png" alt=""></p>
</li>
<li>
<p>Fill in the form with your email and put “Student” as company</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-4-Untitled.png" alt=""></p>
</li>
<li>
<p>Confirm the email and begin the onboarding process.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-5-Untitled.png" alt=""></p>
</li>
<li>
<p>Connect to BigQuery for destination and call it <strong>BigQuery</strong> or Warehouse</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-6-Untitled.png" alt=""></p>

<ul>
<li>
<p>Read set-up guide on the right</p>
</li>
<li>
<p>choose <strong>[your-bigquery-project-id]</strong></p>
</li>
<li>
<p>choose <strong>EU or your current location</strong> as data and processing location</p>
</li>
</ul>

<details>
<summary>Note on EU location</summary>

<p>Choosing EU is the safest option when it comes to the data protection. That’s why we always recommend going for this option when using third party services. You will learn more about why is that on the last day of the bootcamp! (<em>Hint</em>: GDPR)</p>
</details>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-7-Untitled.png" alt=""></p>

<ul>
<li>Copy-paste the Fivetran email and add this email as BigQuery user in <a href="https://console.cloud.google.com/iam-admin/iam/project" target="_blank">the GCP IAM console</a></li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-8-Untitled.png" alt=""></p>

<ul>
<li>Choose the relevant timezone</li>
</ul>
</li>
<li>
<p>Connect to Google Sheet as a source</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-9-Untitled.png" alt=""></p>

<ul>
<li>
<p>Read the set-up guide on the right</p>
</li>
<li>
<p>choose <code>fvt_gsheet</code> as <em>destination schema</em></p>
</li>
<li>
<p>choose <code>gwz_finance_campaign</code> as <em>destination table</em></p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-10-Untitled.png" alt=""></p>

<ul>
<li>
<p>Select and authorize your Google account to access the <strong>Fivetran</strong> application</p>
</li>
<li>
<p>Connect to your own url <code>google_sheet</code><strong>-</strong> <code>gwz_finance</code></p>
</li>
<li>
<p>Create a named data range on your “campaign” sheet named <code>gwz_finance_campaign</code> with enough rows to anticipate potential additional rows if not already created.</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/01-Fivetran-Create-account-asset-11-Untitled.png" alt=""></p>

<ul>
<li>Validate the connection to Google Sheet</li>
</ul>
</li>
<li>
<p>Go to the Connectors tab, click on your connector and Start Initial Sync</p>
</li>
</ol>

<p>🎉 <strong>Congrats, you have set up your first EL export with Fivetran!</strong> 🎉</p>



</div>
</div>