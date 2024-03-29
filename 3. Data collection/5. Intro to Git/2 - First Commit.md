<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>In this challenge, you will create your first commit. Happy branching! 🎋</p>

<p>We will be using the <a href="https://console.cloud.google.com/bigquery?project=data-analytics-bootcamp-363212&amp;ws=!1m5!1m4!4m3!1sdata-analytics-bootcamp-363212!2scourse14!3sgwz_sales" target="_blank">🔗gwz_sales</a> table in this challenge (and in the next ones) to demonstrate the use of Git with SQL queries. Your mission is to write the queries to be able to create a dashboard for the sales manager. This time, you won’t save different versions of your work in BigQuery, but you will use the power of Git to track your changes!</p>

<ol>
<li>
<p>Open GitHub Desktop and create a new repository on your hard drive by <a href="https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/overview/creating-your-first-repository-using-github-desktop#creating-a-new-repository" target="_blank">following the instructions here</a>.</p>

<p>You will use <strong>“</strong><code>gwz_sales</code><strong>” as the name of your repository, “GreenWeez sales data” as the description and initialise it with a readme file</strong>. A readme file is a markdown file (= formatted text) that provides information about the current repository and the code it contains.</p>

<p>We won’t use any <code>License</code> or <code>.gitignore</code> file.</p>

<p>Local Path: By default, GitHub Desktop creates the repo in your Documents folder. That will work, but it is better to create the repo outside of it. At Le Wagon, we do this in the following folder:</p>
<ul>
<li>On 🍏 macOS: <code>/home/&lt;username&gt;/code/&lt;githubusername&gt;/&lt;repo_name&gt;/</code></li>
<li>On 🪟 Windows: <code>c:\user\&lt;username&gt;\code\&lt;githubusername&gt;\&lt;repo_name&gt;\</code></li>
</ul>

<details>
<summary>Why outside your Documents folder?</summary>

<p>Many users have their Documents folder synced using a cloud service provider (iCloud, OneDrive, DropBox, …). Git will create many small files to do its magic. If you create the repo within your Documents folder, all of these files will be synced with your cloud service provider, and will slow it down. You might also get conflicts between the two.</p>
</details>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/02-First-Commit-asset-1-Screenshot_2023-09-21_at_15.29.29.png" alt=""></p>
</li>
<li>
<p>In the path you chose, you should now see a <code>gwz_sales</code> folder with a <code>README.md</code> file in it.</p>

<p>Open the folder with VS Code, using one of these two methods:<br>
a- In GitHub Desktop click on the “Open in VS Code” button<br>
b- Open VS code &gt; File &gt; Open Folder &gt; Browse to the location of your repo</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/02-First-Commit-asset-2-Screenshot_2023-09-21_at_15.34.59.png" alt=""></p>

<p>You should see:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/02-First-Commit-asset-3-Screenshot_2023-09-21_at_15.36.38.png" alt=""></p>
</li>
<li>
<p>Go to GitHub Desktop and the History tab. You should see a first commit (snapshot of your project) called “Initial commit” with both the <code>README.md</code> and the <code>.gitattributes</code> files added.</p>

<blockquote>
<p>💡 Note that your current branch is either <code>master</code> or <code>main</code> depending on your default GitHub setup. If you have just signed up, your main/default branch will be <code>main</code> and not <code>master</code>. If you have** <code>master</code>, you can consider it to be the same as <code>main</code>.</p>
</blockquote>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/02-First-Commit-asset-4-Screenshot_2023-09-21_at_15.39.45.png" alt=""></p>
</li>
<li>
<p>In VS Code, create a new file called <code>gwz_sales.sql</code>. Write a query to obtain the daily turnover. (You can test out your query on BigQuery to see if it works.)</p>

<details>
<summary>Query solution</summary>

<div class="language-sql highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="k">SELECT</span>
<span class="n">date_date</span>
<span class="p">,</span> <span class="k">SUM</span><span class="p">(</span><span class="n">turnover</span><span class="p">)</span> <span class="k">AS</span> <span class="n">turnover</span>
<span class="k">FROM</span> <span class="nv">`data-analytics-bootcamp-363212.course14.gwz_sales`</span>
<span class="k">GROUP</span> <span class="k">BY</span> <span class="n">date_date</span>
<span class="k">ORDER</span> <span class="k">BY</span> <span class="n">date_date</span>
</code></pre></div>      </div>
</details>

<p><strong>Save and go back to GitHub Desktop</strong> and the Changes tab. What do you see?</p>

<details>
<summary>Solution</summary>

<p>GitHub Desktop (or rather the git technology working behind the scenes) has detected a new file after the initial commit. Git tracks every changes you make!</p>
</details>
</li>
<li>
<p>In GitHub Desktop, save your changes by creating a new <code>commit</code>. We will use “Daily turnover” as the commit message and click on the “Commit to <strong>main</strong> (or master)” button.</p>

<details>
<summary>Solution</summary>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/02-First-Commit-asset-5-Screenshot_2023-10-02_at_17.24.28.png" alt=""></p>

</details>

<p>🎉&nbsp;Congratulations, you have now created your first commit!</p>
</li>
<li>
<p>Stay in GitHub Desktop and go to the <code>History</code> tab. You should be able to see your new commit at the top of the left sidebar.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/05-Intro-To-Git-And-Versioning/02-First-Commit-asset-6-Screenshot_2023-09-21_at_15.48.39.png" alt=""></p>

<p>Note that you can click on the “Initial commit” and see only changes saved at that time. Each commit creates a new snapshot of your project when you are doing it.</p>
</li>
</ol>



</div>
</div>