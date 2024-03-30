<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>To embark on the challenges presented in this new lecture, it’s imperative to grasp the fundamental concepts introduced in the exercises corresponding to the previous lecture.</p>

<p>The tasks in this lecture will build upon the exercises from the preceding one, introducing increased complexity and depth. It is strongly recommended to first complete challenges 1, 2, 3, 4, and 5 from the previous lecture with solutions.</p>

<p>Prioritize finishing the exercises from the preceding lecture to establish a solid foundation before tackling these new challenges.</p>

<h2 id="introduction">Introduction</h2>

<p>There are more notions on dbt that we didn’t have the time to cover.</p>

<p><strong>dbt Snapshots</strong> is a powerful feature that allows you to capture and manage changes in your data over time and maintain a historical record of those changes</p>

<h3 id="how-do-dbt-snapshots-work">How do dbt Snapshots Work?</h3>

<ol>
<li>
<p><strong>Identify Source Data Changes</strong>: dbt compares the data in your source table or view with the previously recorded state to identify any changes.</p>
</li>
<li>
<p><strong>Record Changes</strong>: When a change is detected (addition, deletion, or modification of records), dbt records metadata about that change, including a timestamp and the type of change.</p>
</li>
<li>
<p><strong>Store Historical Data</strong>: dbt stores this metadata in a special table called the snapshot table. This table maintains a historical record of changes to the data over time.</p>
</li>
</ol>

<h2 id="1---track-the-evolution-of-the-price-of-each-product">1 - Track the Evolution of the Price of each Product</h2>

<ol>
<li>
<p>Create a new <code>products_price.sql</code> in the snapshots folder and paste this code:</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="p">{</span><span class="o">%</span> <span class="n">snapshot</span> <span class="n">products_snapshot</span> <span class="o">%</span><span class="p">}</span>

<span class="p">{{</span>
<span class="n">config</span><span class="p">(</span>
<span class="n">target_schema</span><span class="o">=</span><span class="s1">'dbt_snapshots'</span><span class="p">,</span> <span class="c1">--corresponding to the new database in BigQuery</span>
<span class="n">unique_key</span><span class="o">=</span><span class="s1">'products_id'</span><span class="p">,</span> <span class="c1">--unique key of the table to track</span>
<span class="n">strategy</span><span class="o">=</span><span class="s1">'check'</span><span class="p">,</span> <span class="c1">--other strategy </span>
<span class="n">check_cols</span><span class="o">=</span><span class="s1">'all'</span> <span class="c1">--track evolution on all columns</span>
<span class="p">)</span>
<span class="p">}}</span>

<span class="k">select</span> <span class="o">*</span> <span class="k">from</span> <span class="p">{{</span> <span class="k">ref</span><span class="p">(</span><span class="nv">"stg_raw__product"</span><span class="p">)</span> <span class="p">}}</span>

<span class="p">{</span><span class="o">%</span> <span class="n">endsnapshot</span> <span class="o">%</span><span class="p">}</span> 
</code></pre></div>    </div>
</li>
<li>
<p>Build your snapshot table</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/05-Snapshot-asset-1-Capture_decran_2023-09-28_a_09.22.02.png" alt=""></p>
</li>
<li>
<p>Check the creation on BigQuery</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/05-Snapshot-asset-2-Capture_decran_2023-09-28_a_09.16.10.png" alt=""></p>
</li>
<li>
<p>Let’s pretend a change of price for a product</p>

<p>Execute this code directly in BigQuery</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">UPDATE</span> <span class="nv">`gz_raw_data.raw_gz_product`</span>
<span class="k">SET</span> <span class="n">purchSE_PRICE</span>   <span class="o">=</span> <span class="s1">'4'</span>
<span class="k">WHERE</span> <span class="n">products_id</span> <span class="o">=</span> <span class="mi">5547</span><span class="p">;</span>
</code></pre></div>    </div>
</li>
<li>
<p>Build your snapshot again and check it in BigQuery with:</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> <span class="o">*</span> 
<span class="k">FROM</span> <span class="nv">`snapshots.products_snapshot`</span> 
<span class="k">WHERE</span> <span class="n">products_id</span> <span class="o">=</span> <span class="mi">5547</span>
</code></pre></div>    </div>
</li>
<li>
<p>Check the result and try to understand the structure.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/05-Snapshot-asset-3-Capture_decran_2023-09-28_a_09.45.21.png" alt=""></p>

<p>Now you can track your changes, you can imagine schedule your snapshot execution everyday.</p>
</li>
</ol>



</div>
</div>