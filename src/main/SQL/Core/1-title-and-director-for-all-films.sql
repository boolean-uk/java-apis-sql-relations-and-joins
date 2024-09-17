SELECT title AS film_title, director.name AS director_name
FROM film
JOIN director
ON film.director_id = director.id