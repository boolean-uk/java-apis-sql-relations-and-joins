SELECT title AS film_title, director.name AS director_name, star.name AS star_name
FROM film
JOIN director
ON film.director_id = director.id
JOIN star
ON film.star_id = star.id