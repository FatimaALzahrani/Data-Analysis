<div role="tabpanel" class="tab-pane active" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<p>👥&nbsp;In this exercise, you will learn about Looker Studio as a business user.</p>

<p>🤔&nbsp;Imagine you are a member of the Greenweez customer service team.</p>

<h2 id="introduction">Introduction</h2>

<h3 id="greenweez-presentation">Greenweez Presentation</h3>

<p>🌐&nbsp;Greenweez is an organic e-commerce website.</p>

<p>🍏&nbsp;It sells products to B2C customers to offer them a healthier and “greener” lifestyle.</p>

<p>👩🏽‍💼&nbsp;Customer satisfaction is essential to ensure customer loyalty and retention.</p>

<h3 id="customer-service-team">Customer Service Team</h3>

<p>The customer service team closely monitors customer satisfaction to detect any problems in the Greenweez value chain.</p>

<p>This is the heart of the company. 🤍</p>

<p>Any change in their satisfaction must be accurately analyzed and understood.</p>

<p>In addition, the customer service team closely follows this metric as it is responsible for responding to customer requests when a problem arises.</p>

<p>Here are the main missions of the customer service team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/01-Discovering-Looker-Studio-As-A-User-asset-1-Untitled.png" alt=""></p>

<p>Here are the main KPIs to track for the CRM team:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/01-Discovering-Looker-Studio-As-A-User-asset-2-Untitled.png" alt=""></p>

<h3 id="business-needs">Business Needs</h3>

<p>The customer service team wants to monitor the NPS:</p>

<p><strong>1 - Overall satisfaction</strong></p>

<p>The first need is to have a global vision of the customer satisfaction with:</p>

<ul>
<li>
<p>NPS monitoring</p>
</li>
<li>
<p>A customer satisfaction score for each domain (website, price, product offer, delivery, …).</p>
</li>
</ul>

<p><strong>2 - Satisfaction of the delivery by transporter/carrier</strong></p>

<p>The second need is to have the satisfaction by carrier/transporter. The objective is to analyze the delivery customer satisfaction metric (csat_delivery) by carrier/transporter.</p>

<p><strong>3 - Filtering on customers or orders</strong></p>

<p>The last need of the customer service is the possibility to filter on a specific customer to analyze the corresponding satisfaction.</p>

<h2 id="dashboard-analysis">Dashboard Analysis</h2>

<p>The data team created a <a href="https://lookerstudio.google.com/reporting/50e750fb-77f2-4484-924a-fa0a8590403b/page/p_l33eefpp0c?s=jd4UMWgGlSs" target="_blank">dashboard</a> to meet all the business needs required by the customer service team.</p>

<h3 id="opening-the-dashboard">Opening the Dashboard</h3>

<ol>
<li>
<p>It gives the customer service department an overall view of customer satisfaction. Take time to look at the page and understand the various graphs and charts.</p>

<h3 id="getting-kpis">Getting KPIs</h3>

<p>On this dashboard, we imagine that it is August 31, 2021. We are a member of the customer service team.</p>

<p>Answer the following business questions for customer service and <a href="https://forms.gle/uDMd8Wmn4vhF1XZc9" target="_blank">fill in your answers in this form</a>:</p>
</li>
<li>
<p>What is the NPS score for the current month?</p>
</li>
<li>
<p>What is the customer satisfaction with delivery for the current month?</p>
</li>
<li>
<p>How many reviews were provided by customers in the current month (August 2021)?</p>
</li>
<li>
<p>What is the NPS score for the previous month (July 2021)?</p>
</li>
<li>
<p>How many comments were provided by customers in June 2021?</p>
</li>
<li>
<p>What is the customer’s satisfaction with the price for the previous month (July 2021)?</p>
</li>
<li>
<p>What is the customer satisfaction on the website in June 2021?</p>
</li>
<li>
<p>How many reviews were provided by customers in July 2021?</p>
</li>
<li>
<p>What is the customer satisfaction rate on delivery in July 2021?</p>

<h3 id="playing-with-filters">Playing with Filters</h3>

<p>At the top of the page, you have 2 filters - <strong>transporter</strong> and <strong>sgt</strong>. This allows you to filter the KPIs on the page to a specific transporter or a specific segment.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/01-Discovering-Looker-Studio-As-A-User-asset-3-Untitled.jpeg" alt=""></p>

