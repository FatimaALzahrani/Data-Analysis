<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>To embark on the challenges presented in this new lecture, it’s imperative to grasp the fundamental concepts introduced in the exercises corresponding to the previous lecture.</p>

<p>The tasks in this lecture will build upon the exercises from the preceding one, introducing increased complexity and depth. It is strongly recommended to first complete challenges 1, 2, 3, 4, and 5 from the previous lecture with solutions.</p>

<p>Prioritize finishing the exercises from the preceding lecture to establish a solid foundation before tackling these new challenges.</p>

<p>It’s time to merge your work on the <code>main</code> branch and publish a production version of your dbt project.</p>

<h2 id="1---merge-to-main-branch">1 - Merge to Main Branch</h2>

<ol>
<li>
<p>Click on Create a Pull Request within dbt interface</p>

<p>This will take you to GitHub, where you can view the history of all your commits.</p>
</li>
<li>
<p>Create a Pull Request in GitHub interface. Verify there are no conflicts and that you will be able to merge the PR.</p>
</li>
<li>
<p>Comment your pull request and <strong>submit it</strong></p>

<p>You should <strong>never validate your own Pull Request.</strong></p>

<p>Each company typically has its own validation process in place. For example, you could request someone in the team to review and confirm your PR.</p>

<p>Since we are working individually on this exercise, you can <strong>confirm merge.</strong></p>

<p><em><strong>Note</strong></em>: We can decide to delete your branch or to keep working on it. In theory, you should do one branch by feature._</p>
</li>
</ol>

<h2 id="2---deploy-in-production">2 - Deploy in Production</h2>

<p>Now that your modifications are merged into the main branch, we will deploy them in production.</p>

<h3 id="create-a-production-environment">Create a production environment</h3>

<ol>
<li>
<p>Under the tab <code>Deploy</code> select <code>Environments</code></p>
</li>
<li>
<p>Create the <code>Production</code> environment and define it as the default branch for production.</p>

<p>Use <code>dbt_prod</code>  as the name for your production dataset</p>
</li>
</ol>

<h3 id="create-a-job">Create a Job</h3>

<ol>
<li>
<p>In the tab <code>Deploy</code> select <code>Jobs</code></p>
</li>
<li>
<p>Create a new Job, for which you use <code>build all</code> as the job name. Select the <code>production</code> environment.</p>

<p>Add <code>dbt build</code> as command</p>

<p>You can decide to run source freshness tests if you defined it before.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/02-Production-Version-asset-1-Capture_decran_2023-09-26_a_18.47.37.png" alt=""></p>

<p>You can decide to generate docs if you defined it before.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/07-DBT-Advanced/02-Production-Version-asset-2-Capture_decran_2023-09-27_a_10.16.24.png" alt=""></p>
</li>
<li>
<p>Save your job and execute it.</p>

<p>Wait for the job to be done.</p>
</li>
<li>
<p>Analyze the different pieces of information you can get access to once the job is run.</p>

<p>Congratulations, you ran your first job in production 🎊&nbsp;🎊&nbsp;🎊&nbsp;🎊&nbsp;🎊</p>
</li>
</ol>

<h3 id="documentation--data-source-tabs">Documentation &amp; Data Source Tabs</h3>

<p>You might have noticed that the documentation tab and the data source are still empty.</p>

<p>To activate them, you need to link them to your job.</p>

<ol>
<li>
<p>Go to the&nbsp;<strong>Account settings</strong>&nbsp;page.</p>

<ul>
<li>
<p>open your project</p>
</li>
<li>
<p>In the <code>Artifacts</code> section, select your job in Documentation and Source freshness job</p>
</li>
</ul>
</li>
</ol>

<h3 id="check-in-bigquery">Check in BigQuery</h3>

<ol>
<li>Verify in BigQuery that you get the different tables in the <code>prod</code> datasets.</li>
</ol>

<h2 id="3---schedule-table-update">3 - Schedule Table Update</h2>

<p>The finance team asked you to have fresh data each day at 8 a.m. so that they can run their dashboard.</p>

<p><em><strong>Note:</strong></em> Data are outdated so it makes no sense to update them each day but this is just for practice.</p>

<h2 id="scheduling-your-job-in-production-with-dbt-cloud">Scheduling your Job in Production with dbt Cloud</h2>

<ol>
<li>
<p>Edit your job to run it everyday at 8 a.m.</p>

<p>You can imagine having specific needs for updates for all tables.</p>

<p>Having jobs representing your needs will help you orchestrate the updates.</p>

<p><em><strong>Note:</strong></em> Remove your scheduling after so that you don’t run unnecessary work on BigQuery</p>
</li>
</ol>



</div>
</div>