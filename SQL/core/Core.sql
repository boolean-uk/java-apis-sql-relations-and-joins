-- Show the title and director name for all films
SELECT films.title AS title, directors.name AS director
FROM films
    JOIN directors
        ON films.director_id = directors.id;

-- Show the title, director and star name for all films
WITH films_and_directors AS (
    SELECT films.title AS title, directors.name AS director, star_id AS star_id
    FROM films
    JOIN directors
        ON films.director_id = directors.id
)
SELECT title, director, name as star
    FROM films_and_directors
    JOIN stars
        ON films_and_directors.star_id = stars.id;



-- Show the title of films where the director is from the USA
WITH american_directors AS (
  SELECT id
  FROM directors
    WHERE country = 'USA'
)

SELECT title
FROM films
    INNER JOIN american_directors
    on films.director_id = american_directors.id;


-- Show only those films where the writer and the director are the same person
SELECT *
FROM films
WHERE writer_id = director_id;

-- Show directors and film titles for films with a score of 8 or higher
SELECT films.title AS title, directors.name AS director
    FROM films
    JOIN directors
        ON films.director_id = directors.id
    WHERE films.score >= 8;


-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
--1 full table
SELECT *
FROM films
    JOIN directors
        ON films.director_id = directors.id
    JOIN stars
        ON films.star_id = stars.id
    JOIN writers
        ON films.writer_id = writers.id;


-- 2 writers
SELECT films.title, writers.name AS writer, writers.email
FROM films
JOIN writers ON films.writer_id = writers.id;

-- 3 country and genre
SELECT films.title, directors.country AS director_country, films.genre
    FROM films
JOIN directors ON films.director_id = directors.id;

-- 4 score and dir name
SELECT films.title, films.score, directors.name AS director
FROM films
    JOIN directors
    ON films.director_id = directors.id
ORDER BY directors.name;

-- 5 total number of films per director // its 1 per, but works.
SELECT directors.name AS director, COUNT(films.id) AS total films
FROM films
    JOIN directors ON films.director_id = directors.id
GROUP BY directors.name;


