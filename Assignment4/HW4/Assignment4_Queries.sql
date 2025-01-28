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
-- Selecting category name and avergae film length
-- Grouping and ordering by category name in ascending order so that it is alphabetical


-- ---------------------------------------------------------
-- Query 2:
-- Which categories have the longest and shortest average film lengths?
-- ---------------------------------------------------------

select Category_Name, Average_Length
from (
    select c.name as category_name, avg(f.length) as average_length
    from category c
    join film_category fc using (category_id)
    join film f using (film_id)
    group by category_name
) as subquery
where average_length = (
	select max(subquery.average_length) 
	from (
		select c1.name as category_name, avg(f1.length) as average_length 
		from category c1 
        join film_category fc1 using (category_id) 
        join film f1 using (film_id) 
        group by category_name
	) as subquery
)
or average_length = (
	SELECT min(subquery.average_length) 
    FROM (
		select c2.name as category_name, avg(f2.length) as average_length 
        from category c2 
        join film_category fc2 using (category_id) 
        join film f2 using (film_id) 
        group by category_name
	) as subquery
);
-- First selects the category name and its average film length
-- It selects this from a subquery that finds the average film length in each category
-- Condition statment where the average film length selected must be the highest or lowest average film lengths
-- 	Finds the categories with the highest and lowest average film lengths within the subquery


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
						 where ca.name = 'Action'
                         ) 
						 and cu.customer_id not in 
							(select distinct cu.customer_id
							 from customer cu
							 join rental r using (customer_id)
							 join inventory i using (inventory_id)
							 join film f using (film_id)
							 join film_category fc using (film_id)
							 join category ca using (category_id)
							 where ca.name = 'Classics' or ca.name = 'Comedy'
                             )
group by cu.customer_id
order by cu.customer_id asc;
-- Selects customer's distinct id's so they only appear once, their first names, and their last names
-- Condition statement where they rented Action movies but not Comedy and Classic movies as well
--  Finds this by having a subquery search for customer ids with the category 'Action' by joing the required tables
--  Also searches for customer ids with the categories 'Classics' or 'Comedy' and excludes them from the final result
-- Groups and orders the customers by their distinct ids in ascending order


-- ---------------------------------------------------------
-- Query 4:
-- Which actor has appeared in the most English-language movies?
-- ---------------------------------------------------------

select a.actor_id, a.first_name, a.last_name, count(*) as Number_Of_English_Movies
from actor a
join film_actor fa using (actor_id)
join film f using (film_id)
where f.language_id = (select language_id 
					   from language
					   where name = 'English')
group by a.actor_id
order by count(*) desc
limit 1;
-- Selecting the id and name of the actor and number of movies the actor has been in
-- Condition statement that selects only the movies that were in the English languge
-- Grouping by the actor's ids 
-- Ordering by number of English-language movies they appeared in
-- Limited that order by 1 so that only the highest value in number of movies shows update


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
-- Selects the number of distinct movies
-- Uses the condition of the staff's first name being Mike and
-- Uses the condition of the movie being rented exactly 10
-- Uses the DATEDIFF function between the return and rental dates for the second condition


-- ---------------------------------------------------------
-- Query 6:
-- Alphabetically list actors who appeared in the movie with the largest cast of actors.
-- ---------------------------------------------------------

SELECT a.first_name, a.last_name, a.actor_id
FROM actor a
join film_actor fa using (actor_id)
WHERE fa.film_id = (
    SELECT fa.film_id
    FROM film_actor fa
    GROUP BY fa.film_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
ORDER BY a.first_name asc;
-- Selects the actor's first name, last name, and id
-- Condition where the actors must be in the film with the largest number of actors
-- 	Finds the specific film by selecting how many times each film_id appears in film_actor table
-- 	Orders that search by the number of times each film_id appears in descending order and limits that by 1
--  This finds the movie with the largest number of actors
-- The final result is ordered by the first name of the actor so that it is alphabetically
-- It lists all the actors that are found within the movie the subquery finds