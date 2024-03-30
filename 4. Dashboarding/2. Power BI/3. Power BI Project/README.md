<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<h2 id="instructions">🎯&nbsp;Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong><br>
<strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<h2 id="insights-from-e-commerce-data">Insights from E-commerce Data</h2>

<h3 id="objective">Objective</h3>

<p><em>In this challenge, you will dive into the intricacies of The Look E-commerce dataset using PowerBI. This dataset is a comprehensive collection of information related to a fictitious e-commerce clothing retailer, designed to simulate real-world data analytics scenarios you might encounter in the industry. It includes data on customers, products, orders, logistics, web events, and digital marketing campaigns. Your task will be to navigate through this dataset to uncover valuable insights that could help drive business decisions.</em></p>

<h3 id="expected-outcomes">Expected Outcomes</h3>

<p>Participants leverage this dataset to:</p>

<ul>
<li><strong>Select an Area of Focus:</strong> Choose a specific aspect of the business to analyze. This could be sales performance, customer behavior, product popularity, or inventory efficiency.</li>
<li><strong>Conduct a Detailed Analysis:</strong> Utilize PowerBI to dive deeper into your chosen area. Apply segmentation, calculate KPIs to assess business performance, such as sales revenue, customer acquisition, and conversion rates, and use the visualization techniques you’ve learned to explore the data from multiple angles.</li>
<li><strong>Develop Recommendations:</strong> Based on your analysis, craft actionable recommendations for the business. Consider how they can leverage your insights to improve their operations, marketing strategies, product offerings, or customer engagement.</li>
</ul>

<p>By doing that:</p>

<ul>
<li>You will gain hands-on experience in applying PowerBi concepts to real-oriented data.</li>
<li>Insights derived from the analysis will contribute to informed decision-making within an e-commerce business context.</li>
<li>The project presentation will showcase participants’ ability to analyze complex datasets and communicate findings effectively.</li>
</ul>

<h2 id="introduction-to-the-look-e-commerce-dataset">Introduction to the Look E-commerce Dataset</h2>

<p>The Look E-commerce Dataset provides a comprehensive view of online retail operations, encompassing various dimensions such as sales transactions, customer information, product attributes, website engagement metrics, logistics and additional metadata. This dataset serves as a valuable resource for analyzing and understanding the dynamics of e-commerce business activities.</p>

<h1 id="getting-to-know-the-context---30min--1h">Getting to Know the Context - 30min / 1H</h1>

<h3 id="understanding-the-business-context">Understanding the Business Context</h3>

<ul>
<li><strong>Industry Overview:</strong> Gain insights into the e-commerce industry, including market trends, competition, and consumer behavior.</li>
<li><strong>Company Background:</strong> Understand the company operating the e-commerce platform, its mission, values, target audience, and unique selling propositions.</li>
<li><strong>Business Objectives:</strong> Identify the overarching business goals and strategic priorities driving the e-commerce operation.</li>
<li><strong>Operational Processes:</strong> Familiarize yourself with key operational processes such as sales, marketing, inventory management, and customer service.</li>
</ul>

<h3 id="identifying-key-business-questions">Identifying Key Business Questions</h3>

<ul>
<li><strong>Sales Performance:</strong>
<ul>
<li>How have sales trends varied across different product categories over time?</li>
<li>What are the top-selling products and their contribution to overall revenue?</li>
<li>Are there any notable seasonal patterns or trends in sales data?</li>
<li>How do sales vary between weekdays and weekends?</li>
</ul>
</li>
<li><strong>Customer Behavior:</strong>
<ul>
<li>Who are the most frequent buyers, and what is their average order value?</li>
<li>Can we identify any customer segments based on purchasing behavior or demographics?</li>
<li>What is the distribution of customer lifetimes, and how does it impact sales?</li>
<li>Are there any correlations between customer satisfaction ratings and purchase frequency?</li>
</ul>
</li>
<li><strong>Inventory Management:</strong>
<ul>
<li>Which products have the highest inventory turnover rates, and which ones are slow-moving?</li>
<li>Can we predict future inventory requirements based on historical sales data?</li>
<li>Are there any inventory shortages or excesses that need to be addressed?</li>
<li>How do inventory levels correlate with sales performance and customer satisfaction?</li>
</ul>
</li>
<li><strong>Website Performance:</strong>
<ul>
<li>What are the primary sources of website traffic, and how do they impact conversion rates?</li>
<li>Is there a correlation between website engagement metrics (e.g., time spent on site, page views) and sales?</li>
<li>Can we identify any usability issues or barriers to conversion based on website analytics?</li>
<li>How effective are promotional campaigns in driving website traffic and sales?</li>
</ul>
</li>
<li>
<p><strong>Marketing Effectiveness:</strong></p>

