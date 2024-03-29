<div class="tab-content w-100">
<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<h3 id="data-import">Data Import</h3>

<ul>
<li>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_orders_17" target="_blank">gwz_orders_17</a> table in the <strong><code>course17</code></strong> dataset of your Bigquery project</li>
</ul>

<h2 id="1---count-and-rank">1 - Count and Rank</h2>

<p>Window functions can be used to sort/rank or count lines.</p>

<h3 id="a---new-order">A - New Order</h3>

<p>The <code>gwz_orders_17</code> table contains all the orders of our customers until “2021-08-31”.</p>

<p>We consider an order to be <strong>new</strong> if it is the first order from a customer. To find the first order of each customer, we need to sort the orders from the oldest date to the most recent date.</p>

<ol>
<li>
<p>Use the <code>ROW_NUMBER()</code> function to add a new column called <code>rn</code> (row number) to the <code>gwz_orders_17</code> table. For each customer, the new column should contain a number that designates the order that the customer made their orders in. For example, the customer’s oldest order should have a value “1”, the second oldest order should contain a value “2” and so on. You’ll have to specify by which columns you want the table to be PARTITIONED for the <code>ROW_NUMBER()</code> function to work properly. You can check the documentation <a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/numbering_functions#row_number" target="_blank">here</a>.</p>
</li>
<li>
<p>Use the <code>RANK()</code> function to achieve the same thing in another column called <code>rk</code>.</p>
</li>
<li>
<p>Create a query to compare the values in the <code>rn</code> and <code>rk</code> columns for the customers with <code>customers_id</code> in (212497,205343,33690). How to explain the difference between the two values?</p>

<p>Our goal is to:</p>

<ul>
<li>
<p>have a single <code>orders_number</code> for each row</p>
</li>
<li>
<p>identify a single order as the first one and flag it as <strong>new</strong>.</p>
</li>
</ul>

<p>So, which function seems more relevant to you?</p>
</li>
<li>
<p>Add a new column <code>is_new</code> which is equal to 1 if the order is the first customer order and 0 otherwise. The calculation is done in 2 steps:</p>

<ul>
<li>
<p>calculate the <code>rn</code> column using the <code>ROW_NUMBER()</code> function.</p>
</li>
<li>
<p>calculate the column <strong>is_new</strong> based on the <code>rn</code> column.</p>
</li>
</ul>

<p>Use the <code>WITH AS</code> clause to combine the 2 steps into a single query. Save the results in a new table <strong><code>gwz_orders_17_rn</code></strong>.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/05-Nested-Formats-And-Complex-Aggregations/03-Window-Functions-Sorting-asset-1-Untitled.png" alt=""></p>
</details>

<h3 id="b---sales">B - Sales</h3>

<p>Make sure you have the <code>gwz_sales_17</code> table in the <strong><code>course17</code></strong> dataset of your Bigquery project. If you don’t, you can copy it from <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_sales_17" target="_blank">here</a></p>

<p>The same as with the <code>gwz_orders_17</code> table, our aim is to mark all the rows corresponding to new orders in <code>gwz_sales_17</code>.</p>

<p>To achieve this, we will use window functions.</p>

<p><u>Note</u> - we could also use a join with <code>gwz_orders_17</code>, but our aim is to practice window functions.</p>
</li>
<li>
<p>Use the <code>ROW_NUMBER()</code> function to add a new column called <code>rn</code> (row number) to the <code>gwz_sales_17</code> table. For each customer, the new column should contain a number that designates the order that the customer made their orders in from the oldest to the newest.</p>

<p><u>_Note_</u><em>-This time it is mandatory to add <code>orders_id</code> in the ORDER BY clause</em></p>
</li>
<li>
<p>Use the <code>RANK()</code> function to achieve the same thing in another column called <code>rk</code>.</p>
</li>
<li>
<p>Use the <code>DENSE_RANK()</code> function to achieve the same thing in another column called <code>ds_rk</code>.</p>
</li>
<li>
<p>Create a query to compare the values in the <code>rk</code> and <code>ds_rk</code> columns for the customers with <code>customers_id</code> in (98869,217071,268263). How to explain the difference between the two values?</p>

