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

<h1 id="create-intermediate-models">Create intermediate models</h1>

<p>Intermediate models are made to break up the complexity of your models.</p>

<h2 id="1---calculate-the-margin-per-product">1 - Calculate the Margin per Product</h2>

<blockquote>
<p>📌 Margin = Revenue - Purchase_cost<br>
Purchase_cost = Quantity * Purchase_price</p>
</blockquote>

<ol>
<li>
<p>Create a file called <code>int_sales_margin.sql</code> inside <code>models/intermediate/</code>.</p>
</li>
<li>
<p>Locate the data needed for the calculation in your different <code>staging</code> models.</p>

<ul>
<li>
<p>Where is the data about quantity?</p>
</li>
<li>
<p>Where is the data about purchase_price?</p>
</li>
<li>
<p>Where is the data about revenue?</p>
</li>
</ul>

<p>You can use the Preview button on all the staging models, to understand the structure.</p>
</li>
<li>
<p>Join the relevant tables in dbt query editor and perform the <code>purchase_cost</code> and <code>margin</code> calculations.</p>

<p>You can use the following step-by-step process:</p>

<ul>
<li>
<p>What type of JOIN should you use to connect the two models we created before?</p>
</li>
<li>
<p>How can you use/refer the models that we created before?</p>
</li>
</ul>

<details>
<summary>Hint</summary>

<p>Using {{ ref(’model_name’)}}</p>
</details>

<ul>
<li>
<p>Start by writing the FROM… section and use SELECT * as a placeholder.</p>
</li>
<li>
<p>Use Preview button to check the result</p>
</li>
<li>
<p>Use Lineage button to check the result</p>
</li>
</ul>

<details>
<summary>Hint</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-1-Capture_decran_2023-09-26_a_11.20.35.png" alt=""></p>

</details>

<ul>
<li>
<p>If your JOIN is working, let’s focus on the SELECT.. part</p>
</li>
<li>
<p>Create the <code>purchase_cost</code> column</p>
</li>
</ul>

<details>
<summary>Help if you run into an error</summary>

<p>You might see an error like this when clicking on Preview 
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-2-Capture_decran_2023-09-26_a_11.13.26.png" alt=""></p>

<p>You need to come back to your staging models and CAST the value in a good numerical format.</p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="n">example</span> <span class="p">:</span> 
<span class="k">CAST</span><span class="p">(</span><span class="k">column_name</span> <span class="k">as</span> <span class="n">int64</span><span class="p">)</span>
</code></pre></div>      </div>
</details>

<ul>
<li>Create the <code>margin</code> column</li>
</ul>

<details>
<summary>Solution</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="n">products_id</span><span class="p">,</span> 
<span class="n">date_date</span><span class="p">,</span> 
<span class="n">orders_id</span><span class="p">,</span>
<span class="n">revenue</span><span class="p">,</span> 
<span class="n">quantity</span><span class="p">,</span> 
<span class="k">CAST</span><span class="p">(</span><span class="n">purchase_price</span> <span class="k">AS</span> <span class="n">FLOAT64</span><span class="p">),</span> 
<span class="n">ROUND</span><span class="p">(</span><span class="n">s</span><span class="p">.</span><span class="n">quantity</span><span class="o">*</span><span class="k">CAST</span><span class="p">(</span><span class="n">p</span><span class="p">.</span><span class="n">purchase_price</span> <span class="k">AS</span> <span class="n">FLOAT64</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">AS</span> <span class="n">purchase_cost</span><span class="p">,</span>
<span class="n">s</span><span class="p">.</span><span class="n">revenue</span> <span class="o">-</span> <span class="n">ROUND</span><span class="p">(</span><span class="n">s</span><span class="p">.</span><span class="n">quantity</span><span class="o">*</span><span class="k">CAST</span><span class="p">(</span><span class="n">p</span><span class="p">.</span><span class="n">purchase_price</span> <span class="k">AS</span> <span class="n">FLOAT64</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">AS</span> <span class="n">margin</span>
<span class="k">FROM</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="nv">"stg_raw__sales"</span><span class="p">)}}</span> <span class="n">s</span>
<span class="k">LEFT</span> <span class="k">JOIN</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="nv">"stg_raw__product"</span><span class="p">)}}</span> <span class="n">p</span> 
<span class="k">USING</span> <span class="p">(</span><span class="n">products_id</span><span class="p">)</span>
</code></pre></div>      </div>
</details>

<h3 id="congrats">Congrats!</h3>
</li>
<li>
<p>You can check your code, ‘Commit and sync’ your changes and build your model</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-3-Capture_decran_2023-09-25_a_18.06.08.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-4-Capture_decran_2023-09-25_a_18.26.39.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-5-Capture_decran_2023-09-26_a_11.25.20.png" alt=""></p>

</details>
</li>
</ol>

<h2 id="2---calculate-the-margin-per-order">2 - Calculate the Margin per Order</h2>

<ol>
<li>
<p>Create another intermediate model named <code>int_orders_margin.sql</code></p>
</li>
<li>
<p>Perform the relevant transformations to build the following table:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-6-Capture_decran_2023-09-26_a_14.47.43.png" alt=""></p>

<p>Step-by-step guide:</p>

<ul>
<li>Use the previous <code>int_sales_margin</code> as a reference in the FROM section</li>
</ul>

<details>
<summary>Hint</summary>

<p>You will need to do something with date_date. 
How many different values can you have for the same order id?</p>
</details>

