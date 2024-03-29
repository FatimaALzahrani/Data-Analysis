<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>In the previous exercise, you have created a feature branch and merged it into the <code>main</code> branch.</p>

<p>This is not really the best practice. It is better to create a <code>develop</code> branch and <code>merge</code> every feature branch into it.</p>

<p>Once the cycle of development is over, we will then finally merge <code>develop</code> into <code>main</code>.</p>

<p>Let’s bring this into practice.</p>

<p>Our sales manager was very happy with the result of our work, but he’s a bit confused by all the decimals he sees in <code>turnover</code> and <code>purchase_cost</code>. Can we round that to 2 decimals? That would be great!</p>

<ol>
<li>
<p>On the Github Desktop, create a new branch called “develop” and push it to “origin”.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-1-Screenshot_2023-09-21_at_16.35.09.png" alt=""></p>

</details>
</li>
<li>
<p>Create another branch called <code>rounding_results</code>. You can base it on <code>develop</code> or&nbsp;<code>main</code>, for now the result will be the same because right now both correspond to the same code.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-2-Screenshot_2023-09-21_at_16.36.54.png" alt=""></p>

</details>
</li>
<li>
<p>Go to VS Code, modify the sql file to round the numbers. Save.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-3-Screenshot_2023-09-21_at_16.38.16.png" alt=""></p>

</details>
</li>
<li>
<p>Commit the change on the Github Desktop. Use a commit message that conveys the scope of your change so you get used to the right practice.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-4-Screenshot_2023-09-21_at_16.39.17.png" alt=""></p>

</details>
</li>
<li>
<p>Push to <code>origin</code> and check on&nbsp;<a href="http://github.com/" target="_blank">🔗 github.com</a>. What does your Git Graph in VS Code show?</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-5-Screenshot_2023-09-21_at_16.42.12.png" alt=""></p>

<p><a href="http://github.com/" target="_blank">github.com</a>:
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-6-Screenshot_2023-09-21_at_16.43.31.png" alt=""></p>

</details>
</li>
<li>
<p>We now want to merge the <code>rounding_results</code> branch into <code>develop</code>. Make a pull request and merge it.</p>

<p>Note -&nbsp;Be careful to select the right base branch…</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-7-Screenshot_2023-09-21_at_16.46.30.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-8-Screenshot_2023-09-21_at_16.47.17.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-9-Screenshot_2023-09-21_at_16.47.57.png" alt=""></p>

</details>
</li>
<li>
<p>Does your local branch <code>develop</code> contain the updated code? Why?</p>

<details>
<summary>Solution</summary>

<p>No the sql file of the local branch develop doesn’t include the rounding. This is because we didn’t pull anything from remote. For now, locally, the <code>rounding_results</code> branch has not been merged into <code>develop</code>.</p>
</details>
</li>
<li>
<p>In Github Desktop,&nbsp;<strong>click on the “Fetch origin” button to locally update the remote branches</strong>.</p>

<p>Go to the VS Code Git Graph. Where can you find your local branch <code>develop</code> compared to the remote branch <code>develop</code>?&nbsp;<strong>Why is that?</strong> Discuss it with your buddy. Make sure you understand this, because it is the source of many Git problems.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-10-Screenshot_2023-09-21_at_16.50.17.png" alt=""></p>

<p>The local branch <code>develop</code> is behind the remote branch <code>origin/develop</code>.
It’s because locally the merge has not been done yet. To do so, we need to pull origin first in Github Desktop.</p>

</details>
</li>
<li>
<p>Go to Github Desktop and <strong>click on the “Pull origin” button</strong>. Go back to VS Code Git Graph. You should now see that <code>develop</code> and <code>origin/develop</code> are at the same level, both showing the rounding code.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-11-Screenshot_2023-09-21_at_16.52.06.png" alt=""></p>

</details>
</li>
<li>
<p>In Github Desktop, delete the <code>rounding_results</code> branch locally. Why can you delete it?</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-12-Screenshot_2023-09-21_at_16.53.33.png" alt=""></p>

</details>

<p>Our sales manager just sent us an email saying that while we are working on the rounding, that it would be nice to see the most recent dates first. <br>
(Thinking of it, we should probably have spent a bit more time on an interview to determine the sales manager’s needs. That would have made our life a bit easier, no?)</p>
</li>
<li>
<p>Create a new branch <code>sort_dates</code> based on develop and repeat steps 2-10 to implement this new feature.</p>

<details>
<summary>Hint</summary>

<p>Create a pull request on “develop” and not <code>master</code></p>
</details>

<p>You should get a git graph like this one on the VS code:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-13-Screenshot_2023-09-21_at_17.01.49.png" alt=""></p>

<details>
<summary>Solution</summary>

<ul>
<li>In GitHub Desktop, create <code>sort_dates</code> branch</li>
<li>Modify the sql file by adding <code>DESC</code> to the <code>ORDER BY</code> clause.</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-14-Screenshot_2023-09-21_at_16.56.22.png" alt=""></p>

<ul>
<li>Commit changes</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-15-Screenshot_2023-09-21_at_16.57.22.png" alt=""></p>

<ul>
<li>Publish branch to origin</li>
<li>
<p>Create pull request on develop
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-16-Screenshot_2023-09-21_at_16.58.54.png" alt=""></p>
</li>
<li>Merge pull request</li>
<li>From Github Desktop, Fetch and Pull origin</li>
<li>Delete <code>sort_dates</code> locally</li>
<li>Go to VS Code Git Graph and verify</li>
</ul>
</details>
</li>
<li>
<p>We merged two feature branches into <code>develop</code>. We now want to merge <code>develop</code> into&nbsp;<code>main</code>, to deploy our code into production. Create a pull request. Have a look at all the changes this will make to main. Do you recognise these? Now merge the pull request.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-17-Screenshot_2023-09-21_at_17.10.52.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-18-Screenshot_2023-09-21_at_17.12.47.png" alt=""></p>

</details>
</li>
<li>
<p>[Advanced] Go to the VS Code Git Graph. Why are your local and remote <code>develop</code> branches behind the&nbsp;<code>main</code>&nbsp;branches? How can you bring <code>develop</code> to the same level as&nbsp;<code>main</code>&nbsp;after the merge? Try it out.</p>

<details>
<summary>Solution</summary>

<p>We just merged <code>develop</code> into <code>main</code>. <code>main</code> is then ahead of <code>develop</code>. To bring back develop at the same level as master, we need to merge <code>main</code> into <code>develop</code>.
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-19-Screenshot_2023-09-21_at_17.18.08.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-20-Screenshot_2023-09-21_at_17.18.30.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-21-Screenshot_2023-09-21_at_17.19.26.png" alt=""></p>

<p>After the final merge, you should get in your git graph a similar graph to this one:
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/06-Working-With-Branches-asset-22-Screenshot_2023-09-21_at_17.19.57.png" alt=""></p>

<p>Local and remote branches master and develop are at the top. We can iterate the process and launch a new cycle of features development!</p>
</details>
</li>
</ol>

<p>Congratulations! You now get all the basics of Git 🎉</p>

<p>Wherever you work, small or large companies, you will use the same processes.</p>


</div>
</div>