<ul>
<li>Which marketing channels (e.g., email campaigns, social media ads) drive the highest ROI?</li>
<li>Can we analyze the effectiveness of specific marketing campaigns in acquiring new customers?</li>
<li>Are there any customer segments that respond better to certain marketing strategies?</li>
<li>How do customer acquisition costs compare across different marketing channels?</li>
</ul>
</li>
</ul>

<h2 id="data-import">Data Import</h2>

<p>Create a new dataset The Look e-commerce in BigQuery and add all the CSV files from the The Look e-commerce dataset as tables</p>

<p>link to the dataset in <a href="https://console.cloud.google.com/marketplace/product/bigquery-public-data/thelook-ecommerce?project=lewagon-da-bootcamp-411819" target="_blank">BigQuery</a> (click on view dataset)</p>

<p>Instructions to get data:</p>

<ol>
<li>Open PowerBI Desktop and select “Get Data” from the Home tab.</li>
<li>Choose “BigQuery” as your data source and connect to The Look e-commerce dataset using the provided project ID.</li>
<li>Import the tables</li>
</ol>

<h2 id="general-exploratory-data-analysis">General Exploratory Data Analysis</h2>

<ul>
<li>Take some time to understand the dataset’s tables and relationships (What is the data in each table, what is in each column, what is the type of data, what information could I obtain with it?)</li>
<li>Explore briefly the dataset</li>
<li>Identify interesting patterns, trends, and potential areas for analysis.</li>
</ul>

<h3 id="understanding-table-relationships">Understanding Table Relationships</h3>

<ul>
<li>Take time to look at the data and make sure you understand the relationships between the different tables.</li>
<li>Check the relationships in PowerBi &gt; Model view. If necessary change the relationships</li>
</ul>

<h3 id="datasets-tables-and-relationships">Dataset’s Tables and Relationships</h3>

<p>For the Look E-commerce Dataset, we can envision several tables representing different aspects of e-commerce operations. Here’s a hypothetical breakdown of tables and their relationships:</p>

<h3 id="tables">Tables:</h3>

<ol>
<li><strong>distribution_centers:</strong>
<ul>
<li>This table stores information about distribution centers.</li>
<li>Fields: id, name, latitude, longitude</li>
</ul>
</li>
<li><strong>events:</strong>
<ul>
<li>This table records various events related to user interactions.</li>
<li>Fields: id, user_id, sequence_number, session_id, created_at, ip_address, city</li>
</ul>
</li>
<li><strong>inventory_items:</strong>
<ul>
<li>This table maintains a record of inventory items.</li>
<li>Fields: id, product_id, created_at, sold_at, cost, product_category, product_name, product_brand, product_retail_price, product_department, product_sku, product_distribu</li>
</ul>
</li>
<li><strong>order_items:</strong>
<ul>
<li>This table contains information about items included in orders.</li>
<li>Fields: id, order_id, user_id, product_id, inventory_item_id, status, created_at, shipped_at</li>
</ul>
</li>
<li><strong>orders:</strong>
<ul>
<li>This table stores data related to orders placed by users.</li>
<li>Fields: order_id, user_id, status, gender, created_at, returned_at, shipped_at, delivered_at, num_of_item</li>
</ul>
</li>
<li><strong>products:</strong>
<ul>
<li>This table contains information about products available for sale.</li>
<li>Fields: id, cost, category, name, brand, retail_price, department, sku, distribution_center</li>
</ul>
</li>
<li><strong>users:</strong>
<ul>
<li>This table stores user information.</li>
<li>Fields: id, first_name, last_name, email, age, gender, state, street_address, postal_code, city, country</li>
</ul>
</li>
</ol>

<h3 id="relationships">Relationships:</h3>

<p>Using the Model view look for the relationship between the different tables</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/h3orwaz2u8qyf3f7mnzwf7mzejqx" alt=""></p>

<h3 id="additional-considerations">Additional Considerations:</h3>

<ul>
<li>Ensure referential integrity by enforcing foreign key constraints between related tables.</li>
<li>Use appropriate data types and indexing to optimize query performance.</li>
<li>Consider denormalization techniques for improving query performance in analytical workloads.</li>
<li>Regularly update and maintain the dataset to reflect changes in e-commerce operations over time.</li>
</ul>

<h1 id="setting-goals-and-project-organisation---30min--1h">Setting Goals and Project Organisation - 30min / 1H</h1>

<h3 id="defining-analytical-objectives">Defining Analytical Objectives</h3>

<p>IMPORTANT! To begin, choose only two or three points, from the business cases. If you have more time throughout the day, you can continue covering other topics.<br>
Once you have chosen the topics to discuss, identify the main tables that you will use. Those will be the tables you will continue working with. There are different topics and tables to cover, the purpose of the challenge is not to cover them all in one day, but to be able to select which ones are the most relevant to get the job done.</p>

