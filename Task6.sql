use Projects;
select * from orders;

-- extract month
select extract(month from `order date`) as month from orders group by month order by month;

-- month wise sales
select extract(month from `Order Date`) as month, count(`order id`) as total_orders, round(sum(sales)) as revenue 
from orders  group by month order by month;

-- year wise sales
select year(`order date`) as year,round(sum(`sales`)) as sales from orders group by year order by year;

-- DISTINCT 
select count(distinct order_id) as total_orders from orders;

-- sorting and grouping
select Customer_ID, Customer_Name, sum(sales) as total_sales from orders group by Customer_ID, Customer_Name order by total_sales desc;

select Category, sum(Profit) as total_profit from orders group by category order by total_profit desc;

select * from orders where profit <0; 

-- Aggregation function 
select sum(sales) as total_sales from orders;
select count(distinct order_id) as total_orders from orders;
select round(avg(`profit`),2) as Profit from orders;

-- limit
select * from orders where region="south" order by sales asc limit 10;
select * from orders where `sales` > (select avg(`sales`) from orders) order by sales desc limit 10; 


SELECT
    EXTRACT(YEAR FROM CAST(`Order Date` AS DATE)) AS year,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY year
ORDER BY year;
