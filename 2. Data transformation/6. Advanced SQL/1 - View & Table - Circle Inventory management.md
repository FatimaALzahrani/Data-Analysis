<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<h2 id="introduction">Introduction</h2>

<h3 id="objective">Objective</h3>

<p>🎯&nbsp;The objective of this exercise is to understand the difference between views and tables. What is the difference? How to use them? When to use them? What are the advantages and disadvantages?</p>

<p>In this exercise, you will be able to:</p>

<ul>
<li>
<p>create your first views and tables</p>
</li>
<li>
<p>understand which method to choose depending on the situation</p>
</li>
<li>
<p>clarify your data pipeline by combining multiple transformations into a single view</p>
</li>
</ul>

<p>The different steps of the exercise are:</p>

<p><strong>1 - Save your requests</strong></p>

<p>Understand the importance of saving transformation requests in views to allow you to restart your transformation data pipelines in the future.</p>

<p><strong>2 - View only method</strong></p>

<p>Understand the benefits of using the view-only method, especially when dealing with regular updates and small volumes of data.</p>

<p><strong>3 - View + Table method</strong></p>

<p>Understand the benefits of using the View + Table method, especially when dealing with large volumes of data with infrequent updates.</p>

<h3 id="context">Context</h3>

<p>💪🏽&nbsp;During your previous work on Circle, you calculated some interesting KPIs on stock and shortages for the purchase team. They are fans of the metrics you were able to extract and want to use them as much as possible.</p>

<p>How cool is that? ✨</p>

<p>But the problem is that stock moves quickly. Every hour we get an update from the warehouse with the updated stock level, and the purchasing team needs to have the latest numbers. We just received the latest stock sheet image in <a href="https://docs.google.com/spreadsheets/d/1A04aCwnjA3803GDAmOEfVdREVe2cdvY9m1nk9HliegQ/edit#gid=0" target="_blank">this Google sheet</a> with:</p>

<ul>
<li>
<p>a few orders placed by the purchase team that increased the forecasted stock</p>
</li>
<li>
<p>some deliveries of clothes, notably a big delivery of “Brassière” (<em>Bra</em> in 🇬🇧) and “Crop-top”</p>
</li>
<li>
<p>some deliveries of accessories (”Gourde” or <em>Flask</em> in 🇬🇧)</p>
</li>
<li>
<p>some sales and new products out of stock</p>
</li>
</ul>

<h2 id="1---saving-your-request">1 - Saving your Request</h2>

<p>We need you to update the KPI calculated in the previous year with this new data.</p>

<ol>
<li>
<p>How do you manage this? What requests and transformations should you make?</p>

<details>
<summary>Solution 🔓</summary>

<ul>
<li>First, we should replace the data of our connected Google Sheet by the new values</li>
<li>Then we would have to find and rerun the various queries that allow us to calculate circle_stock_name, then circle_stock_cat and circle_stock_kpi. Not to mention the additional aggregate query used to calculate the aggregate stock statistics on the model type from circle_stock_kpi.</li>
</ul>
</details>

<p>We performed successive transformations from our raw circle_stock table to our clean, enriched <strong>circle_stock_kpi</strong> table (we are not interested in circle_stock_kpi_top in this exercise).</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/02-View-And-Table-Circle-Inventory-Management-asset-1-Untitled.png" alt=""></p>

<p>It is essential to save the different requests 1, 2 and 3 in views. This way, if we need to perform the transformation again, we don’t have to rewrite them from scratch.</p>
</li>
<li>
<p>Go back to the solution of exercise A (A is&nbsp;<strong>challenge 1 exercise 10</strong>&nbsp;of Aggregation, Date &amp; Time Functions, Testing lecture), get the request to create <strong>circle_stock_name</strong> from circle_stock.</p>

<p>Save it as a view and call it <strong>circle_stock_name_view</strong>.</p>

<p>Help - _<a href="https://cloud.google.com/bigquery/docs/views#view_naming" target="_blank">Documentation to create a view</a> on BigQuery.</p>

<details>
<summary>💁🏽&nbsp;Help - Documentation to create a view on BigQuery from the console</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/02-View-And-Table-Circle-Inventory-Management-asset-2-Untitled.png" alt=""></p>
</details>

