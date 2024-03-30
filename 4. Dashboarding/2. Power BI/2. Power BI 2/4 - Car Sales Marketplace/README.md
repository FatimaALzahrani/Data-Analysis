<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>Download solution <a href="https://drive.google.com/file/d/1hnF2f0FJ3wYE5ZNWZTHK2FfgFLKe8BUR/view?usp=drive_link" target="_blank">here</a></p>

<hr>

<h3 id="relevant-links-for-this-challenge">Relevant links for this challenge</h3>

<p><a href="https://drive.google.com/file/d/1jjuwFewQ1Quv0o_slyjy2FZQX5a3vWJu/view?usp=drive_link" target="_blank">CarSales_Adv_DAX.pbix</a></p>

<p>Data sources:</p>

<p><a href="https://docs.google.com/spreadsheets/d/1qXOQh60XDznbWgO7aM9-7KtndjEd6zTe/edit?usp=drive_link&amp;ouid=106373757090288630688&amp;rtpof=true&amp;sd=true" target="_blank">car_sales.xlsx</a></p>

<p>In this challenge we will dive deeper into DAX and learn about <strong>Variables,</strong> and review<strong>Calculate, All</strong> and other functions.</p>

<h3 id="files-to-download">Files to download</h3>

<ol>
<li>
<p>Please download the .pbix &amp; .xlsx files containing sales of a second-hand car marketplace</p>
</li>
<li>
<p>Open the file in Google Sheets, Excel or PowerBI and describe the key columns contained in the file</p>

<details>
<summary>Solution</summary>

<p>The tables have various information related to the car listing description that includes:</p>

<ul>
<li>Body, brand, engine type, engine V, mileage, model, price, registration</li>
</ul>

<p>Additionally it has:</p>

<ul>
<li>ListingDate:  Date in which it was listed in the marketplace</li>
<li>SoldDate: Date in which it was sold. Note its empty when the car has NOT yet been sold</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/625908agslexybmg33e8aev71lgs" alt=""></p>
</details>

<p><br></p>

<h3 id="building-some-measures-with-dax">Building some measures with DAX</h3>
</li>
<li>
<p>As the business unit manager we would like to calculate:</p>

<p>a- GMV (Gross Merchandise Value) per month:</p>

<blockquote>
<p>💡 GMV or Gross Merchandise Value is the SUM of all merchandise value sold through customer-to-customer (C2C)&nbsp;within our marketplace per month</p>
</blockquote>

<p><em>You objective is to get a matrix similar to this one 👇:</em></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/05-Car-Sales-Marketplace-asset-1-Untitled.png" alt=""></p>

<details>
<summary>Hint</summary>

<ul>
<li>Create a new measure <code>GMV</code>, and then use the measure in a Matrix Visual</li>
</ul>
</details>

<details>
<summary>Solution</summary>

<ul>
<li>Create a new measure “GMV”</li>
</ul>

<div class="language-html highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code>
GMV = SUM(CarSales[Price])
</code></pre></div>      </div>
<ul>
<li>Add a Matrix as a Visual and including the following rows and columns</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/05-Car-Sales-Marketplace-asset-2-Untitled.png" alt=""></p>

</details>

<p>b- YTD: Sum of all merchandise value sold through customer-to-customer (C2C)&nbsp;within our marketplace per month.</p>

<details>
<summary>Hint</summary>

<p>You can use the QuickMeasure option to calculate the <code>YTD</code>, or alternatively create the measure manually by clicking on NewMeasure and writing the formula</p>
</details>

<details>
<summary>Solution</summary>

<div class="language-html highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code> GMV YTD = TOTALYTD([GMV],Dates[Date].[Date])
</code></pre></div>      </div>
</details>

<p>c- GMV Share % by Brand</p>

<p>This can serve our Marketing team to focus in their initiatives</p>

<p><em>You objective is to get a matrix similar to this one: 👇</em></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/05-Car-Sales-Marketplace-asset-3-Untitled.png" alt=""></p>

<p>Steps:</p>

<ul>
<li>
<p>Create a New Measure named <code>GMV Brand Total</code>.</p>