<p>Answer the following business questions regarding customer service:</p>
</li>
<li>
<p>What is the current month’s NPS score for the <strong>Chrono Home</strong> carrier?</p>
</li>
<li>
<p>What is the customer satisfaction rate for delivery in the current month for the <strong>DPD Pickup</strong> carrier?</p>
</li>
<li>
<p>How many reviews were given in the current month (August 2021) by <strong>new</strong> clients?</p>
</li>
<li>
<p>What is the previous month’s NPS score for <strong>frequent</strong> customers (July 2021)?</p>
</li>
<li>
<p>How many reviews were given in July 2021 by <strong>occasional</strong> customers who chose <strong>Chrono Pickup</strong>?</p>
</li>
<li>
<p>How satisfied are <strong>frequent</strong> customers with the previous month’s <strong>price</strong> (July 2021) for <strong>DPD Home</strong>?</p>
</li>
<li>
<p>What is the customers satisfaction on delivery in June 2021 for <strong>new</strong> customers who used <strong>Chrono Home</strong>?</p>
</li>
<li>
<p>Reset the filter to its default value by clicking on the reset button at the top right of the page.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/01-Discovering-Looker-Studio-As-A-User-asset-4-Untitled.jpeg" alt=""></p>

<h3 id="navigate-through-pages">Navigate through Pages</h3>

<p>So far, you’ve only looked at the first page of the dashboard called <strong>Global Score/Score Global</strong>.</p>

<p>The data team has created other pages to address other customer service needs: <strong>Score by transporter</strong> and <strong>Filtering on Customer</strong>.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/01-Discovering-Looker-Studio-As-A-User-asset-5-Untitled.jpeg" alt=""></p>

<p>If the navigation bar is hidden, click on the arrow at the bottom to enlarge it.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/01-Discovering-Looker-Studio-As-A-User-asset-6-Untitled.jpeg" alt=""></p>
</li>
<li>
<p>Navigate to the other pages - try to understand the role of the different pages, charts and diagrams.</p>

<details>
<summary>Solution 🔓</summary>

<p><em><strong>Score by transporter</strong></em></p>
<ul>
<li><em>Give a clear vision of the customers satisfaction by transporter</em></li>
<li><em>Help to compare the performances of the different transporter and the evolution over time</em></li>
<li><em>Help to identify if a decrease in the NPS or the csat_delivery is caused by one specific transporter</em>
<em><strong>Filtering on customer</strong></em></li>
<li><em>Ability to filter on a specific customers for the customer service</em></li>
<li><em>Ability to evaluate the evolution over time of one specific customer</em></li>
</ul>
</details>

<h3 id="performance-per-transporter">Performance per Transporter</h3>
</li>
<li>
<p>What’s the NPS score for current month for <strong>Chrono Pickup</strong>?</p>
</li>
<li>
<p>What’s the NPS score <strong>evolution</strong> between current month and last month for <strong>DPD Pickup</strong>?</p>
</li>
<li>
<p>Who is the <strong>transporter</strong> with the maximum delivery reviews?</p>
</li>
<li>
<p>Who is the <strong>transporter</strong> with the <strong>best NPS score</strong> in June 2021 for <strong>Occasional customers</strong>?</p>
</li>
<li>
<p>What is the corresponding <strong>NPS score</strong> given to the best transporter in June 2021 for Occasional customers?</p>

<p><strong>Home delivery</strong></p>
</li>
<li>
<p>For home delivery, which brand has a better NPS for the current month: <strong>Chrono</strong> or <strong>DPD</strong>?</p>
</li>
<li>
<p>For home delivery, what is the evolution trend? Is the NPS score stable for Chrono Home and DPD Home?</p>
</li>
<li>
<p>For home delivery, when you focus on customer satisfaction upon delivery (csat_delivery), do you find similar information and trends?</p>
</li>
<li>
<p>What would you do if you were customer service?</p>

<p><strong>Pick-up Delivery</strong></p>
</li>
<li>
<p>For pickup and delivery, which brand has a better NPS for the current month: Chrono or DPD?</p>
</li>
<li>
<p>What is the evolution trend for pick-up delivery? Is the NPS score stable for Chrono Pick-up and DPD Pick-up?</p>
</li>
<li>
<p>For pickup and delivery, when you focus on customer satisfaction upon delivery (csat_delivery), do you find similar information and trends?</p>
</li>
<li>
<p>What would you do if you were customer service?</p>

<h2 id="filtering-on-customer">Filtering on Customer</h2>

<p>Customer Service has identified a big problem with <strong>Chrono Home</strong> delivery, especially in July and August. They want to contact customers who have had a bad delivery experience with <strong>Chrono Home</strong>. As a priority, they want to contact <strong>frequent customers</strong>. They are very valuable to Greenweez and it is important not to lose them.</p>

<p>Go to the <strong>Filtering on customer</strong> page. Answer the following business question for customer service:</p>

<h3 id="identify-customers">Identify Customers</h3>
</li>
<li>
<p>On the <strong>Filtering on Customer</strong> page, filter the reviews with the Chrono Home carrier/transporter, the <strong>Frequent</strong> segment and sort the <u>_Detailed Reviews_</u> on global_note table in an ascending manner.</p>