<p>Our goal is to:</p>

<ul>
<li>
<p>have a single <code>orders_number</code> for each row</p>
</li>
<li>
<p>identify a single order as the first one and flag it as <strong>new</strong>.</p>
</li>
</ul>

<p>So, which function seems more relevant to you?</p>
</li>
<li>
<p>Add a new column <code>is_new</code> which is equal to 1 if the order is the first customer order and 0 otherwise. The calculation is done in 2 steps:</p>

<ul>
<li>
<p>calculate the <code>ds_rk</code> column using the <code>DENSE_RANK()</code> function.</p>
</li>
<li>
<p>calculate the column <strong>is_new</strong> based on the <code>ds_rk</code> column.</p>
</li>
</ul>

<p>Use the <code>WITH AS</code> clause to combine the 2 steps into a single query. Save the results in a new table called <strong><code>gwz_sales_17_ds_rk</code></strong>.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/05-Nested-Formats-And-Complex-Aggregations/03-Window-Functions-Sorting-asset-2-Untitled.png" alt=""></p>
</details>
</li>
</ol>

<p>You’re doing great! ⭐</p>


</div>
</div>
<div role="tabpanel" class="tab-pane px-5" id="challenge-submission">

<h4 class="mt-3 mb-4">Assignments</h4>
<div class="commit-card box-shadow-light bg-white px-3 py-2 mb-2">
<div class="commit-info d-flex align-items-center justify-content-between w-100">
<p class="small mb-0"><img class="img-avatar" src="https://avatars.githubusercontent.com/u/107775566?v=4"> <span class="text-dark font-weight-bold">FatimaALzahrani</span> uploaded about 1 month ago</p>
<div class="d-flex align-items-center">
<a target="blank" href="https://console.cloud.google.com/bigquery?sq=70374119533%3Ad21520ce01184eb397854c5ff2911ce1">
<span class="fa fa-link" data-toggle="tooltip" title="Open link"></span>
</a>    </div>
</div>
</div>

<h4 class="my-4">You can resubmit an assignment if desired with the form below</h4>


<div class="box-shadow-light bg-white p-3">
<div data-controller="ajax-form">
<form class="simple_form w-100" id="new_challenge_submission" data-action="ajax:success->ajax-form#onPostSuccess ajax:error->ajax-form#onPostError" novalidate="novalidate" action="/camps/3447/challenge_submissions" accept-charset="UTF-8" data-remote="true" method="post">
<div class="form-group hidden challenge_submission_exercise_path"><input class="form-control hidden" value="03-Data-Transformation/05-Nested-Formats-And-Complex-Aggregations/03-Window-Functions-Sorting" autocomplete="off" type="hidden" name="challenge_submission[exercise_path]" id="challenge_submission_exercise_path"></div>


<div class="form-group hidden challenge_submission_type"><input class="form-control hidden" value="UrlChallengeSubmission" autocomplete="off" type="hidden" name="challenge_submission[type]" id="challenge_submission_type"></div>
<div class="form-group url required challenge_submission_url w-100"><label class="url required" for="challenge_submission_url">Url <abbr title="required">*</abbr></label><input class="form-control string url required" required="required" aria-required="true" placeholder="https://github.com/lewagon" type="url" name="challenge_submission[url]" id="challenge_submission_url"></div>


<div class="form-group hidden challenge_submission_schooling_id"><input class="form-control hidden" value="39173" autocomplete="off" type="hidden" name="challenge_submission[schooling_id]" id="challenge_submission_schooling_id"></div>


<input type="submit" name="commit" value="Submit Assignment" class="btn btn-primary mt-3 mb-2 " data-disable-with="Submit Assignment">
</form></div>

</div>

</div>
<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<h3 id="data-import">Data Import</h3>

<ul>
<li>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_orders_17" target="_blank">gwz_orders_17</a> table in the <strong><code>course17</code></strong> dataset of your Bigquery project</li>
</ul>

