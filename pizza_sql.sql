select * from pizza_sales;

select round(sum(total_price),2) AS total_revenue from pizza_sales;

select round(sum(total_price)/count(distinct order_id),2) AS avg_order_value from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

select count(distinct order_id) as Total_order from pizza_sales;

select cast(sum(quantity)/count(distinct order_id) as decimal(10,2)) as avg_pizza_per_order from pizza_sales;

desc pizza_sales;
select * from Pizza;

-- to convert into date datatype 
CREATE TABLE Pizza AS SELECT * FROM pizza_sales;
ALTER TABLE pizza_sales ADD COLUMN Ord_Date DATE;
UPDATE pizza_sales
SET order_date = REPLACE(order_date, '/', '-');

UPDATE pizza_sales
SET Ord_Date= STR_TO_DATE(order_date, '%d-%m-%Y');

ALTER TABLE pizza_sales DROP COLUMN order_date;
ALTER TABLE pizza_sales CHANGE COLUMN Ord_Date order_date DATE;

select dayname(order_date) as Day_name,count(distinct order_id) as Total_orders from pizza_sales 
group by dayofweek(order_date),dayname(order_date)
order by dayofweek(order_date);

select monthname(order_date) AS Month_name, count(distinct order_id) as Total_orders
from pizza_sales
group by monthname(order_date),month(order_date)
Order by month(order_date);

select pizza_category,round(sum(total_price),2)as total_sales,
round(sum(total_price)/(select sum(total_price) from pizza_sales)*100,2) 
as Total_sales_percentage from pizza_sales
group by pizza_category;

select pizza_category,round(sum(total_price),2)as total_sales,
round(sum(total_price)/(select sum(total_price) from pizza_sales where month(order_date)=1)*100,2) 
as Total_sales_percentage from pizza_sales
where month(order_date)=1
group by pizza_category;

select pizza_size,round(sum(total_price),2)as total_sales,
round(sum(total_price)/(select sum(total_price) from pizza_sales)*100,2) 
as Total_sales_percentage from pizza_sales
group by pizza_size;

select pizza_size,round(sum(total_price),2)as total_sales,
round(sum(total_price)/(select sum(total_price) from pizza_sales where quarter(order_date)=1)*100,2) 
as Total_sales_percentage from pizza_sales
where quarter(order_date)=1
group by pizza_size;

select pizza_name,sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by sum(total_price) desc
limit 5;
select pizza_name,round(sum(total_price),2) as total_revenue from pizza_sales
group by pizza_name
order by sum(total_price) 
limit 5;

select pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by sum(quantity) desc
limit 5;

select pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by sum(quantity) asc
limit 5;

select pizza_name,count(distinct order_id) as total_order from pizza_sales
group by pizza_name
order by count(distinct order_id) desc
limit 5;

select pizza_name,count(distinct order_id) as total_order from pizza_sales
group by pizza_name
order by count(distinct order_id) asc
limit 5;




