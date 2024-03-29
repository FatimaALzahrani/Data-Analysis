<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>Welcome again at StartMeUp. This time, you are asked to set up an automatic email analysis system to determine whether a lead is highly interested in the product or not.</p>

<ol>
<li>
<p>Let’s first simulate a response from a prospect so that we have a test sample to work with.</p>

<ul>
<li>
<p>Send an email to your main email address (use gmail address) putting yourself in the shoes of a lead who has just received a promotional email and would respond.</p>
</li>
<li>
<p>Write an email in English showing a great interest in the product for better results (eg: I am really interested in your product, may I test it ? …)</p>
</li>
<li>
<p>Connect to a third party email address and send an email to your main email address. For example:</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-1-Zapier-API.png" alt=""></p>
</li>
<li>
<p>Create a Zapier trigger for each new email received in your main inbox.</p>

<ul>
<li>
<p>Create a Zap, whose Trigger uses the Gmail application, and the “New Email” event.</p>
</li>
<li>
<p>Choose as account the Gmail account already connected to Zapier.</p>
</li>
<li>
<p>Then choose the label “INBOX” (in order to filter on only the messages received in your “INBOX” - the denomination can change according to the configuration of your mailbox).</p>
</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-2-image15.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-3-image10.png" alt=""></p>

<ul>
<li>Test the Trigger and get your Test sample (being the email sent to your own email address in question 1 - in order to simulate the email of a prospect who is interested in StartMeUp).</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-4-image9.png" alt=""></p>
</li>
<li>
<p>Let’s create Zap’s main action: classification via the <a href="https://moderationapi.com/auth/signin" target="_blank">Moderation API</a>.</p>

<p><strong>Tip:</strong> This <a href="https://moderationapi.com/auth/signin" target="_blank">tool</a> has a native integration with Zapier that allows you to avoid a call to the API. Let’s pretend this integration doesn’t exist!</p>

<blockquote>
<p>Access your Moderation API account at this <a href="https://moderationapi.com/app/projects" target="_blank">address</a>, select the project to analyse the sentiment of a “snippet” of text. You will find your API key in the “integrate” tab on the left. Next, familiarise yourself with the documentation at this address, where you’ll find information on the request, the response and an example API call.</p>
</blockquote>

<p>From your Moderation API account, you have access to a wide selection of pre-built templates (Quality Analyzer, Toxicity Analyzer, etc.). Here, we’re interested in the Sentiment Analyzer template.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-5-Untitled.png" alt=""></p>

<p>Then go to the Integrate section to find your key and access the <a href="https://developers.moderationapi.com/#sentiment-analyzer" target="_blank">API documentation</a>.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-6-Untitled.png" alt=""></p>

<p>You will notice that the API call in question is a POST request (send data to receive a response). The data (input - text to be classified) must be sent via the “value” key in the JSON payload.</p>

<p>The results will be returned in JSON format, as indicated in the “Response” section.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-7-Untitled.png" alt=""></p>
</li>
<li>
<p>Take your Zap and build a “Webhook by Zapier” step to classify the contents of the email.</p>

<p>Now we need to use this API command (the call in question identified in the previous question) within a Zapier step.</p>

<p>So we take our Zap and create an action in the second Zap step. The application to use is the “Webhook by Zapier” micro-tool (this is the tool that provides access to the interface for making an API call to a third-party application).</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-8-image6.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-9-Untitled.png" alt=""></p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-10-Untitled.png" alt=""></p>

<p>The other fields (“Data Pass Through?”, “Unflatten”, etc.) are optional and can be ignored.</p>

<p>Next, test the step and identify the output (response from the Moderation API).</p>

<p>This is because your dataset has been qualified by connecting to the Moderation API via its API.</p>

<p>If you enable Zap, each email content received will then become the input to the ‘Webhook by Zapier’ step and will be qualified by the Moderation API as soon as a new email arrives in your inbox.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/04-Data-Collection/04-Automation-With-Zapier/05-Sentiment-Analysis-asset-11-Untitled.png" alt=""></p>

<p><em>Note: here, the response is described as “positive” with a confidence index close to 100/100!</em></p>
</li>
</ol>



</div>
</div>