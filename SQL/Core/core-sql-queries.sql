--Show the title and director name for all films
SELECT movies.title, directors.name
From movies
INNER JOIN directors ON movies.director_id = directors.id;

--Show the title, director and star name for all films
SELECT movies.title, directors.name, stars.name
From movies
INNER JOIN directors ON movies.director_id = directors.id
INNER JOIN stars ON movies.star_id = stars.id;

--Show the title of films where the director is from the USA

SELECT title
FROM movies
INNER JOIN directors on movies.director_id = directors.id
WHERE directors.country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT title, directors.name
FROM movies
INNER JOIN directors on movies.director_id = directors.id
INNER JOIN writers on movies.writer_id = writers.id
WHERE directors.name = writers.name;

--Show directors and film titles for films with a score of 8 or higher
SELECT movies.title, directors.name, movies.score
FROM movies
INNER JOIN directors ON movies.director_id = directors.id
WHERE score > 7;

--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

		-- Movies newer than 1970
SELECT movies.title, directors.name AS director, stars.name AS star, movies.year
FROM movies
INNER JOIN stars ON movies.star_id = stars.id
INNER JOIN directors ON movies.director_id = directors.id
WHERE year > 1970;

		-- Amount of movies with directors from different countries
SELECT COUNT(movies.title), directors.country
FROM movies
JOIN directors ON movies.director_id = directors.id
GROUP BY directors.country;

		-- Writers and what genre they create
SELECT movies.genre, writers.name
FROM movies
INNER JOIN writers ON movies.writer_id = writers.id;


		-- Every movie with a colon in their name
SELECT movies.title, directors.name AS director, writers.name AS writer, movies.year, movies.score
FROM movies
JOIN writers ON movies.writer_id = writers.id
JOIN directors ON movies.director_id = directors.id
WHERE movies.title LIKE '%:%';

		-- Movies, stars and rating with every leading actor that has a name that stars with M
SELECT movies.title, stars.name AS star, movies.score
FROM movies
JOIN stars ON movies.star_id = stars.id
WHERE stars.name LIKE 'M%';