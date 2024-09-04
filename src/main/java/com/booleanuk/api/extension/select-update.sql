SELECT film.title, director.name AS director_name
FROM film
         INNER JOIN people AS director ON film.director_id = director.id;


SELECT film.title, director.name AS director_name, star.name AS star_name
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
         INNER JOIN people AS star ON film.star_id = star.id;


SELECT film.title, director.country AS director_country
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
WHERE director.country = 'USA';


SELECT film.title, director.name AS director_name, writer.name AS writer_name
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
         INNER JOIN people AS writer ON film.writer_id = writer.id
WHERE director.id = writer.id;

SELECT film.title, director.name AS director_name
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
WHERE film.score >= 8;

SELECT film.title, writer.name AS writer_name
FROM film
         INNER JOIN people AS writer ON film.writer_id = writer.id
WHERE writer.name LIKE '%George%';


SELECT film.title, director.name AS director_name, film.score
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
ORDER BY film.score DESC;


SELECT film.title, director.name AS director_name, star.name AS star_name, film.score
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
         INNER JOIN people AS star ON film.star_id = star.id
WHERE film.genre = 'Science Fiction'
ORDER BY film.score ASC;


SELECT film.title, director.name AS director_name, star.name AS star_name
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
         INNER JOIN people AS star ON film.star_id = star.id
WHERE film.genre = 'Drama';


SELECT film.title, star.name AS star_name
FROM film
         INNER JOIN people AS star ON film.star_id = star.id;



SELECT film.title, director.name AS director_name, star.name AS star_name
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
         INNER JOIN people AS star ON film.star_id = star.id;


SELECT film.title, director.country AS director_country
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
WHERE director.country = 'USA';


SELECT film.title, director.name AS director_name, writer.name AS writer_name
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
         INNER JOIN people AS writer ON film.writer_id = writer.id
WHERE director.id = writer.id;

SELECT film.title, director.name AS director_name
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
WHERE film.score >= 8;

SELECT film.title, writer.name AS writer_name
FROM film
         INNER JOIN people AS writer ON film.writer_id = writer.id
WHERE writer.name LIKE '%George%';


SELECT film.title, director.name AS director_name, film.score
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
ORDER BY film.score DESC;


SELECT film.title, director.name AS director_name, star.name AS star_name, film.score
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
         INNER JOIN people AS star ON film.star_id = star.id
WHERE film.genre = 'Science Fiction'
ORDER BY film.score ASC;


SELECT film.title, director.name AS director_name, star.name AS star_name
FROM film
         INNER JOIN people AS director ON film.director_id = director.id
         INNER JOIN people AS star ON film.star_id = star.id
WHERE film.genre = 'Drama';


SELECT film.title, star.name AS star_name
FROM film
         INNER JOIN people AS star ON film.star_id = star.id;
