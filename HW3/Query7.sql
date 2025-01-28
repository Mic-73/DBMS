-- ----------------------------------------------
--  Query 7: 
--  Which company had the highest annual revenue and in what year?
-- ----------------------------------------------

select Company_Name, Order_Year, max(total_sales) as Highest_Revenue
from (
	select m.name as Company_Name, year(order_date) as Order_Year, sum(price * quantity_available) as Total_Sales
    from merchants m
    join sell using (mid)
    join contain using (pid)
    join orders using (oid)
    join place using (oid)
    group by m.name, year(order_date)
) as Yearly_Revenue
group by company_name, order_year
order by Highest_Revenue desc
limit 1;

select m.name as Company_Name, year(order_date) as Order_Year, sum(price * quantity_available) as Total_Sales
from merchants m
join sell using (mid)
join contain using (pid)
join orders using (oid)
join place using (oid)
group by m.name, year(order_date)
order by Total_Sales desc
limit 1;

desc place;
ALTER TABLE place MODIFY order_date DATE;