<details>
<summary>Solution 🔓</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="n">CONCAT</span><span class="p">(</span><span class="n">model</span><span class="p">,</span><span class="nv">"_"</span><span class="p">,</span><span class="n">color</span><span class="p">,</span><span class="nv">"_"</span><span class="p">,</span><span class="n">IFNULL</span><span class="p">(</span><span class="k">size</span><span class="p">,</span><span class="nv">"no-size"</span><span class="p">))</span> <span class="k">AS</span> <span class="n">product_id</span> 
<span class="o">###########</span>
<span class="p">,</span><span class="n">model</span>
<span class="p">,</span><span class="n">color</span>
<span class="p">,</span><span class="k">size</span>
<span class="c1">-- name</span>
<span class="p">,</span><span class="n">model_name</span>
<span class="p">,</span><span class="n">color_name</span>
<span class="p">,</span><span class="n">CONCAT</span><span class="p">(</span><span class="n">model_name</span><span class="p">,</span><span class="nv">" "</span><span class="p">,</span><span class="n">color_name</span><span class="p">,</span><span class="n">IF</span><span class="p">(</span><span class="k">size</span> <span class="k">IS</span> <span class="k">NULL</span><span class="p">,</span><span class="nv">""</span><span class="p">,</span><span class="n">CONCAT</span><span class="p">(</span><span class="nv">" - Taille "</span><span class="p">,</span><span class="k">size</span><span class="p">)))</span> <span class="k">AS</span> <span class="n">product_name</span>
<span class="c1">-- product info --</span>
<span class="p">,</span><span class="n">t</span><span class="p">.</span><span class="k">new</span> <span class="k">AS</span> <span class="n">pdt_new</span>
<span class="p">,</span><span class="n">price</span>
<span class="c1">-- stock metrics --</span>
<span class="p">,</span><span class="n">forecast_stock</span>
<span class="p">,</span><span class="n">stock</span>
<span class="k">FROM</span> <span class="nv">`course15.circle_stock`</span> <span class="n">t</span>
<span class="k">WHERE</span> <span class="k">TRUE</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="n">product_id</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Go back to the solution of exercise A (A is&nbsp;<strong>challenge 1 exercise 12</strong>&nbsp;of Aggregation, Date &amp; Time Functions, Testing lecture). Get the query to create <strong>circle_stock_cat</strong> from <strong>circle_stock_name</strong>. Save it as a view and call it <strong>circle_stock_cat_view</strong>.</p>

<details>
<summary>💁🏽&nbsp;Help - Documentation to create a view on BigQuery from the console</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/02-View-And-Table-Circle-Inventory-Management-asset-3-Untitled.png" alt=""></p>
</details>

<details>
<summary>Solution 🔓</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="n">product_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">model</span>
<span class="p">,</span><span class="n">color</span>
<span class="p">,</span><span class="k">size</span>
<span class="c1">-- category</span>
<span class="p">,</span><span class="k">CASE</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="n">model_name</span><span class="p">),</span><span class="s1">'t-shirt'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'T-shirt'</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="n">model_name</span><span class="p">),</span><span class="s1">'short'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'Short'</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="n">model_name</span><span class="p">),</span><span class="s1">'legging'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'Legging'</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="k">REPLACE</span><span class="p">(</span><span class="n">model_name</span><span class="p">,</span><span class="nv">"è"</span><span class="p">,</span><span class="nv">"e"</span><span class="p">)),</span><span class="s1">'brassiere|crop-top'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'Crop-top'</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="n">model_name</span><span class="p">),</span><span class="s1">'débardeur|haut'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'Top'</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="n">model_name</span><span class="p">),</span><span class="s1">'tour de cou|tapis|gourde'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'Accessories'</span>
<span class="k">ELSE</span> <span class="k">NULL</span>
<span class="k">END</span> <span class="k">AS</span> <span class="n">model_type</span>
<span class="c1">-- name</span>
<span class="p">,</span><span class="n">model_name</span>
<span class="p">,</span><span class="n">color_name</span>
<span class="p">,</span><span class="n">product_name</span>
<span class="c1">-- product info --</span>
<span class="p">,</span><span class="n">pdt_new</span>
<span class="p">,</span><span class="n">price</span>
<span class="c1">-- stock metrics --</span>
<span class="p">,</span><span class="n">forecast_stock</span>
<span class="p">,</span><span class="n">stock</span>
<span class="k">FROM</span> <span class="nv">`course15.circle_stock_name`</span>
<span class="k">WHERE</span> <span class="k">TRUE</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="n">product_id</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Go back to the solution of exercise A (A is&nbsp;<strong>challenge 1 exercise 14</strong>&nbsp;of Aggregation, Date &amp; Time Functions, Testing lecture). Get the request to create <strong>circle_stock_kpi</strong> from circle_stock_cat. If necessary, update it to get updated data and save it as a view and call it <strong>circle_stock_kpi_view</strong>. We don’t care about the top_products column.</p>

