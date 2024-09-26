-- Show the title and director name for all films
SELECT title, name FROM film, director, person
WHERE film.director_id = director.id AND director.person_id = person.id;

-- Show the title, director and star name for all films
SELECT title, pd.name AS director, ps.name AS star 
FROM film
JOIN director ON director.id = film.director_id
JOIN star ON star.id = film.star_id
JOIN person AS pd ON pd.id = director.person_id
JOIN person AS ps ON ps.id = star.person_id;

-- Show the title of films where the director is from the USA
SELECT title FROM film, director
WHERE film.director_id = director.id AND director.country ILIKE 'USA';

-- Show only those films where the writer and the director are the same person
SELECT film.title, film.genre, film.year, film.score, person.name As writer_And_director FROM film
JOIN director ON film.director_id = director.id
JOIN writer ON film.writer_id = writer.id
JOIN person ON person.id = writer.person_id
WHERE writer.person_id = director.person_id;

-- Show directors and film titles for films with a score of 8 or higher
SELECT title, name FROM film
JOIN director ON film.director_id = director.id
JOIN person ON person.id = director.person_id
WHERE film.score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

-- Get film title, star name and writer name for films after 1980
SELECT title, ps.name AS star, pw.name AS writer FROM film
JOIN star ON film.star_id = star.id
JOIN writer ON film.writer_id = writer.id
JOIN person AS ps ON ps.id = star.person_id
JOIN person AS pw ON pw.id = writer.person_id
WHERE year > 1980;

-- Get film title and director name for Science Fiction films
SELECT title, name FROM film
JOIN director ON film.director_id = director.id
JOIN person ON person.id = director.person_id
WHERE film.genre ILIKE '%sci%';

-- Get all film titles with writer name, director name and star name
SELECT title, pw.name AS writer, pd.name AS director, ps.name AS star 
FROM film
JOIN writer ON film.writer_id = writer.id
JOIN director ON film.director_id = director.id
JOIN star ON film.star_id = star.id
JOIN person AS ps ON ps.id = star.person_id
JOIN person AS pw ON pw.id = writer.person_id
JOIN person AS pd ON pd.id = director.person_id;

-- GET film name and director name for films with score between 5 and 7
SELECT title, name FROM film
JOIN director ON film.director_id = director.id
JOIN person ON person.id = director.person_id
WHERE score BETWEEN 5 AND 7;

-- Get film with the highest score for each director's country, ordered by score DESC
SELECT country, MAX(score) FROM film
JOIN director ON film.director_id = director.id
GROUP BY country
ORDER BY MAX(score) DESC;
