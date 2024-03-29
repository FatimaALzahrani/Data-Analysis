<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>In this exercise, we will work with the stock market API&nbsp;<a href="https://iexcloud.io/" target="_blank">iexcloud.io</a>.</p>

<p>The objective here is to become familiar with reading the API documentation.</p>

<ol>
<li>
<p>Try to find the API documentation page of&nbsp;<a href="https://iexcloud.io/" target="_blank">iexcloud.io</a>.</p>

<details>
<summary>Found it?</summary>

<p>Documentation pages are often hidden in the footer or in a menu.
Typing ‘the_website_name API documentation’ in the google search bar is a quick way to find it too.
To pursue this challenge, we’re going to refer to the legacy version of their documentation here: <a href="https://iexcloud.io/docs/api/" target="_blank">https://iexcloud.io/docs/api/</a></p>
</details>
</li>
<li>
<p>From now on, you can use Insomnia to call the API.</p>

<details>
<summary>Hint</summary>

<p>Link to the documentation: <a href="https://docs.insomnia.rest/" target="_blank">https://docs.insomnia.rest</a></p>
</details>

<p>The API endpoints we want to use are protected&nbsp;<strong>behind a paywall</strong>.</p>

<p>As Le Wagon, we provide you with a&nbsp;<strong>proxy</strong>&nbsp;to that API for you to use__ during today’s challenge.</p>

<p>Here’s how it works:</p>

<ol>
<li>
<p>if you used the regular API, you would say: use&nbsp;<code>https://cloud.iexapis.com/stable/stock/aapl/stats?token=...</code></p>
</li>
<li>
<p>But you can copy the URL above, and replace&nbsp;<code>cloud.iexapis.com</code>&nbsp;with&nbsp;<code>iex.lewagon.com</code></p>
</li>
</ol>

<details>
<summary>Hint</summary>

<p>As we are now using a proxy that provides authorised access to the API, discuss with your buddy whether your API call still needs the query parameters required for assessing <code>cloud.iexapis.com</code>.</p>
</details>
</li>
<li>
<p>Now let’s find the&nbsp;<strong>URL</strong>&nbsp;for the last 3 months of Apple stock prices in the IEXCloud API.</p>

<p>When you find the URL, copy and paste it into a new tab and look at the data you get from the API. It should be a JSON that looks like this:</p>

