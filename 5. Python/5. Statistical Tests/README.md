<div role="tabpanel" class="tab-pane active" id="exercise-instructions">

<div id="exercice-content" class="px-5 py-3">


<hr>

<p><a href="https://colab.research.google.com/drive/11vOF63sVVMSL8mtyACESEHKEnrmL5JsB?usp=sharing" target="_blank">Solution</a></p>

<hr>

<h2 id="instructions">Instructions</h2>

<p><strong>The challenge will be considered complete when you submit the URL of the document you have been working on. Make sure that the URL is in share mode and accessible by the teacher.</strong></p>

<p><strong>If there is no submission option on the exercise, click on the “I’m done” button.</strong></p>

<hr>

<h2 id="insights-from-olists-dataset">Insights from Olist’s dataset</h2>

<h3 id="objective">Objective:</h3>

<p>In this project we will explore the Brazilian E-Commerce Public Dataset by Olist and conduct basic statistical analysis and A/B testing to draw insights from the data.At the end of the day, you will have the opportunity to present you work with the rest of the batch.</p>

<h3 id="dataset">Dataset:</h3>

<p>You can find the data&nbsp;<a href="https://drive.google.com/file/d/1Yt_xC3j_IEyuOmkUPCyeBa69BSj8c0wY/view?usp=drive_link" target="_blank">here</a>&nbsp;and if you want to learn more about this dataset or use more data, you can visit the Kaggle page&nbsp;<a href="https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce" target="_blank">here</a>.</p>

<p>You might notice some differences between the version you can download and the Kaggle version. That’s because we have reduced the scope of the dataset by dropping some tables in order to make this project achievable in one day!</p>

<p>There is no notebook for this day, you need to create your own! We only have one piece of advice: keep things organized. At the end of the day, after you’ve written a lot of code, you need to still be able to make sense of it and present it to your peers!</p>

<h3 id="dataset-description">Dataset Description:</h3>

<p>The Brazilian E-Commerce Public Dataset by Olist contains information about orders, customers, products, and payments from 2016 to 2018. It includes data on orders made at Olist Store, which is divided into multiple datasets linked by unique identifiers.</p>

<h3 id="project-steps">Project Steps:</h3>

<h2 id="1-data-exploration-and-preparation">1. Data Exploration and Preparation:</h2>

<ul>
<li>Load the necessary Python libraries (pandas, numpy, plotly express).</li>
<li>Load the dataset into a pandas DataFrame.</li>
<li>Explore the structure of the dataset (columns, datatypes, missing values).</li>
<li>Clean the data (handle missing values, data type conversions if necessary).</li>
</ul>

<h2 id="2-descriptive-statistics">2. Descriptive Statistics:</h2>

<p>By examining descriptive statistics, you can gain a comprehensive understanding of the dataset’s characteristics and identify areas of interest for further analysis or improvement.</p>

<ul>
<li>Compute basic statistics (mean, median, mode, standard deviation) for relevant columns (e.g., order price, customer age).</li>
<li>Visualize distributions using histograms, boxplots, etc.</li>
<li>Explore correlations between variables.</li>
</ul>

<p>A few examples of descriptive statistics that can be computed and visualized from the dataset.</p>

<h3 id="order-price-statistics">Order Price Statistics:</h3>

<ul>
<li><strong>Mean order price:</strong> This represents the average amount spent per order.$X</li>
<li><strong>Median order price:</strong> This is the middle value of the order prices when they are sorted in ascending order. It’s a measure of central tendency that is less affected by outliers compared to the mean. $Y</li>
<li><strong>Standard deviation of order prices:</strong> This measures the dispersion or variability of order prices around the mean. A higher standard deviation indicates more variability in order prices.$Z</li>
<li><strong>Histogram of order prices showing the distribution:</strong> This visualizes the distribution of order prices, showing how frequently different price ranges occur.</li>
</ul>

<h3 id="customer-age-statistics">Customer Age Statistics:</h3>

<ul>
<li><strong>Mean customer age:</strong> This gives the average age of customers. A years</li>
<li><strong>Median customer age:</strong> This represents the middle value of customer ages when they are sorted. It’s another measure of central tendency. B years</li>
<li><strong>Standard deviation of customer ages:</strong> This measures the spread of customer ages around the mean age. C years</li>
<li><strong>Histogram of customer ages:</strong> This visualizes the distribution of customer ages, showing how many customers fall into different age ranges.</li>
</ul>

<h3 id="product-category-distribution">Product Category Distribution:</h3>

