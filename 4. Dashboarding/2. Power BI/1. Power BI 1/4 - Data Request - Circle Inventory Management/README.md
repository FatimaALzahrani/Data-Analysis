<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<hr>

<p>Download solution <a href="https://drive.google.com/file/d/1Zhj0i8uK8qzl36fDP2E_eXXclefInpRD/view?usp=share_link" target="_blank">here</a></p>

<hr>

<h3 id="relevant-links-for-this-challenge">Relevant links for this challenge</h3>

<p>Data sources:</p>

<p><a href="https://docs.google.com/spreadsheets/d/19cDDybWRQrWkGpGJfL6Yp63zkHXEtQRn_SNXySUm6sI/edit#gid=0" target="_blank">circle_stock</a></p>

<p><a href="https://docs.google.com/spreadsheets/d/19cDDybWRQrWkGpGJfL6Yp63zkHXEtQRn_SNXySUm6sI/edit#gid=1009765988" target="_blank">circle_sales</a></p>

<p><br></p>

<h2 id="objective">Objective</h2>

<p>The objective of this exercise is to request <a href="https://docs.google.com/spreadsheets/d/1A04aCwnjA3803GDAmOEfVdREVe2cdvY9m1nk9HliegQ/edit#gid=0" target="_blank">Circle’s stock data</a> in Power Query in order to perform relevant analyses. In this exercise you will be able to:</p>

<ul>
<li>
<p>Get used to Power Query</p>
</li>
<li>
<p>Gain a better understanding of stock management requirements</p>
</li>
</ul>

<p><br></p>

<h3 id="1---table-exploration-cleaning-and-enrichment">1 - Table Exploration, Cleaning and Enrichment</h3>

<p>In this first part, the objective is to move from the raw <code>circle_stock</code> table to a clean and enriched <code>circle_stock_kpi</code> table.</p>

<ul>
<li><code>circle_stock</code></li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-1-Untitled.png" alt=""></p>

<ul>
<li><code>circle_stock_kpi</code></li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-2-Untitled.png" alt=""></p>

<p><br></p>

<h3 id="data-import">Data Import</h3>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-3-Untitled.png" alt=""></p>

<p>Copy and paste the URL and select the tables you need.</p>

<p><br></p>

<h3 id="table-cleaning">Table Cleaning</h3>

<p>The combination of model, colour and size is a primary key for the <code>stock</code> table. However, it is not very practical to have three columns to identify a product and a row. Furthermore, in the <code>circle_sales</code> table, products are identified by the <code>product_id</code> column which is the concatenation of model, colour and size with the delimiter “_”. We will add this <code>product_id</code> column to the <code>circle_stock</code> table.</p>

<ol>
<li>
<p>Use 1st row as headers (for both tables)</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-4-Untitled.png" alt=""></p>
</li>
<li>
<p>Check the column format (for both tables)</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-5-Untitled.png" alt=""></p>

