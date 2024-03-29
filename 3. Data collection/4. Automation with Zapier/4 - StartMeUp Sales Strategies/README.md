<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>StartMeUp wants to treat its incoming leads differently based on their qualification and attributes.</p>

<p>Your colleague from the Sales team manually fills in a Google Sheet every day, after finishing the product demo. He notes down the email address of the prospect who attended the demo in column A.</p>

<ol>
<li>
<p>Create a copy of <a href="https://docs.google.com/spreadsheets/d/1HZVKxiA2hHILkkgOO7E84JBvIcyk7Qi1hOOC24CtiP8/edit?usp=sharing" target="_blank">this file</a> in your drive so that you can access it for the rest of the exercise.</p>

<p>This is how the marketing team would like to divide their leads for each new lead that attended a demo.</p>

<ul>
<li>
<p>Path A: The lead is a highly qualified lead (Score above 90).</p>
</li>
<li>
<p>Path B: The lead is moderately qualified (Score between 50 and 90).</p>
</li>
<li>
<p>Path C: The lead is very poorly qualified (Score below 50).</p>
</li>
</ul>
</li>
<li>
<p>Translate this into a Zap, starting with a Trigger involving the Google Sheet application, giving the lead a score and then creating three different Paths based on the conditions outlined above.</p>

<p>💁🏽 <em><strong>Notes:</strong></em></p>

<ul>
<li>
<p><em>To score the leads, use a “Tool By Zapier” (We’ll let you guess which one!)</em></p>
</li>
<li>
<p><em>Do not hesitate to test the 3 Paths at the end of each configuration to make sure that everything works correctly.</em></p>
</li>
</ul>
</li>
<li>
<p>Think, without building Zaps, about relevant marketing actions for each group of leads.</p>

<p>👉🏽 These marketing actions should be technically feasible from Zapier (using external tools or “Tools by Zapier” or natively integrated applications). Check with your buddy, what did you come up with?</p>
</li>
<li>
<p>Now let’s build Path A in a concrete way by taking up the Zap.</p>

<p>This is what the marketing team wants to achieve:</p>

<p>👉🏽 For highly qualified leads, push them into a <strong>LemList campaign.</strong> The body of the email should use the name of the prospect’s company as well as the industry (2 personalization parameters making the email more “customised”).</p>

<p>The idea of the mail is the following:</p>

<p><em>“Hello</em> <code>{{firstName}}</code><em>,</em></p>

<p><em>You work in the</em> <code>{{Industry}}</code><em>sector. Do you know that StartMeUp is a recruitment software specialised for this sector? You might be interested in our solution at</em> <code>{{CompanyName}}</code><em>“</em></p>

<p>👉🏽 Create a free account on LemList with your gmail account and create the campaign.</p>

<p>💁🏽 <strong>Notes</strong>:</p>

<ul>
<li>
<p>You can <a href="https://www.youtube.com/watch?v=pcdQJa_ltXw&amp;t=401s" target="_blank">watch this video</a> to learn how to use the product.    We won’t upload any lead by hand, we will connect Zapier to LemList in your workflow.</p>
</li>
<li>
<p>The <code>{{Industry}}</code> variable cannot be found in the variables provided by LemList. You can simply create it from the body of the email itself.</p>
</li>
</ul>
</li>
<li>
<p>Add a Zapier step pushing the lead into the campaign. Check that everything has worked properly!</p>
</li>
</ol>



</div>
</div>