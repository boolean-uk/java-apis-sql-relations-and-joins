-- Show the title and director name for all films
SELECT films.title, people.name
FROM films
INNER JOIN directors ON directors.id = films.director_id
INNER JOIN people ON people.id = directors.people_id;

-- Show the title, director and star name for all films
SELECT films.title, directors.name AS director_name, stars.name AS star_name
FROM films
LEFT JOIN (
  SELECT directors.id, people.name 
  FROM directors 
  INNER JOIN people ON directors.people_id = people.id
) AS directors
  ON directors.id = films.director_id
LEFT JOIN (
  SELECT stars.id, people.name 
  FROM stars 
  INNER JOIN people ON stars.people_id = people.id
) AS stars
  ON stars.id = films.star_id;

-- Show the title of films where the director is from the USA
SELECT films.title
FROM films
INNER JOIN directors ON directors.id = films.director_id
WHERE directors.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT films.title, directors.name AS director_and_writer
FROM films
LEFT JOIN (
  SELECT directors.id, people.name 
  FROM directors 
  INNER JOIN people ON directors.people_id = people.id
) AS directors
  ON directors.id = films.director_id
LEFT JOIN (
  SELECT writers.email, people.name 
  FROM writers 
  INNER JOIN people ON writers.people_id = people.id
) AS writers
  ON writers.email = films.writer_email
  WHERE directors.name = writers.name;

-- Show directors and film titles for films with a score of 8 or higher
SELECT people.name, films.title
FROM films
INNER JOIN directors ON directors.id = films.director_id
INNER JOIN people ON people.id = directors.people_id
WHERE films.score >= 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
-- 1: Show the titles of all films that are directed by George Lucas
SELECT films.title AS george_lucas_film
FROM films
INNER JOIN directors ON directors.id = films.director_id
INNER JOIN people ON people.id = directors.people_id
WHERE people.name = 'George Lucas';

-- 2: Show the the average release year of films directed by american directors
SELECT AVG(year)
FROM films
INNER JOIN directors ON directors.id = films.director_id
WHERE directors.country = 'USA';

-- 3: Show the number of films directed by each director
SELECT people.name, COUNT(*) AS num_films
FROM films
INNER JOIN directors ON directors.id = films.director_id
INNER JOIN people ON people.id = directors.people_id
GROUP BY people.name;

-- 4: Show all the stars starring in movies directed by american directors that are born in or after 1930
SELECT DISTINCT stars.name AS star_name
FROM films
INNER JOIN (
  SELECT directors.id, people.name, directors.country
  FROM directors 
  JOIN people ON directors.people_id = people.id
) AS directors
  ON directors.id = films.director_id
INNER JOIN (
  SELECT stars.id, people.name, stars.birthday
  FROM stars 
  JOIN people ON stars.people_id = people.id
) AS stars
  ON stars.id = films.star_id
WHERE directors.country = 'USA' AND stars.birthday > '1930-01-01';

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