<div class="language-javascript highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code> <span class="o">=</span> <span class="nx">Table</span><span class="p">.</span><span class="nc">TransformColumnTypes</span><span class="p">(</span><span class="err">#</span><span class="dl">"</span><span class="s2">Promoted Headers</span><span class="dl">"</span><span class="p">,{{</span><span class="dl">"</span><span class="s2">model</span><span class="dl">"</span><span class="p">,</span> <span class="nx">type</span> <span class="nx">text</span><span class="p">},</span> 
<span class="p">{</span><span class="dl">"</span><span class="s2">model_name</span><span class="dl">"</span><span class="p">,</span> <span class="nx">type</span> <span class="nx">text</span><span class="p">},</span> <span class="p">{</span><span class="dl">"</span><span class="s2">color</span><span class="dl">"</span><span class="p">,</span> <span class="nx">type</span> <span class="nx">text</span><span class="p">},</span> <span class="p">{</span><span class="dl">"</span><span class="s2">color_name</span><span class="dl">"</span><span class="p">,</span> <span class="nx">type</span> <span class="nx">text</span><span class="p">},</span> 
<span class="p">{</span><span class="dl">"</span><span class="s2">size</span><span class="dl">"</span><span class="p">,</span> <span class="nx">type</span> <span class="nx">text</span><span class="p">},</span> <span class="p">{</span><span class="dl">"</span><span class="s2">new</span><span class="dl">"</span><span class="p">,</span> <span class="nx">Int64</span><span class="p">.</span><span class="nx">Type</span><span class="p">},</span> <span class="p">{</span><span class="dl">"</span><span class="s2">forecast_stock</span><span class="dl">"</span><span class="p">,</span> <span class="nx">Int64</span><span class="p">.</span><span class="nx">Type</span><span class="p">},</span> 
<span class="p">{</span><span class="dl">"</span><span class="s2">stock</span><span class="dl">"</span><span class="p">,</span> <span class="nx">Int64</span><span class="p">.</span><span class="nx">Type</span><span class="p">},</span> <span class="p">{</span><span class="dl">"</span><span class="s2">price</span><span class="dl">"</span><span class="p">,</span> <span class="nx">Int64</span><span class="p">.</span><span class="nx">Type</span><span class="p">}})</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Create a new <code>product_id</code> column from the <code>circle_stock</code> table by concatenating the model, colour and size.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-6-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-7-Untitled.png" alt=""></p>

<div class="language-javascript highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code> <span class="o">=</span> <span class="nx">Table</span><span class="p">.</span><span class="nc">AddColumn</span><span class="p">(</span><span class="err">#</span><span class="dl">"</span><span class="s2">Changed Type</span><span class="dl">"</span><span class="p">,</span> <span class="dl">"</span><span class="s2">product_id</span><span class="dl">"</span><span class="p">,</span> <span class="nx">each</span> <span class="nx">Text</span><span class="p">.</span><span class="nc">Combine</span><span class="p">({[</span><span class="nx">model</span><span class="p">],</span> <span class="p">[</span><span class="nx">color</span><span class="p">],</span> <span class="p">[</span><span class="nx">size</span><span class="p">]},</span> <span class="dl">"</span><span class="s2">_</span><span class="dl">"</span><span class="p">),</span> <span class="nx">type</span> <span class="nx">text</span><span class="p">)</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Identify rows where size IS NULL</p>

<details>
<summary>Solution 🔓</summary>

<p>We have 6 rows with a null value for size. However, as you can see, product_id is not null.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-8-Untitled.png" alt=""></p>

<p>However, this is not the end result we want. To correct this, we should give a default value when there is no size for a product.</p>

</details>
</li>
<li>
<p>Remove the <code>Filtered Rows</code> step from the flow.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-9-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>By using the <code>Replace values</code> function and setting the default size to “no-size”, you are adding a new step to your feed. Does this affect your <code>product_id</code>  column?</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-10-Untitled.png" alt=""></p>

<p><em>For “no-size” products, we still don’t have the correct product_id since we created the</em> <code>_Replace_</code><em>step</em> <em><strong>after</strong>__the</em> <em><strong>Merge columns</strong></em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-11-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Move the <code>Replace</code> step above the ` Merge columns<code> step. Does this affect your </code>product_id` column?</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-12-Untitled.png" alt=""></p>

<p>Now, we have the correct <code>product_id</code> designation
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-13-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h3 id="table-enrichment">Table Enrichment</h3>

<p><br></p>

<h3 id="adding-a-product_name-column">Adding a product_name column</h3>

<p>We want to add the product_name which is the concatenation of the model_name, the <code>color_name</code> and the size.</p>
</li>
<li>
<p>In addition to the product_id column, add the product_name column using the <code>Custom Column</code>function. Don’t forget the cases when <code>size</code> value = “no-size” to build the function.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-14-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h3 id="adding-a-model_type-column">Adding a model_type column</h3>

<p>The purchase team wants to analyze the stock and filter it by different model types.</p>