<details>
<summary>💁🏽&nbsp;Help - Documentation to create a view on BigQuery from the console</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/02-View-And-Table-Circle-Inventory-Management-asset-4-Untitled.png" alt=""></p>
</details>

<details>
<summary>Solution 🔓</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="n">product_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">model</span>
<span class="p">,</span><span class="n">color</span>
<span class="p">,</span><span class="k">size</span>
<span class="c1">-- category</span>
<span class="p">,</span><span class="n">model_type</span>
<span class="c1">-- name</span>
<span class="p">,</span><span class="n">model_name</span>
<span class="p">,</span><span class="n">color_name</span>
<span class="p">,</span><span class="n">product_name</span>
<span class="c1">-- product info --</span>
<span class="p">,</span><span class="n">pdt_new</span>
<span class="c1">-- stock metrics --</span>
<span class="p">,</span><span class="n">forecast_stock</span>
<span class="p">,</span><span class="n">stock</span>
<span class="p">,</span><span class="n">IF</span><span class="p">(</span><span class="n">stock</span><span class="o">&gt;</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">)</span> <span class="k">AS</span> <span class="n">in_stock</span>
<span class="c1">-- value</span>
<span class="p">,</span><span class="n">price</span>
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="n">stock</span><span class="o">*</span><span class="n">price</span><span class="p">,</span><span class="mi">2</span><span class="p">)</span> <span class="k">AS</span> <span class="n">stock_value</span>
<span class="k">FROM</span> <span class="nv">`course15.circle_stock_cat`</span>
<span class="k">WHERE</span> <span class="k">TRUE</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="n">product_id</span>
</code></pre></div>      </div>
</details>

<p>🎉 <strong>Congratulations! You have saved your first views on BigQuery!</strong> 🎉</p>

<p>Now let’s update the data pipelines so that the KPIs are updated with the latest values.</p>
</li>
<li>
<p>Copy-paste the data from the <a href="https://docs.google.com/spreadsheets/d/1A04aCwnjA3803GDAmOEfVdREVe2cdvY9m1nk9HliegQ/edit#gid=0" target="_blank">new updated stock sheet</a> to your own <em>15 - circle_stock</em> sheet</p>
</li>
<li>
<p>Run the <strong>circle_stock_kpi_view</strong>. Is the data updated in the query result?</p>

<details>
<summary>Solution 🔓</summary>

<p>The data is not up to date. You can check this by looking at the first row of the table with the product_id “ACC001-B01-BL-L_BL_L” which has a stock of 50 in the new updated stock sheet.</p>

<p>This is normal. <strong>circle_stock_kpi_view</strong> asks for data from the <strong>circle_stock_cat</strong> tables that have not been updated.</p>
</details>
</li>
<li>
<p>Now, run successively the following views:</p>

<ul>
<li>
<p><strong>circle_stock_name_view</strong> and overwrite <strong>circle_stock_name</strong> with the query result</p>
</li>
<li>
<p><strong>circle_stock_cat_view</strong> and overwrite <strong>circle_stock_cat</strong> with the query result</p>
</li>
<li>
<p><strong>circle_stock_kpi_view</strong> and overwrite <strong>circle_stock_kpi</strong> with the query result</p>
</li>
</ul>
</li>
<li>
<p>Select the <strong>circle_stock_kpi</strong> table. Is the data updated?</p>

<details>
<summary>Solution 🔓</summary>

<p>The data is now updated with the new sheet.</p>

<p>You can verify this by looking at the first row of the table with the product_id “ACC001-B01-BL-L_BL_L” which has a stock of 50 in the new updated stock sheet.</p>
</details>
</li>
</ol>

<p>🎉 <strong>Congratulations! You have run your first data pipelines on BigQuery!</strong> 🎉</p>

