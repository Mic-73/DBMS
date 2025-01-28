-- ---------------------------------------------------------
-- Query 5:
-- How many distinct movies were rented for exactly 10 days from the store where Mike works?
-- ---------------------------------------------------------

select count(distinct f.film_id) as Number_Of_Movies
from rental r
join inventory i using (inventory_id)
join film f using (film_id)
join staff sta using (staff_id)
where sta.first_name = 'Mike'
and datediff(r.return_date, r.rental_date) = 10;