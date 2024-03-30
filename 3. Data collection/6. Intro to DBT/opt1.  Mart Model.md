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
<p><strong>Daily Margin and Operational Margin Evolution:</strong></p>

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

<h1 id="mart-models">Mart Models</h1>

<p>Mart models are designed to be accessible for business teams, such as finance.</p>

<h2 id="calculate-the-evolution-requested-by-the-finance-team">Calculate the Evolution Requested by the Finance Team**</h2>

<ol>
<li>
<p>Create a mart model named <code>finance_days.sql</code></p>
</li>
<li>
<p>Perform the relevant transformations in dbt query editor to build the following table:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/05-Mart-Models-asset-1-Capture_decran_2023-09-26_a_16.44.50.png" alt=""></p>

<details>
<summary>Solution </summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="k">COUNT</span><span class="p">(</span><span class="n">orders_id</span><span class="p">)</span> <span class="k">AS</span> <span class="n">nb_transactions</span>
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">revenue</span><span class="p">),</span><span class="mi">0</span><span class="p">)</span> <span class="k">AS</span> <span class="n">revenue</span> 
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">AVG</span><span class="p">(</span><span class="n">revenue</span><span class="p">),</span><span class="mi">1</span><span class="p">)</span> <span class="k">AS</span> <span class="n">average_basket</span>
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">revenue</span><span class="p">)</span><span class="o">/</span><span class="k">COUNT</span><span class="p">(</span><span class="n">orders_id</span><span class="p">),</span><span class="mi">1</span><span class="p">)</span> <span class="k">AS</span> <span class="n">average_basket_bis</span>
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">margin</span><span class="p">),</span><span class="mi">0</span><span class="p">)</span> <span class="k">AS</span> <span class="n">margin</span> 
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">operational_margin</span><span class="p">),</span><span class="mi">0</span><span class="p">)</span> <span class="k">AS</span> <span class="n">operational_margin</span> 
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">purchase_cost</span><span class="p">),</span><span class="mi">0</span><span class="p">)</span> <span class="k">AS</span> <span class="n">purchase_cost</span> 
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">shipping_fee</span><span class="p">),</span><span class="mi">0</span><span class="p">)</span> <span class="k">AS</span> <span class="n">shipping_fee</span> 
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">logcost</span><span class="p">),</span><span class="mi">0</span><span class="p">)</span> <span class="k">AS</span> <span class="n">logcost</span> 
<span class="p">,</span><span class="n">ROUND</span><span class="p">(</span><span class="k">SUM</span><span class="p">(</span><span class="n">ship_cost</span><span class="p">),</span><span class="mi">0</span><span class="p">)</span> <span class="k">AS</span> <span class="n">ship_cost</span> 
<span class="p">,</span><span class="k">SUM</span><span class="p">(</span><span class="n">quantity</span><span class="p">)</span> <span class="k">AS</span> <span class="n">quantity</span> 
<span class="k">FROM</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="nv">"int_orders_operational"</span><span class="p">)}}</span>
<span class="k">GROUP</span> <span class="k">BY</span>  <span class="n">date_date</span>
<span class="k">ORDER</span> <span class="k">BY</span>  <span class="n">date_date</span> <span class="k">DESC</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Once you are satisfied with the Preview results, you can commit and build the model.</p>

<p>The lineage should look like this:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/06-Data-Layers-And-Intro-DBT/05-Mart-Models-asset-2-Capture_decran_2023-09-26_a_16.48.16.png" alt=""></p>
</li>
</ol>



</div>
</div>