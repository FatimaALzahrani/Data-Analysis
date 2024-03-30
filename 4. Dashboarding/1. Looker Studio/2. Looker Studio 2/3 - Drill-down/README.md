<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<hr>

<p><a href="https://lookerstudio.google.com/u/0/reporting/855a3969-70fe-46b9-a70a-668af6887f27/page/bAP6C" target="_blank">Solution</a></p>

<hr>

<p>In data visualisation, you can have two pitfalls:</p>

<ul>
<li>
<p>not enough indicators</p>

<p>→ the analysis will remain <strong>superficial</strong></p>
</li>
<li>
<p>too <strong>many</strong> indicators</p>

<p>→ the user is <strong>lost</strong></p>

<p>→ the <strong>maintenance</strong> is <strong>impossible</strong></p>
</li>
</ul>

<p>How can you have <strong>clear</strong> dashboards with <strong>few graphs</strong> while not losing the capacity to do go in depth?</p>

<p>You need to find a balance between quantity and quality.</p>

<p><em>At the same time</em> = <strong>few</strong> information points to be <strong>clear</strong> &amp; <strong>enough</strong> to be <strong>exhaustive</strong></p>

<p>One solution is to use <strong>breakdown,</strong> <strong>drill-down</strong> &amp; i<strong>nteractions</strong> <em>(including interactive charts, cross-filtering, optional metrics)</em>. In this exercise, you will learn how to use <strong>drill-down</strong>. You will practice with Greenweez data.</p>

<p><br></p>

<h3 id="objective">Objective</h3>

<p>Greenweez has a lot of data and information to monitor. One of the main challenges of BI is to give “<em>at the same time”</em> a <strong>clear</strong> view with <strong>few charts</strong> and a <strong>full</strong> view providing <strong>in-depth analysis</strong>.</p>

<p>The objective is to see how to use drill-down to meet both requirements “<em>at the same time</em>”.</p>

<p><br></p>

<h3 id="drill-down">Drill-down</h3>

<p>Look at the video <a href="https://drive.google.com/file/d/1xdYeuffdXDNRjzHDaKuK48QrMyaKyk1u/view?usp=share_link" target="_blank">Drilldown presentation</a>.</p>

<p><a href="https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8ea91b5a-1f48-458e-b209-185b2d30ea42/drill-down.mp4" target="_blank">drill-down.mp4</a></p>

<p>Go to the <strong>Drill-down</strong> page on <strong>YOUR</strong> Looker studio dashboard: <a href="https://lookerstudio.google.com/u/0/reporting/390dc9d2-31ea-43ef-bda4-dd320ef74539/page/p_do0877r8zc/edit" target="_blank">Drill-down, Breakdown &amp; Cross-Filtering</a>.</p>

<p>Answer the various questions on the page - you must complete the chart with the appropriate dimensions, metrics and breakdown dimensions.</p>

<p><br></p>

<ol>
<li>
<p>Display the sum of turnover and cost over time on a combo chart. Add a drill down to Quarter, Year, Month and date_date</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-1-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Use the date range and drill down to display the ad statistics per day from August 15 to 31.</p>

<p>What is the turnover and cost of ads on 20 and 21 August?</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-2-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-3-Untitled.png" alt=""></p>

</details>

<p>Reset the filters to default values using the <strong>reset arrow</strong> at the top right of the dashboard.</p>
</li>
<li>
<p>Display the turnover and ROAS by acquisition channel on a chart. Add a drill down on paid_source, channel_grouping, channel and campaign. Use paid_source as default drill-down level.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-4-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Using the filter and drill down, display the turnover and ROAS by channel for Criteo. Can you compare the ROAS of the Remarketing and Notoriety channel? Does it make sense to you?</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-5-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-6-Untitled.png" alt=""></p>

<p><em>Awareness/notoriety campaigns are not supposed to generate turnover directly. They are top funnel campaigns, too far away from transactions. On the contrary, remarketing campaigns are performance campaigns. They are supposed to generate turnover and therefore have a higher ROAS.</em>
<em>The results are logical.</em></p>
</details>
</li>
<li>
<p>Use filter and drill down to display the turnover and ROAS per campaign for Criteo on Remarketing channel. Compare the ROAS to lower funnel and mid funnel campaigns. Does it make sense to you?</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-7-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-8-Untitled.png" alt=""></p>

<p><em>Bottom funnel campaigns are closer to transactions than mid-funnel campaigns. The ROAS should be higher. This is logical. Furthermore, we can see that criteo_campaing on existing occasional customers has the highest ROAS. This makes sense: users who are already occasional customers are more likely to convert than new users.</em>
<em>The results are logical.</em></p>
</details>
</li>
<li>
<p>Add a stack chart displaying sum of cost broken down by channel over time. Add a drill down by Quarter, Month, date_date with a default value on the Quarter.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-9-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Add a table chart displaying turnover, cost and ROAS per acquisition channel. Add a drill-down on paid_source, channel_grouping, channel and campaign.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-10-Untitled.png" alt=""></p>

</details>
</li>
<li>
<p>Using the filter and drill-down, provide the best campaign ROAS for Adwords in the SEA non-branded channel_grouping.</p>

<details>
<summary>Solution 🔓</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/02-Looker-Studio2/03-Drill-Down-asset-11-Untitled.png" alt=""></p>

</details>
</li>
</ol>



</div>
</div>