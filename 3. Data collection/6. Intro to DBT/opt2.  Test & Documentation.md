<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>Now, let’s add some documentation to our dbt project.</p>

<p>Documentation of the data pipeline is essential for:</p>

<ul>
<li>
<p>understanding models created by other colleagues</p>
</li>
<li>
<p>comprehending complex transformations and lineage</p>
</li>
<li>
<p>maintaining a growing number of automated pipelines</p>
</li>
<li>
<p>quickly debugging errors in the data pipeline</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/06-Test-Documentation-asset-1-Capture_decran_2023-09-26_a_16.48.16.png" alt=""></p>

<h2 id="1---add-tests-to-schemayml">1 - Add Tests to <code>schema.yml</code></h2>

<p>Testing ensures the accuracy, reliability, and efficiency of the data pipelines and analytical models.</p>

<ol>
<li>
<p>Add a test for each primary key</p>
</li>
<li>
<p>What would be relevant tests to other columns?</p>

<details>
<summary>Hint</summary>

<p>You can begin by verifying that the other columns do not have null values.</p>
</details>

<details>
<summary>Solution</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="n">models</span><span class="p">:</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">int_sales_margin</span>
<span class="n">tests</span><span class="p">:</span>
<span class="o">-</span> <span class="k">unique</span><span class="p">:</span>
<span class="k">column_name</span><span class="p">:</span> <span class="nv">"(orders_id || '-' || products_id)"</span>
<span class="o">-</span> <span class="n">not_null</span><span class="p">:</span>
<span class="k">column_name</span><span class="p">:</span>
<span class="o">-</span> <span class="n">orders_id</span>
<span class="o">-</span> <span class="n">products_id</span>
<span class="o">-</span> <span class="n">margin</span>
<span class="o">-</span> <span class="n">Purchase_cost</span>
<span class="o">-</span> <span class="n">date_date</span>
<span class="o">-</span> <span class="n">revenue</span>
<span class="o">-</span> <span class="n">quantity</span>
</code></pre></div>      </div>
</details>

<p>You should implement tests for all the models.</p>
</li>
<li>
<p>Run <code>dbt test</code> to check your code.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/06-Test-Documentation-asset-2-Capture_decran_2023-09-27_a_09.56.12.png" alt=""></p>
</li>
</ol>

<h2 id="2---add-documentation-to-schemayml">2 - Add Documentation to <code>schema.yml</code></h2>

<ol>
<li>
<p>Add documentation about:</p>

<ul>
<li>
<p>description of the models</p>
</li>
<li>
<p>description of the columns in the models</p>
</li>
</ul>

<details>
<summary>Solution</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="n">models</span><span class="p">:</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">int_orders_margin</span>
<span class="n">description</span><span class="p">:</span> <span class="n">margin</span> <span class="n">calcultation</span> <span class="n">per</span> <span class="k">order</span> 
<span class="n">columns</span><span class="p">:</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">order_id</span>
<span class="n">description</span><span class="p">:</span> <span class="k">primary</span> <span class="k">key</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">margin</span>
<span class="n">description</span><span class="p">:</span> <span class="n">Margin</span> <span class="o">=</span> <span class="n">Revenue</span> <span class="o">-</span> <span class="n">Purchase_cost</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">Purchase_cost</span>
<span class="n">description</span><span class="p">:</span> <span class="n">Purchase_cost</span> <span class="o">=</span> <span class="n">Quantity</span> <span class="o">*</span> <span class="n">Purchase_price</span> 
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">date_date</span>
<span class="n">description</span><span class="p">:</span> <span class="nb">date</span> <span class="k">of</span> <span class="n">the</span> <span class="k">order</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">revenue</span>
<span class="n">description</span><span class="p">:</span> <span class="k">sum</span> <span class="k">of</span> <span class="n">revenue</span> <span class="n">per</span> <span class="k">order</span> 
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">quantity</span>
<span class="n">description</span><span class="p">:</span> <span class="k">sum</span> <span class="k">of</span> <span class="n">quantity</span> <span class="n">per</span> <span class="k">order</span>

</code></pre></div>      </div>
</details>

<p>You should do it for all the models we created in the pipeline, focusing on:</p>

<ul>
<li>
<p>description of all the tables</p>
</li>
<li>
<p>description of new columns calculation</p>
</li>
</ul>