<h2 id="2---view-only-method">2 - ‘View only’ Method</h2>

<h3 id="creating-view">Creating View</h3>

<p>You have run your first data pipelines. However, every hour we receive an update of <strong>circle_stock</strong> table from the warehouse.</p>

<ol>
<li>
<p>How long did it take you to update the data pipeline? Would you be willing to do it every hour?</p>

<details>
<summary>Solution 🔓</summary>

<p>It takes a little time to launch the data pipelines. Updating data pipelines every hour would be too much of a pain. But, guess what, we have a solution.</p>
</details>

<p>To avoid recalculating everything every hour, we can save our transformations in <strong>views</strong> instead of saving our results in intermediate tables that have to be updated every time.</p>

<p>👉🏽&nbsp;Let’s call this the <strong>View only</strong> method.</p>

<p>We don’t save the intermediate result in a table. We use the view instead. When we call a view, it runs the query again from the source tables. So you have up-to-date data ✨</p>

<p>We will delete the intermediate tables <strong>circle_stock_name, circle_stock_cat</strong> and <strong>circle_stock_kpi</strong>. We will replace them with views.</p>
</li>
<li>
<p>Do the following operations for <strong>circle_stock_name</strong>:</p>

<ul>
<li>
<p>delete <strong>circle_stock_name</strong> table</p>
</li>
<li>
<p>modify the <strong>circle_stock_name_view</strong> and rename it to <strong>circle_stock_name</strong></p>
</li>
<li>
<p>delete <strong>circle_stock_name_view</strong></p>
</li>
</ul>

<p>Now you should have a single view called <strong>circle_stock_name</strong></p>

<p>💁🏽&nbsp;Note - Editing/Renaming a view</p>

<details>
<summary>Open and edit the view in details tab</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/02-View-And-Table-Circle-Inventory-Management-asset-5-Untitled.jpeg" alt=""></p>
</details>

<details>
<summary>Save the view with the right option</summary>

<ul>
<li><em>use</em> <u>_save view_</u><em>if you update the view without renaming it</em></li>
<li><em>use</em> <u>_save view_</u><em>as if you need to save it in a new view with another name</em>
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/02-View-And-Table-Circle-Inventory-Management-asset-6-Untitled.png" alt=""></li>
</ul>
</details>
</li>
<li>
<p>Do the same with <strong>circle_stock_cat</strong> and <strong>circle_stock_kpi</strong>.</p>
</li>
<li>
<p>Make some small changes to your <strong>stock sheet</strong>.</p>

<p>👉🏽&nbsp;For example, change the stock and forecasted stock column of the product_id ACC001-B01-BL-L from 50 to 49.</p>

<p>👉🏽&nbsp;Run the <strong>circle_stock_kpi</strong> view and verify that the data is up to date.</p>

<h3 id="optimizing-your-data-pipeline">Optimizing your Data Pipeline</h3>

<p>So now, just by running <strong>circle_stock_kpi</strong> you can access the transformed table with:</p>

<ul>
<li>
<p>enriched columns - product_id, product_name, model_type, in_stock, stock_value (except top_products)</p>
</li>
<li>
<p>update the data directly from <strong>circle_stock</strong> Google Sheet without having to update the tables.</p>
</li>
</ul>

<p>However, you need three consecutive views to add successively:</p>

<p><em>product_id+product_name -&gt; model_type -&gt; in_stock+stock_value.</em></p>

<p><em>stock_name → circle_stock_cat -&gt; circle_stock_kpi</em>.</p>

<p>I’m sorry to say that it’s a bit messy and ugly to have so many consecutive views for such a simple transformation. But guess what, we have a solution.</p>
</li>
<li>
<p>Try to combine these three consecutive views into a single view. The column calculations and transformations on each step are independent and can therefore be done simultaneously rather than sequentially. Save the result in a new view called <strong>cc_stock</strong></p>

<details>
<summary>Solution 🔓</summary>