<ul>
<li><strong>Bar chart:</strong> To show the number of orders placed in each product category. It helps identify which categories are most popular among customers.</li>
<li><strong>Payment Method Distribution:</strong></li>
<li>Pie chart: This illustrates the proportion of orders made using different payment methods, such as credit card, debit card, or boleto (Brazilian payment method).</li>
</ul>

<h3 id="shipping-time-statistics">Shipping Time Statistics:</h3>

<ul>
<li><strong>Mean shipping time:</strong> This gives the average time taken for orders to be delivered to customers. D days</li>
<li><strong>Median shipping time:</strong> Similar to the median for order price and customer age, this represents the middle value of shipping times. E days</li>
<li><strong>Standard deviation of shipping times:</strong> This measures the variability in shipping times. F days</li>
<li><strong>Boxplot of shipping times:</strong> This visualizes the spread of shipping times, showing the minimum, maximum, median, and outliers.</li>
</ul>

<h3 id="customer-satisfaction-ratings">Customer Satisfaction Ratings:</h3>

<ul>
<li><strong>Mean satisfaction rating:</strong> This gives the average satisfaction rating across all orders.</li>
<li><strong>Median satisfaction rating:</strong>Proportion of satisfied (rating &gt;= 4) vs. dissatisfied customers (rating &lt; 4).</li>
<li><strong>Proportion of satisfied vs. dissatisfied customers:</strong> This shows the percentage of customers who rated their satisfaction as high (4 or 5) versus low (1 to 3), providing insights into overall customer satisfaction levels.</li>
</ul>

<p>By studying correlations, you can uncover insights into the relationships between different variables in the dataset, which can inform business decisions and strategies for improving customer experience and satisfaction.</p>

<h3 id="some-examples">Some examples:</h3>

<ul>
<li>
<p><strong>Order Price vs. Customer Age:</strong> Is there a correlation between the amount spent on orders and the age of the customer?</p>

<p>This analysis could reveal whether older customers tend to spend more or less than younger customers.</p>
</li>
<li>
<p><strong>Order Price vs. Shipping Time:</strong> Is there a correlation between the amount spent on orders and the time taken for shipping?</p>

<p>This analysis could show whether customers who spend more are more or less tolerant of longer shipping times.</p>
</li>
<li>
<p><strong>Customer Age vs. Shipping Time:</strong> Is there a correlation between the age of the customer and the time taken for shipping?</p>

<p>This analysis could reveal whether older customers are more or less patient with shipping times compared to younger customers.</p>
</li>
<li>
<p><strong>Order Price vs. Customer Satisfaction Rating:</strong> Is there a correlation between the amount spent on orders and the satisfaction rating given by customers?</p>

<p>This analysis could indicate whether customers who spend more are generally more satisfied with their purchases.</p>
</li>
<li>
<p><strong>Product Category vs. Customer Satisfaction Rating:</strong> Is there a correlation between the product category and the satisfaction rating given by customers?</p>

<p>This analysis could show whether customers have varying satisfaction levels depending on the type of product they purchase.</p>
</li>
<li>
<p><strong>Payment Method vs. Customer Satisfaction Rating:</strong> Is there a correlation between the payment method used and the satisfaction rating given by customers?</p>

<p>This analysis could reveal whether customers who use certain payment methods are more satisfied with their purchases than others.</p>
</li>
<li>
<p>Shipping Time vs. Customer Satisfaction Rating: Is there a correlation between the time taken for shipping and the satisfaction rating given by customers?</p>

<p>This analysis could indicate whether faster shipping leads to higher satisfaction levels among customers.</p>
</li>
</ul>

<h2 id="3-hypothesis-testing-ab-testing">3. Hypothesis Testing (A/B Testing):</h2>

<ul>
<li>Select a hypothesis to test (e.g., Does the shipping time affect customer satisfaction?).</li>
<li>Define null and alternative hypotheses.</li>
<li>Divide the dataset into control and treatment groups (e.g., orders with standard shipping vs. express shipping).</li>
<li>Choose an appropriate statistical test (e.g., t-test, chi-square test) based on the data and hypothesis.</li>
<li>Conduct the hypothesis test.</li>
<li>Interpret the results and draw conclusions.</li>
</ul>

<p>Some examples demonstrating how hypothesis testing (A/B testing) can be applied to analyze the impact of different factors on various aspects of e-commerce operations, such as customer satisfaction, order value, and completion rates.</p>

<h3 id="testing-the-effect-of-shipping-time-on-customer-satisfaction">Testing the Effect of Shipping Time on Customer Satisfaction:</h3>

