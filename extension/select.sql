i.
SELECT title, people.name as DIRECTOR
	FROM
	(
	SELECT * FROM people, directors
	JOIN films ON directors.id = films.director_id
	WHERE people.id = directors.person_id
	) as people;

ii.
SELECT title, dir.name AS director, star.name AS star FROM films
JOIN (
	SELECT people.name, directors.id
	FROM people
	JOIN directors
	ON directors.person_id = people.id
	) AS dir
	ON films.director_id = dir.id
JOIN (
	SELECT people.name, stars.id
	FROM people
	JOIN stars
	ON stars.person_id = people.id
	) AS star
	ON films.star_id = star.id;

iii.
SELECT title, dir.name AS director, star.name AS star FROM films
JOIN (
	SELECT people.name, directors.*
	FROM people
	JOIN directors
	ON directors.person_id = people.id
	) AS dir
	ON films.director_id = dir.id
JOIN (
	SELECT people.name, stars.id
	FROM people
	JOIN stars
	ON stars.person_id = people.id
	) AS star
	ON films.star_id = star.id
WHERE dir.country = 'USA';

iv.
SELECT title, dir.name AS director_writer, star.name AS star FROM films
JOIN (
	SELECT people.name, directors.*
	FROM people
	JOIN directors
	ON directors.person_id = people.id
	) AS dir
	ON films.director_id = dir.id
JOIN (
	SELECT people.name, stars.id
	FROM people
	JOIN stars
	ON stars.person_id = people.id
	) AS star
	ON films.star_id = star.id
JOIN (
	SELECT people.name, writers.id
	FROM people
	JOIN writers
	ON writers.person_id = people.id
	) AS writer
	ON films.writer_id = writer.id
WHERE dir.name = writer.name;

v.
SELECT title, people.name as DIRECTOR, score
	FROM
	(
	SELECT * FROM people, directors
	JOIN films ON directors.id = films.director_id
	WHERE people.id = directors.person_id
	) as people
WHERE score >= 8;