<p>In a single query, you perform your various transformations. Cleaner and easier to understand, don’t you think? By saving it in a view, it means that when you run it, you have direct access to the raw data that is up to date.</p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="n">CONCAT</span><span class="p">(</span><span class="n">model</span><span class="p">,</span><span class="nv">"_"</span><span class="p">,</span><span class="n">color</span><span class="p">,</span><span class="nv">"_"</span><span class="p">,</span><span class="n">IFNULL</span><span class="p">(</span><span class="k">size</span><span class="p">,</span><span class="nv">"no-size"</span><span class="p">))</span> <span class="k">AS</span> <span class="n">product_id</span> 
<span class="o">###########</span>
<span class="p">,</span><span class="n">model</span>
<span class="p">,</span><span class="n">color</span>
<span class="p">,</span><span class="k">size</span>
<span class="c1">-- category</span>
<span class="p">,</span><span class="k">CASE</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="n">model_name</span><span class="p">),</span><span class="s1">'t-shirt'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'T-shirt'</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="n">model_name</span><span class="p">),</span><span class="s1">'short'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'Short'</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="n">model_name</span><span class="p">),</span><span class="s1">'legging'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'Legging'</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="k">REPLACE</span><span class="p">(</span><span class="n">model_name</span><span class="p">,</span><span class="nv">"è"</span><span class="p">,</span><span class="nv">"e"</span><span class="p">)),</span><span class="s1">'brassiere|crop-top'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'Crop-top'</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="n">model_name</span><span class="p">),</span><span class="s1">'débardeur|haut'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'Top'</span>
<span class="k">WHEN</span> <span class="n">REGEXP_CONTAINS</span><span class="p">(</span><span class="k">LOWER</span><span class="p">(</span><span class="n">model_name</span><span class="p">),</span><span class="s1">'tour de cou|tapis|gourde'</span><span class="p">)</span> <span class="k">THEN</span> <span class="s1">'Accessories'</span>
<span class="k">ELSE</span> <span class="k">NULL</span>
<span class="k">END</span> <span class="k">AS</span> <span class="n">model_type</span>
<span class="c1">-- name</span>
<span class="p">,</span><span class="n">model_name</span>
<span class="p">,</span><span class="n">color_name</span>
<span class="p">,</span><span class="n">CONCAT</span><span class="p">(</span><span class="n">model_name</span><span class="p">,</span><span class="nv">" "</span><span class="p">,</span><span class="n">color_name</span><span class="p">,</span><span class="n">IF</span><span class="p">(</span><span class="k">size</span> <span class="k">IS</span> <span class="k">NULL</span><span class="p">,</span><span class="nv">""</span><span class="p">,</span><span class="n">CONCAT</span><span class="p">(</span><span class="nv">" - Taille "</span><span class="p">,</span><span class="k">size</span><span class="p">)))</span> <span class="k">AS</span> <span class="n">product_name</span>
<span class="c1">-- product info --</span>
<span class="p">,</span><span class="n">t</span><span class="p">.</span><span class="k">new</span> <span class="k">AS</span> <span class="n">pdt_new</span>
<span class="c1">-- stock metrics --</span>
<span class="p">,</span><span class="n">forecast_stock</span>
<span class="p">,</span><span class="n">stock</span>
<span class="p">,</span><span class="n">IF</span><span class="p">(</span><span class="n">stock</span><span class="o">&gt;</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">)</span> <span class="k">AS</span> <span class="n">in_stock</span>
<span class="c1">-- value</span>
<span class="p">,</span><span class="n">price</span>
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="n">stock</span><span class="o">*</span><span class="n">price</span><span class="p">,</span><span class="mi">2</span><span class="p">)</span> <span class="k">AS</span> <span class="n">stock_value</span>
<span class="k">FROM</span> <span class="nv">`course15.circle_stock`</span> <span class="n">t</span>
<span class="k">WHERE</span> <span class="k">TRUE</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="n">product_id</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Now the purchase team would like to get the updated view of the aggregated stock and shortage KPIs by model_type. Can you do this and save the result in the <strong>cc_stock_model_type</strong> view? Can you compare the result with the previous stock? What can you tell?</p>

<p>Help - To easily compare 2 queries on BigQuery, you can split one of them in the right pane of the screen and leave the other in the left pane.- _<a href="https://cloud.google.com/bigquery/docs/bigquery-web-ui#working_with_tabs" target="_blank">split tabs documentation</a></p>

<details>
<summary>Solution 🔓</summary>

