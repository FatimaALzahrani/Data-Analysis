Today, you’ll be collaborating with the finance team at Greenweez.

🪴 Greenweez is an organic e-commerce website.

🏷️ It caters to B2C customers by offering a variety of products for a healthier and more sustainable lifestyle.

The finance team’s objective is to monitor the business’s profitability. Specifically, they want a daily report that showcases the balance between revenue and various costs, including purchases, operational costs, advertising costs, and refunds, in order to calculate their margins.

I- KPIs calculation
Before delving into the data, take a moment to consider what you need to calculate.

In this case, you’re collaborating with the finance team, and one of their goals is to determine if the company is generating enough revenue by calculating the company’s margin.

What is the margin? The margin percentage? The operating margin? How do you calculate them?

Hint
II- Data import
Now that you know the data required, let’s locate and explore it!

You’ll be importing four tables using two different methods in order to calculate the margin:

gwz_finance_campaign 👇🏽

gwz_finance_refund 👇🏽

gwz_finance_orders 👇🏽

gwz_finance_shipping 👇🏽

Make a copy of the Google Sheets template to store all your answers. Duplicate the “department page template” sheet, rename it to “Finance page” and record your answers about the mission and main metrics on this new page.

Manually import the following CSV files:

gwz_finance_campaign.csv in a tab that you can name campaign

gwz_finance_refund.csv in a tab that you can name refund

Hint
Use IMPORTRANGE() for automated import:

Import gwz_finance_orders in a tab that you can name orders

Import gwz_finance_ship in a tab that you can name shipping

Analyse the different spreadsheets and try to understand the columns. Do we have all the necessary information to address Greenweez’s financial requirements?

📚Data dictionary
III- Data cleaning
⚠️ If you’re not using Google Sheets in English, be cautious with numbers and dates…
Raw data is never completely clean or ready to use when initially received. Before commencing any analysis, it’s essential to check for anomalies in your data and clean it accordingly.

Let’s begin by cleaning the dates!

a. Start by attempting to change the date format in the orders tab. What happens? Why do you think that is?

b. Now, let’s clean the datetime column in a new date_date column:

Create a new column named date_date and use the SUBSTITUTE function to remove “ 00:00:00UTC”.

💁🏽 Hint to clean the data with an IMPORTRANGE
c. Perform the same steps in the campaign tab, but use the LEFT function instead of SUBSTITUTE (try using LEN inside your LEFT formula”).

d. In the refund tab, create a new column date_refund from the columns year, month and day. Try to do it with the DATE() function.

e. In the campaign tab, use functions Year, Month and Day to create 3 separate columns from the date_date column.

Another form of cleaning is to check for abnormal or extreme values. Those could be cells equal to 0 for no good reason or unusually high or low values compared to the rest of the data.

a. Go to the orders tab and add a filter on the table.

b. There might be some anomalies with high purchase costs. Try to check the top values for orders. Do you sense anything unusual?

c. Check the other columns for the order corresponding to these top values. Do you notice the discrepancy?

d. What do you think is the cause? What can you do?

The limit of the IMPORTRANGE

a. Put a filter on the shippingtab.

b. Sort the log_cost descending.

c. What’s going on?

Filters can’t be used with IMPORTRANGE. If you want to filter your table correctly, you need to copy and paste your dataset hard. Or just use a filtered view. This is the limit of the “IMPORTRANGE” clause

Repeat the same exploration and cleaning steps for the other tabs.

IV- First data calculation - Order Margin
You have explored and cleaned the data. Now you can begin to make some calculations and analyse the results to derive insights for the finance team!

As a reminder, you work with the finance team, and they want to track the evolution of the different types of margins.

Let’s start with the first one, the gross profit margin (which, in our case, is turnover minus the cost of goods sold or purchase costs)!

In the tab orders, add and populate this new column margin

In the tab orders, calculate the margin_percent and format the column as percentage (%) with one digit after the decimal point

