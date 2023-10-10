-- ----------------------------------------------
--  Query 8: 
--  On average, what was the cheapest shipping method used ever?
-- ----------------------------------------------

select Shipping_Method, avg(shipping_cost) as Average_Shipping_Cost
from orders
group by shipping_method 
order by Average_Shipping_Cost asc;
