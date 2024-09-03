-- Show the title and director name for all films --
SELECT films.film_name, directors.director_name
FROM films
JOIN directors ON films.director_id = directors.director_id;

-- Show the title, director and star name for all films --
SELECT films.film_name, directors.director_name, stars.star_name
FROM ((films
JOIN directors ON films.director_id = directors.director_id)
JOIN stars ON films.star_id = stars.star_id);

-- Show the title of films where the director is from the USA --
SELECT films.film_name
FROM films
JOIN directors ON films.director_id = directors.director_id
WHERE directors.director_country = 'USA';

-- Show only those films where the writer and the director are the same person --
SELECT films.film_name
FROM films
JOIN directors ON films.director_id = directors.director_id
JOIN writers ON films.writer_id = writers.writer_id
WHERE writers.writer_name = directors.director_name;

-- Show directors and film titles for films with a score of 8 or higher --
SELECT directors.director_name, films.film_name
FROM directors
JOIN films ON directors.director_id = films.film.director_id
WHERE films.film_score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables. --

-- Get film with director, star and writer for all films in the drama genre
SELECT films.film_name, directors.director_name, stars.star_name, writers.writer_name
FROM (((films
JOIN directors ON films.director_id = directors.director_id)
JOIN stars ON films.star_id = stars.star_id)
JOIN writers ON films.writer_id = writers.writer_id)
WHERE films.film_genre = 'Drama';

-- Get number of movies each director has directed which scored above 9.
SELECT directors.director_name, COUNT(films.film_id)
FROM directors
JOIN films ON films.director_id = directors.director_id
WHERE films.film_score > 8
GROUP BY directors.director_name;

-- Get all movies directed by an american in the drama genre
SELECT directors.director_name, films.film_name
FROM directors
JOIN films ON films.director_id = directors.director_id
WHERE directors.director_country = 'USA' AND films.film_genre = 'Drama';

--  Get number of movies each star has starred in which scored below 9
SELECT stars.star_name, COUNT(films.film_id)
FROM stars
JOIN films ON stars.star_id = films.star_id
WHERE films.film_score < 9
GROUP BY stars.star_name;

-- Get number of movies each star has starred in based on the catalog and sort it based on name.
SELECT stars.star_name, COUNT(films.film_id)
FROM stars
JOIN films ON stars.star_id = films.star_id
GROUP BY stars.star_name
ORDER BY stars.star_name ASC;


