<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<h1 id="introduction---greenweez-finance-team-requirements">Introduction - Greenweez Finance Team Requirements</h1>

<p>The finance team has requested the creation of a comprehensive table in BigQuery for conducting basket analysis. The table should encompass the following key metrics:</p>

<ul>
<li>
<p><strong>Daily Transaction Evolution:</strong></p>

<p>Tracking the number of transactions (orders) that occur each day.</p>
</li>
<li>
<p><strong>Daily Average Basket Evolution:</strong></p>

<p>Monitoring the average basket amount for each day.</p>
</li>
<li>
<p><strong>Daily Margin and Operational Margin Evolution</strong>:</p>

<p>Observing the evolution of both margin and operational margin on a daily basis.</p>
</li>
</ul>

<p>In order to fulfill their requirements, they have specified the need for a well-structured data pipeline using dbt that adheres to the following principles:</p>

<ul>
<li>
<p>Data Accuracy and Protection:</p>

<p>The pipeline should be designed to prevent the insertion of incorrect or erroneous data into the production environment, ensuring data accuracy and integrity.</p>
</li>
<li>
<p>Error Identification and Handling:</p>

<p>The pipeline should have mechanisms in place to break down complexity, making it easy to identify and handle any new errors that may arise without disrupting access to data.</p>
</li>
<li>
<p>Organized and Accessible Structure:</p>

<p>The data should be organized and stored in a separate dataset to prevent any potential misunderstandings regarding its structure or usage within the finance team.</p>
</li>
<li>
<p>Comprehensive Documentation:</p>

<p>Provide detailed and comprehensive documentation of the table, including its columns, and lineage to understand where the data are coming from to enhance understanding and usage.</p>
</li>
</ul>

<p>The dbt pipeline should effectively cater to these requirements, ensuring the finance team has access to up-to-date and accurate information for their daily dashboard needs.</p>

<h1 id="generate-your-first-model">Generate your First Model</h1>

<h2 id="1---generate-a-first-model-for-sales">1 - Generate a First Model for <code>sales</code></h2>

<ol>
<li>
<p>For greater clarity, you can delete the <code>example</code> directory inside the <code>models</code> folder.</p>
</li>
<li>
<p>Go back to the <code>schema.yml</code> file. You can use the button <code>generate model</code> from to instantiate your first staging model for <code>sales</code></p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-1-Capture_decran_2023-09-25_a_17.52.33.png" alt=""></p>

</details>

<details>
<summary>Hint</summary>

<p>This will automatically create a model named <code>stg_raw__sales.sql</code>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-2-Capture_decran_2023-09-25_a_17.57.18.png" alt=""></p>

<p><em><strong>Note -</strong></em> Models will be automatically created using CTEs for enhanced readability. One CTE will pull in a source table via the source macro, and the other CTE will apply our transformations.
<em>More info here</em> <a href="https://docs.getdbt.com/terms/cte" target="_blank">https://docs.getdbt.com/terms/cte</a></p>
</details>
</li>
<li>
<p>Save your result and check the lineage. It should look like this</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-3-Capture_decran_2023-09-25_a_17.57.24.png" alt=""></p>
</li>
<li>
<p>Click on Preview to check your result</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-4-Capture_decran_2023-09-25_a_18.15.40.png" alt=""></p>
</li>
<li>
<p>You need to transform the data, here to perform some basic cleaning operations in the second CTE from lines 10 to 19 in the SQL script:</p>

<ul>
<li>rename the column <code>pdt_id</code> to <code>products_id</code></li>
</ul>
</li>
</ol>

<h2 id="2---generate-one-model-per-source">2 - Generate One Model per Source</h2>

<ol>
<li>
<p>Generate the same for the two other sources so that your lineage looks like this.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-5-Capture_decran_2023-09-25_a_18.19.47.png" alt=""></p>

<p><em><strong>Note -</strong></em>&nbsp;you can click on_ <code>_schema.yml_</code>_and then lineage to view all the models at the same time.</p>
</li>
<li>
<p>Perform the necessary transformations to clean your table columns:</p>

<ul>
<li>
<p>For <code>product</code>: purchse_price as purchase_price</p>
</li>
<li>
<p>For <code>ship</code>:</p>

<ul>
<li>
<p>You might want to check the difference between <code>shipping_fee</code>and <code>shipping_fee_1</code></p>
</li>
<li>
<p>You can use a WHERE clause and preview the result</p>
</li>
<li>
<p>You should keep only one of the columns</p>
</li>
</ul>
</li>
</ul>

<details>
<summary>Solution</summary>

<p>For <code>ship</code> transformations:</p>
<ul>
<li>You can check the difference between <code>shipping_fee</code> and <code>shipping_fee_1</code> using this query in BigQuery:
```sql
SELECT
<ul>
<li>FROM <code>data-analytics-bootcamp-363212.gz_raw_data.raw_gz_ship</code> 
WHERE shipping_fee &lt;&gt; shipping_fee_1
```
It returns no row. It means we have the exact same data in the two columns.</li>
</ul>
</li>
<li>Then, you can remove <code>shipping_fee_1</code> from the query in dbt.</li>
</ul>
</details>
</li>
<li>
<p>Check your code</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-6-Capture_decran_2023-09-25_a_18.06.08.png" alt=""></p>
</li>
<li>
<p>Commit and sync your changes</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-7-Capture_decran_2023-09-25_a_18.26.39.png" alt=""></p>

</details>
</li>
</ol>

<h2 id="3---create-your-models-in-bigquery">3 - Create your Models in BigQuery</h2>

<p>So far, nothing has been created on BigQuery.</p>

