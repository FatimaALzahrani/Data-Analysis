## Introduction

### Greenweez Presentation

🪴 **Greenweez** is an organic e-commerce site. Greenweez sells individuals all the products that help them to be both healthier and more environmentally friendly.

🙋🏽 **Customer satisfaction** is essential to ensure customer loyalty and retention.

### Customer Service Team

🕵🏽‍♀️ The customer service team closely monitors customer satisfaction to detect any problems in the Greenweez value chain.

🔎 This is the pulse of the company, any changes or deviations must be analysed and understood.

🚧 In addition, the customer service team has a clear impact on this measure as they are responsible for answering and resolving customer queries when they have a problem or question about the products.

### Main Tasks

1. **Monitor customer satisfaction**
2. **Detect problems or drops in service quality**
3. **Evaluate the quality of work and optimize processes**

### Key Performance Indicators (KPIs)

- **Global NPS**
- **NPS by Domain**
- **NPS by Segment or Carrier**

## I- Requirements

### A- Business Problem

**Context:**
- 💻 You are in the data team.
- 💬 One day Nicolas, the new customer service manager, comes to you and says:
  "Hello, I’m in charge of modernising the customer service team. In my previous company, we had tools to track customer satisfaction. This was really important for customer service and the whole company. I haven’t seen anything like that here so far. Do you know if there are any existing tools or if it would be possible to create them?"

**Reaction:**
- Use the 5W+1H question.

### B- Business Need

**Dialogue 💬**
- **What:** In my previous company, we calculated an NPS score based on customer feedback. We had an overall figure and then detailed scores per area.
- **Why:** It is essential to proactively detect problems or drops in service quality, determine priorities, and evaluate the quality of work.
- **When:** Fairly quickly to create a roadmap for improving and structuring the customer service team.
- **Who:** The whole customer service team and the company director.
- **Where:** For customer satisfaction as a whole.
- **How:** Quickly add a survey to get customer feedback and create a dashboard.

**Business Needs:**
1. **Global NPS - High priority**
2. **NPS by Domain - Medium priority**
3. **NPS by Segment or Carrier - Low priority**

### C- Deliverable

**What graphs and charts?**
- **Global NPS:**
  - Scorecard
  - Pivot table with monthly evolution
  - Line chart with monthly evolution
- **NPS by Domain:**
  - Scorecard with current CSAT value for each domain
  - Pivot table with monthly evolution by domain
  - Line chart with monthly evolution by domain
- **NPS by Segment or Carrier:**
  - **NPS by Carrier:**
    - Pivot table with monthly evolution for delivery by carrier
    - Combo chart with monthly evolution for delivery by carrier and volume
  - **NPS by Customer Segment:**
    - Pivot table with monthly evolution by segment
    - Line chart with monthly evolution by segment
    - Pivot table with monthly evolution by domain and segment

### D- Data Modeling

**Data Needed:**
- Daily NPS value
- Daily NPS value by domain
- Carrier by order
- Customer segment for each customer

### E- Data Sources

**Steps and Data Sources:**

![Data Sources](data_sources_diagram.png)

## II- Implementation

### Need 1 - Global NPS - High Priority

**A- Import from Data Sources:**
- Duplicate the Department team page to create a NPS team page.
- Add NPS data from nps_global.csv.

**B- Create Data Table:**
- Add date_date column with date format.
- Calculate global NPS value in nps_global column.

**C- Create Deliverable - Visualization Page:**
- Add scorecard with NPS current value.
- Add pivot table with monthly NPS evolution.
- Add line chart with monthly NPS evolution.

**D- Presentation:**
- Mock presentation to customer service team.
- Add top KPIs and results to NPS team page.

### Need 2 - NPS by Domain - Medium Priority

**A- Import from Data Sources:**
- Add NPS by domain data from nps_domain.csv.

**B- Create Data Table:**
- Add CSAT columns in nps_global tab.
- Calculate CSAT by domain.

**C- Create Deliverable - Visualization Page:**
- Add CSAT by domain section in nps_deliverable tab.

**D- Presentation:**
- Mock presentation to customer service team.
- Incorporate feedback from Nicolas.

### Need 3 - NPS by Segment or Carrier - Low Priority

**A- Import from Data Sources:**
- Import orders data from transporter.csv and orders_nps.csv.

**B- Create Data Model:**
- Add carrier to nps_global tab.
- Calculate customer segment.

**C- Create Deliverable - Visualization Page:**
- Add sections for carrier and customer segment analysis in nps_deliverable tab.

**D- Presentation:**
- Mock presentation to customer service team.
- Incorporate feedback from Nicolas.

