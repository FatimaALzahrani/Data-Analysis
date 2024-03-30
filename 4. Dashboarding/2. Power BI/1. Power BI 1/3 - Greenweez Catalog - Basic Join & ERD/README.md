<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<hr>

<p>Download solution <a href="https://drive.google.com/file/d/1M3fWTDVIja9KxfmJo2P89P7uTASp5rJ5/view?usp=drive_link" target="_blank">here</a></p>

<hr>

<p><br></p>

<h3 id="relevant-links-for-this-challenge">Relevant links for this challenge</h3>

<p>Data sources:</p>

<p><a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m4!1m3!3m2!1sdata-analytics-bootcamp-363212!2sgreen_catalog" target="_blank">green_catalogue</a></p>

<p><strong>Goal</strong>: The aim of this exercise is to practise on basic&nbsp;<code>merge</code>&nbsp;and&nbsp;<code>join</code>&nbsp;with the example of products catalogues.</p>

<p>In the&nbsp;<code>green_catalogue</code> dataset, you have several tables concerning the products:</p>

<ul>
<li>
<p><code>green_product</code> is the base table representing the products catalogue</p>
</li>
<li>
<p><code>green_pdt_segment</code> gives the segment of each product</p>
</li>
<li>
<p><code>green_promo</code> gives information on promotion according to <code>promo_id</code> key</p>
</li>
<li>
<p><code>green_price</code> gives information on <code>product_price</code></p>
</li>
<li>
<p><code>green_stock</code> gives information on <code>product_stock</code></p>
</li>
<li>
<p><code>green_categories</code> gives information on categories according to <code>categories_id</code></p>
</li>
<li>
<p><code>green_sales</code> gives information on the quantity of products sold in the last 3 months</p>
</li>
</ul>

<p><br></p>

<h3 id="data-import">Data Import</h3>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-1-Untitled.png" alt=""></p>

<p><br></p>

<h3 id="merge">Merge</h3>

<p>In the following questions, you will perform ‘merges’ to collect products_infos.</p>

<ol>
<li>
<p>In the <code>green_product</code> table, add the segment information.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-2-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-3-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>In the <code>green_product</code> table, add the stock information.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-4-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-5-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>In the <code>green_product</code> table, add the promo information.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-6-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Add all prices information from <code>green_price</code> to <code>green_product</code>.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-7-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Add all categories information from <code>green_category</code> to <code>green_product</code>.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-8-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Get <code>products_id</code>, <code>pdt_name</code> and <code>qty</code> sold in the last 3 months from <code>green_sales</code>. We want all products from <code>green_product</code> even if there were no sales in the last 3 months.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-9-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h3 id="join">Join</h3>

<p>Now that we have created our main product table, we will use another way to get all the information we need.</p>

<p>For that, we will use the&nbsp;<code>Model</code>&nbsp;part from Power BI.</p>
</li>
<li>
<p>Before closing your Power Query application, add a prefix for all your merged columns. This will help us compare the data between the&nbsp;<code>Merge</code>&nbsp;and&nbsp;<code>Join</code>&nbsp;methods.</p>

<details>
<summary>How to do it? (2 ways)</summary>

<ul>
<li>Rename the merged columns one by one</li>
<li>Edit the&nbsp;<code>expanded</code>&nbsp;steps and adding a preffix
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-10-Untitled.png" alt=""></li>
</ul>

</details>
</li>
<li>
<p><code>Close and Apply</code>&nbsp;Power query</p>
</li>
<li>
<p>In the&nbsp;<code>Model</code>&nbsp;part, apply (or correct) the following schema</p>
</li>
</ol>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-11-Untitled.png" alt=""></p>

<p>## Learn About ERD Diagrams</p>

<details>
<summary>What is ERD (Entity-Relationship Diagram)? </summary>

<p>ERD notation refers to the symbols and graphical representation used in an Entity-Relationship Diagram (ERD). An ERD is a visual representation of the relationships between entities in a database. It is commonly used in database design to model the structure and relationships of the data.</p>
</details>

<details>
<summary>What are the different types of ERD Diagram notation? </summary>

<p>There are several different types of ERD notation commonly used to represent Entity-Relationship Diagrams. The most widely recognized ones are: <strong>Crow’s Foot Notation, Chen Notation, Bachman Notation &amp; UML Notation.</strong></p>
</details>

<details>
<summary>Lets learn about the Crow’s Foot Notation</summary>

<ul>
<li>Crow’s foot diagrams represent entities as boxes, and relationships as lines between the boxes.</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-4-Untitled.png" alt=""></p>

<ul>
<li>Different shapes at the ends of these lines represent the relative cardinality of the relationship.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-5-Untitled.png" alt=""></li>
</ul>

<p>The cardinality of relationships is shown using crow’s foot symbols (three lines) or short lines to indicate “zero or one” or “many.”</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-6-Untitled.png" alt=""></p>

<p>The previous cardinality symbols are employed in pairs to depict the combination of four cardinality types that an entity can possess within a relationship. 
The closer to the entity signifies the maximum cardinality, while the other is the minimum cardinality
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-7-Untitled.png" alt=""></p>

</details>

<p><br></p>

<p>### Comparison</p>

<ol>
<li>
<p>Create a table listing the following fields:</p>

<ul>
<li>
<p><code>product_id</code></p>
</li>
<li>
<p><code>pdt_name</code></p>
</li>
<li>
<p><code>merged.pdt_segment</code></p>
</li>
<li>
<p><code>pdt_segment</code></p>
</li>
<li>
<p><code>merged.ps_cat</code>⚠️&nbsp;Power BI will automatically perform some aggregation as it is a number. Click on&nbsp;<code>Don’t Summarize</code>&nbsp;to display all results</p>
</li>
</ul>

<details>
<summary>Don’t Summarize</summary>

</details>

<ul>
<li>
<p><code>ps_cat</code></p>
</li>
<li>
<p><code>merged.qty</code> (Don’t Summarize)</p>
</li>
<li>
<p><code>qty</code> (Don’t Summarize)</p>
</li>
<li>
<p><code>merged.category_1</code></p>
</li>
<li>
<p><code>category_1</code></p>
</li>
<li>
<p><code>merged.promo_name</code></p>
</li>
<li>
<p><code>promo_name</code></p>
</li>
<li>
<p><code>merged.stock</code> (Don’t Summarize)</p>
</li>
<li>
<p><code>stock</code> (Don’t Summarize)</p>
</li>
</ul>

<p>Compare the columns with each other and make sure you get the same results</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-12-Untitled.png" alt=""></p>
</li>
<li>
<p>Create a KPI card by counting your total products</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-13-Untitled.png" alt=""></p>
</li>
<li>
<p>Export your data from the table you created and compare the number of rows you have with the total number of products. Is your result the same as the KPI above and the file?</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-14-Untitled.png" alt=""></p>

<p>In our file, we only have 244 rows instead of 1000</p>
</details>
</li>
<li>
<p>How can you explain this difference?</p>

<details>
<summary>Solution 🔓</summary>

<p>We are only displaying products with sales in our table (the sales table contains exactly 244 rows).
This problem comes from the links we have created between the tables and Power BI will consider them as an <code>Inner Join</code> and in our case, we need a <code>Left Join</code> to display <strong>all</strong> the products.
From your table, in the product_id field, click on <code>Show items with no data</code>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/05-Basic-Join-&amp;-ERD-asset-15-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>After applying the right correction, do the same export export from your table again. How many rows do you now have in your file?</p>

<details>
<summary>Solution 🔓</summary>

<p>1000 rows
/details&gt;</p>

</details>
</li>
</ol>


</div>
</div>