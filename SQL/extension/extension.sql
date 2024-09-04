-- Show the title and director name for all films
SELECT films.title, people.name
FROM films
	JOIN people
  ON films.director_id = people.id;

-- Show the title, director and star name for all films
WITH films_and_directors AS (
    SELECT films.title AS title, people.name AS director, star_id AS star_id
    FROM films
    JOIN people
        ON films.director_id = people.id
)
SELECT title, director, people.name as star
    FROM films_and_directors
    JOIN people
        ON films_and_directors.star_id = people.id;



-- Show the title of films where the director is from the USA
WITH american_directors as (
  SELECT person_id as id
  FROM directors
  WHERE country = 'USA'
)

SELECT films.title
FROM films
	JOIN american_directors
  	ON films.director_id = american_directors.id
 ;


-- Show only those films where the writer and the director are the same person
SELECT title
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
WITH dir AS (
  SELECT directors.person_id as dir_id, people.name as director, directors.country as dircountry
  FROM directors
  JOIN people
  	ON directors.person_id = people.id
),



writ AS (
  SELECT writers.person_id as wr_id, people.name as writer, writers.email as writer_email
  FROM writers
  JOIN people
  	ON writers.person_id = people.id
),

star AS (
  SELECT stars.person_id as s_id, people.name as star, stars.birthdate as star_dob
  FROM stars
  JOIN people
  	ON stars.person_id = people.id
  )

-- reconstructing the previous tables


SELECT id, title, director, dircountry, star, star_dob, writer, writer_email, year, genre, score
FROM films
 JOIN dir
 ON films.director_id = dir.dir_id
 JOIN writ
 ON films.writer_id = writ.wr_id
 JOIN star
 ON films.star_id = star.s_id


-- 2 writers
SELECT films.title, people.name as writer
FROM films
JOIN people
ON films.writer_id = people.id;

-- 3 country and genre
SELECT films.title, directors.country AS director_country, films.genre
FROM films
JOIN directors ON films.director_id = directors.person_id
JOIN people ON directors.person_id = people.id;


-- 4 score and dir name
SELECT films.title, films.score, people.name AS director
FROM films
JOIN people ON films.director_id = people.id
ORDER BY people.name;

-- 5 total number of films per director // its 1 per, but works.
SELECT people.name AS director, COUNT(films.id) AS total_films
FROM films
JOIN directors ON films.director_id = directors.person_id
JOIN people ON directors.person_id = people.id
GROUP BY people.name;




