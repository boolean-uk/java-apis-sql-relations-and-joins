-- Show the title and director name for all films
SELECT film.title, director.name AS director_name
from film
         INNER JOIN director
                    ON film.director_id = director.id

-- Show the title, director and star name for all films
SELECT film.title, director.name AS director_name, star.name AS star_name
FROM film
         INNER JOIN director ON film.director_id = director.id
         INNER JOIN star ON film.star_id = star.id;

-- Show the title of films where the director is from the USA
SELECT film.title, director.country AS director_country
from film
         INNER JOIN director
                    ON film.director_id = director.id
WHERE director.country = 'USA';

-- Show only those films where the writer and the director are the same person

SELECT film.title, director.name AS director_name, writer.name AS writer_name
FROM film
         INNER JOIN director ON film.director_id = director.id
         INNER JOIN writer ON film.star_id = writer.id
WHERE director.name = writer.name

-- Show directors and film titles for films with a score of 8 or higher

SELECT film.title, director.name AS director_name, writer.name AS writer_name
FROM film
         INNER JOIN director ON film.director_id = director.id
         INNER JOIN writer ON film.star_id = writer.id
WHERE director.name = writer.name

--Make at least 5 more queries to demonstrate your understanding of joins, and other
-- relationships between tables

SELECT film.title, director.name AS director_name, star.name AS star_name
FROM film
         INNER JOIN director ON film.director_id = director.id
         INNER JOIN star ON film.star_id = star.id
WHERE film.genre = 'Drama';

SELECT film.title, director.name AS director_name, star.name AS star_name
FROM film
         INNER JOIN director ON film.director_id = director.id
         INNER JOIN star ON film.star_id = star.id;

SELECT film.title, writer.name AS writer_name
FROM film
         INNER JOIN writer ON film.writer_id = writer.id
WHERE writer.name LIKE '%George%';

SELECT film.title, director.name AS director_name, film.score
FROM film
         INNER JOIN director ON film.director_id = director.id
ORDER BY film.score DESC;

SELECT film.title, director.name AS director_name, star.name AS star_name, film.score
FROM film
         INNER JOIN director ON film.director_id = director.id
         INNER JOIN star ON film.star_id = star.id
WHERE film.genre = 'Science Fiction'
ORDER BY film.score ASC;