<details>
<summary>Solution </summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">orders_id</span><span class="p">,</span>
<span class="n">date_date</span><span class="p">,</span>
<span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">revenue</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">as</span> <span class="n">revenue</span><span class="p">,</span>
<span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">quantity</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">as</span> <span class="n">quantity</span><span class="p">,</span>
<span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">purchase_cost</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">as</span> <span class="n">purchase_cost</span><span class="p">,</span>
<span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">margin</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">as</span> <span class="n">margin</span>
<span class="k">FROM</span> <span class="p">{{</span> <span class="k">ref</span><span class="p">(</span><span class="nv">"int_sales_margin"</span><span class="p">)</span> <span class="p">}}</span>
<span class="k">GROUP</span> <span class="k">BY</span> <span class="n">orders_id</span><span class="p">,</span><span class="n">date_date</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="n">orders_id</span> <span class="k">DESC</span>
</code></pre></div>      </div>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">orders_id</span><span class="p">,</span>
<span class="k">max</span><span class="p">(</span><span class="n">date_date</span><span class="p">)</span> <span class="k">as</span> <span class="n">date_date</span><span class="p">,</span>
<span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">revenue</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">as</span> <span class="n">revenue</span><span class="p">,</span>
<span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">quantity</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">as</span> <span class="n">quantity</span><span class="p">,</span>
<span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">purchase_cost</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">as</span> <span class="n">purchase_cost</span><span class="p">,</span>
<span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">margin</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">as</span> <span class="n">margin</span>
<span class="k">FROM</span> <span class="p">{{</span> <span class="k">ref</span><span class="p">(</span><span class="nv">"int_sales_margin"</span><span class="p">)</span> <span class="p">}}</span>
<span class="k">GROUP</span> <span class="k">BY</span> <span class="n">orders_id</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="n">orders_id</span> <span class="k">DESC</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Check your code, commit and build your model</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-7-Capture_decran_2023-09-25_a_18.06.08.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-8-Capture_decran_2023-09-25_a_18.26.39.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-9-Capture_decran_2023-09-26_a_14.58.06.png" alt=""></p>

</details>
</li>
</ol>

<h2 id="3---calculate-the-operational-margin-per-order">3 - Calculate the Operational Margin per Order</h2>

<ol>
<li>
<p>Create another intermediate model named <code>int_orders_operational.sql</code></p>
</li>
<li>
<p>We now want to calculate the operational margin whose formula is:</p>

<blockquote>
<p>📌 Operational margin = margin + shipping fee - log_cost - ship_cost</p>
</blockquote>

<p><em>Note - Shipping fee is how much the client paid for shipping, whereas shipping cost is how much it costs to the company to organize the shipping.</em></p>

<p>Perform the relevant transformations to create the following table:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-10-Capture_decran_2023-09-26_a_14.52.44.png" alt=""></p>

<p>Step-by-step guide:</p>

<ul>
<li>
<p>Think about the models you will need to join</p>
</li>
<li>
<p>You might need to cast the <code>ship_cost</code> in a numerical format directly in the staging model. Remember that if you’re doing some modifications, you will need to re build your model.</p>
</li>
</ul>

<details>
<summary>Solution </summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">o</span><span class="p">.</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">o</span><span class="p">.</span><span class="n">date_date</span>
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="n">o</span><span class="p">.</span><span class="n">margin</span> <span class="o">+</span> <span class="n">s</span><span class="p">.</span><span class="n">shipping_fee</span> <span class="o">-</span> <span class="p">(</span><span class="n">s</span><span class="p">.</span><span class="n">logcost</span> <span class="o">+</span> <span class="n">s</span><span class="p">.</span><span class="n">ship_cost</span><span class="p">),</span><span class="mi">2</span><span class="p">)</span> <span class="k">AS</span> <span class="n">operational_margin</span> 
<span class="p">,</span><span class="n">o</span><span class="p">.</span><span class="n">quantity</span>
<span class="p">,</span><span class="n">o</span><span class="p">.</span><span class="n">revenue</span>
<span class="p">,</span><span class="n">o</span><span class="p">.</span><span class="n">purchase_cost</span>
<span class="p">,</span><span class="n">o</span><span class="p">.</span><span class="n">margin</span>
<span class="p">,</span><span class="n">s</span><span class="p">.</span><span class="n">shipping_fee</span>
<span class="p">,</span><span class="n">s</span><span class="p">.</span><span class="n">logcost</span>
<span class="p">,</span><span class="n">s</span><span class="p">.</span><span class="n">ship_cost</span>
<span class="k">FROM</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="nv">"int_orders_margin"</span><span class="p">)}}</span> <span class="n">o</span>
<span class="k">LEFT</span> <span class="k">JOIN</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="nv">"stg_raw__ship"</span><span class="p">)}}</span> <span class="n">s</span> 
<span class="k">USING</span><span class="p">(</span><span class="n">orders_id</span><span class="p">)</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="n">orders_id</span> <span class="k">desc</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Check your code, commit and build your model</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-11-Capture_decran_2023-09-25_a_18.06.08.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-12-Capture_decran_2023-09-25_a_18.26.39.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-13-Capture_decran_2023-09-26_a_14.58.06.png" alt=""></p>

</details>

<p>Your lineage should look like this:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/04-Intermediate-Models-asset-14-Capture_decran_2023-09-26_a_15.59.04.png" alt=""></p>
</li>
</ol>



</div>
</div>