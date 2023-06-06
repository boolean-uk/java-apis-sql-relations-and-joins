SELECT title AS film_title, release_year, score
FROM film
JOIN director
ON film.director_id = director.id
JOIN writer
ON film.writer_id = writer.id
WHERE writer.name = director.name
-- another way:
SELECT title AS film_title, release_year, score
FROM film
JOIN director
ON film.director_id = director.id
JOIN writer
ON film.writer_id = writer.id AND director.name = writer.name