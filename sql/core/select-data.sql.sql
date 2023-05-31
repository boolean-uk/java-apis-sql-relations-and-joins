-- Show the title and director name for all films
SELECT title, name FROM film, director
WHERE film.director_id = director.id;

-- Show the title, director and star name for all films
SELECT title, director.name AS director, star.name As star 
FROM film, director, star
WHERE film.director_id = director.id AND film.star_id = star.id;

-- Show the title of films where the director is from the USA
SELECT title FROM film, director
WHERE film.director_id = director.id AND director.country ILIKE 'USA';

-- Show only those films where the writer and the director are the same person
SELECT film.title, film.genre, film.year, film.score, writer.name As writer_And_director FROM film
JOIN director ON film.director_id = director.id
JOIN writer ON film.writer_id = writer.id
WHERE writer.name = director.name;

-- Show directors and film titles for films with a score of 8 or higher
SELECT title, name FROM film
JOIN director ON film.director_id = director.id
WHERE film.score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

-- Get film title, star name and writer name for films after 1980
SELECT title, star.name, writer.name FROM film
JOIN star ON film.star_id = star.id
JOIN writer ON film.writer_id = writer.id
WHERE year > 1980;

-- Get film title and director name for Science Fiction films
SELECT title, name FROM film
JOIN director ON film.director_id = director.id
WHERE film.genre ILIKE '%sci%';

-- Get all film titles with writer name, director name and star name
SELECT title, writer.name AS writer, director.name AS director, star.name AS star 
FROM film
JOIN writer ON film.writer_id = writer.id
JOIN director ON film.director_id = director.id
JOIN star ON film.star_id = star.id;

-- GET film name and director name for films with score between 5 and 7
SELECT title, name FROM film
JOIN director ON film.director_id = director.id
WHERE score BETWEEN 5 AND 7;

-- Get film with the highest score for each director's country, ordered by score DESC
SELECT country, MAX(score) FROM film
JOIN director ON film.director_id = director.id
GROUP BY country
ORDER BY MAX(score) DESC;
