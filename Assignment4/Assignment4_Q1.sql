-- ---------------------------------------------------------
-- Query 1:
-- What is the average length of films in each category? List the results in alphabetic order of categories.
-- ---------------------------------------------------------

select c.name, avg(f.length) as Average_Length
from category c
join film_category fc using(category_id)
join film f using(film_id)
group by c.name
order by c.name asc;

