--Show the title and director name for all films
SELECT title, people.name
FROM films
INNER JOIN people
	ON films.director_id = people.id;

--Show the title, director and star name for all films
SELECT title, directors.name as director, stars.name as star
FROM films
INNER JOIN directors
	ON films.director_id = directors.id
INNER JOIN stars
	ON films.star_id = stars.id;

--Show the title of films where the director is from the USA
SELECT title
FROM films
INNER JOIN directors
	ON films.director_id = directors.id
WHERE directors.country = 'USA';

--Show only those films where the writer and the director are the same person
SELECT title, directors.name as director, writers.name as writer
FROM films
INNER JOIN directors
	ON films.director_id = directors.id
INNER JOIN writers
	ON films.writer_id = writers.id
WHERE directors.name = writers.name

--Show directors and film titles for films with a score of 8 or higher
SELECT directors.name, title
FROM films
INNER JOIN directors
	ON films.director_id = directors.id
WHERE score > 7;



--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

-- 1. SHow title and director name with director name containing a 's'
SELECT title, directors.name as director
FROM films
INNER JOIN directors
	ON films.director_id = directors.id
WHERE directors.name LIKE('%s%')

-- 2. Show the title, star name and star birth from youngest to oldest star
SELECT title, stars.name as star, stars.birth as birth
	FROM films
INNER JOIN stars
	ON films.star_id = stars.id
ORDER BY stars.birth DESC

-- 3. Show all distinct directors alphabetically
SELECT DISTINCT(directors.name) as director
FROM films
INNER JOIN directors
	ON films.director_id = directors.id
ORDER by directors.name

-- 4. Show title and score of the three best and three worst rated movies from worst-best
(
SELECT title, score
	FROM films
		ORDER BY score ASC
			LIMIT 3
)
UNION
(
SELECT title, score
	FROM films
		ORDER BY score DESC
			Limit 3
)
ORDER BY score

-- 5. Show title, genre and names for all historical movies
SELECT
    films.title AS title,
    films.genre,
    directors.name AS director,
    stars.name AS star,
    writers.name AS writer
FROM films
	JOIN directors
		ON films.director_id = directors.id
	JOIN stars
		ON films.star_id = stars.id
	JOIN writers
		ON films.writer_id = writers.id
WHERE genre = 'Historical'



