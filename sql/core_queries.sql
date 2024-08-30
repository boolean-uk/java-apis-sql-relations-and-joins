-- Show the title and director name for all films
SELECT films.title, directors.name
FROM films
INNER JOIN directors ON directors.id = films.director_id;

-- Show the title, director and star name for all films
SELECT films.title, directors.name, stars.name
FROM films
INNER JOIN directors ON directors.id = films.director_id
INNER JOIN stars ON stars.id = films.star_id;

-- Show the title of films where the director is from the USA
SELECT films.title
FROM films
INNER JOIN directors ON directors.id = films.director_id
WHERE directors.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT films.title, directors.name AS director_and_writer
FROM films
INNER JOIN directors ON directors.id = films.director_id
INNER JOIN writers ON writers.email = films.writer_email
WHERE writers.name = directors.name;

-- Show directors and film titles for films with a score of 8 or higher
SELECT directors.name, films.title
FROM films
INNER JOIN directors ON directors.id = films.director_id
WHERE films.score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
-- 1: Show the titles of all films that are directed by George Lucas
SELECT films.title AS george_lucas_film
FROM films
INNER JOIN directors ON directors.id = films.director_id
WHERE directors.name = 'George Lucas';

-- 2: Show the the average release year of films directed by american directors
SELECT AVG(year)
FROM films
INNER JOIN directors ON directors.id = films.director_id
WHERE directors.country = 'USA';

-- 3: Show the number of films directed by each director
SELECT directors.name, COUNT(*) AS num_films
FROM films
INNER JOIN directors ON directors.id = films.director_id
GROUP BY directors.name;

-- 4: Show all the stars starring in movies directed by american directors that are born in or after 1930
SELECT stars.name
FROM films
INNER JOIN directors ON directors.id = films.director_id
INNER JOIN stars ON stars.id = films.star_id
WHERE directors.country = 'USA'
AND stars.birthday > '1/1/1930';

-- 5: Show the country that has directed the most movies
WITH country_counts AS (
  SELECT directors.country, COUNT(*) AS count
  FROM films
  INNER JOIN directors ON directors.id = films.director_id
  GROUP BY directors.country
)
SELECT country_counts.country
FROM country_counts
WHERE country_counts.count = (
  SELECT MAX(count)
  FROM country_counts
);
