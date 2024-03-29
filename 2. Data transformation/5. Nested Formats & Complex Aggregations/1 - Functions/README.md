<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<h2 id="1---mail">1 - Mail</h2>

<h3 id="data-import">Data Import</h3>

<ul>
<li>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_mail_17" target="_blank">gwz_mail_17</a> table into the <strong>‘course17’</strong> dataset of your BigQuery project.</li>
</ul>

<p>💁🏽&nbsp;<u>_Help_</u> - <a href="https://cloud.google.com/bigquery/docs/managing-tables#copying_a_single_source_table" target="_blank">Google documentation</a> to copy a table</p>

<h3 id="is_mail_be-function">is_mail_be Function</h3>

<p>The following query returns the different Greenweez mail campaigns.</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span> 
<span class="o">###</span> <span class="k">Key</span> <span class="o">###</span>
<span class="n">journey_id</span>
<span class="o">###########</span>
<span class="p">,</span><span class="n">journey_name</span>
<span class="p">,</span><span class="n">sent_nb</span> 
<span class="k">FROM</span> <span class="nv">`course17.gwz_mail_17`</span>
<span class="k">ORDER</span> <span class="k">BY</span> 
<span class="n">sent_nb</span> <span class="k">DESC</span>
</code></pre></div></div>

<p>If the campaigns are sent to Belgian customers, the string in the <code>journey_name</code> column contains “nlbe”.</p>

<ol>
<li>
<p>Write a query to create the <code>mail_be</code> column which is equal to 1 if the mail campaign is sent to Belgium and 0 otherwise.</p>
</li>
<li>
<p>Create a function <code>is_mail_be</code> in the <strong>course17</strong> dataset that takes the <code>journey_name</code> as input and returns 1 if the mail campaign is sent to Belgium and 0 otherwise.</p>

<p>💁🏽&nbsp;<u>_Help_</u><em>-</em> <em><a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/user-defined-functions" target="_blank">Create User defined function documentation</a></em></p>
</li>
<li>
<p>Update the query from the first step by using the new <code>is_mail_be</code> function to create the <code>mail_be</code> column. When creating columns remember to give them a useful name using an alias and the <code>AS</code> clause.</p>

<h3 id="mail_type-function">mail_type Function</h3>

<p>There are 3 different types of mail:</p>

<ul>
<li>
<p><code>newsletter</code> - if the <code>journey_name</code> contains “nl” or “nlbe”.</p>
</li>
<li>
<p><code>abandoned_basket</code> - if the <code>journey_name</code> contains “panier_abandonne” (or <em>“abandoned_basket”</em> in 🇬🇧)</p>
</li>
<li>
<p><code>back_in_stock</code> - if the <code>journey_name</code> contains “back_in_stock”.</p>
</li>
</ul>
</li>
<li>
<p>Create a function <code>mail_type</code> in the <strong>course17</strong> dataset that contains one of the 3 above mentioned mail types depending on the <code>journey_name</code>.</p>
</li>
<li>
<p>Select all the columns from the <code>gwz_mail_17</code> table and add a <code>mail_type</code> column to the results by using the <code>mail_type</code> function you created.</p>

<h2 id="2---nps">2 - NPS</h2>

<h3 id="data-import-1">Data Import</h3>

<ul>
<li>Copy the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse17!3sgwz_nps_17" target="_blank">gwz_nps_17</a> table into the <strong>‘course17’</strong> dataset of your BigQuery project.</li>
</ul>

<p>The following query displays the NPS scores (<code>global_note</code>) for many orders.</p>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span><span class="n">orders_id</span>
<span class="p">,</span><span class="n">transporter</span>
<span class="p">,</span><span class="n">global_note</span>
<span class="k">FROM</span> <span class="nv">`course17.gwz_nps_17`</span>
</code></pre></div>    </div>

<h3 id="nps-function">NPS Function</h3>

<p><em><strong>NPS</strong>__= % promoters - % detractors,</em> where:</p>

<ul>
<li>
<p>detractors give an overall score between 0 and 6 🔴</p>
</li>
<li>
<p>Passives give an overall score between 7 and 8 🟡</p>
</li>
<li>
<p>Promoters give an overall score between 9 and 10 🟢</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/05-Nested-Formats-And-Complex-Aggregations/01-Functions-asset-1-Untitled.png" alt=""></p>
</li>
<li>
<p>Add an <code>nps</code> column that equals to 1 if the customer is a promoter, -1 if they are a detractor and 0 if they are neutral.</p>
</li>
<li>
<p>Create an <code>nps</code> function in the <strong>course17</strong> dataset that takes <code>global_note</code> as an input and returns the same values as the <code>nps</code> column created in the step above.</p>

<p>💁🏽&nbsp;<u>_Help_</u><em>-</em> <em><a href="https://cloud.google.com/bigquery/docs/reference/standard-sql/user-defined-functions" target="_blank">Create User defined function documentation</a></em></p>
</li>
<li>
<p>Select all the columns from the <code>gwz_nps_17</code> table and add an <code>nps</code> column to the results by using the <code>nps</code> function you created.</p>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/05-Nested-Formats-And-Complex-Aggregations/01-Functions-asset-2-Untitled.png" alt=""></p>
</details>

<h3 id="transporter-carrier-function">Transporter (carrier) Function</h3>

<p>There are 2 different brands of transporters:</p>

<ul>
<li>
<p>Chrono</p>
</li>
<li>
<p>DPD</p>
</li>
</ul>

<p>There are 2 kinds of delivery modes:</p>

<ul>
<li>
<p>Pickup point delivery</p>
</li>
<li>
<p>Home delivery</p>
</li>
</ul>
</li>
<li>
<p>Create a <code>delivery_mode</code> function in the <strong>course17</strong> dataset that takes the <code>transporter</code> column as an input and returns one of the 2 above-mentioned delivery modes.</p>
</li>
<li>
<p>Create a <code>transporter_brand</code> function in the <strong>course17</strong> dataset that takes the <code>transporter</code> column as an input and returns one of the 2 above-mentioned transporter brands.</p>
</li>
<li>
<p>Select all the columns from the <code>gwz_nps_17</code> table and add the <code>nps</code>, <code>delivery_mode</code> &amp; <code>transporter_brand</code> columns to it using the new functions you created.</p>
</li>
</ol>

<details>
<summary>🎯 Target</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/03-Data-Transformation/05-Nested-Formats-And-Complex-Aggregations/01-Functions-asset-3-Untitled.png" alt=""></p>
</details>

<p>Great start! 🛫</p>



</div>
</div>