<details>
<summary>Solution </summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">version</span><span class="p">:</span> <span class="mi">2</span>

<span class="n">models</span><span class="p">:</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">stg_raw_product</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">stg_raw_sales</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">stg_raw_ship</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">int_sales_margin</span>
<span class="n">description</span><span class="p">:</span> <span class="n">margin</span> <span class="n">calcultation</span> <span class="n">per</span> <span class="k">order</span> <span class="n">line</span> <span class="o">/</span> <span class="n">product</span> <span class="n">sale</span>
<span class="n">columns</span><span class="p">:</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">margin</span>
<span class="n">description</span><span class="p">:</span> <span class="n">Margin</span> <span class="o">=</span> <span class="n">Revenue</span> <span class="o">-</span> <span class="n">Purchase_cost</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">Purchase_cost</span>
<span class="n">description</span><span class="p">:</span> <span class="n">Purchase_cost</span> <span class="o">=</span> <span class="n">Quantity</span> <span class="o">*</span> <span class="n">Purchase_price</span> 
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">int_orders_margin</span>
<span class="n">description</span><span class="p">:</span> <span class="n">margin</span> <span class="n">calcultation</span> <span class="n">per</span> <span class="k">order</span> 
<span class="n">columns</span><span class="p">:</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">orders_id</span>
<span class="n">description</span><span class="p">:</span> <span class="k">primary</span> <span class="k">key</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">margin</span>
<span class="n">description</span><span class="p">:</span> <span class="n">Margin</span> <span class="o">=</span> <span class="n">Revenue</span> <span class="o">-</span> <span class="n">Purchase_cost</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">Purchase_cost</span>
<span class="n">description</span><span class="p">:</span> <span class="n">Purchase_cost</span> <span class="o">=</span> <span class="n">Quantity</span> <span class="o">*</span> <span class="n">Purchase_price</span> 
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">date_date</span>
<span class="n">description</span><span class="p">:</span> <span class="nb">date</span> <span class="k">of</span> <span class="n">the</span> <span class="k">order</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">revenue</span>
<span class="n">description</span><span class="p">:</span> <span class="k">sum</span> <span class="k">of</span> <span class="n">revenue</span> <span class="n">per</span> <span class="k">order</span> 
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">quantity</span>
<span class="n">description</span><span class="p">:</span> <span class="k">sum</span> <span class="k">of</span> <span class="n">quantity</span> <span class="n">per</span> <span class="k">order</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">int_orders_operational</span>
<span class="n">description</span><span class="p">:</span> <span class="n">operational</span> <span class="n">margin</span> <span class="n">calcultation</span> <span class="n">per</span> <span class="k">order</span> 
<span class="n">columns</span><span class="p">:</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">operational_margin</span> 
<span class="n">description</span><span class="p">:</span> <span class="n">Operational</span> <span class="n">margin</span> <span class="o">=</span> <span class="n">margin</span> <span class="o">+</span> <span class="n">shipping</span> <span class="n">fee</span> <span class="o">-</span> <span class="n">log_cost</span> <span class="o">-</span> <span class="n">ship_cost</span>
<span class="o">-</span> <span class="n">name</span><span class="p">:</span> <span class="n">finance_days</span>
<span class="n">description</span><span class="p">:</span> <span class="n">finance</span> <span class="n">calculation</span> <span class="n">per</span> <span class="n">days</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Run <code>dbt docs generate</code>  and click on the small icon above Version Control.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/06-Test-Documentation-asset-3-Capture_decran_2023-09-27_a_09.16.05.png" alt=""></p>
</li>
<li>
<p>Navigate to the web page, look at all the descriptions and corresponding lineages.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/06-Test-Documentation-asset-4-Capture_decran_2023-09-27_a_09.25.30.png" alt=""></p>

<p>You can envision being onboarded to this project and dedicating time to understanding the project structure solely through this documentation.</p>
</li>
<li>
<p>Check your code and commit</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/06-Test-Documentation-asset-5-Capture_decran_2023-09-25_a_18.06.08.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/06-Test-Documentation-asset-6-Capture_decran_2023-09-25_a_18.26.39.png" alt=""></p>

</details>

<p>🎉&nbsp;Congratulations, you built a whole pipeline in dbt Cloud, using tests and documentation to strengthen the pipeline and make sure other colleagues could understand and use the views and tables you created.</p>
</li>
</ol>


</div>
</div>