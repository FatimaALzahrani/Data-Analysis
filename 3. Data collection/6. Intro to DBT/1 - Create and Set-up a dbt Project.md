<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>Let’s start by importing Greenweez data into BigQuery and creating a new dbt project for Greenweez data.</p>

<h2 id="1---data-import-on-bigquery">1 - Data Import on BigQuery</h2>

<h3 id="dataset-creation">Dataset Creation</h3>

<ol>
<li>
<p>Open the&nbsp;<a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m0" target="_blank">BigQuery console</a>&nbsp;and create a dataset called&nbsp;<code>gz_raw_data</code>&nbsp;located in ❗<code>eu (multiple regions in European Union)</code>❗</p>

<p><em><strong>Note -</strong></em>&nbsp;Google documentation on&nbsp;<em><a href="https://cloud.google.com/bigquery/docs/datasets#create-dataset" target="_blank">How to create a dataset</a></em></p>

<p><em><strong>Note</strong></em>&nbsp;- Make sure you are logged in to your personal BigQuery project using the correct email account.</p>
</li>
</ol>

<h3 id="table-import">Table Import</h3>

<ol>
<li>
<p>Copy the following tables in a dataset&nbsp;<code>gz_raw_data</code>&nbsp;into your own BigQuery project:</p>

<ul>
<li>
<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sgz_raw_data!3sraw_gz_sales" target="_blank">raw_gz_sales</a></p>
</li>
<li>
<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sgz_raw_data!3sraw_gz_product" target="_blank">raw_gz_product</a></p>
</li>
<li>
<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sgz_raw_data!3sraw_gz_ship" target="_blank">raw_gz_ship</a></p>
</li>
</ul>

<p><em><strong>Help -</strong></em>&nbsp;<em><a href="https://cloud.google.com/bigquery/docs/managing-tables#copying_a_single_source_table" target="_blank">Google documentation</a></em>&nbsp;to copy a table</p>
</li>
</ol>

<h2 id="2---create-a-new-dbt-project">2 - Create a New dbt Project</h2>

<p>Now, let’s create a dedicated dbt project for the Greenweez data pipeline.</p>

<ol>
<li>
<p>Go to <a href="https://cloud.getdbt.com/" target="_blank">https://cloud.getdbt.com</a> and create an account.</p>

<p>When creating a new non-enterprise DBT account, a default project called <strong>Analytics</strong> is created. (non-enterprise accounts can’t own more than one project)</p>
</li>
<li>
<p>Select BigQuery as your data warehouse</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/01-Create-And-Set-Up-A-DBT-Project-asset-1-Untitled.png" alt=""></p>
</li>
</ol>

<h2 id="3---connect-dbt-to-bigquery">3 - Connect dbt to BigQuery</h2>

<ol>
<li>
<p>Click on&nbsp;<strong>Upload a Service Account JSON File</strong>&nbsp;in the section “BigQuery settings” on dbt.</p>
</li>
<li>
<p>Create a JSON key using the instructions to <a href="https://docs.getdbt.com/docs/get-started/getting-started/getting-set-up/setting-up-bigquery#generate-bigquery-credentials" target="_blank">Generate BigQuery Credentials</a>.</p>
</li>
<li>
<p>Upload the JSON key in the section “BigQuery settings” on dbt. Dbt Cloud will populate all the necessary fields.</p>

<details>
<summary>Hint</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/01-Create-And-Set-Up-A-DBT-Project-asset-2-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>In&nbsp;<em><strong>Optional settings</strong></em>, enter&nbsp;<code>EU</code>&nbsp;in the&nbsp;<strong>location</strong>&nbsp;field. This allows you to create a dbt dataset in the EU region on BigQuery.</p>
</li>
<li>
<p>Go to the bottom of the page. In the&nbsp;<em><strong>Development Credential</strong></em>&nbsp;section, rename the&nbsp;<strong>Dataset</strong>&nbsp;field to <code>dbt_&lt;your_firstname&gt;</code>. During the development phase, Dbt will create and save your transformations in the corresponding dataset on BigQuery.</p>
</li>
<li>
<p>Test the connection.</p>
</li>
<li>
<p>If you see “Connection test Succeeded!”,&nbsp;<strong>continue</strong>. If it fails, you may need to go back and regenerate your BigQuery credentials.</p>

<p>⚠️ do not close the project set up screen, we will see juste below how to connect a repository ⚠️</p>

<p>🎉 You have successfully created a dedicated dbt project for Greenweez and connected it to BigQuery 🎉</p>
</li>
</ol>

<h2 id="4---connect-gitgithub">4 - Connect Git/GitHub</h2>

<h3 id="git">Git</h3>

<p>dbt Cloud will initiate a git workflow automatically and utilize the ‘main’ / ‘master’ branch as the production version of your code.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/01-Create-And-Set-Up-A-DBT-Project-asset-3-Capture_decran_2023-09-25_a_14.38.12_1.png" alt=""></p>

<p>To make modifications to your code, you will need to follow these steps:</p>

<ul>
<li>
<p>create a new branch</p>
</li>
<li>
<p>make changes to your code</p>
</li>
<li>
<p>commit your changes</p>
</li>
<li>
<p>merge your branch into ‘main’ / ‘master’ to apply the changes to the production version</p>
</li>
</ul>

<p>Each commit represents a snapshot of your code project over time, allowing you to revert to a previous version if needed.</p>

<h3 id="collaboration-on-github">Collaboration on GitHub</h3>

<p>You will utilize GitHub to share your repository and collaborate with your team.</p>

<p>Version control and Git workflow are essential in data teams. Writing production-quality code is challenging without it.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/01-Create-And-Set-Up-A-DBT-Project-asset-4-Capture_decran_2023-09-25_a_14.59.52.png" alt=""></p>

<p>The process for modifications remain the same, except for the last step (merging into <code>main</code>/<code>master</code>) which is replaced by issuing a pull request (PR). This allows another team member to review your changes before publishing them to the production version.</p>

<p><em><strong>Note</strong></em>&nbsp;- In analytics engineering, we primarily borrow established concepts from software engineering. Version control, and more specifically Git/GitHub, is a good example.</p>

<h3 id="create-a-github-repository-for-your-dbt-project">Create a GitHub repository for your dbt project</h3>

<p>Let’s configure your project with GitHub considering team development features.</p>

<ol>
<li>
<p>On <a href="http://github.com/" target="_blank">github.com</a>, create a new repository&nbsp;named <code>gz-dbt-repository</code></p>

<p>Alternatively, if you didn’t close the project setup, you can directly setup your repository here by choosing <strong>managed</strong> and naming it.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/01-Create-And-Set-Up-A-DBT-Project-asset-5-Untitled.png" alt=""></p>
</li>
<li>
<p>Back in the dbt interface, under “Add repository from”, select&nbsp;<strong>GitHub</strong>&nbsp;and choose the newly-created repository, then click&nbsp;<strong>Create</strong>.</p>
</li>
<li>
<p>Once you see the “Successfully imported repository,” click&nbsp;<strong>Start developing in the IDE</strong>.</p>
</li>
</ol>

<p>🎉 Congratulations! You have successfully created the git repository for Greenweez dbt project 🎉</p>


</div>
</div>