<ul>
<li>Hint: This measure should show <code>GMV</code> total regardless of the <code>BRAND</code>. To achieve this we will use the CALCULATE and ALL function</li>
</ul>
</li>
<li>
<p>Create a New Measure named <code>GMV Share % by Brand</code> that divides : <code>GMV</code> / <code>GMV Brand Total</code>, while adding the Brand Filter as Column in the Matrix created</p>
</li>
</ul>

<details>
<summary>Solution</summary>

<ul>
<li>Create a New Measure named “GMV Brand Total”</li>
</ul>

<div class="language-html highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code> GMV Brand Total =
CALCULATE (
[GMV],
ALL(CarSales[Brand])
)
</code></pre></div>      </div>
<ul>
<li>Create a New Measure named “GMV Brand Marketshare %” that divides: GMV / GMV Brand Total”</li>
</ul>

<div class="language-html highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code> GMV Share % by Brand =
DIVIDE(
[GMV],
[GMV Brand Total]
)
</code></pre></div>      </div>

</details>

<p><br></p>
</li>
</ol>

<h3 id="dynamic-measures-and-variables">Dynamic Measures and Variables</h3>

<ol>
<li>
<p>Check which months are incomplete</p>

<details>
<summary>Hint</summary>

<p>The current incomplete month at the time of the dataset snapshot was June 2023.</p>
</details>

<details>
<summary>Solution</summary>

<p>The current incomplete month at the time of the dataset snapshot was June 2023.</p>
</details>
</li>
<li>
<p>Compare our <strong>Actual GMV vs our Forecasted GMV</strong> to check %Variation and take potential actions</p>

<p>Create GMV Forecast and GMV Forecast YTD Measures following b- &amp; c- steps above</p>

<details>
<summary>Solution</summary>

<p>Create this three different measures:</p>
<div class="language-html highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code> GMV Forecast = SUM(Fcast[GMV Monthly Forecast])

GMV Forecast YTD = TOTALYTD([GMV Forecast],Dates[Date].[Date])

GMV Var% vs Forecast = ([GMV YTD] / [GMV Forecast YTD])-1
</code></pre></div>      </div>

</details>

<p>a- What is the <code>GMV YTD</code> for the March 2023?</p>

<details>
<summary>Solution </summary>

<p>$ 5.1116.755</p>
</details>

<p>Let’s try to improve the <code>GMV YTD</code> behaviour for the incomplete months (ie. starting March 2023)</p>

<p>b- What if we would like to show the<em>**</em> <code>GMV</code> with this behaviour:</p>

<pre><code> - When the current month is still not completely over (eg. period starting in March 2023), we would like to add the `Forecasted GMV` for those incomplete months

- However, for periods where all months are complete, we will just add and show the `Actual GMV`
</code></pre>

<details>
<summary>Solution</summary>

<div class="language-html highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code> Dynamic GMV YTD = 
VAR
LastSalesDate = LASTDATE ('CarSales'[SoldDate])
VAR
LastDayOfMonthDate = LASTDATE ('Date'[Date])
RETURN

IF(LastSalesDate <span class="nt">&lt;&gt;</span> LastDayOfMonth,
[GMV Forecast YTD], 
[GMV YTD]
)
</code></pre></div>      </div>
</details>

<p>Let’s create a Dynamic Measure (by using variables) that will enable us to achieve this</p>

<blockquote>
<p>💡 What do we mean with DYNAMIC measure? It’s a measure that will show either one or another value depending on certain condition and behaviour we desire to see in how data is shown</p>
</blockquote>

<p>🎉&nbsp;<em><strong>Congrats!</strong></em> Now we do have a dynamic GMV YTD that shows Actuals for past months, but uses Forecast</p>

<p>### (Optional) Solving for edge cases</p>
</li>
<li>
<p>The last <code>Dynamic GMV YTD</code> still does not cover any specific case in which there are no cars sold on the last day of month (eg. might be the last day of the month falls in a weekend and salespeople do not work at that time). Can you think of how we could simply adjust the code to cover this special case?</p>
</li>
</ol>


</div>
</div>