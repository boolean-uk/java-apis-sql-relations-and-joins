-- Show the title and director name for all films
SELECT title, people.name 
FROM movies 
JOIN directors ON movies.director_id = directors.id 
JOIN people ON directors.people_id = people.id;

-- Show the title, director and star name for all films
SELECT mov.title, peo.name, peo2.name 
FROM movies mov
JOIN directors dir ON mov.director_id = dir.id 
JOIN people peo ON dir.people_id = peo.id
JOIN stars sta ON mov.star_id = sta.id 
JOIN people peo2 ON sta.people_id = peo2.id;

-- Show the title of films where the director is from the USA
SELECT title
FROM movies
JOIN directors ON movies.director_id = directors.id
WHERE directors.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT title
FROM movies
JOIN directors ON movies.director_id = directors.id
JOIN writers ON movies.writer_id = writers.id
WHERE directors.people_id = writers.people_id;

-- Show directors and film titles for films with a score of 8 or higher
SELECT title, people.name
FROM movies
JOIN directors ON movies.director_id = directors.id
JOIN people ON directors.people_id = people.id
WHERE movies.score > 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

-- Show average scores of movies based on its director's country
SELECT directors.country, AVG(score)
FROM movies
JOIN directors ON movies.director_id = directors.id
GROUP BY directors.country;

-- Show movies alphabetically based on its star's first name
SELECT title, people.name, stars.dob
FROM movies
JOIN stars ON movies.star_id = stars.id
JOIN people ON stars.people_id = people.id
ORDER BY people.name ASC;

-- Show titles of movies and writer's name and email
SELECT title, writers.email, people.name
FROM movies
JOIN writers ON movies.writer_id = writers.id
JOIN people ON writers.people_id = people.id;

-- Show movies alphabetically based on its writers's first name
SELECT title, people.name
FROM movies
JOIN writers ON movies.star_id = writers.id
JOIN people ON writers.people_id = people.id
ORDER BY people.name ASC;

-- Show directors' names and average score of each director's movies
SELECT people.name, AVG(score)
FROM movies
JOIN directors ON movies.director_id = directors.id
JOIN people ON directors.people_id = people.id
GROUP BY people.name;