<p>Here are accessible shortcut commands on dbt Cloud:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-8-Capture_decran_2023-09-26_a_16.57.22.png" alt=""></p>

<ol>
<li>
<p>Click <code>build</code> to execute the command <code>dbt build --select &lt;model_name&gt;</code> where <model_name> is the open file</model_name></p>

<p>Use the command <code>dbt build</code> to:</p>

<ul>
<li>
<p>test all your sources (no test written so far)</p>
</li>
<li>
<p>test all your models (no test written so far)</p>
</li>
<li>
<p>create all your models (as views by default)</p>
</li>
</ul>

<p>You should see these logs</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-9-Capture_decran_2023-09-26_a_09.08.45.png" alt=""></p>

<p><em><strong>Note -</strong></em>&nbsp;if you haven’t deleted_ <code>example</code> directory inside <code>models</code>, the command <code>dbt build</code> will also run these models into BigQuery</p>
</li>
<li>
<p>Check that the views are created on BigQuery</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-10-Capture_decran_2023-09-25_a_18.39.04.png" alt=""></p>

</details>

<p>If something has gone wrong, you can delete the dataset in BigQuery and <code>dbt build</code> again.</p>

<p>Views will be created under the dataset that you set up on the first challenge.</p>

<p>If you want to change it, you can go to your Profile / Credentials / Greenweez [Your name] / edit</p>

<details>
<summary>Hint</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-11-Capture_decran_2023-09-25_a_18.36.03.png" alt=""></p>

</details>
</li>
</ol>

<h2 id="4---lets-add-more-information-about-the-source">4 - Let’s Add More Information about the Source</h2>

<ol>
<li>
<p>Add a description about the schema (dataset), the tables, and their columns, so that you can leter generate documentation generation into the <code>schema.yml</code> file.</p>

<details>
<summary>Hint</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-12-Capture_decran_2023-09-25_a_16.48.19.png" alt=""></p>

</details>

<details>
<summary>Solution </summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-13-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Add tests to ensure the uniqueness and existence of the primary keys of the table <code>product</code> and <code>ship</code></p>

<ul>
<li>
<p>What’s the primary key?</p>
</li>
<li>
<p>What’s the associated test?</p>
</li>
</ul>

<details>
<summary>Hint</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-14-Capture_decran_2023-09-25_a_17.24.48.png" alt=""></p>

</details>

<details>
<summary>Solution</summary>

<p><code>product</code>table
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-15-Capture_decran_2023-09-25_a_17.20.37.png" alt=""></p>

<p><code>ship</code> table
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-16-Capture_decran_2023-09-25_a_17.20.44.png" alt=""></p>

</details>
</li>
<li>
<p>Let’s add a test for the primary key of table <code>sales</code></p>

<ul>
<li>What is the particularity of this primary key?</li>
</ul>

<details>
<summary>Hint</summary>

<p>You should do a combination of two columns and test this ‘new column’ 
<em><strong>Note -</strong></em>&nbsp;Searching on the internet, you might have found <code>dbt_utils.unique_combination_of_columns</code> You should install a package first to use this test, we will see that tomorrow</p>
</details>

<details>
<summary>Solution</summary>

<p><code>sales</code> table
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-17-Untitled.png" alt=""></p>

<p>If package dbt_utils is already installed</p>
</details>
</li>
</ol>

<h2 id="5---recreate-your-models-in-bigquery">5 - Recreate your Models in BigQuery</h2>

<ol>
<li>
<p>Run the <code>dbt build</code> command again.</p>

<p>If a model was already created, the command  <code>dbt build</code>  will recreate it:</p>

<ul>
<li>
<p>test your sources <strong>(new tests added here)</strong></p>
</li>
<li>
<p>test your models (no test written so far)</p>
</li>
<li>
<p>create your models (as views by default)</p>
</li>
</ul>

<p>You should see these logs</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-18-Capture_decran_2023-09-25_a_18.33.28.png" alt=""></p>
</li>
</ol>

<h3 id="optional---add-freshness-test">Optional - Add Freshness Test</h3>

<p>Since these tables are outdated, adding freshness tests might not be appropriate. However, to understand how freshness tests work, let’s add a warning if the freshest data in the <code>sales</code>table is more than 90 days ago.</p>

<ol>
<li>
<p>Write the freshness test in the <code>schema.yml</code> file.</p>

<details>
<summary>Hint</summary>

<p>Freshness test will need a <code>loaded_at_field</code>  corresponding to the timestamp column to identify the latest row and compare it with today’s date.
Make sure you add this freshness test under <code>sales</code>table</p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="n">tables</span><span class="p">:</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">sales</span>
<span class="n">freshness</span><span class="p">:</span> 
<span class="n">warn_after</span><span class="p">:</span> <span class="p">{........}</span>
<span class="n">loaded_at_field</span><span class="p">:</span> <span class="nv">"CAST(..... as TIMESTAMP)"</span>
</code></pre></div>      </div>
</details>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-19-Capture_decran_2023-09-25_a_17.39.03.png" alt=""></p>

</details>
</li>
<li>
<p>Run <code>dbt source freshness</code>to test if the latest data in <code>sales</code>are more than 90 days ago.</p>

<p>Since data are from 2021, the warning should be active</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/03-First-Staging-Models-asset-20-Capture_decran_2023-09-26_a_09.07.53.png" alt=""></p>
</li>
</ol>

<h3 id="congrats-you-can-check-your-code-and-commit-and-sync-your-changes">Congrats! You can check your code and ‘Commit and sync’ your changes</h3>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/4aqcks2l1na0vo42sjsrswvrpmhb" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/vhfxvsunxozx4t17osrlfabh8tx5" alt=""></p>



</div>
</div>