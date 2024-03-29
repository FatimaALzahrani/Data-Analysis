<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>This exercise is building on the previous challenge to show you the power of Fivetran 🚀</p>

<ol>
<li>
<p>Check the BigQuery to ensure that the new dataset and table have been created correctly.</p>
</li>
<li>
<p>Open the table, control the schema and check that the data has been added correctly.</p>
</li>
<li>
<p>Click on the button query and add “<code>*</code>” after <code>SELECT</code> and <code>ORDER BY date_date</code> to get</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> <span class="o">*</span> <span class="k">FROM</span> <span class="nv">`fvt_gsheet.gwz_finance_campaign`</span> <span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span> <span class="k">LIMIT</span> <span class="mi">1000</span>
</code></pre></div>    </div>
</li>
<li>
<p>Go to your own Google Sheet <code>gwz_finance</code> and update the cost of 2021-10-01 from 3700€ to 3900€. There has been an error in the cost of some forgotten ads so you want to correct the data to reflect the right cost.</p>

<p>Go to <strong>Fivetran</strong>&nbsp;» <strong>Connectors</strong>&nbsp;» <code>Gwz_finance_campaign</code> and, on the top right, start a <strong>Sync now</strong> to resynchronise.</p>
</li>
<li>
<p>Wait a while ⏰, go back to BigQuery and run your query again:</p>

<ul>
<li>
<p>Is the data updated? 🆕</p>
</li>
<li>
<p>Check the log file in Fivetran:</p>

<ul>
<li>
<p>how long did it take? 🕐</p>
</li>
<li>
<p>how many rows have been modified? 👀</p>
</li>
</ul>
</li>
</ul>

<details>
<summary>Example of a log file</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/02-Fivetran-Data-Flow-Update-asset-1-Untitled.png" alt=""></p>
</details>
</li>
<li>
<p>Add a new row on the Google Sheet for <code>2021-10-16</code> with <strong>3400€</strong> as cost. Sync on Fivetran and run a query on BigQuery.</p>

<ul>
<li>
<p>Is the data updated? 🆕</p>
</li>
<li>
<p>Check the log file in Fivetran:</p>

<ul>
<li>
<p>how long did it take? 🕐</p>
</li>
<li>
<p>how many rows have been modified? 👀</p>
</li>
</ul>
</li>
</ul>
</li>
<li>
<p>Delete the <code>2021-10-16</code> row, sync on Fivetran and run on BigQuery.</p>

<ul>
<li>
<p>Is the data updated? 🆕</p>
</li>
<li>
<p>Check the log file in Fivetran:</p>

<ul>
<li>
<p>how long did it take? 🕐</p>
</li>
<li>
<p>how many rows have been modified? 👀</p>
</li>
</ul>
</li>
</ul>
</li>
<li>
<p>Change the frequency of the synchronisation</p>

<ul>
<li>Change the frequency of the synchronisation from 6 hours to 24 hours to reduce the cost</li>
</ul>
</li>
<li>
<p>Check the schema tab in Fivetran → how many columns are there?</p>
</li>
<li>
<p>Add a new column - <code>Impression</code> on the Google Sheet with <code>1,000,000</code> impressions every day. Sync on Fivetran and run on BigQuery.</p>

<ul>
<li>
<p>Is the data updated? 🆕</p>
</li>
<li>
<p>Check log file in Fivetran:</p>

<ul>
<li>
<p>how long did it take? 🕐</p>
</li>
<li>
<p>how many rows have been modified? 👀</p>
</li>
</ul>
</li>
<li>
<p>Check the schema in Fivetran:</p>

<ul>
<li>how many columns are there?</li>
</ul>
</li>
</ul>
</li>
<li>
<p>Change the name of the data column stored on Google Sheet and add column C, and run sync on Fivetran</p>

<ul>
<li>
<p>Is the data updated? 🆕</p>
</li>
<li>
<p>Check log file in Fivetran:</p>

<ul>
<li>
<p>how long did it take? 🕐</p>
</li>
<li>
<p>how many rows have been modified? 👀</p>
</li>
</ul>
</li>
<li>
<p>Check the schema in Fivetran:</p>

<ul>
<li>how many columns are there?</li>
</ul>
</li>
</ul>
</li>
<li>
<p>In the schema settings, block the schema sync, then enable notifications.</p>

<details>
<summary>Hint</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/am7fagbqpq729r3z5nv3hwlaqtil" alt=""></p>
</details>

<p>Add a new column on D named “<strong>Click</strong>” on the Google Sheet with <code>10,000</code> clicks each day. Change the name of the data stored on the Google Sheet and add the column D, synchronize on Fivetran and run on BigQuery.</p>

<ul>
<li>
<p>Is the data updated? 🆕</p>
</li>
<li>
<p>Check your email 📧</p>
</li>
</ul>
</li>
<li>
<p>Re-activate schema change and restart the sync.</p>

<details>
<summary>Hint</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/rxzm1j3u9jph2e1eaf7eey60xaw8" alt=""></p>
</details>

<ul>
<li>
<p>Is the data updated? 🆕</p>
</li>
<li>
<p>Check the log file in Fivetran:</p>

<ul>
<li>
<p>how long did it take? 🕐</p>
</li>
<li>
<p>how many rows have been modified? 👀</p>
</li>
</ul>
</li>
<li>
<p>Check the schema in Fivetran:</p>

<ul>
<li>how many columns are there?</li>
</ul>
</li>
</ul>
</li>
</ol>



</div>
</div>