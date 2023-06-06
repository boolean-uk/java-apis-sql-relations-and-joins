SELECT title AS film_title, person.name AS director_name, person.name AS star_name
FROM film
JOIN director
ON film.director_id = director.id
JOIN star
ON film.star_id = star.id
JOIN person AS ps
ON ps.id = director.person_id
JOIN person
On person.id = star.person_id
-- here we rename the person once because SQL will give an error.