<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<h3 id="relevant-links-for-this-challenge">Relevant links for this challenge</h3>

<p>Data sources:</p>

<p><a href="https://docs.google.com/spreadsheets/d/1HatMy8dQ7xVCqTJQQMFWRpnQNdtMzpn-/edit?usp=sharing&amp;ouid=100452186638598593746&amp;rtpof=true&amp;sd=true" target="_blank">List of films.xlsx</a></p>

<h3 id="relevant-links-for-this-solution">Relevant links for this solution</h3>

<p><a href="https://drive.google.com/file/d/1qL8-7WuklpNY9taqH0FuXa7xoob0rBqh/view?usp=drive_link" target="_blank">Solution file</a></p>

<h3 id="background--objectives">Background &amp; Objectives</h3>

<p>The goal of this challenge is to start manipulating the relational model and DAX.</p>

<h3 id="import-the-file">Import the File</h3>

<p>Create a new Power BI report, and load the data (3 tabs) from this file:</p>

<p><a href="https://docs.google.com/spreadsheets/d/1HatMy8dQ7xVCqTJQQMFWRpnQNdtMzpn-/edit?usp=sharing&amp;ouid=100452186638598593746&amp;rtpof=true&amp;sd=true" target="_blank">List of films.xlsx</a></p>

<details>
<summary>Hint</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/04-Margin-Movies-asset-1-Screenshot_2023-10-31_at_12.34.43.png" alt=""></p>

<p><em>Select all tables needed. For Certificate &amp; Genre, you can choose between raw table or a formatting table.</em></p>
</details>

<h3 id="data-cleaning">Data Cleaning</h3>

<ol>
<li>
<p>Inspect and format the columns if needed. Once you validated the preview, close Power Query.</p>

<h3 id="data-modeling">Data Modeling</h3>
</li>
<li>
<p>Select the model view. What do you see? Can you detail it?</p>

<details>
<summary>Hint</summary>

<p>Double click on a link to get details
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/04-Margin-Movies-asset-2-Screenshot_2023-10-31_at_12.35.41.png" alt=""></p>

</details>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/04-Margin-Movies-asset-3-Screenshot_2023-10-31_at_12.40.40.png" alt=""></p>

</details>

<h3 id="data-visualization">Data Visualization</h3>
</li>
<li>
<p>Create a table showing&nbsp;<em>the average box office takings</em>&nbsp;and&nbsp;<em>average budget spend</em>&nbsp;by Certificate.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/04-Margin-Movies-asset-4-Screenshot_2023-10-31_at_12.41.18.png" alt=""></p>

</details>
</li>
<li>
<p>Now, we will perform the calculation using DAX. First create a new&nbsp;<code>Measure</code>&nbsp;table.</p>

<details>
<summary>Hint</summary>

<p>Step by step operations explained in detail&nbsp;<a href="https://www.phdata.io/blog/creating-a-measures-table-in-power-bi/" target="_blank">here</a></p>
</details>
</li>
<li>
<p>Using DAX, calculate&nbsp;<strong>the average box office takings</strong>. Add the measure in your table and compare it to the once you previously added.</p>

<details>
<summary>Solution</summary>

<div class="language-javascript highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="nx">AvgBoxOffice</span> <span class="o">=</span> <span class="nc">CALCULATE</span><span class="p">(</span><span class="nc">AVERAGE</span><span class="p">(</span><span class="nx">Films</span><span class="p">[</span><span class="nx">BoxOfficeDollars</span><span class="p">]))</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Using DAX, calculate&nbsp;<em>the</em>&nbsp;<strong>average budget spend</strong>. Add the measure in your table and compare it to the once you previously added.</p>

<details>
<summary>Solution</summary>

<div class="language-javascript highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="nx">AvgBudget</span> <span class="o">=</span> <span class="nc">CALCULATE</span><span class="p">(</span><span class="nc">AVERAGE</span><span class="p">(</span><span class="nx">Films</span><span class="p">[</span><span class="nx">BudgetDollars</span><span class="p">]))</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Create the <code>**% margin by Certificate**</code> using variables in a DAX formula</p>

