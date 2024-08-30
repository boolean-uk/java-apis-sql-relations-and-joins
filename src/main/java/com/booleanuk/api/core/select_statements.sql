-- Show the title and director name for all films --
SELECT Film.film_name, Director.director_name
FROM Film
JOIN Director ON Film.director_id = Director.director_id;

-- Show the title, director and star name for all films --
SELECT Film.film_name, Director.director_name, Star.star_name
FROM ((Film
JOIN Director ON Film.director_id = Director.director_id)
JOIN Star ON Film.star_id = Star.star_id);

-- Show the title of films where the director is from the USA --
SELECT Film.film_name
FROM Film
JOIN Director ON Film.director_id = Director.director_id
WHERE Director.director_country = 'USA';

-- Show only those films where the writer and the director are the same person --
SELECT Film.film_name
FROM Film
JOIN Director ON Film.director_id = Director.director_id
JOIN Writer ON Film.writer_id = Writer.writer_id
WHERE Writer.writer_name = Director.director_name;

-- Show directors and film titles for films with a score of 8 or higher --
SELECT Director.director_name, Film.film_name
FROM Director
JOIN Film ON Director.director_id = film.director_id
WHERE Film.film_score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables. --

-- Get film with director, star and writer for all films in the crime genre
SELECT Film.film_name, Director.director_name, Star.star_name, Writer.writer_name
FROM (((Film
JOIN Director ON Film.director_id = Director.director_id)
JOIN Star ON Film.star_id = Star.star_id)
JOIN Writer ON Film.writer_id = Writer.writer_id)
WHERE Film.film_genre = 'Crime';

-- Get number of movies each director has directed which scored above 9.
SELECT Director.director_name, COUNT(Film.film_id)
FROM Director
JOIN Film ON Film.director_id = Director.director_id
WHERE Film.film_score > 8
GROUP BY Director.director_name;

-- Get all movies directed by an american in the drama genre
SELECT Director.director_name, Film.film_name
FROM Director
JOIN Film ON Film.director_id = Director.director_id
WHERE Director.director_country = 'USA' AND Film.film_genre = 'Drama';

--  Get number of movies each star has starred in which scored below 9
SELECT Star.star_name, COUNT(Film.film_id)
FROM Star
JOIN Film ON Star.star_id = Film.star_id
WHERE Film.film_score < 9
GROUP BY Star.star_name;

-- Get number of movies each star has starred in based on the catalog and sort it based on name.
SELECT Star.star_name, COUNT(Film.film_id)
FROM Star
JOIN Film ON Star.star_id = Film.star_id
GROUP BY Star.star_name
ORDER BY Star.star_name ASC;

-- TODO: Prove Herman wrong. Select the country that has the directed the most films.
-- NOTE: This will be easy.


