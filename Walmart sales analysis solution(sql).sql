
-----------------Genaric Question--------------------
-----#Q1.How many unique cities does the data have?-----
SELECT DISTINCT city AS unique_cities
FROM `walmart_sales.sales_walmart`
----#Q2.In which city is each branch?
SELECT DISTINCT branch, city
FROM walmart_sales.sales_walmart
ORDER BY branch;
-------------------Product--------------------------
--Q1.How many unique product lines does the data have?--
SELECT DISTINCT product_line AS unique_product_lines
FROM `walmart_sales.sales_walmart`
--Q2.What is the most common payment method?--
SELECT payment, COUNT(payment) AS payment_count
FROM `walmart_sales.sales_walmart`
GROUP BY payment
ORDER BY payment_count DESC
LIMIT 3;
--Q3.What is the most selling product line?---
SELECT product_line, SUM(quantity) AS total_quantity_sold
FROM `walmart_sales.sales_walmart`
GROUP BY product_line
ORDER BY total_quantity_sold DESC
LIMIT 3;
---Q4.What is the total revenue by month?—
SELECT 
    month_name AS month,
    SUM(total) AS total_revenue
FROM 
    `walmart_sales.sales_walmart`
GROUP BY 
    month_name
ORDER BY 
    month_name ;


--Q5.What month had the largest COGS?---
SELECT 
    month_name AS month,
    SUM(cogs) AS total_cogs
FROM 
    `walmart_sales.sales_walmart`
GROUP BY 
    month_name
ORDER BY 
    total_cogs DESC
LIMIT 3;

---Q6.What product line had the largest revenue?--
SELECT 
    product_line,
    SUM(total) AS total_revenue
FROM 
    `walmart_sales.sales_walmart`
GROUP BY 
    product_line
ORDER BY 
    total_revenue DESC
LIMIT 3;
--What is the city with the largest revenue?--
SELECT 
    city,
    SUM(total) AS total_revenue
FROM 
    `walmart_sales.sales_walmart`
GROUP BY 
    city
ORDER BY 
    total_revenue DESC
LIMIT 3;
--Q7.What product line had the largest VAT?--
SELECT
  product_line,
  AVG(Tax_5_) as avg_tax
FROM `walmart_sales.sales_walmart`
GROUP BY product_line
ORDER BY avg_tax DESC;
--Q8.Fetch each product line and add a column to those product line showing "Good", "Bad".--
-- Good if its greater than average sales--
WITH product_sales AS (
    SELECT 
        product_line,
        SUM(total) AS total_sales
    FROM 
        `walmart_sales.sales_walmart`
    GROUP BY 
        product_line
),
average_sales AS (
    SELECT 
        AVG(total_sales) AS avg_sales
    FROM 
        product_sales
)
SELECT 
    ps.product_line,
    ps.total_sales,
    CASE 
        WHEN ps.total_sales > avg.avg_sales THEN 'Good'
        ELSE 'Bad'
    END AS performance
FROM 
    product_sales ps,
    average_sales avg
ORDER BY 
    ps.product_line;
--Q9.Which branch sold more products than average product sold?--
SELECT 
	branch, 
    SUM(quantity) AS qnty
FROM `walmart_sales.sales_walmart`
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) 
FROM `walmart_sales.sales_walmart`);
--Q.10What is the most common product line by gender?--
WITH product_line_gender AS (
    SELECT 
        gender,
        product_line,
        SUM(quantity) AS total_quantity_sold
    FROM 
        `walmart_sales.sales_walmart`
    GROUP BY 
        gender, 
        product_line
),
ranked_product_lines AS (
    SELECT 
        gender,
        product_line,
        total_quantity_sold,
        RANK() OVER (PARTITION BY gender ORDER BY total_quantity_sold DESC) AS rank
    FROM 
        product_line_gender
)
SELECT 
    gender,
    product_line,
    total_quantity_sold
FROM 
    ranked_product_lines
WHERE 
    rank = 1;

--Q.12What is the average rating of each product line?--
SELECT 
    product_line,
    AVG(rating) AS average_rating
FROM 
    `walmart_sales.sales_walmart`
GROUP BY 
    product_line
