--Show the title and director name for all films
SELECT movies.title, directors.name AS director_name
FROM movies
JOIN directors ON movies.director_id = directors.director_id;

--Show the title, director, and star name for all films
SELECT movies.title, directors.name AS director_name, stars.name AS star_name
FROM movies
JOIN directors ON movies.director_id = directors.director_id
JOIN stars ON movies.star_id = stars.star_id;


--Show the title of films where the director is from the USA
SELECT movies.title
FROM movies
JOIN directors ON movies.director_id = directors.director_id
WHERE directors.country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT movies.title
FROM movies
JOIN directors ON movies.director_id = directors.director_id
JOIN writers ON movies.writer_id = writers.writer_id
WHERE directors.name = writers.name;


--Show directors and film titles for films with a score of 8 or higher
SELECT directors.name AS director_name, movies.title
FROM movies
JOIN directors ON movies.director_id = directors.director_id
WHERE movies.score >= 8;

--Extra queries

--Show the birthdate of stars along with the movies they starred in
SELECT stars.name, stars.birthDate, movies.title
FROM stars
JOIN movies ON stars.star_id = movies.star_id;

--Show the total number of movies directed by each director
SELECT directors.name AS director_name, COUNT(movies.movie_id) AS total_movies
FROM directors
LEFT JOIN movies ON directors.director_id = movies.director_id
GROUP BY directors.name;

--Show the average score for movies in each genre:
SELECT genre, ROUND(AVG(score),2) AS average_score
FROM movies
GROUP BY genre;

--Show the movies with their director, star, and writer for a specific year
SELECT movies.title, directors.name AS director_name, stars.name AS star_name, writers.name AS writer_name
FROM movies
JOIN directors ON movies.director_id = directors.director_id
JOIN stars ON movies.star_id = stars.star_id
JOIN writers ON movies.writer_id = writers.writer_id
WHERE movies.year = '1968';

--Show movies with their director, star, and writer where the star's birthdate is after 01/01/1960
SELECT movies.title, directors.name AS director_name, stars.name AS star_name, writers.name AS writer_name
FROM movies
JOIN directors ON movies.director_id = directors.director_id
JOIN stars ON movies.star_id = stars.star_id
JOIN writers ON movies.writer_id = writers.writer_id
WHERE TO_DATE(stars.birthDate, 'DD/MM/YYYY') > '01/01/1960';