-- ----------------------------------------------
--  Query 4: 
--  HP has a 20% sale on all its Networking products.
-- ----------------------------------------------

update sell 
join products using (pid)
join merchants m using (mid)
set price = price - (price * 0.2)
where m.name = 'HP' and category = 'Networking';

select *
from sell;