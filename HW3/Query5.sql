-- ----------------------------------------------
--  Query 5: 
--  What did Uriel Whitney order from Acer? (make sure to at least retrieve product names and prices).
-- ----------------------------------------------

select c.fullname, m.name, p.name as Product_Name, price
from customers c
join place using (cid)
join orders using (oid)
join contain using (oid)
join products p using (pid)
join sell using (pid)
join merchants m using (mid)
where fullname = 'Uriel Whitney' and m. name = 'Acer';