<h2 id="1---count-and-rank">1 - Count and Rank</h2>

<p>Window functions can be used to sort/rank or count lines.</p>

<h3 id="a---new-order">A - New Order</h3>

<p>The <code>gwz_orders_17</code> table contains all the orders of our customers until “2021-08-31”.</p>

<p>We consider an order to be <strong>new</strong> if it is the first order from a customer. To find the first order of each customer, we need to sort the orders from the oldest date to the most recent date.</p>

<ol>
<li>
<p>Use the <code>ROW_NUMBER()</code> function to add a new column called <code>rn</code> (row number) to the <code>gwz_orders_17</code> table. For each customer, the new column should contain a number that designates the order that the customer made their orders in. For example, the customer’s oldest order should have a value “1”, the second oldest order should contain a value “2” and so on. You’ll have to specify by which columns you want the table to be PARTITIONED for the <code>ROW_NUMBER()</code> function to work properly. You can check the documentation <a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/numbering_functions#row_number" target="_blank">here</a>.</p>

<details>
<summary>Solution 🔓</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">customers_id</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">ROW_NUMBER</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rn</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_orders_17`</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">customers_id</span>
<span class="p">,</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">rn</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Use the <code>RANK()</code> function to achieve the same thing in another column called <code>rk</code>.</p>

<details>
<summary>Solution 🔓</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">customers_id</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">ROW_NUMBER</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rn</span>
<span class="p">,</span><span class="n">RANK</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rk</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_orders_17`</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">customers_id</span>
<span class="p">,</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">rn</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Create a query to compare the values in the <code>rn</code> and <code>rk</code> columns for the customers with <code>customers_id</code> in (212497,205343,33690). How to explain the difference between the two values?</p>

<p>Our goal is to:</p>

<ul>
<li>
<p>have a single <code>orders_number</code> for each row</p>
</li>
<li>
<p>identify a single order as the first one and flag it as <strong>new</strong>.</p>
</li>
</ul>

<p>So, which function seems more relevant to you?</p>

<details>
<summary>Solution 🔓</summary>

<p><em>Some customers place several orders on the same date. With ROW_NUMBER(), an arbitrary order is made between the orders of the same date, which ensures that there are no rows with the same order number. With RANK(), the same rank is assigned to orders from the same day, which is not what we want as we could have several first orders for the same customer. We will therefore use ROW_NUMBER().</em></p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">customers_id</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">ROW_NUMBER</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rn</span>
<span class="p">,</span><span class="n">RANK</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rk</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_orders_17`</span>
<span class="k">WHERE</span> <span class="n">customers_id</span> <span class="k">IN</span> <span class="p">(</span><span class="mi">33690</span><span class="p">,</span><span class="mi">205343</span><span class="p">,</span><span class="mi">212497</span><span class="p">)</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">customers_id</span>
<span class="p">,</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">rn</span>
</code></pre></div>      </div>
<p><u>_Note_</u><em>- orders_id is an incremental id affected to order. The smaller it is, the oldest the order is. If we want to distinguish same-date orders we could add orders_id in ORDER BY after date_date.</em></p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">customers_id</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">ROW_NUMBER</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rn</span>
<span class="p">,</span><span class="n">RANK</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rk</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_orders_17`</span>
<span class="k">WHERE</span> <span class="n">customers_id</span> <span class="k">IN</span> <span class="p">(</span><span class="mi">33690</span><span class="p">,</span><span class="mi">205343</span><span class="p">,</span><span class="mi">212497</span><span class="p">)</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">customers_id</span>
<span class="p">,</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">rn</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Add a new column <code>is_new</code> which is equal to 1 if the order is the first customer order and 0 otherwise. The calculation is done in 2 steps:</p>

<ul>
<li>
<p>calculate the <code>rn</code> column using the <code>ROW_NUMBER()</code> function.</p>
</li>
<li>
<p>calculate the column <strong>is_new</strong> based on the <code>rn</code> column.</p>
</li>
</ul>

