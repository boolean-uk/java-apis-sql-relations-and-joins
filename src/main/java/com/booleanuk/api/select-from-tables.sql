1. Show the title and director name for all films
SELECT title, directors.name AS director_name
FROM films
JOIN directors ON films.director_id = directors.id;

2. Show the title, director and star name for all films
SELECT title, directors.name AS director_name, stars.name AS star_name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN stars ON films.star_id = stars.id;

3. Show the title of films where the director is from the USA
SELECT title
FROM films
JOIN directors ON films.director_id = directors.id
WHERE directors.country = 'USA';

4. Show only those films where the writer and the director are the same person
SELECT title
FROM films
JOIN directors ON films.director_id = directors.id
JOIN writers ON films.writer_id = writers.id
WHERE writers.name = directors.name;

5. Show directors and film titles for films with a score of 8 or higher
SELECT title, directors.name AS director_name
FROM films
JOIN directors ON films.director_id = directors.id
WHERE score >= 8;

6. Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
a. Show the title, director name, star name, and writer name for all films
SELECT title, directors.name AS director_name, stars.name AS star_name, writers.name AS writer_name
FROM films
JOIN directors ON films.director_id = directors.id
JOIN stars ON films.star_id = stars.id
JOIN writers ON films.writer_id = writers.id;

b. Show the title and genre for all films directed by Stanley Kubrick
SELECT title, genre
FROM films
JOIN directors ON films.director_id = directors.id
WHERE directors.name = 'Stanley Kubrick';

c. Show the title and the star name for films released after 1990
SELECT title, stars.name AS stars_name
FROM films
JOIN stars ON films.star_id = stars.id
WHERE year > 1990;

d. Show the title, director name, and writer email for films written by George Lucas
SELECT title, directors.name AS director_name, writers.email AS writer_email
FROM films
JOIN directors ON films.director_id = directors.id
JOIN writers ON films.writer_id = writers.id
WHERE writers.name = 'George Lucas';

e. Show the title, writer name and writer email for all films with a score of 7 or lower
SELECT title, writers.name, writers.email
FROM films
JOIN writers ON films.writer_id = writers.id
WHERE score <= 7