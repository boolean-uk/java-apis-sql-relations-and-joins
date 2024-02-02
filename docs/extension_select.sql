
--Show the title and director name for all films
SELECT title, name
FROM films
JOIN directors ON films.directorid = directors.id;

SELECT films.title, directors.name
FROM films, directors
WHERE films.directorid = directors.id;

--Show the title, director and star name for all films
SELECT films.title, directors.name, stars.name
FROM films, directors, stars
WHERE films.directorid = directors.id
AND films.starid = stars.id;


--Show the title of films where the director is from the USA
SELECT films.title
FROM films
JOIN directors ON films.directorid = directors.id
WHERE directors.country LIKE 'USA';

--Show only those films where the writer and the director are the same person
SELECT films.title
FROM films
JOIN directors ON films.directorid = directors.id
JOIN writers ON films.writerid = writers.id
WHERE directors.name = writers.name
;

--Show directors and film titles for films with a score of 8 or higher
SELECT directors.name, films.title
FROM films
JOIN directors ON films.directorid = directors.id
WHERE films.score >= 8
;


--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

-- Alphabetical order to the movies with rating less than 8
SELECT directors.name, films.title
FROM films
JOIN directors ON films.directorid = directors.id
WHERE films.score < 8
ORDER BY films.title ASC
;

-- Movies by director in alphabetical order
SELECT films.title, directors.name
FROM films
JOIN directors ON films.directorid = directors.id
ORDER BY directors.name ASC
;

-- join all classes
SELECT films.title, stars.name, directors.name, writers.name
FROM films
JOIN stars ON films.starid = stars.id
JOIN directors ON films.directorid = directors.id
JOIN writers ON films.writerid = writers.id
;

-- All drama movies
SELECT films.title, stars.name, directors.name, writers.name
FROM films
JOIN stars ON films.starid = stars.id
JOIN directors ON films.directorid = directors.id
JOIN writers ON films.writerid = writers.id
WHERE films.genre LIKE 'Drama'
;


-- All actors born in the 40's
SELECT films.title, stars.name
FROM films
JOIN stars ON films.starid = stars.id
JOIN directors ON films.directorid = directors.id
JOIN writers ON films.writerid = writers.id
WHERE films.genre LIKE 'Drama'
;

SELECT films.title, stars.name
FROM films
JOIN stars ON films.starid = stars.id
WHERE stars.dob LIKE '%194%'
;