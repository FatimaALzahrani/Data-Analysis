<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<p>The objective of this exercise is to learn about basic SQL join operations by joining the tables from a product catalog.</p>

<p>The <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m4!1m3!3m2!1sdata-analytics-bootcamp-363212!2sgreen_catalog" target="_blank">green_catalog</a> dataset consists of several product related tables:</p>

<ul>
<li>
<p><code>green_product</code> is the base table representing the <code>products</code> catalog</p>
</li>
<li>
<p><code>green_pdt_segment</code> provides the segment of each product</p>
</li>
<li>
<p><code>green_promo</code> provides information about promotions</p>
</li>
<li>
<p><code>green_price</code> provides information about product prices</p>
</li>
<li>
<p><code>green_stock</code> provides information about product stock</p>
</li>
<li>
<p><code>green_categories</code> provides information about product categories</p>
</li>
<li>
<p><code>green_sales</code> provides information about the quantity of products sold in the last 3 months</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/03-Joins-Testing/01-Greenweez-Catalog-Basic-Join-asset-1-Untitled.png" alt=""></p>

<h2 id="1---join-queries---building-joins">1 - Join Queries - Building Joins</h2>

<ol>
<li>
<p>Join the <code>green_product</code> and <code>green_pdt_segment</code> tables in order to return the <code>pdt_name</code> and the <code>pdt_segment</code> columns. First you have to pick a type of JOIN depending of the schema and the analysis you want to do (INNER JOIN in our case). Then you’ll have to specify the column that you want to do the joining ‘ON’.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/03-Joins-Testing/01-Greenweez-Catalog-Basic-Join-asset-2-Untitled.png" alt=""></p>
</details>
</li>
<li>
<p>Add all the stock information to the main product information by joining the <code>green_product</code> and <code>green_stock</code> tables. When joining tables, make sure you give an alias name to each of the tables so that in the <code>SELECT</code> clause you can unambiguously indicate from which table a specific column should be taken.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/03-Joins-Testing/01-Greenweez-Catalog-Basic-Join-asset-3-Untitled.png" alt=""></p>
</details>
</li>
<li>
<p>SELECT <code>products_id</code>, <code>pdt_name</code>, <code>promo_name</code> and <code>promo_pourcent</code> from <code>green_product</code> and <code>green_promo</code> tables. In the results, we also want to include those product rows that don’t have a promotion. Experiment with the different JOIN types to be able to return all the product rows without promotion AND the rows with promotion.</p>
</li>
<li>
<p>Return the same result by using RIGHT JOIN.</p>
</li>
<li>
<p>Add all the price information from <code>green_price</code> to <code>green_product</code>.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/03-Joins-Testing/01-Greenweez-Catalog-Basic-Join-asset-4-Untitled.png" alt=""></p>
</details>
</li>
<li>
<p>Return the <code>products_id</code> and <code>pdt_name</code> with all their associated category information.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/03-Joins-Testing/01-Greenweez-Catalog-Basic-Join-asset-5-Untitled.png" alt=""></p>
</details>
</li>
<li>
<p>Return the <code>products_id</code>, <code>pdt_name</code> and their <code>qty</code> sold in the last 3 months. We want to return all the products from <code>green_product</code> even if they were not sold in the last 3 months&nbsp;<strong>(Remember, the&nbsp;<code>green_sales</code>&nbsp;table only contains the sales data from the past 3 months.)</strong></p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/03-Joins-Testing/01-Greenweez-Catalog-Basic-Join-asset-6-Untitled.png" alt=""></p>
</details>
</li>
<li>
<p>Return the same result by using RIGHT JOIN.</p>
</li>
</ol>

<p>Great start! 💪🏽</p>


</div>
</div>