<p>Same query as in the previous exercise but instead of calling <strong>circle_stock_kpi</strong>, we call <strong>cc_stock</strong> to get the updated views of the raw data.
<em><strong>Up-to-date stock view</strong></em></p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>  
<span class="n">model_type</span>
<span class="p">,</span><span class="k">COUNT</span><span class="p">(</span><span class="n">in_stock</span><span class="p">)</span> <span class="k">AS</span> <span class="n">nb_products</span>
<span class="p">,</span><span class="k">SUM</span><span class="p">(</span><span class="n">in_stock</span><span class="p">)</span> <span class="k">AS</span> <span class="n">nb_products_in_stock</span>
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">AVG</span><span class="p">(</span><span class="mi">1</span><span class="o">-</span><span class="n">in_stock</span><span class="p">),</span><span class="mi">3</span><span class="p">)</span> <span class="k">AS</span> <span class="n">shortage_rate</span>
<span class="p">,</span><span class="k">SUM</span><span class="p">(</span><span class="n">stock_value</span><span class="p">)</span> <span class="k">AS</span> <span class="n">stock_value</span>
<span class="k">FROM</span> <span class="nv">`course15.cc_stock`</span>
<span class="k">GROUP</span> <span class="k">BY</span> <span class="n">model_type</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="n">model_type</span>
</code></pre></div>      </div>
<p><em><strong>Previous stock view</strong></em></p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>  
<span class="n">model_type</span>
<span class="p">,</span><span class="k">COUNT</span><span class="p">(</span><span class="n">in_stock</span><span class="p">)</span> <span class="k">AS</span> <span class="n">nb_products</span>
<span class="p">,</span><span class="k">SUM</span><span class="p">(</span><span class="n">in_stock</span><span class="p">)</span> <span class="k">AS</span> <span class="n">nb_products_in_stock</span>
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">AVG</span><span class="p">(</span><span class="mi">1</span><span class="o">-</span><span class="n">in_stock</span><span class="p">),</span><span class="mi">3</span><span class="p">)</span> <span class="k">AS</span> <span class="n">shortage_rate</span>
<span class="p">,</span><span class="k">SUM</span><span class="p">(</span><span class="n">stock_value</span><span class="p">)</span> <span class="k">AS</span> <span class="n">stock_value</span>
<span class="k">FROM</span> <span class="nv">`course15.circle_stock_kpi`</span>
<span class="k">GROUP</span> <span class="k">BY</span> <span class="n">model_type</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="n">model_type</span>
</code></pre></div>      </div>
<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/02-View-And-Table-Circle-Inventory-Management-asset-7-Untitled.png" alt=""></p>
</details>
</li>
</ol>

<p>🎉 <strong>Congratulations!</strong> 🎉</p>

<h2 id="3---table--view-method">3 - Table + View Method</h2>

<p>You have created views to process the circle_stock</p>

<ul>
<li>
<p><strong>cc_stock</strong> - enrich raw data with new columns</p>
</li>
<li>
<p><strong>cc_stock_model_type</strong> - aggregate the stock KPIs on the model_type</p>
</li>
</ul>

<p>Now let’s save our queries for <strong>circle_sales</strong> in views as well.</p>

<ol>
<li>
<p>Going back to the solution of exercise 1, get the request to create <strong>circle_sales_daily</strong> from circle_sales. Save it as a view and call it <strong>cc_sales_daily_view</strong>.</p>

<p>💁🏽&nbsp;Help - _<a href="https://cloud.google.com/bigquery/docs/views#view_naming" target="_blank">Documentation to create a view</a> on BigQuery</p>

<details>
<summary>Solution 🔓</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">product_id</span>
<span class="p">,</span><span class="k">SUM</span><span class="p">(</span><span class="n">qty</span><span class="p">)</span> <span class="k">AS</span> <span class="n">qty_91</span>
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">qty</span><span class="p">)</span><span class="o">/</span><span class="mi">91</span><span class="p">,</span><span class="mi">2</span><span class="p">)</span> <span class="k">AS</span> <span class="n">avg_daily_qty_91</span>
<span class="k">FROM</span> <span class="nv">`course15.circle_sales`</span> 
<span class="k">WHERE</span> <span class="k">TRUE</span>
<span class="k">AND</span> <span class="n">date_date</span> <span class="o">&gt;=</span> <span class="n">DATE_SUB</span><span class="p">(</span><span class="s1">'2021-10-01'</span><span class="p">,</span><span class="n">INTERVAL</span> <span class="mi">91</span> <span class="k">DAY</span><span class="p">)</span>
<span class="k">GROUP</span> <span class="k">BY</span> <span class="n">product_id</span>
</code></pre></div>      </div>
</details>

