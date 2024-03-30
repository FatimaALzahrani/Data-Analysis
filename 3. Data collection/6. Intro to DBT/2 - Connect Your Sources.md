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

<h2 id="connect-your-sources">Connect your Sources</h2>

<p>For this lecture’s challenges, we will remain in the <code>develop</code> tab . <code>Develop</code> corresponds to my environment in dbt Cloud</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-1-Capture_decran_2023-09-25_a_15.16.30.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-2-Capture_decran_2023-09-25_a_15.15.15.png" alt=""></p>

<h3 id="overview-of-my-dbt-cloud">Overview of my dbt Cloud</h3>

<p>When you initiate the project, the new repository should look like this:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-3-Capture_decran_2023-09-25_a_15.06.12.png" alt=""></p>

<h2 id="1---start-making-changes">1 - Start Making Changes</h2>

<ol>
<li>
<p>Before being able to make changes, you need to Initialize the dbt project and perform a first commit.</p>

<details>
<summary>Solution</summary>

<ol>
<li>
<p>Initialise dbt project
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-4-Capture_decran_2023-09-25_a_15.15.02.png" alt=""></p>
</li>
<li>
<p>Commit and sync
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-5-Untitled.png" alt=""></p>
</li>
<li>
<p>Type a commit message and&nbsp;<strong>Commit Changes</strong>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-6-Untitled.png" alt=""></p>
</li>
</ol>

</details>
</li>
<li>
<p>We will start by creating a new branch to modify the project. You can call it <code>init</code></p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-4-Capture_decran_2023-09-25_a_15.15.02.png" alt=""></p>

</details>
</li>
<li>
<p>Now, let’s proceed by creating a <code>schema.yml</code> inside the <code>models</code> directory using the <code>…</code> icon on the folder</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-8-Capture_decran_2023-09-25_a_15.07.03.png" alt=""></p>

<p>Remember Git will track your modifications, you can click on the changes list to see the details of the modifications.</p>
</li>
</ol>

<h2 id="2---connect-your-source">2 - Connect your Source</h2>

<p>Remember, your sources were created in your own BigQuery project as follows:</p>

<ul>
<li>
<p>Dataset: <code>gz_raw_data</code></p>
</li>
<li>
<p>Tables:</p>

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
</li>
</ul>

<ol>
<li>
<p>You need to declare the sources in dbt Cloud to be able to reference them in your models later on.</p>

<details>
<summary>Hint</summary>

<p>You should declare your sources like this :
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-9-Capture_decran_2023-09-25_a_15.45.08.png" alt=""></p>

</details>
</li>
</ol>

<h3 id="optional---change-naming-reference">Optional - Change Naming Reference</h3>

<p>You can opt for a simpler <strong>schema</strong> name for your database and a simpler <strong>identifier</strong> name for your tables when referencing them in dbt.</p>

<p><em><strong>Note -</strong></em>&nbsp;database in BigQuery are called schema in dbt</p>

<ol>
<li>
<p>Transform the names as follows: let’s use <code>raw</code> instead of <code>gz_raw_data</code> for the dataset name, and the following for the tables’ names:</p>

<ul>
<li>
<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sgz_raw_data!3sraw_gz_sales" target="_blank">raw_gz_sales</a> → <code>sales</code></p>
</li>
<li>
<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sgz_raw_data!3sraw_gz_product" target="_blank">raw_gz_product</a> → <code>product</code></p>
</li>
<li>
<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2sgz_raw_data!3sraw_gz_ship" target="_blank">raw_gz_ship</a> → <code>ship</code></p>
</li>
</ul>

<p>So that you can access your sources with <code>{{source(’raw’, ‘sales’)}}</code> instead of<code>{{source(’gz_raw_data’, ‘raw_gz_sales’)}}</code></p>

<details>
<summary>Solution </summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-10-Capture_decran_2023-09-25_a_15.59.19.png" alt=""></p>

</details>
</li>
</ol>

<h2 id="3---check-your-code">3 - Check your Code</h2>

<ol>
<li>
<p>Save your code and check the parsing result:</p>

<ul>
<li>At the bottom right of your page you should have this label:</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-11-Capture_decran_2023-09-25_a_18.06.08.png" alt=""></p>

<ul>
<li>If you have this:</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-12-Capture_decran_2023-09-25_a_18.07.29.png" alt=""></p>

<p>You can click on it to have more details</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-13-Capture_decran_2023-09-25_a_18.08.28.png" alt=""></p>

<p>Then you should close, correct your mistake, save and check again</p>
</li>
</ol>

<h2 id="4---commit-your-changes">4 - Commit your Changes</h2>

<p>👏&nbsp;Your sources seem well-parametrized.</p>

<ol>
<li>
<p>Let’s <code>commit and sync</code> your changes to save your work.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-14-Capture_decran_2023-09-25_a_17.44.05.png" alt=""></p>

</details>

<p>We will create a Pull request at the end to merge our work into the <code>main</code> / <code>master</code> branch</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-15-Capture_decran_2023-09-25_a_17.45.21.png" alt=""></p>

<p>Let’s disregard this for now and continue with our modifications.</p>
</li>
</ol>

<h2 id="5---check-lineage">5 - Check Lineage</h2>

<ol>
<li>
<p>Navigate to the bottom of your page and check the beginning of your lineage. How does it look like?</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/02-Connect-Your-Sources-asset-16-Capture_decran_2023-09-25_a_17.53.10.png" alt=""></p>

<p>If you haven’t change the naming reference, the name should be different, you can continue without any issue.</p>
</details>
</li>
</ol>



</div>
</div>