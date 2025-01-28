-- ---------------------------------------------------------
-- Query 3:
-- Which customers have rented action but not comedy or classic movies?
-- ---------------------------------------------------------

select distinct cu.customer_id, cu.first_name, cu.last_name
from customer cu
where cu.customer_id in (select distinct cu.customer_id
						from customer cu
						join rental r using (customer_id)
						join inventory i using (inventory_id)
						join film f using (film_id)
						join film_category fc using (film_id)
						join category ca using (category_id)
						where ca.name = 'Action') 
						and cu.customer_id not in 
							(select distinct cu.customer_id
							from customer cu
							join rental r using (customer_id)
							join inventory i using (inventory_id)
							join film f using (film_id)
							join film_category fc using (film_id)
							join category ca using (category_id)
							where ca.name = 'Classics' or ca.name = 'Comedy')
group by cu.customer_id
order by cu.customer_id asc;