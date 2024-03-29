```markdown
<div id="exercice-content" class="px-5 py-3">
        
    
<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<h2 id="introduction">Introduction</h2>

<h3 id="greenweez-presentation">Greenweez Presentation</h3>

<p>🪴&nbsp;Greenweeez is a leading online marketplace for organic products.</p>

<p>🏷️&nbsp;It sells organic, ecological and sustainable produce to B2C customers with the aim to facilitate responsible consumption and a healthier lifestyle.</p>

<p>⚖️&nbsp;Monitoring the financial health of the company is essential to ensure a sufficient level of profitability.</p>

<h3 id="finance-team">Finance Team</h3>

<p>Here are the main missions of the finance team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/05-Gwz-Finance-Key-And-Relationship-Diagram-asset-1-Untitled.png" alt=""></p>

<p>Let’s focus on financial management. The goal is to gather all the data about costs and revenue in order to track the company’s profitability over time.</p>

<p>Here are the main KPIs for the finance team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/05-Gwz-Finance-Key-And-Relationship-Diagram-asset-2-Untitled.png" alt=""></p>

<h3 id="objective">Objective</h3>

<p>The objective of this exercise is to identify the primary keys and to understand the structure and relationship between the different tables of the Greenweez finance data.</p>

<p>In this exercise you will be able to:</p>

<ul>
  <li>
    <p>Define the primary keys for several tables</p>
  </li>
  <li>
    <p>Better understand the relationships between the different tables</p>
  </li>
</ul>

<h3 id="data-import">Data Import</h3>

<ul>
  <li>
    <p>Copy <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgwz_sales" target="_blank">gwz_sales</a> table on your project in course14 dataset</p>
  </li>
  <li>
    <p>Copy <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgwz_product" target="_blank">gwz_product</a> table on your project in course14 dataset</p>
  </li>
  <li>
    <p>Copy <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse16!3sgwz_ship" target="_blank">gwz_ship</a> table on your project in course14 dataset</p>
  </li>
</ul>

<p>💁🏽&nbsp;<u>_Help_</u> - <a href="https://cloud.google.com/bigquery/docs/managing-tables#copying_a_single_source_table" target="_blank">Google documentation</a> to copy a table</p>

<h2 id="1---table-exploration">1 - Table Exploration</h2>

<ol>
  <li>
    <p>First, to explore and understand the structure of the tables, click on the <code>Schema</code> and <code>Preview</code> tabs in BigQuery. How many columns are there? How many rows? Can you understand what data each of the columns contain?</p>
  </li>
  <li>
    <p>What are the primary keys for the different tables?</p>

    <details>
      <summary>Hint - Primary key 🗝️</summary>

      <p>A primary key is a column, or a combination of several columns, that uniquely identify each row in a table. It must satisfy the following criteria:</p>

      <ol>
        <li>Each value in the primary key must be unique.</li>
        <li>The primary key cannot contain null values.</li>
        <li>There can only be one primary key per table.</li>
      </ol>

      <p>The primary key is important because it is used to create relationships between tables in a database. To ensure data integrity, it’s crucial to control that the primary key meets the criteria above.
To control the primary key, you can use the <code>SELECT DISTINCT</code> clause to identify if the values are unique. You can use <code>WHERE column IS NULL</code> to identify if there are any null values. It’s important to verify the primary key early in the analysis process to avoid data inconsistencies and errors later on.
Remember, you’ll be using the primary key for most of your database queries and operations, so it’s essential to ensure its accuracy and validity.</p>
    </details>

    <h2 id="2---table-link-and-relationship">2 - Table Link and Relationship</h2>

    <h3 id="relationship-between-tables">Relationship between Tables</h3>
  </li>
  <li>
    <p>What is the relationship between <code>gwz_sales</code> and <code>gwz_product</code>? What is the key to link the two tables? Is it a <strong>1:1</strong> relationship, a <strong>1:N/N:1</strong> relationship or an <strong>N:N</strong> relationship?</p>
  </li>
  <li>
    <p>What is the relationship between <code>gwz_sales</code> and <code>gwz_ship</code>? What is the key to connect the two tables? Is it a <strong>1:1</strong> relationship, a <strong>1:N</strong> relationship or an <strong>N:N</strong> relationship?</p>

    <h3 id="schema---entity-relationship-diagrams-erd">Schema - Entity Relationship Diagrams (ERD)</h3>

    <p>To better understand the relationship between relational databases, you should make an entity-relationship diagram (ERD).</p>

    <ul>
      <li>Watch this video on <a href="https://www.youtube.com/watch?v=QpdhBUYk

7Kk&amp;t=1s" target="_blank">Entity Relationship Diagram</a></li>
    </ul>

    <p>The goal is to create the ERD for our 3 tables.</p>

    <p>You could create it from the scratch, but that would take too much time, therefore we have started to create the ERD for you. Please take the time to complete it.</p>

    <p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/05-Gwz-Finance-Key-And-Relationship-Diagram-asset-3-Untitled.png" alt=""></p>
  </li>
  <li>
    <p>With pencil and paper (or in your head), fill it in with:</p>

    <ul>
      <li>
        <p>Primary Key for each table (PK)</p>
      </li>
      <li>
        <p>Joining key between tables (JK)</p>
      </li>
      <li>
        <p>Relationship between tables</p>
      </li>
    </ul>

    <p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/01-Intro-To-Transformation/05-Gwz-Finance-Key-And-Relationship-Diagram-asset-4-Untitled.png" alt=""></p>

    <p>You have now completed the ERD by identifying the keys of all the tables in the Greenweez financial dataset and by mapping out their relationships. The ERD is meant to help you correctly join the different tables together in the next challenge.</p>
  </li>
</ol>


      </div>
```