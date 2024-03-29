<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>Now, we want to practice by importing new Google spreadsheets.</p>

<ol>
<li>
<p>Import other sheets from your own Google Sheet <code>gwz_finance</code>:</p>

<ul>
<li>
<p><code>gwz_finance_orders</code></p>
</li>
<li>
<p><code>gwz_finance_ship</code></p>
</li>
<li>
<p><code>gwz_finance_refund</code></p>
</li>
</ul>

<p>💁🏽 Note: Destination schema is still <code>fvt_gsheet</code></p>
</li>
<li>
<p><a href="https://drive.google.com/drive/my-drive" target="_blank"></a> In your Drive, create a new folder called <code>gwz_finance</code> and move your Google Sheet <code>gwz_finance</code> in it.</p>

<p>Create new Google Drive connector using Magic Folder mode:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/03-Fivetran-Google-Sheet-asset-1-Untitled.png" alt=""></p>

<p><strong>Destination schema</strong>: “<code>fvt_drive</code>”</p>

<p>Why might this be dangerous in terms of price?</p>
</li>
<li>
<p>Modify impression to <code>9,000,000</code> on row  <code>2021-10-15</code> in <code>gwz_finance_campaign</code> sheet:</p>

<ul>
<li>
<p>start a sync on <code>gwz_finance_campaign</code> connector</p>
</li>
<li>
<p>start a sync on drive connector</p>
</li>
<li>
<p>Compare log file in Fivetran:</p>

<ul>
<li>
<p>how long did it take? 🕐</p>
</li>
<li>
<p>how many rows and tables have been modified? 👀</p>
</li>
</ul>
</li>
</ul>
</li>
<li>
<p><strong>Pause drive connectors</strong> on the top right of the User Interface ⚠️ <strong>to prevent unnecessary costs</strong> ⚠️</p>

<details>
<summary>Hint</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/02-Introduction-To-API-And-ELT-Fivetran/03-Fivetran-Google-Sheet-asset-2-Untitled.png" alt=""></p>
</details>
</li>
</ol>


</div>
</div>