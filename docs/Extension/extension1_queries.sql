-- Show the title and director name for all films
SELECT film.title, people.name
	FROM film
		JOIN people
			ON film.director_id = people.id;
-- Show the title, director and star name for all films
SELECT title, director, people.name AS star
	FROM
		(SELECT film.star_id, film.title, people.name AS director
			FROM film
				JOIN people ON film.director_id = people.id) AS foo
	JOIN people ON foo.star_id = people.id;
-- Show the title of films where the director is from the USA
SELECT film.title
	FROM film
		JOIN people ON film.director_id = people.id
	WHERE people.country = 'USA';
-- Show only those films where the writer and the director are the same person
SELECT film.title FROM film
	WHERE writer_id = director_id;
--Show directors and film titles for films with a score of 8 or higher
SELECT people.name AS director, film.title, film.score
	FROM film
		JOIN people ON film.director_id = people.id
	WHERE film.score >= 8;

-- More queries
-- Stars acting in movies before 1970, ordered by year descending
SELECT people.name AS star, film.year
	FROM film
		JOIN people ON film.star_id = people.id
	WHERE year < 1970
	ORDER BY year desc;
-- Writers of movies with a score of 9 or 10
SELECT people.name AS writer
	FROM film
		JOIN people ON film.writer_id = people.id
	WHERE film.score >= 9;
-- Average score of the movies in the database
SELECT AVG(score) FROM film;
-- Genres and number of directors from different countries that have directed movies in that genre
SELECT film.genre, people.country, COUNT(people.country)
	FROM film
		JOIN people ON film.director_id = people.id
	GROUP BY film.genre, people.country;
-- Genres and number of distinct director countries
SELECT film.genre, COUNT(distinct people.country) AS number_of_different_counties_directed
	FROM film
		JOIN people ON film.director_id = people.id
	GROUP BY film.genre;