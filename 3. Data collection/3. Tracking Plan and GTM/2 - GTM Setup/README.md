<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<p>## Introduction</p>

<p>Welcome back after the hard work on your tracking plan! 🚀&nbsp;In this challenge, you will set up your Google Tag Manager and create your first tags!</p>

<p>Ready to implement your tracking plan in the GTM?</p>

<h2 id="1---create-your-own-website-with-github">1 - Create your Own Website with Github</h2>

<p>To be able to experience Google Tag Manager yourself, you are going to need… your own website!</p>

<p>For this you will need a Google Tag Manager account but also a Github account: a solution that allows you to write your own code and work on it with others!</p>

<p>Don’t panic, you won’t have to re-develop the e-commerce website or become a Github pro! We will guide you step by step.</p>

<p>We have created a sample code for an e-commerce website that you will copy and use for today’s challenge.</p>

<ol>
<li>
<p>Go to your Github account</p>
</li>
<li>
<p>Access the <a href="https://github.com/lewagon/ecommerce-template" target="_blank">ToyStore website template</a></p>
</li>
<li>
<p>Click on “Use this template”</p>

<p>a- Owner: your account</p>

<p>b- Repository name: choose a name</p>

<p>c- Choose the “Public” mode</p>

<p>d- Include all <code>branches</code>: ✅</p>

<p>e- Click on “Create repository from template”</p>
</li>
</ol>

<p><strong>Once the repository is created, you should have access to it and see the following screen. 👇</strong></p>

<p><img src="https://lh6.googleusercontent.com/S3f5-uuwPfFqek5e5s-EEg_lTfLfq9tw-Q1IeaevnZmJLGHi_k0jkKnLl4T1FqmmPqiwawyAsM4L5WrCbZd_jJZSwL8zHcyvBk3VQiVlZsrkyE-vMncmiAwpx4YEfYYNeSHSOGCfag6UvuKMTKNK" alt=""></p>

<p>It’s your code! We will now add the Google Tag Manager tags so you can start working!</p>

<h2 id="2---creating-your-google-tag-manager-account">2 - Creating your Google Tag Manager Account</h2>

<ol>
<li>
<p>Create a Google Tag Manager account: <a href="https://tagmanager.google.com/" target="_blank">here</a></p>
</li>
<li>
<p>Create a <code>container</code> by clicking on the interface</p>
</li>
<li>
<p>Assign a <code>name</code> and a <code>type</code> (web) to the container and click <code>Create</code> (top right)</p>
</li>
<li>
<p>An interface opens, copy the code in the first square (for the <code>head</code>).</p>
</li>
</ol>

<h2 id="3---adding-gtm-to-your-website-code">3 - Adding GTM to your Website Code</h2>

<p>As a reminder, there are two pieces of code to add so that GTM can read your website’s data: one to place in the <code>head</code> of your code (the one you just copied) and the other in the <code>body</code> which you will deal with next.</p>

<ol>
<li>
<p>Return to Github, in the <code>Code</code> menu:</p>

<p>a- Click on <code>-layouts then default.html </code>=&gt; this is the main code of your website.</p>

<p>b- Click the <code>edit</code> button (top right)</p>
</li>
<li>
<p>In the <code>head</code> part below the text <code>TODO: Add GTM head script here</code>, paste the GTM code you just copied.</p>
</li>
<li>
<p>Repeat the action with the 2nd GTM code to paste in the <code>body</code> after the second dedicated location .</p>
</li>
<li>
<p><code>Commit</code> (= publish) your code changes at the bottom of the page.</p>
</li>
</ol>

<h2 id="4---github-publishing-the-website-locally">4 - GitHub: Publishing the Website Locally</h2>

<p>Your code now contains the GTM tags, all you have to do is publish it to be able to set up your tracking!</p>

<ol>
<li>
<p>Go to the <code>Settings</code> &gt; <code>Pages</code> menu</p>
</li>
<li>
<p>In the <code>Build and deploy</code> menu:</p>

<p>a- Choose <code>main</code> in the first drop-down menu then /(root)</p>

<p>b- Click <code>Save</code></p>
</li>
<li>
<p>Wait 2 - 3 minutes and refresh the page. Deployment is OK when this interface appears at the top of the page 👇</p>

<p><img src="https://lh4.googleusercontent.com/LkqmYvQmAALCxBAnqcE9_6bbwpTgQrg-vjkPlYtr8CHz2r4cRNadpY3_IOFzxIQBDbIcAxf6naqwbfhUbh1ZCW3nxmwWqA3YBTu-WEFHKUd74jJ97_lNZfGuW9EXJkLWXDk5nw00gBb1IRMi9tB5" alt=""></p>
</li>
<li>
<p>Visit your website by following the URL indicated → you have your e-commerce website online set up with GTM!</p>
</li>
</ol>

