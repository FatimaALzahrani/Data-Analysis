<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<h2 id="1---sales">1 - Sales</h2>

<h3 id="data-import">Data Import</h3>

<ul>
<li>Check that you have the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_sales_17" target="_blank">gwz_sales_17</a> table in the <strong>‘course17’</strong> dataset of your BigQuery project. If not copy it from the link above.</li>
</ul>

<p>The following query displays the sales information:</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code>   <span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">products_id</span>
<span class="p">,</span><span class="n">promo_name</span>
<span class="p">,</span><span class="n">turnover_before_promo</span>
<span class="p">,</span><span class="n">turnover</span>
<span class="p">,</span><span class="n">purchase_cost</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
</code></pre></div></div>

<h2 id="2---margin-percent">2 - Margin Percent</h2>

<ol>
<li>
<p>Add a <code>margin_percent</code> column to the query above . Round the percentage to a single digit after the comma.</p>
</li>
<li>
<p>Create a function <code>margin_percent</code> in the <strong>course17</strong> dataset that takes the <code>purchase_cost</code> and <code>turnover</code> as inputs and returns the percent margin.</p>

<p>💁🏽&nbsp;<u>_Help_</u><em>-</em> <em><a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/user-defined-functions" target="_blank">Create User defined function documentation</a></em></p>
</li>
<li>
<p>Update the query from the first step by using the new <code>margin_percent</code> function to create the <code>margin_percent</code> column.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/05-Nested-Formats-And-Complex-Aggregations/02-Functions-Sales-asset-1-Untitled.png" alt=""></p>
</details>

<h2 id="3---promo_percent">3 - promo_percent</h2>
</li>
<li>
<p>Add a <code>promo_percent</code> column to the previous query ((<code>turnover_before_promo</code> - <code>turnover</code>) / (<code>turnover_before_promo</code>). Round it to zero digits after comma.</p>
</li>
<li>
<p>Create a function <code>promo_percent</code> in the <strong>course17</strong> dataset that takes the <code>turnover</code> and <code>turnover_before_promo</code> as inputs and returns the <code>promo_percent</code> as a percentage with zero digits after the comma.</p>

<p>💁🏽&nbsp;<u>_Help_</u><em>-</em> <em><a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/user-defined-functions" target="_blank">Create User defined function documentation</a></em></p>
</li>
<li>
<p>Query the <code>gwz_sales_17</code> table to select all the columns and add the <code>margin_percent</code> and <code>promo_percent</code> columns by using the newly created functions.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/05-Nested-Formats-And-Complex-Aggregations/02-Functions-Sales-asset-2-Untitled.png" alt=""></p>
</details>
</li>
</ol>

<p>Stay motivated! 🔋</p>



</div>
</div>