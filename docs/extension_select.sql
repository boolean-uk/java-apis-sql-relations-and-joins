
--Show the title and director name for all films
SELECT title, persons.name
FROM films
JOIN persons ON directorId = persons.id;


--Show the title, director and star name for all films
SELECT films.title, pd.name AS Directors, ps.name AS Stars
FROM films
INNER JOIN directors ON films.directorid = directors.id
INNER JOIN stars ON films.starid = stars.id
INNER JOIN persons pd ON directors.personid = pd.id
INNER JOIN persons ps ON stars.personid = ps.id
;


--Show the title of films where the director is from the USA
SELECT films.title
FROM films
JOIN directors ON films.directorid = directors.id
JOIN persons ON directors.personid = persons.id
WHERE directors.country LIKE 'USA';

--Show only those films where the writer and the director are the same person
SELECT films.title
FROM films
JOIN directors ON films.directorid = directors.id
JOIN writers ON films.writerid = writers.id
WHERE directors.personid = writers.personid
;

--Show directors and film titles for films with a score of 8 or higher
SELECT pd.name AS Directors, films.title
FROM films
INNER JOIN directors ON films.directorid = directors.id
INNER JOIN persons pd ON directors.personid = pd.id
WHERE films.score >= 8
;


--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

-- Alphabetical order to the movies with rating less than 8
SELECT pd.name AS Directors, films.title
FROM films
INNER JOIN directors ON films.directorid = directors.id
INNER JOIN persons pd ON directors.personid = pd.id
WHERE films.score < 8
ORDER BY films.title ASC
;

-- Movies by director in alphabetical order
SELECT films.title, persons.name as Directors
FROM films
JOIN directors ON films.directorid = directors.id
JOIN persons ON directors.personid = persons.id
ORDER BY persons.name ASC
;

-- join all classes
SELECT films.title, ps.name AS Stars, pd.name AS Directors, pw.name AS Writers
FROM films
JOIN stars ON films.starid = stars.id
JOIN directors ON films.directorid = directors.id
JOIN writers ON films.writerid = writers.id
JOIN persons ps on stars.personid = ps.id
JOIN persons pd ON directors.personid = pd.id
JOIN persons pw ON writers.personid = pw.id
;

-- All drama movies
SELECT films.title, ps.name AS Stars, pd.name AS Directors, pw.name AS Writers
FROM films
JOIN stars ON films.starid = stars.id
JOIN directors ON films.directorid = directors.id
JOIN writers ON films.writerid = writers.id
JOIN persons ps on stars.personid = ps.id
JOIN persons pd ON directors.personid = pd.id
JOIN persons pw ON writers.personid = pw.id
WHERE films.genre LIKE 'Drama'
;


-- All actors born in the 40's
SELECT films.title, persons.name as Stars
FROM films
JOIN stars ON films.starid = stars.id
JOIN persons ON stars.personid = persons.id
WHERE stars.dob LIKE '%194%'
;