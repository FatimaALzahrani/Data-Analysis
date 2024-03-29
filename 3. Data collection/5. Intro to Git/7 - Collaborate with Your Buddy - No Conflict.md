<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>Until now, you have been practicing Git on your own in a personal project. It’s time to see the full power of collaboration that Git offers!</p>

<p><strong>For this exercise, you will work entirely with your buddy, so make sure you’re both ready for the challenge! 🙂</strong></p>

<p><strong>SPOILER:</strong> This is still not the best way to collaborate, but we will work on best practices in the next exercise. Hold on, we are getting there! 🚀</p>

<p>For the purpose of this exercise, you should divide the roles of Teamplayer A and Teamplayer B between you and your buddy. You both are co-workers from the same data team in your company.</p>

<p>Our sales manager wants to have two views on the company’s sales:</p>

<p>A- A view of turnover and purchase cost on a daily basis (sounds familiar, no?).</p>

<p>B- An all time view of turnover and purchase cost split by <code>category_1</code>.</p>

<p>As a good team, let’s split the work!</p>

<ol>
<li>
<p>[Teamplayer A] In GitHub Desktop, create a new repository on your hard drive <code>gwz_sales_team_project</code>. No need to add a description but initialise it with a README file (it’s a good practice to have one with a description of your repo).</p>

<p><strong>Publish the repository, you can keep this code private</strong>.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-1-Screenshot_2023-09-21_at_17.55.42.png" alt=""></p>

</details>
</li>
<li>
<p>[Teamplayer A] Create a <code>develop</code> branch locally and push it.</p>

<p>The VS Code Git Graph should look like this:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-2-Screenshot_2023-09-21_at_18.00.24.png" alt=""></p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-3-Screenshot_2023-09-21_at_17.57.20.png" alt=""></p>

</details>
</li>
<li>
<p>[Teamplayer A] On github.com,&nbsp;make sure your default branch is&nbsp;<code>main</code>&nbsp;(or <code>master</code>) by going to the&nbsp;<strong>settings tab</strong>&nbsp;of the repository &gt;&nbsp;<strong>Branches</strong>&nbsp;and&nbsp;<strong>Change the default branch.</strong></p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-4-Screenshot_2023-09-21_at_18.02.05.png" alt=""></p>

<p><strong>Note in this solution, Teamplayer A is using “main” and not “master” by default branch name.</strong></p>
</details>
</li>
<li>
<p>[Teamplayer A] On github.com, <strong>invite Teamplayer B to collaborate</strong>. To do that, go to the settings of the repository. On the left side, <strong>click on Collaborators and on the “Add people” button</strong>.</p>

<p><strong>Search for Teamplayer B using their email or GitHub nickname</strong>.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-5-Screenshot_2023-09-21_at_18.05.52.png" alt=""></p>

</details>
</li>
<li>
<p>[Teamplayer B] <strong>Accept the invitation</strong> you received by email! Check your inbox and, if needed, your spam 🙂</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-6-Screenshot_2023-09-21_at_18.10.02.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-7-Screenshot_2023-09-21_at_18.11.13.png" alt=""></p>

<p>Teamplayer B can now access to the repository:
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-8-Screenshot_2023-09-21_at_18.12.05.png" alt=""></p>

</details>
</li>
<li>
<p>[Teamplayer B] On github.com,&nbsp;<strong>click on the green “Code” button and “Open with Github Desktop”.</strong>&nbsp;It will clone (= make a copy of) the code on your local machine.</p>

<details>
<summary>Where to save your code best?</summary>

<p>Remember we said it is better not to save your repo’s in your Documents folder? But where do you save this one then?</p>

<p>Well, your own repos were saved under home_folder &gt; code &gt; your_github_username.</p>

<p>This repo is from another GitHub user, so we will save it under home_folder &gt; code &gt; TeamplayerA_github_username.
This way, we store every repo in a folder named after the owner’s GitHub username. This ensures each folder is unique.</p>
</details>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-9-Screenshot_2023-09-21_at_18.12.59.png" alt=""></p>

</details>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-10-Screenshot_2023-09-21_at_18.14.22.png" alt=""></p>
</li>
<li>
<p>[Teamplayer B]&nbsp;<strong>On Github desktop,</strong>&nbsp;<strong>click on the blue “Clone” button:</strong></p>

<p><strong>On VS code git graph, Teamplayer B, should see:</strong></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-11-Screenshot_2023-09-21_at_18.19.43.png" alt=""></p>

<p>If you have this error:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-12-Untitled.png" alt=""></p>

<p>Try to update VS code and quit. Reopen and the issue should be solved!</p>
</li>
<li>
<p>According to the VS Code Git Graph, which branch doesn’t exist yet on your local machine? Why?</p>

<details>
<summary>Solution</summary>

<p>The <code>develop</code> branch doesn’t exist locally because Teamplayer A created it! We only have the remote version <code>origin/develop</code>.
Note that the branch <code>main</code> has been created for you as it is the default branch.</p>

</details>
</li>
<li>
<p>[TeamPlayer B] On GitHub Desktop,&nbsp;<strong>open the list of branches, and click on</strong> <code>origin/develop</code>.&nbsp;This will create your local version of the develop branch.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-13-Screenshot_2023-09-21_at_18.22.08.png" alt=""></p>