<ul>
<li>Define specific analytical objectives based on the business questions identified earlier.</li>
<li>Use the differents tools from PowerBi to achieve these objectives.</li>
</ul>

<p><strong>Some business cases you could explore for the Project related to the key bussiness question:</strong></p>

<ol>
<li>
<p>Sales Performance Analysis:</p>

<ul>
<li><strong>Case 1: Product Performance Evaluation:</strong> Analyze sales data to identify top-performing and underperforming products. Recommend strategies to promote high-margin products and optimize inventory for slow-moving items.</li>
<li><strong>Case 2: Seasonal Trends Analysis:</strong> Explore seasonal variations in sales and identify peak periods for different product categories. Develop targeted marketing campaigns and promotions to capitalize on seasonal demand fluctuations.</li>
</ul>
</li>
<li>
<p>Customer Behavior Analysis:</p>

<ul>
<li><strong>Case 1: Customer Segmentation:</strong> Segment customers based on demographics, purchasing behavior, and engagement levels. Tailor marketing strategies and product offerings to different customer segments to enhance customer satisfaction and loyalty.</li>
<li><strong>Case 2: Customer Lifetime Value Prediction:</strong> Predict the lifetime value of customers using historical purchase data. Implement personalized marketing campaigns and loyalty programs to increase customer retention and maximize lifetime value.</li>
</ul>
</li>
<li>
<p>Inventory Management Optimization:</p>

<ul>
<li><strong>Case 1: Inventory Forecasting:</strong> Forecast future inventory requirements based on historical sales data and seasonality patterns. Implement demand-driven inventory management strategies to minimize stockouts and reduce excess inventory holding costs.</li>
<li><strong>Case 2: Stockout Prevention:</strong> Identify products with high stockout rates and analyze the root causes. Implement safety stock policies and supplier management strategies to mitigate stockout risks and improve product availability.</li>
</ul>
</li>
<li>
<p>Website Performance Enhancement:</p>

<ul>
<li><strong>Case 1: User Experience Optimization:</strong> Analyze website traffic patterns and user behavior to identify usability issues and bottlenecks in the customer journey. Implement website design improvements and UX enhancements to increase conversion rates and improve customer satisfaction.</li>
<li><strong>Case 2: Conversion Rate Optimization:</strong> Conduct A/B testing and multivariate analysis to optimize website layout, messaging, and call-to-action buttons. Implement targeted landing pages and personalized recommendations to enhance conversion rates and drive sales.</li>
</ul>
</li>
<li>
<p>Marketing Effectiveness Assessment:</p>

<ul>
<li><strong>Case 1: Campaign ROI Analysis:</strong> Evaluate the return on investment (ROI) of different marketing campaigns and channels. Allocate marketing budgets more effectively based on the performance of each campaign and channel.</li>
<li><strong>Case 2: Customer Acquisition Cost Reduction:</strong> Identify cost-effective customer acquisition channels and tactics. Implement targeted advertising campaigns, referral programs, and content marketing strategies to reduce customer acquisition costs and increase marketing ROI.</li>
</ul>
</li>
</ol>

<h1 id="exploratory-data-analysis-eda-3h--4h">Exploratory Data Analysis (EDA) 3H / 4H</h1>

<h2 id="checking-data-quality">Checking Data Quality</h2>

<p>Checking data quality is crucial because the reliability and accuracy of the data directly impact the outcomes of analyses, decision-making, and business operations. Inaccurate or incomplete data can lead to flawed insights, misguided strategies, and unreliable results, emphasizing the importance of ensuring data quality for trustworthy and impactful outcomes.</p>

<p>Take some minutes to answer this questions</p>

<ul>
<li>Are all the columns types good?</li>
<li>Nomenclature is clear?</li>
<li>There is some missing data?</li>
<li>There outliers?</li>
</ul>

<h2 id="data-cleaning">Data Cleaning</h2>

<p>Cleaning the data is essential to eliminate inconsistencies, errors, and inaccuracies, ensuring that analyses and models are based on reliable information and leading to more accurate and trustworthy insights.<br>
Here is a list of tasks to keep in mind when cleaning the data:</p>

<ul>
<li>Navigate to the Power Query Editor.</li>
<li>Identify and handle missing values, ensuring to either fill or remove them based on the context.</li>
<li>Correct any inconsistent data entries, such as formatting errors in product names or categories.</li>
<li>Convert data types where necessary, e.g., transforming text dates to datetime format.</li>
<li>Remove duplicate records to maintain data integrity.</li>
</ul>

<h2 id="exploratory-data-analysis">Exploratory Data Analysis</h2>

<p><em><strong>Objective:</strong> Familiarize yourself with the dataset by exploring the distribution of key variables and summarizing data through basic visualizations.</em></p>

