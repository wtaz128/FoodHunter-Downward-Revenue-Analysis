#Find the time scope of the dataset
#select max(order_date), min(order_date) from orders;

/*Find order quantity amd revenue changes in months/
/*select month(order_date) as OrderMonth,
 count(order_id) as OrderQuantity,
 sum(final_price) as TotalRevenue
 from orders
 group by month(order_date)
 order by OrderQuantity desc;/
 
/* 1.Time-based: Did day have any impact on sales?*/
/*select sum(final_price) as TotalRevenue, count(order_id) as OrderQuantity,
case
when dayofweek(order_date) =1 then 'weekend'
when dayofweek(order_date) =7 then 'weekend'
else 'weekday'
end as WDays
from orders group by WDays;*/

/* How weekend factors changed and impacts revenue by month */
/*select *,
round((((total_revenue-prev_revenue)/prev_revenue)*100),0) as percentage_change
from
(select * ,
lag(total_revenue) over(partition by day_of_week) as prev_revenue
from
(select case
when dayofweek(order_date) between 2 and 6 then 'weekdays'
when dayofweek(order_date) in (1,7) then 'weekends'
end as day_of_week,
month(order_date) as month,
round(sum(final_price)) as total_revenue
from orders
group by day_of_week, month
order by day_of_week) t1) t2;*/

/* How day segment impact revenues */
/*SELECT
order_month,
time_segment,
round(total_revenue,0),
round(((total_revenue-(lag(total_revenue) over(partition by order_month)))/(lag(total_revenue) over(partition by order_month)))*100,1) as "percent_change"
from
(
SELECT
MONTH(order_date) AS order_month,
CASE
WHEN HOUR(order_time) BETWEEN 6 AND 11 THEN '6AM-12PM'
WHEN HOUR(order_time) BETWEEN 12 AND 17 THEN '12PM-6PM'
WHEN HOUR(order_time) BETWEEN 18 AND 23 THEN '6PM-12AM'
ELSE '12AM-6AM'
END AS time_segment,
SUM(final_price) AS total_revenue
FROM orders
GROUP BY order_month, time_segment
ORDER BY order_month, total_revenue DESC)
t1;*/


/* 2.Delivery Partner Effciency */
/* average delivery time changes over months */
/*select month(order_date) as month,
avg(timestampdiff(minute, order_time, delivered_time)) as avg_time
from orders
group by month;*/

/* rank the top 5 and last 5 drivers performence */
/*select * from
(
select month, driver_id, avg_time,
rank() over(partition by month order by avg_time) as driver_rank
from(
select month(order_date) as month,
avg(timestampdiff(minute, order_time, delivered_time)) as avg_time
from orders
group by month;
) as t1
) t2
where driver_id between 1 and 5; */

/* 3.Food Preferences & Food Quality*/
/*select 
month(t3.order_date) as month,
coalesce(t2.food_type_new, 'unknown') as food_type,
sum(t1.quantity) as total_quantity
from orders t3
left join orders_items t1 on t3.order_id = t1.order_id
left join (
select item_id,
case
when food_type like 'veg%' then 'veg'
else 'non-veg'
end as food_type_new
from food_items)t2 on t1.item_id = t2.item_id
group by 
month(t3.order_date),
coalesce(t2.food_type_new, 'unknown')
order by month, food_type;*/

/*select month(os.order_date) as month, r.restaurant_name, r.restaurant_id, r.cuisine, sum(quantity) as item_quantity
from restaurants r
left join food_items fi on r.restaurant_id = fi.restaurant_id
left join orders_items oi on fi.item_id = oi.item_id
left join orders os on oi.order_id  = os.order_id
group by month, r.restaurant_id
having item_quantity is null
order by item_quantity;*/



 /* 4.Marketing: Did discountd have any impact on sales?*/
 /*select month(order_date) as month,
 round(sum(discount)) as TotalDiscount,
 round(sum(final_price),0) as TotalRevenue,
 sum(discount)/sum(final_price) as Discount_Sales_Ratio,
 count(order_id) as OrderCount
 from orders
 group by month
 order by month;*/
 
 /* 5.Customer Review/Feedback */
 /*select month, rating_level,
 sum(order_count) as rating_distribution
 from
 (
 select *,
 case
 when avg_rating >4.5 then 'good'
 when avg_rating between 3.5 and 4.5 then 'medium'
 else 'bad'
 end as rating_level
 from                   
 (
 select month(o.order_date) as month,
 c.customer_id,
 count(o.order_id) as order_count,
 round(avg(o.order_rating),1) as avg_rating
 from customers c right join orders o on c.customer_id = o.customer_id
 group by month, c.customer_id) t1
 )t2
 group by month, rating_level
 order by month, rating_level;*/
 