<div class="language-json highlighter-rouge"><div class="highlight github"><pre class="highlight github"><code><span class="p">[</span><span class="w">
</span><span class="p">{</span><span class="w">
</span><span class="nl">"close"</span><span class="p">:</span><span class="w"> </span><span class="mf">160.1</span><span class="p">,</span><span class="w">
</span><span class="nl">"high"</span><span class="p">:</span><span class="w"> </span><span class="mf">162.06</span><span class="p">,</span><span class="w">
</span><span class="nl">"low"</span><span class="p">:</span><span class="w"> </span><span class="mf">159.78</span><span class="p">,</span><span class="w">
</span><span class="nl">"open"</span><span class="p">:</span><span class="w"> </span><span class="mf">161.22</span><span class="p">,</span><span class="w">
</span><span class="nl">"priceDate"</span><span class="p">:</span><span class="w"> </span><span class="s2">"2023-04-12"</span><span class="p">,</span><span class="w">
</span><span class="nl">"symbol"</span><span class="p">:</span><span class="w"> </span><span class="s2">"AAPL"</span><span class="p">,</span><span class="w">
</span><span class="nl">"volume"</span><span class="p">:</span><span class="w"> </span><span class="mi">50133062</span><span class="p">,</span><span class="w">
</span><span class="nl">"id"</span><span class="p">:</span><span class="w"> </span><span class="s2">"HISTORICAL_PRICES"</span><span class="p">,</span><span class="w">
</span><span class="nl">"key"</span><span class="p">:</span><span class="w"> </span><span class="s2">"AAPL"</span><span class="p">,</span><span class="w">
</span><span class="nl">"subkey"</span><span class="p">:</span><span class="w"> </span><span class="s2">""</span><span class="p">,</span><span class="w">
</span><span class="nl">"date"</span><span class="p">:</span><span class="w"> </span><span class="s2">"2023-04-12"</span><span class="p">,</span><span class="w">
</span><span class="nl">"updated"</span><span class="p">:</span><span class="w"> </span><span class="mi">1684361913000</span><span class="p">,</span><span class="w">
</span><span class="nl">"changeOverTime"</span><span class="p">:</span><span class="w"> </span><span class="mi">0</span><span class="p">,</span><span class="w">
</span><span class="nl">"marketChangeOverTime"</span><span class="p">:</span><span class="w"> </span><span class="mi">0</span><span class="p">,</span><span class="w">
</span><span class="nl">"uOpen"</span><span class="p">:</span><span class="w"> </span><span class="mf">161.22</span><span class="p">,</span><span class="w">
</span><span class="nl">"uClose"</span><span class="p">:</span><span class="w"> </span><span class="mf">160.1</span><span class="p">,</span><span class="w">
</span><span class="nl">"uHigh"</span><span class="p">:</span><span class="w"> </span><span class="mf">162.06</span><span class="p">,</span><span class="w">
</span><span class="nl">"uLow"</span><span class="p">:</span><span class="w"> </span><span class="mf">159.78</span><span class="p">,</span><span class="w">
</span><span class="nl">"uVolume"</span><span class="p">:</span><span class="w"> </span><span class="mi">50133062</span><span class="p">,</span><span class="w">
</span><span class="nl">"fOpen"</span><span class="p">:</span><span class="w"> </span><span class="mf">160.775</span><span class="p">,</span><span class="w">
</span><span class="nl">"fClose"</span><span class="p">:</span><span class="w"> </span><span class="mf">159.658</span><span class="p">,</span><span class="w">
</span><span class="nl">"fHigh"</span><span class="p">:</span><span class="w"> </span><span class="mf">161.613</span><span class="p">,</span><span class="w">
</span><span class="nl">"fLow"</span><span class="p">:</span><span class="w"> </span><span class="mf">159.339</span><span class="p">,</span><span class="w">
</span><span class="nl">"fVolume"</span><span class="p">:</span><span class="w"> </span><span class="mi">50133062</span><span class="p">,</span><span class="w">
</span><span class="nl">"label"</span><span class="p">:</span><span class="w"> </span><span class="s2">"Apr 12, 23"</span><span class="p">,</span><span class="w">
</span><span class="nl">"change"</span><span class="p">:</span><span class="w"> </span><span class="mi">0</span><span class="p">,</span><span class="w">
</span><span class="nl">"changePercent"</span><span class="p">:</span><span class="w"> </span><span class="mi">0</span><span class="w">
</span><span class="p">},</span><span class="w">
</span><span class="p">{</span><span class="w">
</span><span class="nl">"close"</span><span class="p">:</span><span class="w"> </span><span class="mf">165.56</span><span class="p">,</span><span class="w">
</span><span class="nl">"high"</span><span class="p">:</span><span class="w"> </span><span class="mf">165.8</span><span class="p">,</span><span class="w">
</span><span class="nl">"low"</span><span class="p">:</span><span class="w"> </span><span class="mf">161.42</span><span class="p">,</span><span class="w">
</span><span class="nl">"open"</span><span class="p">:</span><span class="w"> </span><span class="mf">161.63</span><span class="p">,</span><span class="w">
</span><span class="nl">"priceDate"</span><span class="p">:</span><span class="w"> </span><span class="s2">"2023-04-13"</span><span class="p">,</span><span class="w">
</span><span class="nl">"symbol"</span><span class="p">:</span><span class="w"> </span><span class="s2">"AAPL"</span><span class="p">,</span><span class="w">
</span><span class="nl">"volume"</span><span class="p">:</span><span class="w"> </span><span class="mi">68445649</span><span class="p">,</span><span class="w">
</span><span class="nl">"id"</span><span class="p">:</span><span class="w"> </span><span class="s2">"HISTORICAL_PRICES"</span><span class="p">,</span><span class="w">
</span><span class="nl">"key"</span><span class="p">:</span><span class="w"> </span><span class="s2">"AAPL"</span><span class="p">,</span><span class="w">
</span><span class="nl">"subkey"</span><span class="p">:</span><span class="w"> </span><span class="s2">""</span><span class="p">,</span><span class="w">
</span><span class="nl">"date"</span><span class="p">:</span><span class="w"> </span><span class="s2">"2023-04-13"</span><span class="p">,</span><span class="w">
</span><span class="nl">"updated"</span><span class="p">:</span><span class="w"> </span><span class="mi">1684361910000</span><span class="p">,</span><span class="w">
</span><span class="nl">"changeOverTime"</span><span class="p">:</span><span class="w"> </span><span class="mf">0.03410368519675208</span><span class="p">,</span><span class="w">
</span><span class="nl">"marketChangeOverTime"</span><span class="p">:</span><span class="w"> </span><span class="mf">0.03410368519675208</span><span class="p">,</span><span class="w">
</span><span class="nl">"uOpen"</span><span class="p">:</span><span class="w"> </span><span class="mf">161.63</span><span class="p">,</span><span class="w">
</span><span class="nl">"uClose"</span><span class="p">:</span><span class="w"> </span><span class="mf">165.56</span><span class="p">,</span><span class="w">
</span><span class="nl">"uHigh"</span><span class="p">:</span><span class="w"> </span><span class="mf">165.8</span><span class="p">,</span><span class="w">
</span><span class="nl">"uLow"</span><span class="p">:</span><span class="w"> </span><span class="mf">161.42</span><span class="p">,</span><span class="w">
</span><span class="nl">"uVolume"</span><span class="p">:</span><span class="w"> </span><span class="mi">68445649</span><span class="p">,</span><span class="w">
</span><span class="nl">"fOpen"</span><span class="p">:</span><span class="w"> </span><span class="mf">161.184</span><span class="p">,</span><span class="w">
</span><span class="nl">"fClose"</span><span class="p">:</span><span class="w"> </span><span class="mf">165.103</span><span class="p">,</span><span class="w">
</span><span class="nl">"fHigh"</span><span class="p">:</span><span class="w"> </span><span class="mf">165.342</span><span class="p">,</span><span class="w">
</span><span class="nl">"fLow"</span><span class="p">:</span><span class="w"> </span><span class="mf">160.974</span><span class="p">,</span><span class="w">
</span><span class="nl">"fVolume"</span><span class="p">:</span><span class="w"> </span><span class="mi">68445649</span><span class="p">,</span><span class="w">
</span><span class="nl">"label"</span><span class="p">:</span><span class="w"> </span><span class="s2">"Apr 13, 23"</span><span class="p">,</span><span class="w">
</span><span class="nl">"change"</span><span class="p">:</span><span class="w"> </span><span class="mf">5.460000000000008</span><span class="p">,</span><span class="w">
</span><span class="nl">"changePercent"</span><span class="p">:</span><span class="w"> </span><span class="mf">0.0341</span><span class="w">
</span><span class="p">},</span><span class="w">
</span><span class="err">//</span><span class="w"> </span><span class="p">[</span><span class="err">...</span><span class="p">]</span><span class="w">
</span><span class="p">]</span><span class="w">
</span></code></pre></div>    </div>

<p>If you are using Chrome, to make the API more easily readable, you can install JSON Viewer as an extension!</p>
</li>
<li>
<p>Let’s find out what kind of data we can get from this API&nbsp;🕵️‍♂️</p>

<p>What is the URL of the:</p>

<p>a- Amazon stock prices since last year?</p>

<p>b- Facebook (Meta) market cap?</p>

<p>c- Apple’s quarterly research and development spending?</p>

<p>d- Most recent news about Tesla?</p>

<p>e- Performance of the ‘Energy’ sector?</p>
</li>
</ol>


</div>
</div>