<h3 id="a---compare-requests-performance">A - Compare Requests Performance</h3>
</li>
<li>
<p>Run cc_sales_daily_view and cc_stock and compare the execution performance of the queries - number of records read, computing time. How many rows are there in the source table <strong>circle_stock</strong> and <strong>circle_sales</strong>?</p>

<details>
<summary>Note - How to see the detailed performance of a query execution?</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/02-View-And-Table-Circle-Inventory-Management-asset-8-Untitled.jpeg" alt=""></p>
</details>

<p>💁🏽&nbsp;Help - To easily compare 2 queries on BigQuery, you can split one of them in the right pane of the screen and leave the other in the left pane.- <em><a href="https://cloud.google.com/bigquery/docs/bigquery-web-ui#working_with_tabs" target="_blank">split tabs documentation</a></em></p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/06-Advanced-SQL/02-View-And-Table-Circle-Inventory-Management-asset-9-Untitled.jpeg" alt=""></p>

<ul>
<li>The requested sales are much longer to compute. There are many more rows in the sales source data sheet (over 20,000) compared to the stock sheet (450).</li>
<li>Circle is a young company with few sales at the moment and we are only focusing on 4 month periods. If you focus on an older company like Greenweez for 2 years, you will have several million lines. This can be time consuming to process.</li>
</ul>

</details>

<p>When you have large queries to perform on many rows of source data, it can be interesting to save the result of the query in a table. That way, if you want to access the value of a specific row, you can simply process the small aggregate table without having to recalculate everything from the raw data. This is especially true if data freshness is not a major issue, i.e. you don’t need to update your table every hour.</p>

<p>The sales data is updated only once a day and there are many more rows than in the stock data. Therefore, storing the results of <strong>cc_sales_daily_view</strong> in a table is interesting to avoid re-aggregating them every time we want to access the sales statistics of a specific product.</p>
</li>
<li>
<p>Run <strong>cc_sales_daily_view</strong> and save the result in the <strong>cc_sales_daily</strong> table.</p>

<details>
<summary>Solution 🔓</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="o">*</span>
<span class="k">FROM</span> <span class="nv">`course15.cc_sales_daily_view`</span>
</code></pre></div>      </div>
</details>

<p>To avoid manually updating the data every day, we will see in the next courses orchestration techniques to automate the update of the data pipeline.</p>
</li>
</ol>

<h2 id="summary">Summary</h2>

<h3 id="1---saving-your-requests-into-views">1 - Saving your Requests into Views</h3>

<p>The query you create will have to be executed again when the source data is updated.</p>

<p>It is therefore essential to save your queries into views</p>

<h3 id="2---using-view-to-obtain-up-to-date-data">2 - Using View to Obtain up-to-date Data</h3>

<p>When the source data is regularly updated and good freshness is needed to perform analyses, it is interesting to use only views and not to store the results in a table. This way, every time you run the views query, you are sure to get up-to-date data from the source.</p>

<p>This is especially true if the source data is not large and the calculation is easy and fast.</p>

<h3 id="3---using-a-table-to-store-large-point-calculations">3 - Using a Table to Store Large Point Calculations</h3>

<p>When the source data is large, the calculation is complex and time consuming, it can be interesting to store the result of your view queries in a table. This way, if you want to access the result, you only request the small result table instead of recalculating everything from the source data.</p>

<p>This is especially true when data freshness is not a major issue, i.e. you don’t need to update your result every hour.</p>

<h3 id="4---naming-rules">4 - Naming Rules</h3>

<p>When using a table to store the calculation of query views, you can use the suffix <strong>_view</strong> to name your view and the table will have the same name as the view but without the suffix. This makes it clear and easy to understand.</p>

<p>When using only view without saving the result in a table, you don’t use the <strong>_view</strong> suffix so that you understand that the query gives you the view directly if you want the result without having to look for a possible table.</p>

<p>In future exercises, you should consider whether it is more appropriate to use the view or the table depending on the type of request. During the development phase, it is often easier to work with the view so that you don’t have to refresh the table every time you have successive transformations. Once development is complete and you are ready to validate your transformation pipeline, you can update the structure to create the table.</p>


</div>
</div>