<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>Now that we learned about developing new code on a separate branch, it’s time to learn how to integrate our feature in the common code in <code>main (or master)</code>.</p>

<p>To do this, you will need to create a pull request to merge your feature branch <code>add_purchase_cost</code> into the <code>main</code> branch.</p>

<ol>
<li>
<p>Go to <a href="http://github.com/" target="_blank">github.com</a> on your repository <code>gwz_sales</code></p>
</li>
<li>
<p>Go to the Pull Requests tab and <strong>click on the “New pull request” button.</strong></p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/05-First-Pull-Request-asset-1-Screenshot_2023-09-21_at_16.21.22.png" alt=""></p>

</details>
</li>
<li>
<p>In the section on “Comparison of changes”, choose the&nbsp;<code>main (or master)</code>&nbsp;base (the branch you want to update with the new code) and&nbsp;<code>add_purchase_cost</code>&nbsp;as a comparison. We want to merge&nbsp;<code>add_purchase_cost</code>&nbsp;into&nbsp;<code>main (or master)</code>. Click on the “create pull request” button.</p>

<p>Choose a title for your pull request. You can let the last commit message be the default and click on the “Create pull request” button.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/05-First-Pull-Request-asset-2-Screenshot_2023-09-21_at_16.22.48.png" alt=""></p>

<p>Choose a title for you pull request. You can let the last commit message by default and click on create pull request button.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/05-First-Pull-Request-asset-3-Screenshot_2023-09-21_at_16.23.38.png" alt=""></p>

</details>
</li>
<li>
<p>You should get a similar screen:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/05-First-Pull-Request-asset-4-Screenshot_2023-09-21_at_16.24.26.png" alt=""></p>

<p>Click on <strong>“Merge pull request”</strong>. Our changes in the <code>add_purchase_cost</code> branch are now integrated into <code>main</code> in the remote repository (the repository on GitHub).</p>
</li>
<li>
<p>Just as we had to push our local code to update the remote code, now we have to pull the remote code to update the code in our local <code>main</code> branch.</p>

<p>Take a few minutes to make sure you understand. Discuss with your buddy.</p>

<p>Go back to the Github Desktop, and <strong>click on the “Fetch origin” button</strong>.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/05-First-Pull-Request-asset-5-Screenshot_2023-09-21_at_16.26.34.png" alt=""></p>

</details>
</li>
<li>
<p>Go to VS Code Git Graph and describe what you see.</p>

<details>
<summary>Solution</summary>

<p>We can see that <code>add_purchase_cost</code> has been merged into the <code>main</code> branch. The local and the remote <code>main</code> branches are up to date.
See how nicely Git Graph renders branches and merge operations. You can easily visualise the whole history.</p>
</details>
</li>
<li>
<p>Go to Github Desktop and delete your <code>add_purchase_cost</code> branch. Your work won’t be lost because it has been integrated into the <code>main</code> branch after the merge.</p>

<p>To delete a branch, right click on the branch you want to delete and click on Delete…</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/05-First-Pull-Request-asset-6-Screenshot_2023-09-21_at_16.29.46.png" alt=""></p>

</details>

<p>Confirm the deletion but don’t delete this branch on the remote (for pedagogical reason, you will be able to see all branches you created today).</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/05-First-Pull-Request-asset-7-Screenshot_2023-09-21_at_16.30.41.png" alt=""></p>

</details>

<p>Check the lineage</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/05-First-Pull-Request-asset-8-Screenshot_2023-09-21_at_16.31.48.png" alt=""></p>

<p><code>add_purchase_cost</code> branch only exists on the remote that’s why we only see <code>**origin**</code><code>/add_purchase_cost</code>.</p>
</details>
</li>
</ol>



</div>
</div>