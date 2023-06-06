--Show the title and director name for all films
SELECT title, directors.name
FROM films
JOIN directors ON director_id = directors.id;

--Show the title, director and star name for all films
SELECT
title, directors.name AS director, stars.name AS star
FROM films
JOIN directors ON director_id = directors.id
JOIN stars on stars.id= star_id;

--Show the title of films where the director is from the USA
SELECT title
FROM films
JOIN directors ON director_id = directors.id
WHERE directors.country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT title
FROM films
JOIN directors ON director_id = directors.id
JOIN writers ON writer_id = writers.id
WHERE writers.name = directors.name;

--Show directors and film titles for films with a score of 8 or higher
SELECT directors.name AS director, title
FROM films
JOIN directors ON director_id = directors.id
WHERE score >= 8;

--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables

--return title, writer, director country for films that the director's country starts from 'U'
SELECT title, writers.name AS writer, directors.country AS director_country
FROM films
JOIN directors ON director_id = directors.id
JOIN writers ON writer_id = writers.id
WHERE directors.country LIKE 'U%';
