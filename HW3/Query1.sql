-- ----------------------------------------------
--  Query 1: 
--  List names and sellers of products that are no longer available (quantity=0)
-- ----------------------------------------------

select p.name as Product_Name, m.name as Seller_name
from products p
join sell s using (pid)
join merchants m using (mid)
where s.quantity_available = 0;