<ul>
<li><strong>Hypothesis 1</strong>:
<ul>
<li><strong>Null Hypothesis (H0):</strong> There is no difference in customer satisfaction between orders with standard shipping and orders with express shipping.</li>
<li><strong>Alternative Hypothesis (H1):</strong> Orders with express shipping have higher customer satisfaction compared to orders with standard shipping.</li>
</ul>
</li>
<li><strong>A/B Testing Process:</strong>
<ul>
<li>Divide the dataset into two groups: one group with orders shipped via standard shipping and the other with orders shipped via express shipping.</li>
<li>Compute the average satisfaction rating for each group.</li>
<li>Conduct a hypothesis test (e.g., t-test) to determine if there is a statistically significant difference in satisfaction ratings between the two groups.</li>
</ul>
</li>
<li><strong>Interpretation:</strong><br>
If the p-value is less than a chosen significance level (e.g., 0.05), reject the null hypothesis and conclude that there is a significant difference in satisfaction ratings between standard and express shipping methods.<br>
If the p-value is greater than the significance level, fail to reject the null hypothesis, indicating no significant difference in satisfaction ratings between the two shipping methods.</li>
</ul>

<h3 id="testing-the-impact-of-product-category-on-order-value">Testing the Impact of Product Category on Order Value:</h3>

<ul>
<li><strong>Hypothesis 2:</strong>
<ul>
<li><strong>Null Hypothesis (H0):</strong> There is no difference in the average order value between different product categories.</li>
<li><strong>Alternative Hypothesis (H1):</strong> Some product categories have higher average order values compared to others.</li>
</ul>
</li>
<li><strong>A/B Testing Process:</strong>
<ul>
<li>Divide the dataset into groups based on product categories.</li>
<li>Compute the average order value for each product category.</li>
<li>Conduct a hypothesis test (e.g., ANOVA test) to determine if there is a statistically significant difference in average order values across different product categories.</li>
</ul>
</li>
<li><strong>Interpretation:</strong><br>
If the p-value is less than the chosen significance level, reject the null hypothesis and conclude that there is a significant difference in average order values across product categories.<br>
If the p-value is greater than the significance level, fail to reject the null hypothesis, indicating no significant difference in average order values between product categories.</li>
</ul>

<h3 id="testing-the-impact-of-payment-method-on-order-completion-rate">Testing the Impact of Payment Method on Order Completion Rate:</h3>

<ul>
<li><strong>Hypothesis 3:</strong>
<ul>
<li><strong>Null Hypothesis (H0):</strong> There is no difference in the completion rate between orders paid via credit card and orders paid via boleto (Brazilian payment method).</li>
<li><strong>Alternative Hypothesis (H1):</strong> Orders paid via credit card have a higher completion rate compared to orders paid via boleto.</li>
</ul>
</li>
<li><strong>A/B Testing Process:</strong>
<ul>
<li>Divide the dataset into two groups based on payment methods: credit card and boleto.</li>
<li>Calculate the completion rate (percentage of orders successfully completed) for each group.</li>
<li>Conduct a hypothesis test (e.g., chi-square test) to determine if there is a statistically significant difference in completion rates between the two payment methods.</li>
</ul>
</li>
<li><strong>Interpretation:</strong><br>
If the p-value is less than the chosen significance level, reject the null hypothesis and conclude that there is a significant difference in completion rates between credit card and boleto payments.<br>
If the p-value is greater than the significance level, fail to reject the null hypothesis, indicating no significant difference in completion rates between the two payment methods.</li>
</ul>

<h2 id="4-visualization-and-interpretation">4. Visualization and Interpretation:</h2>

<ul>
<li>Visualize the results of hypothesis testing (e.g., bar chart comparing satisfaction rates between control and treatment groups).</li>
<li>Interpret the visualizations and relate them back to the hypothesis being tested.</li>
<li>Discuss any implications or insights from the analysis.</li>
</ul>

<h2 id="5-conclusion-and-next-steps">5. Conclusion and Next Steps:</h2>

<ul>
<li>Summarize the findings from the analysis.</li>
<li>Discuss limitations of the analysis and potential areas for further exploration.</li>
</ul>

<h2 id="6-put-all-together-in-a-presentation">6. Put all together in a presentation</h2>

<p>It’s the end of the day, time to present to your peers. You and your buddy should present the findings to each other and ask questions! <br>
Last, but not least, be proud: you’ve just conducted your first independent data analysis in Python! <br>
You might as well start calling yourself a Data Analyst</p>


</div>
</div>