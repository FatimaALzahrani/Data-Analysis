<div role="tabpanel" class="tab-pane active" id="exercise-instructions">
    
      <div id="exercice-content" class="px-5 py-3">
        
    
<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<p>🚧&nbsp;Testing your queries is essential! 🧪</p>

<p>You will develop increasingly complex transformation pipelines and work in teams with other colleagues. It is very easy to make mistakes. And since data transformation steps are building onto each other, a single mistake in one query can potentially impact the entire data transformation pipeline and cause it to fail. So never underestimate testing your work!</p>

<p>Let’s create some tests in this exercise. For now, we want to limit ourselves to testing:</p>

<ul>
  <li>
    <p>that the primary key is respected → <strong>essential</strong></p>
  </li>
  <li>
    <p>that some columns respect a defined format → <strong>optional</strong></p>
  </li>
</ul>

<p>Let’s do it! 💪🏽</p>

<h2 id="1---basic-data-testing">1 - Basic Data Testing</h2>

<p>In the challenge “<strong>Data Request - Circle Inventory Management</strong>” from the <code>Aggregation, Date &amp; Time Functions</code> module, you created several queries to calculate useful KPIs for the purchasing team based on inventory and sales data. Let’s create some tests to verify that your queries return what they are supposed to return.</p>

<p>There are several ways to create tests:</p>

<ul>
  <li>
    <p>run a query that must return true or a specific value</p>
  </li>
  <li>
    <p>run two queries and check that the two values are similar</p>
  </li>
</ul>

<p>For now, we will design our tests to return empty results (no rows of data) if the test has passed. We will save each test query under the <strong>Saved queries</strong> section in your BigQuery project.</p>

<ol>
  <li>
    <p>Open the <strong><code>course15</code></strong> dataset in your BigQuery project that you created on the <code>Aggregation, Date &amp; Time Functions</code> day. Make sure you have the following tables saved in this dataset: <code>circle_stock_cat</code>, <code>circle_stock</code>, <code>circle_stock_kpi</code>, <code>circle_sales_daily</code>. If you don’t find these tables in the <strong><code>course15</code></strong> dataset, copy them to your BigQuery project from <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m4!1m3!3m2!1sdata-analytics-bootcamp-363212!2scourse15" target="_blank">here</a></p>
  </li>
  <li>
    <p>Write a test query that checks if <code>product_id</code> is a primary key in the <code>circle_stock_cat</code> table. Save the query under the name <code>cc_stock_pk</code>. Your saved query will appear at the top of your BigQuery project under the <strong>Saved queries</strong> section.</p>

    <details>
      <summary>Hint</summary>

      <p>To create a test that checks if a column is a primary key in a table you have to check for duplicate and NULL values within that column. Remember how we identified primary keys by using the <code>GROUP BY</code> and <code>HAVING</code> clauses. Your test should return no data (no rows) if the column is indeed a suitable primary key for the table.</p>
    </details>
  </li>
  <li>
    <p>Create a test query called <code>cc_stock_pk-bis</code> to check that the combination of <code>model</code>, <code>color</code> and <code>size</code> columnns are a primary key for the <code>circle_stock</code> table.</p>
  </li>
  <li>
    <p>Create a test query called <code>cc_stock_column-model_type</code> to validate that <code>model_type</code> has no null values in the <code>circle_stock_kpi</code> table.</p>
  </li>
  <li>
    <p>Create a new table called <strong>cc_stock_model_type</strong> from the <code>circle_stock_kpi</code> table that would contain aggregated metrics (nb_products, nb_products_in_stock, shortage_rate, total_stock_value) at the <strong>model_type</strong> granularity. <br>
Create a <strong>cc_stock_model_type_pk</strong> test query that checks if <code>model_type</code> is the primary key of the new <strong>cc_stock_model_type</strong> table.</p>
  </li>
  <li>
    <p>Write and save a <strong>cc_sales_daily_pk</strong> test query to check if <code>product_id</code> the primary key of <strong>circle_sales_daily</strong>.</p>
  </li>
  <li>
    <p>Create a <strong>cc_stock_column-product_name</strong> test to check that <code>product_name</code> has no null values in <strong>circle_stock_kpi</strong></p>
  </li>
  <li>
    <p>Create a <strong>cc_stock_column-stock_value</strong> test to check that the <code>stock_value</code> in <strong>circle_stock_kpi</strong> is always positive, 0 or NULL. Did your test return some rows? That means that the test has failed and there are values in <code>stock_value</code> that are negative. Ideally, if <code>stock_value</code> is negative, we would want to set it to NULL. If you want to, you can update the <strong>circle_stock_kpi</strong> table to include this new rule. If you rerun the <strong>cc_stock_column-stock_value</strong> test now, does it pass (i.e. does it return no data)?</p>
  </li>
</ol>

<p>We hope you enjoyed testing! 🔬</p>


      </div>
  </div>