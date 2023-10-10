-- ----------------------------------------------
--  Query 3: 
--  How many customers bought SATA drives but not any routers?
-- ----------------------------------------------

select count(distinct c.cid) as Number_Of_Customers
from customers c
join place using (cid)
join contain using (oid)
join products p using (pid)
left join (
	select distinct c2.cid
    from customers c2
    join place pl2 using (cid)
    join contain co2 using (oid)
    join products p2 using (pid)
    where p2.name = 'Router'
) as routers using (cid)
where p.description like '%SATA%'
and routers.cid is null;