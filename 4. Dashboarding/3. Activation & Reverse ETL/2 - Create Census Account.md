<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>In this exercise, you will create a Census account and connect it to your BigQuery project.</p>

<p><br></p>

<h2 id="create-your-account">Create your Account</h2>

<ol>
<li>
<p>Go to the <a href="https://www.getcensus.com/" target="_blank">Census website</a>. Follow the steps to create your account.</p>

<details>
<summary>If you need help</summary>

<p><strong>Click on “Try for Free”</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/02-Create-Census-Account-asset-1-Untitled.png" alt=""></p>

<p><strong>Create a new account or continue with Google (faster this way)</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/02-Create-Census-Account-asset-2-Untitled.png" alt=""></p>

<p><strong>Confirm email address</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/02-Create-Census-Account-asset-3-Untitled.png" alt=""></p>

<p><strong>Log in again, you can skip their short survey</strong></p>
</details>

<p><br></p>

<h2 id="adding-a-source-data-platform">Adding a Source Data Platform</h2>

<p>A reverse ETL tool links valuable models from the data platform to business tools. The first step is to identify your data platform as a data source.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/02-Create-Census-Account-asset-4-Untitled.png" alt=""></p>

<p><br></p>

<h2 id="identify-the-source-project">Identify the Source Project</h2>
</li>
<li>
<p>On the sidebar, go to “Connect” ⇒ Sources</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/02-Create-Census-Account-asset-5-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Add a data source. Choose BigQuery</p>

<details>
<summary>Screenshot</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/07-Activation-Reverse-ETL/02-Create-Census-Account-asset-6-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Enter the following values in the New Source window:</p>

<ul>
<li>
<p>Select <strong>Basic</strong> sync engine</p>
</li>
<li>
<p>Enter your BigQuery <strong>Project ID</strong></p>
</li>
<li>
<p>Select EU <strong>location</strong> 🇪🇺</p>
</li>
</ul>
</li>
<li>
<p>Keep the <strong>Connect Google BigQuery to Census</strong> window open</p>

<p>💁🏽&nbsp;<u>_**Note**_</u><em>- Make sure you have a BigQuery account with billing enabled. If not, activate billing on your BigQuery account.</em></p>

<p><br></p>

<h2 id="create-a-dataset-for-census-operations">Create a Dataset for CENSUS Operations</h2>

<h3 id="create-the-dataset">Create the Dataset</h3>
</li>
<li>
<p>Create a dataset called CENSUS in capital letters located in the EU on your BigQuery project.</p>

<p><br></p>

<h3 id="authorise-census-in-bigquery">Authorise Census in BigQuery</h3>

<p>Census will require an IAM role to be created and authorised in Google Cloud. Luckily, they’ve provided the CLI commands that can be immediately used.</p>
</li>
<li>
<p>In <strong>Google Cloud Console</strong>, open the <strong>CLI</strong> by clicking this icon on the top right</p>

<p><img src="https://lh7-us.googleusercontent.com/LJVQKAD0B_TlDRKAnU120-CBfgDAF-GhxiyFqo8KEe6KbbGjDH8Md0zaJ1_gFESxyGzaJiMtMrsJ1X1g5MXuUA7wHIxDzZhM0qK2Zm7jU7DB6pjcYJi4Rdx0wGOA8gGqIDTsuejkoy2MWwVzNPBA7Do" alt=""></p>
</li>
<li>
<p>While waiting for the CLI to completely load, go back to the Census tab</p>
</li>
<li>
<p>Copy the Google CLI command</p>
</li>
<li>
<p>Paste these commands to the Google CLI and press Enter</p>
</li>
<li>
<p>Once that’s finished running, go back to the Census tab and click <strong>Confirm</strong></p>
</li>
<li>
<p>Census will test the connection settings, and will return the below if the connection tests successfully. If you come across any failure during this setup process, please ask for some assistance from the teaching team.</p>

<p><img src="https://lh7-us.googleusercontent.com/9hnx7Iy3Skud1NfqQYcXp5wfs9HLNMfz43cNNDFbsdHXw5xkH19V8eizg1wDyI4K7VRp0Pn1r82jxgSWbfp3a49bryjFrD-FDiFDW7L7yzMP_zIRSo9rjCKZpwcwTRermX8QegUUjRtZKCuu94tOEnc" alt=""></p>
</li>
</ol>

<p>🎉 Congratulations. You have created your Census account and connected it to BigQuery. 🎉</p>

<p>In the next exercise, we will connect to the business tools and export the data from your BigQuery data platform for activation.</p>



</div>
</div>