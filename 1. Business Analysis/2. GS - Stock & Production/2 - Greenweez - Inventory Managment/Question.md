### The objective of this exercise is to address a recurring business need of the inventory team, which is inventory management, using Greenweez as an example company.

The inventory team has the following objectives:

- Control stock shortages
- Anticipate future sales
- Place the right orders to the production team for supplying the products

In particular, they would like to have a comprehensive overview of the current stock for each product, including shortage rate, forecasted delivery, and estimated days of remaining stock.

🎯 **In this exercise you will be able to:** 🎯

- Gain a better understanding of the inventory team’s inventory management needs and provide recommendations to the inventory team
- Improve your skills with Google Sheets
- Combine different levels of analysis (granularities) to determine the most relevant ones based on the context and requirements

---

### I - Import and cleaning

Open the Google Sheets (GS) analysis file you created in Google Sheets’ first lecture.

**Hint**

- Add relevant data sources:
  - Add the stock tab from this raw data source
  - Add the sales from stock tab from this raw data source
  - Add the product tab from this raw data source (⚠️ be careful there is a sales tab in this file that is not the right one for today’s challenges)

**Hint**

- Duplicate the Department page template to create the “Inventory page.”
- Think about the key indicators that would be relevant to the inventory team.

**Duplicate the stock sheet** and call it **explo_stock** sheet.

**a.** Add columns for  category_1, category_2 and category_3 in the explo_stock sheet and use `XLOOKUP()` function to retrieve the corresponding information from the product sheet.

**b.** Currently, we only have the product_id column available, and we would like to easily know to which category each product_id belongs so we can provide feedback to the appropriate sub-team in the inventory team. Create a new **Product Name** column. In the Product Name column, concatenate the product_id, category_2, and category_3 to match the format `[product_id] - [category_2] - [category_3]`

**Calculate the stock value**

**a.** Add the product’s pp_cat in a new column called **PRICE** using `XLOOKUP()` from the product tab.

**b.** In a new column, calculate the **STOCK VALUE**. It is the total amount in stock (STOCK * PRICE). Name the column STOCK VALUE.

**Create an IN_STOCK column.**

The stock shortage ratio is the percentage of products that are out of stock. To calculate this, we need an IN_STOCK column where each line contains a 0 if the product is out of stock and 1 if the product is in stock.

**a.** Create a filter and filter all rows with stock <= 0.

**b.** If there were any negative stock lines, what could that mean to you? What value would you put in the IN_STOCK column: 0 or 1?

**c.** Create an **IN_STOCK** column and populate it using the `IF` function.

---

### II - Stock shortage analysis

In a new sheet called **stock_analysis**, create a pivot table to determine the number and percentage of products in stock or out of stock

Create a pie chart from your pivot table to visualize the percentage of shortage.

**Bonus**

Improve the style of your pie chart to create an aesthetically pleasing graph with a legend.

In the product tab, we have 3 columns about the category each product belongs to.

The categories range from general to specific: for example, one product will belong to “boisson” (“drink”) in Category 1, “soda” in Category 2 and “cola bio” (“organic cola”) in Category 3.

Now, create a pivot table to analyze:

- The shortage rate
- The number of products in stock
- The average stock
- The stock value

By:

- Category 1
- Category 2

Create a line-bar chart to show the shortage rate (line) and average stock (bar) by category_1 with data labels displayed.

---

### III - Creating a stock_category file analysis

You want to create a model that allows users to choose a category and obtain a comprehensive view of the data. Your team can select any category from a dropdown list (created in cell C16) to obtain a summary of how many items are available and how many are missing. The end result should resemble the example shown below 👇

- Create a new sheet called **stock_category**
- Add a category filter and dropdown:
  - In cell B16, write **category_2**.
  - In cell C16, create your dropdown list. This will allow a user to select any item from category_2.
- **Hint!**
  - Add filter data:
    - In cell O17, write **Data filter**.
    - In cell O18, add a formula to copy and paste the headers from the explo_stock sheet.
    - Start writing a FILTER function in cell O19.
- **Hint!**
  - Add a product name:
    - In cell B18, write **Category_1**.
    - Select the value of the first row for category_1 in your filtered data.
- **Hint!**
  - Insert a model stock view:
    - In cell B20, insert a pivot table from your filtered data.
    - **Help**: Display CATEGORY_2 in the first row, category_3 in the second row, and new as columns. Use stock as the value.
    - You may have empty values due to empty rows in the selection. You can hide those rows if desired.
- Add a pie chart above the pivot table to show stock shortage based on your filtered data.
  - **Help**: Choose some other category_2 values in the dropdown to access different model information (e.g., Mode, Hygiène, Entretien, …).

Summarize the main information from your analysis in the Main Results section of the Inventory page.
