<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<h2 id="introduction">Introduction</h2>

<p>In this challenge, the objective is to try out different ingestion methods depending on the file formats to BigQuery.</p>

<ol>
<li>
<p>Create a new dataset called “<strong>course12</strong>” in your BigQuery project.</p>

<p>❗Choose <code>eu (multiple regions in European Union)</code> as data location when you are located in EU❗</p>
</li>
</ol>

<h3 id="import-csv">Import csv</h3>

<ol>
<li>
<p>Download <a href="https://drive.google.com/file/d/1h3uJt-g5t36qfjwRQXcfH-0hWnzn5GnJ/view?usp=sharing" target="_blank">clothes.csv</a> on your computer. Then, import the file on BigQuery in a table called <strong>clothes1</strong> thanks to the following steps:<em>**</em></p>

<ul>
<li>
<p>in the dataset course12, click on “create table”</p>
</li>
<li>
<p>used “advanced options” to determine correctly the file delimiter, the header row, …</p>
</li>
</ul>
</li>
</ol>

<h3 id="import-an-excel-file-on-bigquery">Import an Excel File on BigQuery</h3>

<ol>
<li>
<p>Download <a href="https://docs.google.com/spreadsheets/d/14UOY7Kwol1wftv5iy0XqC6Hsn0DYmUpF/edit?usp=sharing&amp;ouid=113026690551879363050&amp;rtpof=true&amp;sd=true" target="_blank">clothes.xlsx</a> on your computer. Then, import it on BigQuery in a table called <code>clothes2</code> thanks to the following steps:</p>

<ul>
<li>
<p>in the dataset course12, click on “create table”</p>
</li>
<li>
<p>use “advanced options” to correctly determine the file delimiter, header row, …</p>
</li>
</ul>

<details>
<summary>Hints for Excel format</summary>

<p>The steps to load data from Excel to BigQuery using CSV are listed below:</p>

<ul>
<li>You can go to your Web console and click “Create table” and then “Create a table from”.</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/02-Importing-Bigquery-asset-1-Screenshot_2023-04-23_at_22.54.53.png" alt=""></p>

<ul>
<li>Next, you can specify the CSV file, which will act as a source for your new table.</li>
<li>The “Source” dropdown will let you select amongst various sources like Cloud storage.</li>
<li>In “File format”, select CSV.</li>
<li>Select a database and give your table a name.</li>
<li>You can either upload a sample JSON to specify the schema or leave the schema definition to “auto-detect”.
Some other configurable parameters are field delimiter/skip header rows/number of errors allowed/jagged rows etc.</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/01-Data-Pipelines/02-Importing-Bigquery-asset-2-233630661-324b88ad-a56b-45e6-ad8c-e801b89977f2.png" alt=""></p>

<ul>
<li>Clicking on “Create Table” will now fetch your CSV, ascertain the schema, create the table and populate it with the CSV data.</li>
</ul>

<h3 id="limitations"><strong>Limitations</strong></h3>

<p>Some limitations of using CSV to load data from Excel to BigQuery are listed below:</p>
<ul>
<li>Files must be loaded individually, no wildcards or multiple selections are allowed when you load files from a local data source.</li>
<li>Excel files loaded from a local data source must be 10 MB or less and must contain fewer than 16,000 rows.</li>
</ul>
</details>
</li>
</ol>

<h3 id="import-a-json-file-on-bigquery">Import a JSON File on BigQuery</h3>

<ol>
<li>Download <a href="https://drive.google.com/file/d/1EdJwn6AW1a2HfexBRpC_wjAuebyf0vhE/view?usp=sharing" target="_blank">clothes_NEWLINE_DELIMITED.json</a> on your computer. Then, import it on BigQuery in a table called <strong>clothes3</strong> in your dataset course12.</li>
</ol>

<h3 id="import-via-google-cloud-storage">Import via Google Cloud Storage</h3>

<p><strong>Direct import</strong> on BigQuery is subject to <strong>some limitations</strong> (file lower than 10 megabyte for instance).</p>

<p>💡&nbsp;However, if you first import the data to Google Cloud Storage and then import the data from Google Cloud Storage to BigQuery, you do not have this limitation.</p>

<p><strong>Google Cloud Storage</strong> works as a <strong>data lake</strong> and <strong>BigQuery</strong> as a <strong>data warehouse</strong>.</p>

<p>💡&nbsp;It can be interesting to keep the data on Google Cloud Storage without deleting it after the import on BigQuery. It is a back-up or archive storage that you can use in case of problem.</p>

<p>The cost is not very expensive on Google Cloud Storage.</p>

<p><strong><a href="https://www.youtube.com/watch?v=cAhVvA83UcA" target="_blank">Tutorial video link here</a></strong></p>

<ol>
<li>Download the file <a href="https://drive.google.com/file/d/121duVBj8KEj4lbdjneGGZqvPj9uXi_qx/view?usp=sharing" target="_blank">sales</a> on your computer. Follow this tutorial to import the 13.3Mo in table <strong>sales</strong>.</li>
</ol>

<p>❗Choose <code>eu (multiple regions in European Union)</code> as location type for your bucket❗</p>

<p>🎉 Congrats!! You have imported your first file via Google Cloud Storage 🎉</p>


</div>
</div>