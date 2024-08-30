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
SELECT Director.director_name, film.film_name
FROM Director
JOIN Film ON Director.director_id = film.film_id
WHERE Film.film_score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables. --






