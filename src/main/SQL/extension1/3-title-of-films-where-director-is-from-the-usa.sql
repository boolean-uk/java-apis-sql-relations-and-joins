SELECT title AS film_title
FROM film
JOIN director
ON film.director_id = director.id
WHERE director.country = 'USA'
-- is the same