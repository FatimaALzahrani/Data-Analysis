<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<h2 id="introduction">Introduction</h2>

<p>In some cases, it’s easy to create a data pipeline using Google Sheets and SQL BigQuery, especially when you’re using data generated on an adhoc database and available in .csv, .xls or .json format.</p>

<p>For this challenge, the aim is to create an initial data pipeline using tools you already know, namely Google Sheets and BigQuery, and to follow an E(xtract)-T(ransform)-L(oad) process step by step.</p>

<h2 id="1---import-survey-data-to-google-sheets">1 - Import Survey Data to Google Sheets</h2>

<ol>
<li>
<p>Open a <a href="https://docs.google.com/spreadsheets/u/0/" target="_blank">new blank Google Sheets</a> called [Your Name] - My First Data Pipeline</p>
</li>
<li>
<p>Import the data from this <a href="https://drive.google.com/file/d/1j97wC5P5pfyvHEw_K5boaz4EX1EDR_dV/view?usp=sharing" target="_blank">CSV file</a> manually. Take the time to understand the information corresponding to the data you have just imported.</p>

<details>
<summary>Dataset information</summary>

<p>DESCRIPTION
Masculinity Survey - What Do Men Think It Means To Be A Man?</p>

<p>SUMMARY
masculinity-survey.csv contains the results of a survey of 1,615 adult men conducted by SurveyMonkey in partnership with FiveThirtyEight from May 10-22, 2018. The modeled error estimate for this survey is plus or minus 2.5 percentage points. The percentages have been weighted for age, race, education, and geography using the Census Bureau’s American Community Survey to reflect the demographic composition of the United States age 18 and over. Crosstabs with less than 100 respondents have been left blank because responses would not be statistically significant.</p>

<p>The data is available under the Creative Commons Attribution 4.0 International License and the code is available under the MIT License.</p>
</details>
</li>
</ol>

<h2 id="2---implement-an-etl-process-between-google-sheets-and-sql">2 - Implement an ETL Process between Google Sheets and SQL</h2>

<p>You now want to analyze the survey responses collected in this Google Sheets document.</p>

<ol>
<li>
<p>Quickly analyze the structure of the document and identify the changes you need to make to make it easier to ingest and manipulate in BigQuery later on.</p>

<details>
<summary>Hint</summary>

<p>Try to identify missing values, duplicates, outliers, unclear naming conventions, etc.</p>
</details>
</li>
<li>
<p>Remove NULL rows to eliminate noise from the dataset when you ingest the data into BigQuery.</p>
</li>
<li>
<p>Transform %s into FLOAT numbers for easier processing by BigQuery.</p>
</li>
<li>
<p>Rename the columns to make them more representative of the data they collect</p>

<details>
<summary>Hint </summary>

<p>You need to focus on both the content and the format of the column names.</p>
</details>
</li>
<li>
<p>You will now upload your cleaned table unto BigQuey. Create a <code>survey</code> table in the ‘course12’ dataset on BigQuery and select your cleaned table as the data source.</p>

<p>Check that you have obtained the correct column names and query the table to check that you have ingested all the data in relation to the Google spreadsheets.</p>
</li>
</ol>

<h2 id="3---perform-first-analysis-on-the-newly-collected-data">3 - Perform First Analysis on the Newly-collected Data</h2>

<ol>
<li>
<p>Identify the most common answers given by respondents to the question: ‘<em>In general, how masculine or “manly” do you feel?</em>’</p>

<details>
<summary>Hint</summary>

<p>In order to select all the rows that offer answer options to that question, you can use the REGEXP_CONTAINS() function</p>
</details>
</li>
<li>
<p>Write a query to compare each age group to&nbsp;<code>adult_men</code>&nbsp;for the questions relating to feelings of isolation.</p>

<p>You can continue to analyze the survey results to compare the different groups and their reported behaviour.</p>

<p>Congratulations, you’ve been able to build an initial pipeline between Google Sheets and BigQuery and perform a few transformations at a time before loading the raw data and getting some initial insights from the analysis. 🎉</p>
</li>
</ol>


</div>
</div>