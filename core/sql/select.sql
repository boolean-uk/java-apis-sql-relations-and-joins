i.
SELECT title, directors.name AS director FROM films
JOIN directors ON films.director_id = directors.id;
ii.
SELECT title, directors.name AS director, stars.name AS star FROM films
JOIN directors ON films.director_id = directors.id
JOIN stars ON films.star_id = stars.id;
iii.
SELECT title FROM films
JOIN directors ON films.director_id = directors.id
WHERE directors.country = 'USA';
iv.
SELECT films.title, films.year, films.genre, films.score, directors.name AS director_writer from films
JOIN directors ON films.director_id = directors.id
JOIN writers ON films.writer_id = writers.id
WHERE directors.name = writers.name;
v.
SELECT directors.name, title, score FROM films
JOIN directors ON directors.id = films.director_id
WHERE films.score >= 8;
vi.
SELECT directors.name, COUNT(title) as films FROM films
JOIN directors ON directors.id = films.director_id
GROUP BY directors.name;

SELECT title, year, score, stars.name FROM films
JOIN stars ON films.star_id = stars.id;

SELECT title, directors.name, score FROM films
JOIN directors ON directors.id = films.director_id
ORDER BY score DESC;

SELECT title, directors.name AS director, stars.name AS star, writers.name AS writer FROM films
JOIN directors ON films.director_id = directors.id
JOIN writers ON films.writer_id = writers.id
JOIN stars ON films.star_id = stars.id
WHERE stars.name LIKE 'L%' AND writers.name LIKE 'J%';

SELECT title, year, directors.name AS director FROM films
JOIN directors ON films.director_id = directors.id
WHERE year < 2010
LIMIT 5;

SELECT score, title AS top_3, directors.name AS director, stars.name AS star FROM films
JOIN directors ON films.director_id = directors.id
JOIN stars ON films.star_id = stars.id
ORDER BY score DESC
LIMIT 3;