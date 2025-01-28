-- ---------------------------------------------------------
-- Query 2:
-- Which categories have the longest and shortest average film lengths?
-- ---------------------------------------------------------

WITH Average_Film_Length AS (
    SELECT c.name AS category_name, AVG(f.length) AS average_length
    FROM category c
    JOIN film_category fc using (category_id)
    JOIN film f using (film_id)
    GROUP BY category_name
)
SELECT category_name, average_length
FROM Average_Film_Length
WHERE average_length = (SELECT MAX(average_length) FROM Average_Film_Length)
   OR average_length = (SELECT MIN(average_length) FROM Average_Film_Length);

