-- ----------------------------------------------
--  Query 9: 
--  What is the best sold ($) category for each company?
-- ----------------------------------------------

select m.name as Company_Name, p.Category, sum(price * quantity_available + shipping_cost) as Total_Sales
from merchants m
join sell using (mid)
join products p using (pid)
join contain using (pid)
join orders using (oid)
join place using (oid)
group by m.name, p.category
having sum(price * quantity_available + shipping_cost) = (
	select max(Total_Sales)
    from (
		select m.name as Company_Name, p.category, sum(price * quantity_available + shipping_cost) as Total_Sales
        from merchants m
		join sell using (mid)
		join products p using (pid)
		join contain using (pid)
		join orders using (oid)
		join place using (oid)
		group by m.name, p.category
	) as Company_Category_Sales
    where Company_Category_Sales.company_name = m.name
);
    