<ol>
<li>Identify the top 5 product categories in terms of inventory availability.
<details>
<summary>Hint </summary>
<pre><code> - Use the `inventory_items` table to count the number of items per `product_category` and sort in descending order.
- Select the top 5 categories for display.
</code></pre>
</details>
</li>
<li>Visualize sales trends over the last year by month.
<details>
<summary>Hint </summary>
<pre><code> - Use the `order_items` and `orders` tables to extract monthly sales data.
- Create a line chart in PowerBI, plotting months on the x-axis and sales volume on the y-axis.
</code></pre>
</details>
</li>
<li>Compare the average sale price by product category.
<details>
<summary>Hint </summary>
<pre><code> - Aggregate data from the `order_items` table to calculate the average `sale_price` for each `product_category`.
- Use a bar chart to represent each category on the x-axis and the average sale price on the y-axis.
</code></pre>
</details>
<details>
<summary>Solution </summary>

<pre><code> `Average Sale Price = AVERAGE('order_items'[sale_price])`
</code></pre>
</details>

<details>
<summary>Tips </summary>

<p>Do we want to include cancelled orders in the sales trends? There’s no right answer: the key is to be aware of what you’re doing according to the objective you’ve set yourself.</p>

<p><em>Would you like to calculate the sales trend for all orders? Do you want to calculate the average sale price by product category for all orders, regardless of their status? (once again, this choice depends on your objectives). A financial report is not the same as a product attractivity study. Play with filters on the appropriate charts.</em></p>

<p>Other option : you  also can use a segment to allow the user to interact with them, but don’t forget to modify the interactions for charts that shouldn’t be affected by the segment choices.</p>

<p><em>indeed, the fact that an order has been cancelled should not affect the top 5 product categories in terms of inventory availability, since we’re talking about available stock.</em></p>

</details>
</li>
</ol>

<h2 id="customer-behavior-analysis">Customer Behavior Analysis</h2>

<p><em><strong>Objective:</strong> Dive deeper into customer analytics by examining behavior patterns and demographics.</em></p>

<ol>
<li>Segment customers based on their total spending.
<details>
<summary>Hint </summary>
<pre><code> - Sum total `sale_price` from `order_items` for each `user_id` to assess spending.
- Segment customers into groups (e.g., low, medium, high spenders).
</code></pre>
</details>
<details>
<summary>Solution </summary>
<pre><code> - `Spending Category = Sum(order_items[sales_price])`
- Add a column on users Table:

```jsx
Spending Category = 
VAR customerSpending = [Total Spending]  // Use the measure within the context of the user
RETURN
IF(customerSpending &lt; 100, "Low",
IF(customerSpending &gt;= 100 &amp;&amp; customerSpending &lt; 500, "Medium", "High"))
```
</code></pre>
</details>
</li>
<li>Analyze the geographic distribution of customers.
<details>
<summary>Hint </summary>

<pre><code> Use the `latitude` and `longitude` data from the **`users`** table to create a map visualization in PowerBI.
</code></pre>
</details>

<p>To allow PowerBi to print maps you should modify the default settings:<br>
Files &gt; Options and Settings &gt; Options &gt; Security &gt; click on Map and flied Map visuals &gt; OK &gt; refresh</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/zibibwjb4hx1nrc86xzh4cvmp2ho" alt=""></p>
</li>
</ol>

<h2 id="product-performance">Product Performance</h2>

<p><em><strong>Objective:</strong> Assess product performance.</em></p>

<ol>
<li>Determine the products with the highest return rates.
<details>
<summary>Hint </summary>
<pre><code> - Calculate the return rate for each product by dividing the number of returned items by the total sold items.
</code></pre>
</details>
<details>
<summary>Solution </summary>

<pre><code> ```jsx
Return Rate = DIVIDE(
COUNTROWS(FILTER('order_items', 'order_items'[status] = "Returned")),
COUNTROWS('order_items'),
0
)
```
</code></pre>
</details>
</li>
<li>Using appropriate graphs, analyze the performance of products, product categories, brands, and anything else that seems relevant to you.</li>
</ol>

<h1 id="getting-all-together---1h">Getting All Together - 1H</h1>

<p>Create your own report. You will have 10 minutes at the end of the day to present your findings.</p>

<p>A good presentation should include:</p>

<ul>
<li>A clear problem statement at the beginning (don’t hesitate to put yourself in a role to explain your objectives and the decisions you’ve made - without going into technical details).</li>
<li>Relevant data, charts and analysis to address the problem</li>
<li>A list of recommended actions to take moving forward</li>
</ul>

<p><strong>IMPORTANT ! Remember</strong> It’s not about how many charts or how much data you show! <br>
Your role as a Data Analyst is to interpret that data and present your findings for better decision-making.</p>

<h3 id="time-to-present-the-result">Time to Present the Result!</h3>

<p>Good luck with your presentations!</p>


</div>
</div>