<details>
<summary>Hint</summary>

<p>Variables explained more&nbsp;<a href="https://learn.microsoft.com/en-us/dax/best-practices/dax-variables" target="_blank">here</a></p>
</details>

<details>
<summary>Solution</summary>

<div class="language-javascript highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="o">%</span><span class="nx">Margin</span> <span class="o">=</span> 
<span class="nx">VAR</span> <span class="nx">SumBoxOffice</span> <span class="o">=</span> <span class="nc">CALCULATE</span><span class="p">(</span><span class="nc">SUM</span><span class="p">(</span><span class="nx">Films</span><span class="p">[</span><span class="nx">BoxOfficeDollars</span><span class="p">]))</span>
<span class="nx">VAR</span> <span class="nx">SumBudget</span> <span class="o">=</span> <span class="nc">CALCULATE</span><span class="p">(</span><span class="nc">SUM</span><span class="p">(</span><span class="nx">Films</span><span class="p">[</span><span class="nx">BudgetDollars</span><span class="p">]))</span>
<span class="nx">RETURN</span>
<span class="nx">SumBoxOffice</span>  <span class="o">/</span> <span class="nx">SumBudget</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Add it into your table, does the result seems ok to you?</p>

<details>
<summary>Solution</summary>

<p>No, because for some movies, we don’t have the spend</p>
</details>
</li>
<li>
<p>In the Data panel, filter on these 3 movies to visualize the issue:</p>

<ul>
<li>
<p>Mary Poppins</p>
</li>
<li>
<p>Hamlet</p>
</li>
<li>
<p>Joan of Arc</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/04-Margin-Movies-asset-5-Screenshot_2023-10-31_at_12.38.02.png" alt=""></p>

<p>What should be the expected result we want?</p>

<details>
<summary>Solution</summary>

<p>For Mary Poppins movie, we don’t have the Budget so we should exclude this movie from the calculation and keep only Hamlet and Joan of Arc.</p>
</details>
</li>
<li>
<p>Now, calculate the&nbsp;<strong>Average profit margin</strong>&nbsp;per Movie in the Films table using the appropriate DAX function</p>

<details>
<summary>Hint</summary>

<p>You can use the&nbsp;<a href="https://learn.microsoft.com/fr-fr/dax/divide-function-dax" target="_blank">Divide function</a>&nbsp;and&nbsp;<a href="https://learn.microsoft.com/fr-fr/dax/averagex-function-dax" target="_blank">Averagex function</a></p>
</details>

<details>
<summary>Solution</summary>

<div class="language-javascript highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="o">%</span><span class="nx">MarginOk</span> <span class="o">=</span> <span class="nc">AVERAGEX</span><span class="p">(</span><span class="nx">Films</span><span class="p">,</span><span class="nc">DIVIDE</span><span class="p">((</span><span class="nx">Films</span><span class="p">[</span><span class="nx">BoxOfficeDollars</span><span class="p">]),</span><span class="nx">Films</span><span class="p">[</span><span class="nx">BudgetDollars</span><span class="p">]))</span>
</code></pre></div>      </div>
</details>
</li>
<li>
<p>Now, let’s create some visuals for our dashboard</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/04-Margin-Movies-asset-6-Screenshot_2023-10-31_at_12.38.45.png" alt=""></p>

<ul>
<li>
<p>1 = Genre Filter: edit the interaction in order to filter 2 &amp; 3 but not 4</p>
</li>
<li>
<p>2 = Certificate Filter: can filter 1, 3 &amp; 4</p>
</li>
<li>
<p>3 = A table that gathers the following information per Movie Title: total budget (in million $), Box Office revenue (in million $) and % of margin</p>
</li>
<li>
<p>4 = Bar Chart that sums up by Genre the % Margin</p>
</li>
</ul>
</li>
</ol>

<p>Congratulations you made it! 🎉</p>


</div>
</div>