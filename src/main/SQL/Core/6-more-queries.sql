--will write 5 more queries here

--how  CROSS join works
SELECT COUNT(*)
FROM film, director, writer,star

--How INNER JOIN works
SELECT COUNT(*)
FROM film
JOIN director
ON film.director_id = director.id
JOIN star
ON film.star_id = star.id
JOIN writer
ON film.writer_id = writer.id


-- Films whose director is called James
SELECT title AS movie_title,director.name AS Director
FROM film
JOIN director
ON film.director_id = director.id
WHERE director.name LIKE '%James%'

-- Films and info about director with bad score (less than or equal to 6
SELECT title AS movie_title,director.name AS Director
FROM film
JOIN director
ON film.director_id = director.id
WHERE film.score <=6


-- Science Fiction films with the same director and writer
SELECT title AS film_title, release_year, score
FROM film
JOIN director
ON film.director_id = director.id
JOIN writer
ON film.writer_id = writer.id
WHERE writer.name = director.name AND film.genre = 'Science Fiction'