</details>

<p><strong>On the VS code git graph, you should now see</strong>:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-14-Screenshot_2023-09-21_at_18.23.26.png" alt=""></p>
</li>
<li>
<p>Nice job! You both, <strong>Teamplayer A and B, should now have the same repository to work on</strong>.</p>

<p><u>**You will do the following steps separately on your own computer.**</u></p>
</li>
<li>
<p>[Teamplayer A] Create a new branch <code>sales_daily</code>  based on <code>develop</code>. <br>
[Teamplayer B] Create a new branch <code>sales_category</code>  based on <code>develop</code>.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-15-Screenshot_2023-09-26_at_16.21.18.png" alt=""></p>

</details>
</li>
<li>
<p>[Teamplayer A &amp; B] Create a new sql file in the repository for your respective feature. What could be a good name for your sql file? Write the code for your feature.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-16-Screenshot_2023-09-26_at_16.27.59.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-17-Screenshot_2023-09-26_at_16.35.34.png" alt=""></p>

</details>
</li>
<li>
<p>[Teamplayer A &amp; B] On the Github desktop, <strong>commit your changes by using a clear and descriptive message</strong> like “Created sales daily / category view”.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-18-Screenshot_2023-09-26_at_16.29.54.png" alt=""></p>

</details>
</li>
<li>
<p>[Teamplayer A &amp; B]&nbsp;<strong>Push your branch</strong></p>
</li>
<li>
<p>[Teamplayer A &amp; B] From the Github Desktop,&nbsp;<strong>press the “Fetch origin” button</strong>&nbsp;to pull updates from remote.</p>

<p>[Teamplayer B] should see the following on the VS code git graph:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-19-Screenshot_2023-09-26_at_16.44.57.png" alt=""></p>

<p>[Teamplayer A] should see this on the VS code git graph:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-20-Screenshot_2023-09-26_at_16.42.14.png" alt=""></p>

<p>Each of you sees the other’s <strong>remote branch</strong> <code>origin/sales_[view]</code> now.</p>
</li>
<li>
<p>[Teamplayer A] From the Github Desktop or github.com, <strong>make a new Pull request</strong>. <br>
We want to merge <code>sales_daily</code><strong>in “develop”</strong>. Don’t merge it immediately! Teamplayer B will review the changes and will merge it!</p>

<blockquote>
<p>💡 Don’t forget to change the base to <code>develop</code>, we don’t make pull requests directly on <code>master</code>. We first do it on <code>develop</code> and then we will merge <code>develop</code> into <code>master</code>.</p>
</blockquote>
</li>
<li>
<p>[Teamplayer B] Go to the project’s repository on&nbsp;<a href="http://github.com/" target="_blank">🔗 github.com</a>&nbsp;and&nbsp;open the pull request for the&nbsp;<code>sales_daily</code> branch. Verify that&nbsp;the sql&nbsp;file has been added, then&nbsp;<strong>merge the pull request</strong>.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-21-Screenshot_2023-09-26_at_16.51.25.png" alt=""></p>

</details>
</li>
<li>
<p>[Teamplayer A &amp; B] <strong>Go to Github Desktop and Fetch origin, then go to VS Code Git Graph.</strong></p>

<p>You should see that the <code>sales_daily</code> branch has been correctly merged and that develop is now ahead of the <code>sales_category</code> branch which doesn’t yet include sql file with daily sales.</p>

<p>Teamplayer B should see the following git graph (the order in which you see the <code>sales_category</code> and <code>sales_daily</code> branches could be reversed depending on the time of the respective commits):</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-22-Screenshot_2023-09-26_at_16.56.17.png" alt=""></p>
</li>
<li>
<p>[Teamplayer B] Go to <a href="http://github.com/" target="_blank">github.com</a> and make a new pull request.</p>

<p>You want to merge <code>sales_category</code> into <code>develop</code>. Don’t merge it immediately! Teamplayer A will review the changes and will merge it!</p>
</li>
<li>
<p>[Teamplayer A] Compare the changes and merge the pull request.</p>
</li>
<li>
<p>[Teamplayer A &amp; B] Go to Github Desktop and Fetch origin, switch to the <code>develop</code> branch, and have a look at the VS Code Git Graph. You should have the following:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/07-Collaborate-With-Your-Buddy-No-Conflict-asset-23-Screenshot_2023-09-26_at_17.03.05.png" alt=""></p>
</li>
<li>
<p>[Teamplayer A &amp; B] Finally, it’s time to <strong>cleanup our branches</strong>: you can both delete your local feature branch. Your feature is ready and has been integrated into the develop branch. So now you can safely delete the branch. For our next feature we will create a new branch.</p>

<p><strong>Congratulations, you have collaborated on a team project!</strong> 🥳</p>

<p>But we still didn’t do it quite right - what if you were both working on the same file, and Teamplayer B made changes that conflicted with Teamplayer A’s file?</p>

<p>A better way to do this would have been to merge the <code>development</code> branch into Teamplayer B’s branch before making the pull request. This time, we were fortunate to not have any conflicts.</p>

<p><strong>Let’s illustrate this point in the next exercise.</strong></p>
</li>
</ol>

<a href="https://github.com/FatimaALzahrani/gwz_sales_team_project">My solution</a>

</div>
</div>