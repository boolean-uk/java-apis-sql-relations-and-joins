--Show the title and director name for all films
SELECT movies.title, people.name
From directors
INNER JOIN movies ON movies.director_id = directors.people_id
INNER JOIN people ON directors.people_id = people.id;


--Show the title, director and star name for all films
SELECT title, d.name AS director, s.name AS star
From movies
INNER JOIN people AS d ON director_id = d.id
INNER JOIN people AS s ON star_id = s.id;



--Show the title of films where the director is from the USA
SELECT title
FROM movies
INNER JOIN directors on movies.director_id = directors.people_id
WHERE directors.country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT title, people.name
FROM movies
INNER JOIN directors on movies.director_id = directors.people_id
INNER JOIN writers on movies.writer_id = writers.people_id
INNER JOIN people ON directors.people_id = people.id
WHERE directors.people_id = writers.people_id;

--Show directors and film titles for films with a score of 8 or higher
SELECT movies.title, people."name", movies.score
FROM movies
INNER JOIN directors ON movies.director_id = directors.people_id
INNER JOIN people ON directors.people_id = people.id
WHERE score > 7;

--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

		-- Movies newer than 1970
SELECT title, d.name AS director, s.name AS star, year
From movies
INNER JOIN people AS d ON director_id = d.id
INNER JOIN people AS s ON star_id = s.id
WHERE year > 1970;

		-- Amount of movies with directors from different countries
SELECT COUNT(movies.title), directors.country
FROM movies
JOIN directors ON movies.director_id = directors.people_id
GROUP BY directors.country;

		-- Writers and what genre they create
SELECT movies.genre, w.name
FROM movies
INNER JOIN people AS w ON writer_id = w.id;


		-- Every movie with a colon in their name
SELECT movies.title, d.name AS director, w.name AS writer, movies.year, movies.score
FROM movies
JOIN people AS w ON writer_id = w.id
JOIN people AS d ON director_id = d.id
WHERE movies.title LIKE '%:%';

		-- Movies, stars and rating with every leading actor that has a name that stars with M
SELECT movies.title, s.name AS star, movies.score
FROM movies
JOIN people AS s ON star_id = s.id
WHERE s.name LIKE 'M%';