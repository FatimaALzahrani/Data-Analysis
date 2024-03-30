<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>To embark on the challenges presented in this new lecture, it’s imperative to grasp the fundamental concepts introduced in the exercises corresponding to the previous lecture.</p>

<p>The tasks in this lecture will build upon the exercises from the preceding one, introducing increased complexity and depth. It is strongly recommended to first complete challenges 1, 2, 3, 4, and 5 from the previous lecture with solutions.</p>

<p>Prioritize finishing the exercises from the preceding lecture to establish a solid foundation before tackling these new challenges.</p>

<h2 id="1---project-structure-materialization">1 - Project Structure Materialization</h2>

<p>Since the <code>finance_days.sql</code> mart model will be requested by the finance team everyday, you want to materialize it as a table and recreate the table each morning computing the latest data.</p>

<ol>
<li>
<p>Define the materialization in the config block inside the file <code>finance_days.sql</code></p>

<details>
<summary>Hint</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="p">{{</span> <span class="n">config</span><span class="p">(</span><span class="n">materialized</span><span class="o">=</span><span class="p">...)</span> <span class="p">}}</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Build your model and check on BigQuery</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/01-Project-Structure-asset-1-Capture_decran_2023-09-26_a_17.53.30.png" alt=""></p>

<p>Actually, we would like this configuration to be valid for all mart models.</p>

<p>Let’s make the all the tables in the <code>mart</code> folder materialized as tables.</p>
</li>
<li>
<p>Edit the config file of your project <code>dbt_project.yml</code></p>

<details>
<summary>Hint</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="n">models</span><span class="p">:</span>
<span class="n">my_new_project</span><span class="p">:</span>
<span class="n">mart</span><span class="p">:</span>
<span class="n">materialized</span><span class="p">:</span> <span class="p">...</span>
</code></pre></div>      </div>
<p>This will apply to all the files inside this folder. Configuration will be overwritten by config block in single file.</p>
</details>
</li>
<li>
<p>Remove the specific configuration in <code>finance_days.sql</code></p>
</li>
</ol>

<h2 id="2---project-structure-database-target">2 - Project Structure Database Target</h2>

<p>We want all the mart models to target a specific dataset in the warehouse, corresponding to the business team that will use it.</p>

<ol>
<li>
<p>Add a folder in mart corresponding to the business i.e. <code>finance</code></p>
</li>
<li>
<p>Move your <code>finance</code> model inside this folder</p>
</li>
<li>
<p>Edit your <code>dbt_project.yml</code> to change the target of a new folder</p>

<details>
<summary>Hint</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="n">models</span><span class="p">:</span>
<span class="n">my_new_project</span><span class="p">:</span>
<span class="n">mart</span><span class="p">:</span>
<span class="n">materialized</span><span class="p">:</span> <span class="p">...</span>
<span class="n">finance</span><span class="p">:</span>
<span class="k">schema</span><span class="p">:</span> <span class="p">...</span>
</code></pre></div>      </div>
<p>Schema will be the suffix of your initial database</p>
</details>
</li>
<li>
<p>Run the <code>dbt build</code> command.</p>
</li>
<li>
<p>Check in BigQuery the structure and the icon of table:</p>
</li>
</ol>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/01-Project-Structure-asset-2-Capture_decran_2023-09-27_a_09.59.13.png" alt=""></p>



</div>
</div>