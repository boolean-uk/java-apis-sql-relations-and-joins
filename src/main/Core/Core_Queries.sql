-- (1) --
SELECT
    movies.title AS movie_title,
    directors.name AS movie_director
        FROM movies
        JOIN directors ON movies.director_id = directors.director_id;

-- (2) --
SELECT
	movies.title AS movie_title,
    directors.name AS movie_director,
    stars.name AS star_name
        FROM movies
        JOIN directors ON movies.director_id = directors.director_id
        JOIN stars ON movies.star_id = stars.star_id;

-- (3) --
SELECT
	movies.title AS movie_title,
    directors.name AS movie_director,
    directors.country AS country
        FROM movies
        JOIN directors ON movies.director_id = directors.director_id
            WHERE directors.country = 'USA';

-- (4) --
SELECT
	movies.title AS movie_title,
    directors.name AS director_name,
    writers.name AS writer_name
        FROM movies
        JOIN directors ON movies.director_id = directors.director_id
        JOIN writers on movies.writer_id = writers.writer_id
            WHERE directors.name = writers.name;

-- (5) --
SELECT
	directors.name AS director_name,
    movies.title AS movie_title,
    movies.score AS movie_rating
        FROM movies
        JOIN directors ON movies.director_id = directors.director_id
  	        WHERE movies.score >= 8
    	        ORDER BY movies.score DESC;

-- (6.1) --
SELECT
    movies.title AS movie_title,
    movies.year,
    movies.genre,
    directors.country AS director_country
        FROM movies
        JOIN directors ON movies.director_id = directors.director_id
            WHERE movies.year = 1968;

-- (6.2) --
SELECT *
	FROM movies
    JOIN writers ON movies.writer_id = writers.writer_id
  	    WHERE writers.email LIKE '%email%'

-- (6.3) --
SELECT
    directors.name AS director_name,
    AVG(movies.score) AS average_score
        FROM directors
        JOIN movies ON directors.director_id = movies.director_id
            GROUP BY directors.name
                ORDER BY average_score DESC;

-- (6.4) --
SELECT
    movies.title AS movie_title,
    stars.name AS star_name,
    movies.year AS movie_release_year,
    stars.date_of_birth AS star_dob,
    EXTRACT(YEAR FROM AGE(DATE(movies.year || '-01-01'), stars.date_of_birth)) AS age_of_star_when_movie_released
        FROM movies
        JOIN stars ON movies.star_id = stars.star_id
            ORDER BY age_of_star_when_movie_released ASC;

-- (6.5) --
SELECT
    movies.title AS movie_title,
    directors.name AS director_name,
    stars.name AS star_name,
    writers.name AS writer_name
        FROM movies
            JOIN directors ON movies.director_id = directors.director_id
            JOIN stars ON movies.star_id = stars.star_id
            JOIN writers ON movies.writer_id = writers.writer_id;

