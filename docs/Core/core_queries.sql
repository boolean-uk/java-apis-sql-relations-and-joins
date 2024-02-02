SELECT film.title, director.name
	FROM film
		JOIN director
			ON film.director_id = director.id;
SELECT film.title, director.name AS director, star.name AS star
	FROM film
		JOIN director ON film.director_id = director.id
		JOIN star ON film.star_id = star.id;
SELECT film.title
	FROM film
		JOIN director ON film.director_id = director.id
	WHERE director.country = 'USA';
SELECT film.title
	FROM film
		JOIN director ON film.director_id = director.id
		JOIN writer ON film.writer_id = writer.id
	WHERE writer.name = director.name;
SELECT director.name, film.title, film.score
	FROM film
		JOIN director ON film.director_id = director.id
	WHERE film.score >= 8;

-- Stars acting in movies before 1970, ordered by year descending
SELECT star.name AS star, film.year
	FROM film
		JOIN star ON film.star_id = star.id
	WHERE year < 1970
	ORDER BY year desc;
-- Writers of movies with a score of 9 or 10
SELECT writer.name AS writer
	FROM film
		JOIN writer ON film.writer_id = writer.id
	WHERE film.score >= 9;
-- Average score of the movies in the database
SELECT AVG(score) FROM film;
-- Genres and number of directors from different countries that have directed movies in that genre
SELECT film.genre, director.country, COUNT(director.country)
	FROM film
		JOIN director ON film.director_id = director.id
	GROUP BY film.genre, director.country;
-- Genres and number of distinct director countries
SELECT film.genre, COUNT(distinct director.country) AS number_of_different_counties_directed
	FROM film
		JOIN director ON film.director_id = director.id
	GROUP BY film.genre;