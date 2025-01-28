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