<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<h3 id="relevant-links-for-this-challenge">Relevant links for this challenge</h3>

<p>Link to the solution:</p>

<p><a href="https://drive.google.com/file/d/1CHlxqit69j7pOBvYzcgEs_Idk0N_6M2v/view?usp=share_link" target="_blank">billions-solution</a></p>

<p>Data sources:</p>

<p><a href="https://wagon-public-datasets.s3.eu-west-1.amazonaws.com/bi-data/Richest_people.xlsx" target="_blank">Richest people.xlsx</a></p>

<p><a href="https://wagon-public-datasets.s3.eu-west-1.amazonaws.com/bi-data/Business_sector.xlsx" target="_blank">Business sector.xlsx</a></p>

<p>Who are the richest people in the world?</p>

<p><br></p>

<p><strong>Background &amp; Objectives</strong></p>

<p>The goal of this challenge is to learn how to load a data source and do some basic data cleaning.</p>

<p><br></p>

<h3 id="import-the-file">Import the File</h3>

<p>Import Richest_people.xlsx</p>

<p>Create a new Power BI report, and load in the data from this workbook:</p>

<p><img src="https://raw.githubusercontent.com/lewagon/data-images/master/bi-data/03-BI/03-Power-Tools-Basics/01-Billions/Untitled.png" alt=""></p>

<p>Let’s clean our data now!</p>

<p><br></p>

<h3 id="data-cleaning">Data Cleaning</h3>

<p>Use Query Editor to make this data look better:</p>

<ol>
<li>
<p>Rename your columns:</p>

<ol>
<li>
<p>No. → Rank</p>
</li>
<li>
<p>Net worth (USD)(March 2018)[15] → Billions ($)</p>
</li>
</ol>
</li>
<li>
<p>Format the “Billions ($)” column to a whole number format</p>

<details>
<summary>Solution</summary>

<ul>
<li>Step 0: Replace the “.” (point) with a “,” (comma) - <em>Warning: ONLY APPLICABLE in countries where the decimal numbers use commas i.e. France</em></li>
<li>Step 1: Replace the word billion with an empty string.</li>
<li>Step 2: Replace the $ symbol with an empty string.</li>
<li>Step 3: Convert the resulting column to a whole number.</li>
</ul>
</details>

<p><br></p>

<h3 id="data-visualization">Data Visualization</h3>
</li>
<li>
<p>Once your data is ok, bring it back into your Power BI report, and use it to create a simple chart.</p>

<p>We want to sum up the&nbsp;<code>total billions owned by nationality</code>&nbsp;in a matrix.</p>

<p><img src="https://raw.githubusercontent.com/lewagon/data-images/master/bi-data/03-BI/03-Power-Tools-Basics/01-Billions/Untitled%201.png" alt=""></p>

<p>So far, so good?</p>

<p>Let’s go further.</p>

<p><br></p>

<h3 id="enrich-your-data">Enrich your Data</h3>

<p>We now want to sum up the total billions per&nbsp;<code>age category</code>.</p>

<p>Use Query Editor to enrich your data:</p>
</li>
<li>
<p>Create a new Conditional column “Age category”</p>
</li>
<li>
<p>Categorise billionaires into 3 categories:</p>

<p>a- If Age ≥ 80 years → <code>Old</code></p>

<p>b- If 50 ≤ Age &lt; 80 years → <code>Middle age</code></p>

<p>c- Else → <code>Young</code></p>

<details>
<summary>Solution</summary>

<ul>
<li>Condition to apply below:
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/02-Billions-asset-1-Untitled.png" alt=""></li>
</ul>

</details>

<p><br></p>

<h3 id="data-visualization-again">Data Visualization Again</h3>
</li>
<li>
<p>Once your data is ok, bring it back into your Power BI report, and use it to create a simple chart.</p>

<p>We want to sum up the&nbsp;<code>total billions owned by age category</code>&nbsp;in a matrix.</p>

<p><img src="https://raw.githubusercontent.com/lewagon/data-images/master/bi-data/03-BI/03-Power-Tools-Basics/01-Billions/Untitled%203.png" alt=""></p>

<p><br></p>

<h3 id="merge-data"><strong>Merge data</strong></h3>

<p>Import the file below:</p>

<p><a href="https://wagon-public-datasets.s3.eu-west-1.amazonaws.com/bi-data/Business_sector.xlsx" target="_blank">Business sector.xlsx</a></p>

<p>It represents the business sector per company.</p>

<p><br></p>

<h3 id="enrich-your-data-even-more">Enrich your Data Even More</h3>

<p>We now want to sum up the total billions per business sector:</p>
</li>
<li>
<p>First, you’ve noticed the first line of your fill is not recognized as a header. Add a new step “Use First Row as Headers”</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/02-Billions-asset-2-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>As you can see, you have a duplicated row in your dataset, remove it</p>

<details>
<summary>Solution</summary>

<ul>
<li>Select all columns</li>
<li>Home → Remove rows → Remove duplicates</li>
</ul>
</details>
</li>
<li>
<p>Merge your dataset <code>Billionaires</code> and <code>Sector</code>. If matching columns do not have the same name, you need to select them.</p>

<details>
<summary>Solution</summary>

<p><img src="https://raw.githubusercontent.com/lewagon/data-images/master/bi-data/03-BI/03-Power-Tools-Basics/01-Billions/Untitled%204.png" alt=""></p>

</details>
</li>
<li>
<p>Rename your new dataset <code>Billionaires - Sector</code></p>
</li>
<li>
<p>Expand the merge table and select only the “Business sector” column</p>
</li>
<li>
<p>Remove the alias <code>Sector</code>. to the <code>Sector.Business sector</code> column</p>
</li>
<li>
<p>In the Power BI report, build your&nbsp;<code>matrix total billions per business sector</code></p>

<p><img src="https://raw.githubusercontent.com/lewagon/data-images/master/bi-data/03-BI/03-Power-Tools-Basics/01-Billions/Untitled%205.png" alt=""></p>
</li>
</ol>

<p>Save your file as <code>Billions</code>.</p>

<p>Congratulations, you made it through your first data cleaning in Power BI! 🎉</p>


</div>
</div>