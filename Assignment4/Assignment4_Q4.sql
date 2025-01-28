-- ---------------------------------------------------------
-- Query 4:
-- Which actor has appeared in the most English-language movies?
-- ---------------------------------------------------------

select a.actor_id, a.first_name, a.last_name, count(*) as Number_Of_Movies
from actor a
join film_actor fa using (actor_id)
join film f using (film_id)
where f.language_id = (select language_id 
						from language
                        where name = 'English')
group by a.actor_id
order by count(*) desc
limit 1;