ORDER BY 
    average_rating DESC;
------------------sales---------------------
--Q1. Number of sales made in each time of the day per weekday---
SELECT
    day_name,
    time_of_day,
    COUNT(*) AS number_of_sales
FROM
    `walmart_sales.sales_walmart`
GROUP BY
    day_name,
    time_of_day
ORDER BY
    day_name,
    time_of_day;
--Q.2.Which of the customer types brings the most revenue?--
SELECT
    customer_type,
    SUM(total) AS total_revenue
FROM
    `walmart_sales.sales_walmart`
GROUP BY
    customer_type
ORDER BY
    total_revenue DESC
LIMIT 2;
--Q.3.Which city has the largest tax percent/ VAT (Value Added Tax)?--
SELECT 
    city,
    SUM(total * tax_5_) AS total_vat
FROM 
    `walmart_sales.sales_walmart`
GROUP BY 
    city
ORDER BY 
    total_vat DESC
LIMIT 3;
---Q.4.Which customer type pays the most in VAT?--
SELECT
    customer_type,
    SUM(total * Tax_5_) AS total_vat_paid
FROM
    `walmart_sales.sales_walmart`
GROUP BY
    customer_type
ORDER BY
    total_vat_paid DESC
LIMIT 2
;
----------------------Customer---------------------------
--Q.1.How many unique customer types does the data have?
SELECT 
  DISTINCT customer_type AS unique_customer_types
FROM 
    `walmart_sales.sales_walmart`;
--Q.2.How many unique payment methods does the data have?--
SELECT 
    COUNT(DISTINCT payment) AS unique_payment_methods
FROM 
    `walmart_sales.sales_walmart`;
--Q.3.What is the most common customer type?--
SELECT 
    customer_type,
    COUNT(*) AS customer_count
FROM 
    `walmart_sales.sales_walmart`
GROUP BY 
    customer_type
ORDER BY 
    customer_count DESC
LIMIT 2;
--Q.4.Which customer type buys the most?--
SELECT 
    customer_type,
    SUM(quantity) AS total_quantity
FROM 
    `walmart_sales.sales_walmart`
GROUP BY 
    customer_type
ORDER BY 
    total_quantity DESC
LIMIT 2;
--Q.5.What is the gender of most of the customers?--
SELECT 
    gender,
    COUNT(*) AS customer_count
FROM 
    `walmart_sales.sales_walmart`
GROUP BY 
    gender
ORDER BY 
    customer_count DESC
LIMIT 2;
--Q.6.What is the gender distribution per branch?---
SELECT 
    branch,
    gender,
    COUNT(*) AS customer_count
FROM 
    `walmart_sales.sales_walmart`
GROUP BY 
    branch,
    gender
ORDER BY 
    branch,
    gender;
--Q.7.Which time of the day do customers give most ratings?--
SELECT
    time_of_day,
    COUNT(rating) AS total_ratings
FROM
    `walmart_sales.sales_walmart`
GROUP BY
    time_of_day
ORDER BY
    total_ratings DESC
LIMIT 3;
--Q.8.Which time of the day do customers give most ratings per branch?--
SELECT
    branch,
    time_of_day,
    COUNT(rating) AS total_ratings
FROM
    `walmart_sales.sales_walmart`
GROUP BY
    branch,
    time_of_day
ORDER BY
    branch,
    total_ratings DESC;
--Q.4.Which day fo the week has the best avg ratings?--
SELECT
    day_name,
    AVG(rating) AS average_rating
FROM
    `walmart_sales.sales_walmart`
GROUP BY
    day_name
ORDER BY
    average_rating DESC
LIMIT 7;
--Q.10.Which day of the week has the best average ratings per branch?--
WITH RankedRatings AS (
    SELECT
        branch,
        day_name,
        AVG(rating) AS average_rating,
        RANK() OVER (PARTITION BY branch ORDER BY AVG(rating) DESC) AS rating_rank
    FROM
        `walmart_sales.sales_walmart`
    GROUP BY
        branch,
        day_name
)
SELECT
    branch,
    day_name,
    average_rating
FROM
    RankedRatings
WHERE
    rating_rank = 1;