<ul>
<li>List the 3 customer_ids that had a global_note of 4 or less for a date_date in July or August.</li>
</ul>

<p><u>_Note_ </u><em>- To sort a table on a column, click on the column_name - once to sort down and again to sort up.</em></p>

<p>What are the customers_id ?</p>
</li>
<li>
<p>What can you say about the CSAT value for website, product and price? What can you say about the CSAT value for delivery?</p>
</li>
<li>
<p>Reset the filter to its default value by clicking on the reset button at the top right of the page.</p>

<h3 id="analyze-customer-satisfaction-evolution">Analyze Customer Satisfaction Evolution</h3>
</li>
<li>
<p>Filter page 3 on the <strong>customer_id 264643</strong> : how many <strong>orders</strong> did that customer take?</p>
</li>
<li>
<p>Which <strong>transporter</strong> did this customer give the best NPS score?</p>
</li>
<li>
<p>What <strong>CSAT_delivery score</strong> did he give in June 2021?</p>

<p>Before calling the three customers who had problems, the customer service department would like to analyze more precisely the evolution of their customers’ satisfaction in order to:</p>

<ul>
<li>
<p>find out if there have been other problems with previous or subsequent orders</p>
</li>
<li>
<p>propose an appropriate discourse and solution to the customer</p>
</li>
</ul>
</li>
<li>
<p>Filter successively on the three customers_id to analyze the evolution of their satisfaction. What would you say to each customer?</p>

<ul>
<li>
<p><strong>270575</strong></p>
</li>
<li>
<p><strong>226378</strong></p>
</li>
<li>
<p><strong>261523</strong></p>
</li>
</ul>

<h2 id="view-and-edit-mode">View and Edit Mode</h2>

<p>You have now used the dashboard as a business user. You only have view access and cannot modify the dashboard. However, you are participating in a data analytics bootcamp. The objective is to modify, improve and create dashboards. This is what you will be doing next.</p>

<h3 id="copy-the-dashboard">Copy the Dashboard</h3>
</li>
<li>
<p>Copy the dashboard by:</p>

<ul>
<li>clicking on <code>…</code> and <code>Make a copy</code> button at the top right</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/01-Discovering-Looker-Studio-As-A-User-asset-7-Untitled.jpeg" alt=""></p>

<ul>
<li>Click on copy report in the pop-up window even if you have an <code>❗(Unknown)</code> warning</li>
</ul>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/01-Discovering-Looker-Studio-As-A-User-asset-8-Untitled.png" alt=""></p>

<h3 id="view--edit-mode">View &amp; Edit Mode</h3>

<p>On the top right, you have a<strong>new blue button</strong> that allows you to switch from View mode to Edit mode.</p>

<p>If you are in View mode, you will see the <code>Edit </code>button which allows you to switch to <strong>Edit mode</strong>.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/01-Discovering-Looker-Studio-As-A-User-asset-9-Untitled.png" alt=""></p>

<p>If you are in <strong>Edit mode</strong>, you will see the <code>View</code> button which allows you to switch to <strong>View mode</strong>.</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/01-Visualisations-And-Looker-Studio1/01-Discovering-Looker-Studio-As-A-User-asset-10-Untitled.png" alt=""></p>
</li>
<li>
<p>Be sure to be in <strong>Edit mode</strong>, clicking on the <code>Edit</code> button if necessary.</p>

<ul>
<li>First rename the dashboard on the top left by clicking on the title <code>Copy of Gwz NPS Report - Business Analysis</code>. Replace <code>Copy of</code> with your first name.</li>
</ul>
</li>
<li>
<p>Click on the <u>_NPS_</u> scorecard and change it to show the average global note (overall score) instead of the NPS.</p>
</li>
<li>
<p>Click on the <u>_NPS over month_</u> Time series chart and display the average <strong>global note</strong> instead of the <strong>NPS</strong>. Change the title of the chart.</p>
</li>
<li>
<p>Click on the bar graph of the <u>_Customer satisfaction time series during the month by domain_</u> and add the average <strong>global note</strong> (average overall score) as a new measure.</p>
</li>
</ol>

<p>🎉 <u>Congratulations, you have made your first changes on a Looker Studio dashboard.</u>🎉</p>

<p>You will do a lot more in the next few exercises.</p>


<a href="https://docs.google.com/forms/d/e/1FAIpQLSeMf3H4g9xAxDviEkBI_uAN_CHn9epX6ZYzsf3ISCAOxenE5w/viewscore?pli=1&pli=1&viewscore=AE0zAgCZePc_EsXcLsVjBIRZnmmf3Zc9e4iQ4_xHqo6B0GaQXypQ2f3H1zHNTCW-Bg">My Solution</a>
</div>
</div>