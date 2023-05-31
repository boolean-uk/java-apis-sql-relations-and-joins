SELECT title AS film_title, person.name AS director_name
FROM film
JOIN director
ON film.director_id = director.id
JOIN person
ON director.person_id = person.id
WHERE film.score>=8