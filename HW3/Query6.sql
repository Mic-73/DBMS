-- ----------------------------------------------
--  Query 6: 
--  List the annual total sales for each company (sorted by company and year):
-- ----------------------------------------------

select m.name as Company_Name, year(order_date) as Order_Year, sum(price * quantity_available + shipping_cost) as Total_Sales
from merchants m
join sell using (mid)
join products using (pid)
join contain using (pid)
join orders using (oid)
join place using (oid)
group by m.name, Order_Year
order by m.name asc, Order_Year asc;