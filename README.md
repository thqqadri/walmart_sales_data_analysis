# Walmart_sales_data_analysis
This project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of of different products, customer behaviour. 
The aims is to study how sales strategies can be improved and optimized. The dataset was obtained from the https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting
# Purposes Of The Project
The primary objective of this project is to delve into Walmart's sales data, with the goal of comprehending the various elements that influence the sales performance across its various branches.
# Analysis List

1. Product Examination
   - Execute an examination on the dataset to comprehend the diversity of product lines, identify the top-performing product lines, and pinpoint the product lines that necessitate enhancement.

2. Sales Examination
   - This examination is designed to decipher the sales patterns of products. The outcome of this can assist us in assessing the efficacy of each sales strategy implemented by the business and determining what alterations are required to boost sales.

3. Customer Examination
   - This examination is intended to reveal the various customer segments, purchasing trends, and the profitability of each customer segment.
   
# Methodology Employed #

1. Data Wrangling: This initial step involves scrutinizing the data to identify and handle NULL or missing values. Replacement techniques are employed to substitute these missing or NULL values.

2. Database Construction: A database is built to house the data.

3. Table Creation and Data Insertion: A table is created and data is inserted into it. Columns with null values are selected. As we have set NOT NULL for each field during table creation, our database is devoid of null values.

4. Feature Engineering: This process aids in the generation of new columns from existing ones, providing more depth to our analysis.
   - A new column, `time_of_day`, is added to provide insights into sales trends during Morning, Afternoon, and Evening. This helps answer the question of when most sales are made.
   - Another new column, `day_name`, is added that contains the extracted days of the week on which the transactions occurred (Mon, Tue, Wed, Thur, Fri). This helps determine the busiest days of the week for each branch.
   - A third new column, `month_name`, is added that contains the extracted months of the year in which the transactions took place (Jan, Feb, Mar). This helps identify the months with the highest sales and profit.

5. Exploratory Data Analysis (EDA): EDA is performed to answer the questions and objectives listed for this project.

6.Conclusion:
# Revenue And Profit calculation #
$ COGS = unitsPrice * quantity $

$ VAT = 5% * COGS $

 is added to the 
 and this is what is billed to the customer.

$ total(gross_sales) = VAT + COGS $

$ grossProfit(grossIncome) = total(gross_sales) - COGS $

Gross Margin is gross profit expressed in percentage of the total(gross profit/revenue)

$ \text{Gross Margin} = \frac{\text{gross income}}{\text{total revenue}} $

