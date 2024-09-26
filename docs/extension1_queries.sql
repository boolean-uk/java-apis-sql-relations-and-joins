SELECT film.title, people.name
FROM film, people
WHERE film.people_id = people.id
AND people.role = 'director'

//
SELECT film.title, people.name
FROM film, director, star
WHERE film.director_id = director.id
AND film.star_id = star.id
//

SELECT film.title, people.name
FROM film, people
WHERE film.people_id = people.id
AND people.role = 'director'
AND people.country = 'USA'


SELECT film.title
FROM film
JOIN director
ON film.director_id = director.id
JOIN writer
ON film.writer_id = writer.id
WHERE writer.name = director.name


SELECT film.title, director.name
FROM film
JOIN director
ON film.director_id = director.id
WHERE score > 8


SELECT film.title, star.name
FROM film
JOIN star
ON film.star_id = star.id
WHERE genre = 'Science Fiction'


SELECT film.title, star.name, director.country
FROM film
JOIN star
ON film.star_id = star.id
JOIN director
ON film.director_id = director.id
WHERE genre = 'Historical'


SELECT film.title, film.score, star.name, director.country
FROM film
JOIN star
ON film.star_id = star.id
JOIN director
ON film.director_id = director.id
WHERE score > 6


SELECT film.title, film.score, director.name, director.country
FROM film
JOIN director
ON film.director_id = director.id
WHERE score > 7
AND genre = 'Historical'


SELECT film.title, film.score, director.name, director.country
FROM film
JOIN director
ON film.director_id = director.id
WHERE score > 7
AND year < 2000