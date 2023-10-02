--Show the title and director name for all films
SELECT f.title, p.name AS director_name
FROM films AS f
INNER JOIN people AS p
ON f.director_id = p.person_id;

--Show the title, director and star name for all films
SELECT title, p1.name AS director_name, p2.name AS star_name
FROM films AS f
INNER JOIN people AS p1
ON f.director_id = p1.person_id
INNER JOIN people AS p2
ON f.star_id = p2.person_id;

--Show the title of films where the director is from the USA
SELECT title
FROM films AS f
INNER JOIN people AS p
ON f.director_id = p.person_id
WHERE p.country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT title
FROM films
WHERE writer_id = director_id;

--Show directors and film titles for films with a score of 8 or higher
SELECT p.name AS director_name, title
FROM films AS f
INNER JOIN people AS p
ON f.director_id = p.person_id
WHERE score >= 8;