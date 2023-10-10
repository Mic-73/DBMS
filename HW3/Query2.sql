-- ----------------------------------------------
--  Query 2: 
--  List names and descriptions of products that are not sold.
-- ----------------------------------------------

select p.name as Product_Name, description as Product_Description
from products p
left join sell s using (pid)
where s.pid is null;