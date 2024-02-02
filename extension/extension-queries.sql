-- Show the title and director name for all films
SELECT movies.title, people.name AS director_name
FROM movies
JOIN people ON movies.director_id = people.person_id
WHERE people.role = 'director';

-- Show the title, director, and star name for all films
SELECT movies.title, directors.name AS director_name, stars.name AS star_name
FROM movies
JOIN people AS directors ON movies.director_id = directors.person_id AND directors.role = 'director'
JOIN people AS stars ON movies.star_id = stars.person_id AND stars.role = 'star';

-- Show the title of films where the director is from the USA
SELECT movies.title
FROM movies
JOIN people AS directors ON movies.director_id = directors.person_id AND directors.role = 'director'
WHERE directors.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT movies.title
FROM movies
JOIN people AS directors ON movies.director_id = directors.person_id AND directors.role = 'director'
JOIN people AS writers ON movies.writer_id = writers.person_id AND writers.role = 'writer'
WHERE directors.name = writers.name;

-- Show directors and film titles for films with a score of 8 or higher
SELECT people.name AS director_name, movies.title
FROM movies
JOIN people ON movies.director_id = people.person_id AND people.role = 'director'
WHERE movies.score >= 8;

-- Extra queries

-- Show the birthdate of stars along with the movies they starred in
SELECT people.name AS star_name, people.birthDate, movies.title
FROM movies
JOIN people ON movies.star_id = people.person_id AND people.role = 'star';

-- Show the total number of movies directed by each director
SELECT people.name AS director_name, COUNT(movies.movie_id) AS total_movies
FROM people
LEFT JOIN movies ON people.person_id = movies.director_id AND people.role = 'director'
WHERE people.role = 'director'
GROUP BY people.name;

-- Show the average score for movies in each genre
SELECT movies.genre, ROUND(AVG(movies.score), 2) AS average_score
FROM movies
GROUP BY movies.genre;

-- Show the movies with their director, star, and writer for a specific year
SELECT movies.title, people.name AS director_name, stars.name AS star_name, writers.name AS writer_name
FROM movies
JOIN people ON movies.director_id = people.person_id AND people.role = 'director'
JOIN people AS stars ON movies.star_id = stars.person_id AND stars.role = 'star'
JOIN people AS writers ON movies.writer_id = writers.person_id AND writers.role = 'writer'
WHERE movies.year = '1968';

-- Show movies with their director, star, and writer where the star's birthdate is after 01/01/1960
SELECT movies.title, people.name AS director_name, stars.name AS star_name, writers.name AS writer_name
FROM movies
JOIN people ON movies.director_id = people.person_id AND people.role = 'director'
JOIN people AS stars ON movies.star_id = stars.person_id AND stars.role = 'star'
JOIN people AS writers ON movies.writer_id = writers.person_id AND writers.role = 'writer'
WHERE TO_DATE(stars.birthDate, 'DD/MM/YYYY') > '01/01/1960';