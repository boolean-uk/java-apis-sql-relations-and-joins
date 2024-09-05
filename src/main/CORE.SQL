SELECT f.title, d.name AS director_name
FROM Film f
JOIN Director d ON f.director_id = d.director_id;

SELECT f.title, d.name AS director_name, s.name AS star_name
FROM Film f
JOIN Director d ON f.director_id = d.director_id
JOIN Star s ON f.star_id = s.star_id;

SELECT f.title
FROM Film f
JOIN Director d ON f.director_id = d.director_id
WHERE d.country = 'USA';

SELECT f.title, d.name AS director_writer
FROM Film f
JOIN Director d ON f.director_id = d.director_id
JOIN Writer w ON f.writer_id = w.writer_id
WHERE d.name = w.name;

SELECT d.name AS director_name, f.title
FROM Film f
JOIN Director d ON f.director_id = d.director_id
WHERE f.score >= 8;

SELECT f.title, w.name AS writer_name
FROM Film f
JOIN Writer w ON f.writer_id = w.writer_id;

SELECT s.name AS star_name, f.title
FROM Star s
JOIN Film f ON s.star_id = f.star_id
WHERE s.dob < '1950-01-01';

SELECT f.title, s.name AS star_name, w.name AS writer_name
FROM Film f
JOIN Star s ON f.star_id = s.star_id
JOIN Writer w ON f.writer_id = w.writer_id
WHERE s.name != w.name;

SELECT title, genre
FROM Film;

SELECT title, score
FROM Film
WHERE score BETWEEN 5 AND 9;
