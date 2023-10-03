--Show the title and director name for all films
SELECT title, name AS director_name
FROM films AS f
INNER JOIN directors AS d
ON f.director_id = d.director_id;

--Show the title, director and star name for all films
SELECT title, d.name AS director_name, s.name AS star_name
FROM films AS f
INNER JOIN directors AS d
ON f.director_id = d.director_id
INNER JOIN stars AS s
ON f.star_id = s.star_id;

--Show the title of films where the director is from the USA
SELECT title
FROM films AS f
INNER JOIN directors AS d
ON f.director_id = d.director_id
WHERE d.country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT title
FROM films AS f
INNER JOIN directors AS d
ON f.director_id = d.director_id
INNER JOIN writers as w
ON f.writer_id = w.writer_id
WHERE w.name = d.name;

--Show directors and film titles for films with a score of 8 or higher
SELECT name AS director_name, title
FROM films AS f
INNER JOIN directors AS d
ON f.director_id = d.director_id
WHERE score >= 8;