<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>News API is a service that provides last news from API calls.</p>

<p>We will see how to authenticate directly with query parameters.</p>

<ol>
<li>
<p>Let’s consider this url: <code>https://newsapi.org/v2/everything?q=tesla&amp;sortBy=publishedAt&amp;apiKey=API_KEY</code></p>

<ul>
<li>What are the scheme, the host, the path and the query parameters?</li>
</ul>
</li>
<li>
<p>Use Insomnia and perform a GET request on this same url.</p>

<ul>
<li>What status code do you get? Can you understand the error from the content returned?</li>
</ul>
</li>
<li>
<p>The service needs us to be authenticated. Why?</p>

<details>
<summary>Hint</summary>

<p>See the pricing options.</p>
</details>
</li>
<li>Create an account and get your API key.
<ul>
<li>Replace the query parameter value <code>API_KEY</code> with the one created and execute the query.</li>
<li>What is the status code? Can you read some articles?</li>
</ul>

<details>
<summary>Troubleshoot</summary>

<p>If you are unable to create your own API key, please try using this one in your request: <strong>a4866862e4d14736bff43c7ff3a8e8ee</strong></p>
</details>
</li>
<li>
<p>Let’s say that we only want the results with French headtitles. How do we do this?</p>

<details>
<summary>Hint</summary>

<p>Study the documentation to find out: <a href="https://newsapi.org/docs/endpoints/everything" target="_blank">https://newsapi.org/docs/endpoints/everything</a></p>
</details>
</li>
<li>Looking at the documentation, are all results returned?
<ul>
<li>Which query parameter allows you to define the number of results? The page you want?</li>
</ul>
</li>
</ol>



</div>
</div>