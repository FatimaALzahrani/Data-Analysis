<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>Git is a very powerful tool but it can be hard to use it.</p>

<p>A very good way to avoid getting lost is to use a tool to <strong>visualise all commits and branches created for the project</strong>.</p>

<p>We will use the <strong>VS Code extension “Git Graph”</strong> for this bootcamp.</p>

<ol>
<li>
<p>Go <a href="https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph" target="_blank">to this website</a> and install Git Graph in your VS code.</p>
</li>
<li>
<p>In VS code, click on the <strong>source control sign</strong> in the left side bar and download Git if it’s not yet installed. (A link will guide you to the official page to download it).</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/03-Local-Versus-Remote-asset-1-Untitled.png" alt=""></p>
</li>
<li>
<p>Relaunch VS code and go in your <code>gwz_sales</code> folder and <strong>click on Git Graph</strong> at the bottom of your screen.</p>

<p><em>Note:</em> The first part of the status bar at the bottom of the screen gives you the branch name you are using. When you create a new repository tracked by Git, it always shows the default <code>main / master</code> branch.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/03-Local-Versus-Remote-asset-2-Screenshot_2023-09-21_at_15.53.55.png" alt=""></p>
</li>
<li>
<p>How many commits do you see? Why? Which commit are you on?</p>

<details>
<summary>Solution</summary>

<p>There are two commits. The initial and the first commit we made. We are at the very last commit (snapshot) because you can see a highlighted box like this one next to the commit message:
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/03-Local-Versus-Remote-asset-3-Screenshot_2023-09-21_at_15.56.49.png" alt=""></p>

<p>We are on the main (or master) branch by default.</p>
</details>
</li>
<li>
<p>Based on your understanding, if your computer stops working, do you think you will lose your project?</p>

<details>
<summary>Solution</summary>

<p>Yes indeed! For now, we have only made changes locally. Everything is stored on the computer. If the computer is broken, you have lost your work! Sad, isn’t it?</p>
</details>
</li>
<li>
<p>How do you suggest we solve this problem?</p>

<details>
<summary>Solution</summary>

<p>We need to push our work on the remote (on github.com). Git is tracking changes locally but pushing on the remote is useful to save your work and collaborate with others!</p>
</details>
</li>
<li>
<p>Go back to Github Desktop and click on <strong>“Publish repository” button</strong>.</p>

<p><strong>Keep the same Name and Description. Be sure to check “Keep this code private”, otherwise everybody on the internet will able to see your code.</strong></p>

<p>Press <strong>“Publish Repository” button</strong>.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/03-Local-Versus-Remote-asset-4-Screenshot_2023-09-21_at_15.58.54.png" alt=""></p>
</li>
<li>
<p>Go back to VS code, look at the git graph. What is different ? Can you understand why ? (be sure that “Show Remote Branches” is selected)</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/03-Local-Versus-Remote-asset-5-Screenshot_2023-09-21_at_16.00.44.png" alt=""></p>

<p>Next to the branch main (or master), we can see the word “origin”. It means that the branch main exists remotely and contains the same code as your branch main locally. Your code has been pushed on <a href="http://github.com/" target="_blank">github.com</a>!</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/03-Local-Versus-Remote-asset-6-Screenshot_2023-09-21_at_16.01.01.png" alt=""></p>

<p>It indicates the code you get when you pull the code from the remote by default. It’s a bit too technical for this introduction course. You should not pay attention to it anymore.</p>
</details>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/03-Local-Versus-Remote-asset-7-Screenshot_2023-09-21_at_16.02.04.png" alt=""></p>
</li>
<li>
<p>Go to <a href="http://github.com/" target="_blank">github.com</a> on your newly created repository. You should see your code online :)</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/03-Local-Versus-Remote-asset-8-Screenshot_2023-09-21_at_16.04.08.png" alt=""></p>

<p>If your computer is out, you can fix it and pull your code from GitHub, you won’t lose your code anymore!</p>
</li>
</ol>

<a href="https://github.com/FatimaALzahrani/gwz_sales">my solution </a>

</div>
</div>