<p>Use the <code>WITH AS</code> clause to combine the 2 steps into a single query. Save the results in a new table <strong><code>gwz_orders_17_rn</code></strong>.</p>

<details>
<summary>Solution</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">WITH</span> <span class="n">orders_rn</span> <span class="k">AS</span>
<span class="p">(</span><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">customers_id</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">ROW_NUMBER</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rn</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_orders_17`</span>
<span class="k">WHERE</span> <span class="k">TRUE</span>
<span class="c1">-- AND customers_id IN (33690,205343,212497)</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">customers_id</span>
<span class="p">,</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">rn</span><span class="p">)</span>

<span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">customers_id</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">rn</span>
<span class="p">,</span><span class="n">IF</span><span class="p">(</span><span class="n">rn</span><span class="o">=</span><span class="mi">1</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">)</span> <span class="k">AS</span> <span class="n">is_new</span>
<span class="k">FROM</span> <span class="n">orders_rn</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">customers_id</span>
<span class="p">,</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">rn</span>
</code></pre></div>      </div>
</details>

<h3 id="b---sales">B - Sales</h3>

<p>Make sure you have the <code>gwz_sales_17</code> table in the <strong><code>course17</code></strong> dataset of your Bigquery project. If you don’t, you can copy it from <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_sales_17" target="_blank">here</a></p>

<p>The same as with the <code>gwz_orders_17</code> table, our aim is to mark all the rows corresponding to new orders in <code>gwz_sales_17</code>.</p>

<p>To achieve this, we will use window functions.</p>

<p><u>Note</u> - we could also use a join with <code>gwz_orders_17</code>, but our aim is to practice window functions.</p>
</li>
<li>
<p>Use the <code>ROW_NUMBER()</code> function to add a new column called <code>rn</code> (row number) to the <code>gwz_sales_17</code> table. For each customer, the new column should contain a number that designates the order that the customer made their orders in from the oldest to the newest.</p>

<p><u>_Note_</u><em>-This time it is mandatory to add <code>orders_id</code> in the ORDER BY clause</em></p>

<details>
<summary>Solution 🔓</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">customers_id</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">products_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">ROW_NUMBER</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rn</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">customers_id</span>
<span class="p">,</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">rn</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Use the <code>RANK()</code> function to achieve the same thing in another column called <code>rk</code>.</p>

<details>
<summary>Solution 🔓</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">customers_id</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">products_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">ROW_NUMBER</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rn</span>
<span class="p">,</span><span class="n">RANK</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rk</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">customers_id</span>
<span class="p">,</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">rn</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Use the <code>DENSE_RANK()</code> function to achieve the same thing in another column called <code>ds_rk</code>.</p>

<details>
<summary>Solution 🔓</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">customers_id</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">products_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">ROW_NUMBER</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rn</span>
<span class="p">,</span><span class="n">RANK</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rk</span>
<span class="p">,</span><span class="n">DENSE_RANK</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">ds_rk</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">customers_id</span>
<span class="p">,</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">rn</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Create a query to compare the values in the <code>rk</code> and <code>ds_rk</code> columns for the customers with <code>customers_id</code> in (98869,217071,268263). How to explain the difference between the two values?</p>

<p>Our goal is to:</p>

<ul>
<li>
<p>have a single <code>orders_number</code> for each row</p>
</li>
<li>
<p>identify a single order as the first one and flag it as <strong>new</strong>.</p>
</li>
</ul>

<p>So, which function seems more relevant to you?</p>

<details>
<summary>Solution 🔓</summary>

<ul>
<li><em>With RANK(), the products_id from the same orders have the same values. However, the rank values vary from order to order depending on the number of products included in each order.</em></li>
<li><em>DENSE_RANK() is the solution. All products with the same orders_id have the same values. There is no difference based on how many products there are in each order.</em></li>
<li><em>We will use dense_rank for this use case.</em>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">customers_id</span>
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">products_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">ROW_NUMBER</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rn</span>
<span class="p">,</span><span class="n">RANK</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">rk</span>
<span class="p">,</span><span class="n">DENSE_RANK</span><span class="p">()</span> <span class="n">OVER</span> <span class="p">(</span><span class="k">PARTITION</span> <span class="k">BY</span> <span class="n">customers_id</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span><span class="p">,</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">ds_rk</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_sales_17`</span>
<span class="k">WHERE</span> <span class="k">TRUE</span>
<span class="k">AND</span> <span class="n">customers_id</span> <span class="k">IN</span> <span class="p">(</span><span class="mi">98869</span><span class="p">,</span><span class="mi">217071</span><span class="p">,</span><span class="mi">268263</span><span class="p">)</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">customers_id</span>
<span class="p">,</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">rn</span>
</code></pre></div>          </div>
</li>
</ul>
</details>
</li>
<li>
<p>Add a new column <code>is_new</code> which is equal to 1 if the order is the first customer order and 0 otherwise. The calculation is done in 2 steps:</p>

<ul>
<li>
<p>calculate the <code>ds_rk</code> column using the <code>DENSE_RANK()</code> function.</p>
</li>
<li>
<p>calculate the column <strong>is_new</strong> based on the <code>ds_rk</code> column.</p>
</li>
</ul>

<p>Use the <code>WITH AS</code> clause to combine the 2 steps into a single query. Save the results in a new table called <strong><code>gwz_sales_17_ds_rk</code></strong>.</p>

<details>
<summary>Solution 🔓</summary>

<div class="language-javascript highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="nx">WITH</span> <span class="nx">sales_ds_rk</span> <span class="nx">AS</span>
<span class="p">(</span><span class="nx">SELECT</span>
<span class="nx">date_date</span>
<span class="p">,</span><span class="nx">customers_id</span>
<span class="err">###</span> <span class="nx">Key</span> <span class="err">###</span>
<span class="p">,</span><span class="nx">orders_id</span>
<span class="p">,</span><span class="nx">products_id</span>
<span class="err">###########</span>
<span class="p">,</span><span class="nc">DENSE_RANK</span><span class="p">()</span> <span class="nc">OVER </span><span class="p">(</span><span class="nx">PARTITION</span> <span class="nx">BY</span> <span class="nx">customers_id</span> <span class="nx">ORDER</span> <span class="nx">BY</span> <span class="nx">date_date</span><span class="p">,</span><span class="nx">orders_id</span><span class="p">)</span> <span class="nx">AS</span> <span class="nx">ds_rk</span>
<span class="nx">FROM</span> <span class="s2">`course17.gwz_sales_17`</span>
<span class="nx">ORDER</span> <span class="nx">BY</span> 
<span class="nx">customers_id</span>
<span class="p">,</span><span class="nx">date_date</span>
<span class="p">,</span><span class="nx">orders_id</span>
<span class="p">,</span><span class="nx">ds_rk</span><span class="p">)</span>

<span class="nx">SELECT</span>
<span class="nx">date_date</span>
<span class="p">,</span><span class="nx">customers_id</span>
<span class="err">###</span> <span class="nx">Key</span> <span class="err">###</span>
<span class="p">,</span><span class="nx">orders_id</span>
<span class="p">,</span><span class="nx">products_id</span>
<span class="err">###########</span>
<span class="p">,</span><span class="nx">ds_rk</span>
<span class="p">,</span><span class="nc">IF</span><span class="p">(</span><span class="nx">ds_rk</span><span class="o">=</span><span class="mi">1</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">)</span> <span class="nx">AS</span> <span class="nx">is_new</span>
<span class="nx">FROM</span> <span class="nx">sales_ds_rk</span>
<span class="nx">ORDER</span> <span class="nx">BY</span> 
<span class="nx">customers_id</span>
<span class="p">,</span><span class="nx">date_date</span>
<span class="p">,</span><span class="nx">orders_id</span>
</code></pre></div>      </div>
</details>
</li>
</ol>


</div>
</div>
</div>