V- Operational Margin
Now, we want to calculate the operational margin: it’s the money you earn after paying for goods (purchase cost), shipment, and logistics!

To do so, we need to bring in the same table (orders) all the data needed for the calculation: revenue, purchase_costs, log_cost and ship_cost.

In the orders tab, create two new columns log_cost and ship_cost. Use XLOOK_UP to populate these columns from the shipping tab.

You can now calculate:

The operational_margin which takes into account logistics and shipping costs

The operational margin percentage

VI- Advanced Margin Calculations
You’re on your own now! Calculate the refund_margin (operational margin - costs of refunds) and refund_margin_percent

Hint
We would like to evaluate the profitability of orders and the business by taking into account ads costs too.

Where can you find these costs?

Is it possible to add those costs to our orders tab?

What can we do if we want to analyse the profitability of the company every day taking into account those advertising costs in the equation?

VII- Data aggregation and pivot tables
Let’s synthesize all the data, shall we?

Create a pivot table in a new sheet called daily_aggregation to obtain the following data by day:

COUNT(orders)
SUM(turnover)
AVG(turnover)
SUM(ship)
AVG(ship)
SUM(purchase cost)
SUM(margin)
AVG(margin)
SUM(log_cost)
AVG(log_cost)
SUM(ship_cost)
AVG(ship_cost)
SUM(operational_margin)
AVG(operational_margin)
Format the columns so that they are easy to read (zero, one or two digits after decimal point…)

Outside of the pivot table, create a new column called ads_cost, and use XLOOKUP ( or “INDEX, MATCH” clause) to add advertising costs from thecampaign sheet.

Help
if it is not working, check if there aren’t any spaces in the column date_date from tab order or tab campaign

Calculate ads_margin which equals to operational_margin minus ads_cost

Calculate ads_margin_avg (ads margin divided by the number of orders) and ads_margin_percent

Format your pivot table to make it pleasant to look at and easy to read.

👏Congrats! You have just created your first financial reporting: a daily profitability analysis 👏

VIII- Summarising your main learnings
Evaluate which metrics are the most important ones for the finance team and copy paste them in the “Finance page” results section.
BONUS (optional)
Margin Percent
Create a pivot table in a new sheet called margin_pivot. Use a calculated field to compute the margin percent from SUM(margin) and SUM(turnover,ship) per day.

Add AVG(margin_percent) to the pivot table.

Compare AVG(margin_percent) with the calculated % margin in step 1- Can you explain why they are different? Can you make an assumption to explain why the average margin % is higher in the pivot table than in the custom calculation?

Refund
We have added the costs of ads in the profitability model but not the refund costs. Let’s try to do that now. In the daily_aggregation tab we added new columns outside of our pivot table (section VII questions 3, 4 and 5), therefore we need to create more space. Right-click on ads_costs column and insert 3 columns to the left.

Now we can add the refund costs to our pivot. Edit the pivot, add values, select a calculated field and compute sum_refund (the sum of ref_turnover, ref_ship and ref_coupon)

Add the count of ref_turnover as refund_number, this shows us the number of refunds per day.

Let’s say we are currently on October 16th, 2021, in the morning
Analyse the evolution of refund_number.
Can you offer a hypothesis to explain the decrease? Why do you think there are very few refunds in the previous 2 days?
In the orders sheet, create a new column refund_delay, which is the difference between date_refund and date_date (hint: you can use DATEDIF and IFERROR)
To insert refund costs in the daily financial reporting, it is not a good strategy to use the orders_id and to join the data, because it uses date_date = date_purchase when aggregating instead of date_refund.

👉🏽 Do you have any idea how to correct this issue and include correctly refund_cost in the daily_reporting?

Create a separate pivot to aggregate refund data on the date_refund column, then add refund_costs to the daily_aggregation sheet.

HelpUse =TEXT([Cell],”YYYY-MM-DD”) to format date_refund from numeric value back to text in order to perform the XLOOKUP
Calculate final_margin, avg_final_margin and final_margin_percent.