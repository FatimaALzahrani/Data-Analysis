<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>To embark on the challenges presented in this new lecture, it’s imperative to grasp the fundamental concepts introduced in the exercises corresponding to the previous lecture.</p>

<p>The tasks in this lecture will build upon the exercises from the preceding one, introducing increased complexity and depth. It is strongly recommended to first complete challenges 1, 2, 3, 4, and 5 from the previous lecture with solutions.</p>

<p>Prioritize finishing the exercises from the preceding lecture to establish a solid foundation before tackling these new challenges.</p>

<h2 id="introduction---macros-as-functions">Introduction - Macros as Functions</h2>

<p>Macros allow you to create functions that can be reused in different models.</p>

<p>Macros are the equivalent of BigQuery functions except that:</p>

<ul>
<li>
<p>you can find them directly on dbt</p>
</li>
<li>
<p>you can perform more advanced transformations</p>
</li>
<li>
<p>you can import packages to use predefined functions created by other developers</p>
</li>
</ul>

<h2 id="1---create-a-margin-percent-function">1 - Create a <code>margin percent</code> Function</h2>

<p>We want to create a macro to calculate the&nbsp;<code>margin percent</code>&nbsp;(%)</p>

<ol>
<li>
<p>In the macros folder, create a&nbsp;<code>functions.sql</code>&nbsp;file.</p>
</li>
<li>
<p>Inside, define the macro <code>margin_percent</code> taking as argument <code>revenue</code> and <code>purchase_cost</code></p>

<details>
<summary>Hint</summary>

<p><em>You can define column in your argument with (column_name1,column_name2)</em></p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="p">{</span><span class="o">%</span> <span class="n">macro</span><span class="o">**&lt;</span><span class="n">your</span> <span class="n">code</span> <span class="n">here</span><span class="o">&gt;**</span> <span class="o">%</span><span class="p">}</span>
<span class="p">...</span>
<span class="p">{</span><span class="o">%</span> <span class="n">endmacro</span> <span class="o">%</span><span class="p">}</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Then define what the macro should return (<code>margin percent = margin / revenue</code>)</p>

<details>
<summary>Hint</summary>

<p>You can use SAFE_DIVIDE() to prevent error with 0.</p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="p">{</span><span class="o">%</span> <span class="n">macro</span> <span class="p">...</span> <span class="o">%</span><span class="p">}</span>
<span class="o">**&lt;</span><span class="n">your</span> <span class="n">code</span> <span class="n">here</span><span class="o">&gt;**</span>
<span class="p">{</span><span class="o">%</span> <span class="n">endmacro</span> <span class="o">%</span><span class="p">}</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Finally, you can decide to round your result and keep 2 as precision by default.</p>

<details>
<summary>Solution</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="p">{</span><span class="o">%</span> <span class="n">macro</span> <span class="n">margin_percent</span><span class="p">(</span><span class="n">revenue</span><span class="p">,</span> <span class="n">purchase_cost</span><span class="p">,</span> <span class="nb">precision</span><span class="o">=</span><span class="mi">2</span><span class="p">)</span> <span class="o">%</span><span class="p">}</span>
<span class="n">ROUND</span><span class="p">(</span> <span class="n">SAFE_DIVIDE</span><span class="p">(</span> <span class="p">({{</span> <span class="n">revenue</span> <span class="p">}}</span> <span class="o">-</span> <span class="p">{{</span> <span class="n">purchase_cost</span> <span class="p">}})</span> <span class="p">,</span> <span class="p">{{</span> <span class="n">revenue</span> <span class="p">}}</span> <span class="p">)</span> <span class="p">,</span> <span class="p">{{</span> <span class="nb">precision</span> <span class="p">}})</span>
<span class="p">{</span><span class="o">%</span> <span class="n">endmacro</span> <span class="o">%</span><span class="p">}</span>

</code></pre></div>      </div>
</details>
</li>
</ol>

<h2 id="2---use-macros-in-the-models">2 - Use Macros in the Models</h2>

<ol>
<li>
<p>Edit your <code>int_sales_margin.sql</code> to add a column with margin percent.</p>

<details>
<summary>Hint</summary>

<p>{{ function(…) }}</p>
</details>

<details>
<summary>Solution</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="p">{{</span> <span class="n">margin_percent</span><span class="p">(</span><span class="s1">'s.revenue'</span><span class="p">,</span> <span class="s1">'s.quantity*CAST(p.purchSE_PRICE AS FLOAT64)'</span><span class="p">)</span> <span class="p">}}</span>
</code></pre></div>      </div>
</details>
</li>
</ol>

<h2 id="3---use-macros-from-package">3 - Use Macros from Package</h2>

<p><code>dbt_utils</code> is the most famous package of dbt, you need to install it before using functions.</p>

<ol>
<li>
<p>Let’s use the function <code>dbt_utils.union_relations</code> to simplify <code>int_campaigns.sql</code> by removing the UNION ALL.</p>

<details>
<summary>Hint</summary>

<p>doc : <a href="https://github.com/dbt-labs/dbt-utils#union_relations-source" target="_blank">dbt_utils.union_relations</a>
Before:</p>
<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> <span class="o">*</span>
<span class="k">FROM</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="s1">'stg_raw__adwords'</span><span class="p">)}}</span>
<span class="k">UNION</span> <span class="k">ALL</span> 
<span class="k">SELECT</span> <span class="o">*</span>
<span class="k">FROM</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="s1">'stg_raw__bing'</span><span class="p">)}}</span>
<span class="k">UNION</span> <span class="k">ALL</span> 
<span class="k">SELECT</span> <span class="o">*</span>
<span class="k">FROM</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="s1">'stg_raw__criteo'</span><span class="p">)}}</span>
<span class="k">UNION</span> <span class="k">ALL</span> 
<span class="k">SELECT</span> <span class="o">*</span>
<span class="k">FROM</span> <span class="p">{{</span><span class="k">ref</span><span class="p">(</span><span class="s1">'stg_raw__facebook'</span><span class="p">)}}</span>
</code></pre></div>      </div>
</details>

<details>
<summary>Solution</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="p">{{</span>
<span class="n">dbt_utils</span><span class="p">.</span><span class="n">union_relations</span><span class="p">(</span>
<span class="n">relations</span><span class="o">=</span><span class="p">[</span><span class="k">ref</span><span class="p">(</span><span class="s1">'stg_raw__adwords'</span><span class="p">),</span> <span class="k">ref</span><span class="p">(</span><span class="s1">'stg_raw__bing'</span><span class="p">),</span> <span class="k">ref</span><span class="p">(</span><span class="s1">'stg_raw__criteo'</span><span class="p">),</span> <span class="k">ref</span><span class="p">(</span><span class="s1">'stg_raw__facebook'</span><span class="p">)]</span>
<span class="p">}}</span>
</code></pre></div>      </div>
</details>
</li>
</ol>

<p>🎉 Congratulations! You have written your first macros on dbt. Macros can be very useful on dbt models. 🎉</p>


</div>
</div>