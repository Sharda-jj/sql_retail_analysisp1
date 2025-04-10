
#how many sales we have?
select 
    count(*) AS total_sales
   from retail_sales 
-- how many unique customers we have

SELECT
    COUNT(DISTINCT customer_id) AS total_sales
 FROM retail_sales 
 SELECT 
    DISTINCT category 
    FROM retail_sales 
    
-- Data anaylis and business key problems and asnwers
-- Q1.Write a SQL query to retrive all columns for sales made on '2022-11-05'
SELECT *
FROM retail_sales 
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
select 
    *
from retail_sales 
where category = 'Clothing'
 and 
DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
and
 quantity >= 4
 
 -- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
 
 select 
      category,
      SUM(total_sale) AS net_sale,
      COUNT(*) AS total_orders
from retail_sales 
group by 1

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select
  ROUND (AVG(age),2)
from retail_sales 
where category = 'Beauty'
   
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
   
   select *
   from retail_sales 
   where  total_sale > '1000'
   
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category

select 
     category,
     gender,
COUNT(*) AS  total_trans
from retail_sales
group by
     category,
     gender
order by 1

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select 
    sale_year,
    sale_month,
    avg_sale
 from 
   (select 
    YEAR (sale_date) AS sale_year,
    MONTH (sale_date) AS sale_month,
    ROUND(AVG (total_sale),2) AS avg_sale,
    RANK() OVER (PARTITION BY (YEAR (sale_date)) ORDER BY AVG (total_sale) DESC) AS `rank`
    from retail_sales
     group by 1,2) AS T1 
where `rank` = 1;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select 
   customer_id,
 SUM(total_sale) AS total_sales
 from retail_sales
 group by 1 
 order by 2 DESC
limit 5

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select
	category,
   COUNT(DISTINCT customer_id) AS unique_cs
from retail_sales
 group by 1 
    
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

-- END PROJECT