<h2 id="5---verification-of-the-implementation-of-gtm-on-your-website">5 - Verification of the Implementation of GTM on your Website.</h2>

<p>It is recommended to always publish your container “empty” when creating your GTM account and to check that it is actually connected to your website.</p>

<ol>
<li>
<p>Go back to Google Tag Manager and click on <code>Submit</code></p>
</li>
<li>
<p>Give a name to the container (for example V0)</p>
</li>
<li>
<p>Publish</p>
</li>
<li>
<p>Visit your website (reminder: the URL is present on your GitHub). Use “preview” on GTM to visit your website and check that your GTM container id is clearly visible. If so, you have successfully set up GTM!</p>
</li>
</ol>

<h2 id="6---creation-of-your-ga4-account">6 - Creation of your GA4 Account</h2>

<p>You are going to create GA4 tags on GTM. And for that you will need a GA4 identifier… and therefore an account!</p>

<ol>
<li>
<p>Create a GA4 account, a property and a <strong>web</strong> data stream (<a href="https://analytics.google.com/" target="_blank">link</a>). When you start creating the account you will be guided step by step. If you already have a property created, you will need to create a new one by clicking on <code>Create Property.</code></p>

<p><img src="https://lh5.googleusercontent.com/CAVu_svB2W6NDbwCnqg-vSDHgltpWpz1WZvl-Vi5Sra7YhXQQ62AukS8-JUTpG12oMUuRux9JPa3Oa80zQs0XuFhgEugjMYTVc_BHeX0iuhemqRWy7Egcko40ftoEOOalIjjEYMDxhG2kLnoIf9S" alt=""></p>
</li>
</ol>

<h2 id="7---setting-up-your-first-tag-in-gtm">7 - Setting up your First Tag in GTM</h2>

<p>You have your website and your GTM and GA4 accounts, now you have to make sure that GTM sends data to GA4!</p>

<p>As a reminder, there are 2 types of GA4 tags in GTM: configuration and custom event. And without the first, no data will go up in GA4. So let’s start with this one!</p>

<ol>
<li>
<p>You are going to need <strong>your GA4 data stream identifier</strong> so that GTM and GA4 can communicate with each other. Find it in Google Analytics. <em>Hint: it’s “G-……”</em></p>
</li>
<li>
<p>To avoid constantly having to go back to GA4 to look for it, create a <code>Constant</code> type variable in GTM, copy and paste this identifier and call it “GA4 - Measurement id”. <strong>You can use this constant variable each time you are asked for your GA4 identifier (like right after 👇).</strong></p>
</li>
<li>
<p>Create a <code>Google Tag</code> tag and do all the necessary steps for it to work properly. Here are some questions to help you:</p>

<p>a- You want this tag to fire as fast as possible to retrieve all the data in GA4. Which trigger to choose?</p>

<p>b- You created a constant variable in the previous step… Don’t forget to use it.</p>

<p>c- Use the preview tool (<code>preview</code> at the top right of your home screen) to check that it fires.</p>

<p><strong>If you have any difficulties, do not hesitate to open a ticket!</strong></p>
</li>
</ol>

<h2 id="8---page_view-setup">8 - Page_view Setup</h2>

<p>Let’s start with a simple tag to get you started with Google Tag Manager: <code>page_view</code>. In “real” life, there is no need to set up this tag, it is done automatically.</p>

<ol>
<li>
<p>Go to the <code>trigger</code> part and create a <code>page_view</code> trigger that fires for all page views. Each time one of your users visits a page, it will fire.</p>
</li>
<li>
<p>Then create your <code>GA4-event</code> tag that you will name <code>page_view</code> and select the trigger that you created just before.</p>
</li>
<li>
<p>Then use the preview tool to check that everything is working.</p>
</li>
</ol>

<h2 id="9---product_view-setup">9 - Product_view Setup</h2>

<ol>
<li>
<p>Browse your website and pay attention to the format of the URLs when browsing a product page. Is there a recurring element each time you go to one of these pages?</p>
</li>
<li>
<p>Create a <code>Page View - Product</code> trigger that fires on every visit to a product page. Use the recurring element seen just before.</p>
</li>
<li>
<p>Create the GA4 <code>product_view</code> tag that comes with this trigger.</p>
</li>
<li>
<p>Test it in the preview tool!</p>
</li>
</ol>

<h2 id="10---publish-your-tags-and-check-that-they-go-up-in-ga4">10 - Publish your Tags and Check that They Go Up in GA4</h2>

<ol>
<li>
<p>Click <code>Submit</code> (top right of the main screen) to publish your changes, fill in the necessary information and publish!</p>
</li>
<li>
<p>In Google Analytics, <code>Real time</code> tab, re-check that the events are sent and if they are sent, you are receiving the correct data.</p>
</li>
</ol>

<p>Congratulations, you made it! 🔥</p>



</div>
</div>