<p>They want to classify the models into the following model_type categories:</p>

<ul>
<li>
<p>Accessories for “Tour de cou”, “Tapis” or “Gourde” (<em>”neck band”, “mat” or “Bottle” in</em> 🇬🇧)</p>
</li>
<li>
<p>T-shirt for “T-shirt”</p>
</li>
<li>
<p>Croc-top for “Brassière” and “Crop-top” (<em>”Bra” or “Crop-top” in</em> 🇬🇧)</p>
</li>
<li>
<p>Legging for “Legging”</p>
</li>
<li>
<p>Short for “Short”</p>
</li>
<li>
<p>Top for “Débardeur” or “Haut” (<em>”Tank top” or “Top” in</em> 🇬🇧)</p>
</li>
</ul>
</li>
<li>
<p>To avoid typographical problems due to capitalization, we will create a new column with <code>product_name</code> in lower case.</p>

<p>Duplicate the <code>model_name</code> column, rename it to <code>model_name_lower </code>and apply a lower format.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-15-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-16-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-17-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Using <code>Conditional Column</code>, create a new <code>model_type</code> column.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-18-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Check that each product has an associated <code>model_type</code>. If not, try to find a solution to correct this.</p>

<details>
<summary>Solution 🔓</summary>

<ul>
<li><em><strong>Model type = Other</strong></em>
<em>Detecting product_id without model_type</em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-19-Untitled.png" alt=""></li>
</ul>

<p><em>BRASSIERE</em> (<em>”Bra” in</em> 🇬🇧) Yvette has no accent on the è. In the conditional formula we have not taken this into account. There are several ways to correct this. Either by adding <em>brassiere</em> without è in the conditional formula or by using <em><a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/string_functions#replace" target="_blank">REPLACE</a></em>__  to replace è with e in <em>model_name_lower</em>
Insert a <code>Replace</code> function before the <code>Conditionnal Column</code> 
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-20-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-21-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h3 id="adding-in_stock-column-for-shortage-rate">Adding in_stock column for shortage rate</h3>

<p>The purchase team wants to analyze the shortage rate and the value of the stock. They would like to have a view by <code>model_type</code>. Let’s do it.</p>
</li>
<li>
<p>Calculate the <code>_in_stock_</code> column which is 0 if the product is out of stock and 1 if the product has a positive stock.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-22-Untitled.png" alt=""></p>

</details>

<p><br></p>

<h3 id="adding-stock_value-column">Adding stock_value column</h3>
</li>
<li>
<p>Add the stock value calculation to the previous result.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-23-Untitled.png" alt=""></p>

</details>

<p>🎉 Congratulations, you have made your first changes with Power Query.<u>__ </u>🎉</p>

<p>In this first part, you have <strong>transformed</strong> your <strong>stock</strong> table into a clean and enriched table.</p>

<ul>
<li><strong>Raw table</strong></li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-24-Untitled.png" alt=""></p>

<ul>
<li><strong>Enriched table</strong></li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-25-Untitled.png" alt=""></p>

<h2 id="analyse-your-data">Analyse your Data</h2>

<p>Close the PowerQuery module and apply your changes</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-26-Untitled.png" alt=""></p>

<p>Before creating your visuals, take a quick look at your tables (do some filtering…).</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-27-Untitled.png" alt=""></p>

<p>And check if PowerBI has created a link between your tables</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-28-Untitled.png" alt=""></p>

<p>You can double-click on it to get more details.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-29-Untitled.png" alt=""></p>

<p>Create the following dashboard and publish it in your workspace.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-30-Untitled.png" alt=""></p>

<p>Note - Some products may not be matched between the stock table and the sales table. You can therefore apply a filter to your report to remove these_“blank” products_</p>

<details>
<summary>“blank” products</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/04-Power-BI-1/07-Data-Request-Inventory-Management-asset-31-Untitled.png" alt=""></p>

</details>
</li>
</ol>



</div>
</div>