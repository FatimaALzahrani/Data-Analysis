<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>Until now, we only had one branch, the <code>main (or master)</code> branch.</p>

<p>We were creating a new commit directly on the <code>main</code>.</p>

<p>This is actually not a good practice! The <code>main</code> branch should always have the version in production that is fully functional. If you push bad code to your <code>main</code> branch, it can break your application.</p>

<p>That’s why, when we want to modify code, we create new branches called “feature branches”.</p>

<p>We test our code and when we are “sure” that it works, we merge it back into the <code>main</code> branch.</p>

<p>The sales manager has told us he also wants to see the purchase costs. Let’s add it!</p>

<ol>
<li>
<p>Go to Github Desktop, create a new feature branch by clicking on the “Current branch” button. Set <code>add_purchase_cost</code> as name and click on the “New Branch” button.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/04-First-Feature-Branch-asset-1-Screenshot_2023-09-21_at_16.07.37.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/04-First-Feature-Branch-asset-2-Screenshot_2023-09-21_at_16.08.19.png" alt=""></p>

</details>
</li>
<li>
<p>Go to VS Code and modify your query to add the purchase cost. Save.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/04-First-Feature-Branch-asset-3-Screenshot_2023-09-21_at_16.09.50.png" alt=""></p>

</details>
</li>
<li>
<p>Go back to Github Desktop: you can see that Git has detected your change. Commit it.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/04-First-Feature-Branch-asset-4-Screenshot_2023-09-21_at_16.10.40.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/04-First-Feature-Branch-asset-5-Screenshot_2023-09-21_at_16.11.24.png" alt=""></p>

</details>
</li>
<li>
<p>Go back to the VS Code Git Graph, how many branches do you see now? <br>
Why is there no <code>origin</code> next to your feature branch <code>add_purchase_cost</code>?</p>

<p><em>Note:</em> make sure you have “Show Remote Branches” selected.</p>

<details>
<summary>Solution</summary>

<p>If we don’t take into account <code>origin/head</code>, we have 3 branches here:</p>
<ul>
<li><code>main</code> branch</li>
<li><code>origin/main</code>, the remote version of the local main branch</li>
<li><code>add_purchase_cost</code>
We don’t see <code>origin</code> next to the feature branch because there is no remote branch yet. We still have to push our feature branch to the remote (<code>origin</code>).</li>
</ul>
</details>
</li>
<li>
<p>Go back to Github Desktop and change the current branch to  <code>master / main</code>. Now, go back to VS code and have a look at the sql file. Can you see the line that added the purchase cost? Why is that?</p>

<details>
<summary>Solution</summary>

<p>You can’t see the line because you added it when you were on your feature branch.  We have not made any changes on <code>main</code> locally or remotely.</p>

<p>Take a few minutes to think about it, it’s hard to understand that you have a single file on your computer <code>gwz_sales.sql</code> but that its content changes depending on which branch you are on. This is what we call versioning. You have different versions of the same file.</p>

<p>🥷🏽 Fun fact: This is a good way to hide something in your computer. A non technical person won’t be able to switch branches to see your hidden content.</p>
</details>
</li>
<li>
<p>Go to Github Desktop and change your current branch to <code>add_purchase_cost</code>. Push your branch to the <code>remote</code>. Check in Git Graph that an <code>origin</code> appears next to your <code>add_purchase_cost</code>.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/04-First-Feature-Branch-asset-6-Screenshot_2023-09-21_at_16.15.46.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/04-First-Feature-Branch-asset-7-Screenshot_2023-09-21_at_16.17.23.png" alt=""></p>

</details>
</li>
<li>
<p>Go to <a href="http://github.com/" target="_blank">github.com</a> and check that your code is there.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/04-First-Feature-Branch-asset-8-Screenshot_2023-09-21_at_16.19.04.png" alt=""></p>

</details>
</li>
</ol>



</div>
</div>