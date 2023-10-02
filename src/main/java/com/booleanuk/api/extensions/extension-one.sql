CREATE TABLE people (
    person_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO People (name)
SELECT name FROM stars
UNION
SELECT name FROM writers
UNION
SELECT name FROM directors;

ALTER TABLE stars
ADD COLUMN person_id INTEGER REFERENCES people(person_id);

ALTER TABLE writers
ADD COLUMN person_id INTEGER REFERENCES people(person_id);

ALTER TABLE directors
ADD COLUMN person_id INTEGER REFERENCES people(person_id);

UPDATE stars AS s
SET person_id = p.person_id
FROM People AS p
WHERE s.name = p.name;

UPDATE writers AS w
SET person_id = p.person_id
FROM People AS p
WHERE w.name = p.name;

UPDATE directors AS d
SET person_id = p.person_id
FROM People AS p
WHERE d.name = p.name;

-- SELECT stars.name AS stars_name, People.name AS people_name
-- FROM stars
-- INNER JOIN People ON stars.person_id = People.person_id;
-- SELECT writers.name AS writers_name, People.name AS people_name
-- FROM writers
-- INNER JOIN People ON writers.person_id = People.person_id;
-- SELECT directors.name AS directors_name, People.name AS people_name
-- FROM directors
-- INNER JOIN People ON directors.person_id = People.person_id;

ALTER TABLE stars
DROP COLUMN name;

ALTER TABLE writers
DROP COLUMN name;

ALTER TABLE directors
DROP COLUMN name;


-- UPDATED QUERIES:

-- Show the title and director name for all films
SELECT films.title, people.name AS director_name
FROM films
INNER JOIN directors ON films.director_id = directors.director_id
INNER JOIN people ON directors.person_id = people.person_id;


-- Show the title, director, and star name for all films
SELECT films.title, people_director.name AS director_name, people_star.name AS star_name
FROM films
INNER JOIN directors ON films.director_id = directors.director_id
INNER JOIN stars ON films.star_id = stars.star_id
INNER JOIN people AS people_director ON directors.person_id = people_director.person_id
INNER JOIN people AS people_star ON stars.person_id = people_star.person_id;

-- Show the title of films where the director is from the USA
SELECT films.title
FROM films
INNER JOIN directors ON films.director_id = directors.director_id
INNER JOIN people ON directors.person_id = people.person_id
WHERE directors.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT films.title
FROM films
INNER JOIN directors ON films.director_id = directors.director_id
INNER JOIN writers ON films.writer_id = writers.writer_id
INNER JOIN people AS pd ON directors.person_id = pd.person_id
INNER JOIN people AS pw ON writers.person_id = pw.person_id
WHERE pd.person_id = pw.person_id;

-- Show directors and film titles for films with a score of 8 or higher
SELECT people.name AS director_name, films.title
FROM films
INNER JOIN directors ON films.director_id = directors.director_id
INNER JOIN people ON directors.person_id = people.person_id
WHERE films.score >= 8;


-- Additional queries to demonstrate joins and relationships:

-- 1. Show the title, writer name, and genre for all films
SELECT films.title, people.name AS writer_name, films.genre
FROM films
INNER JOIN writers ON films.writer_id = writers.writer_id
INNER JOIN people ON writers.person_id = people.person_id;

-- 2. Show the star names and their dates of birth for films with a score of 7 or lower
SELECT people.name AS star_name, stars.dob
FROM films
INNER JOIN stars ON films.star_id = stars.star_id
INNER JOIN people ON stars.person_id = people.person_id
WHERE films.score <= 7;

-- 3. Show the director names and the number of films they have directed
SELECT people.name AS director_name, COUNT(films.film_id) AS film_count
FROM people
INNER JOIN directors ON people.person_id = directors.person_id
LEFT JOIN films ON directors.director_id = films.director_id
GROUP BY people.name;

-- 4. Show the writer names and the titles of films they have written
SELECT people.name AS writer_name, films.title
FROM people
INNER JOIN writers ON people.person_id = writers.person_id
INNER JOIN films ON writers.writer_id = films.writer_id;

-- 5. Show the genre and the average score for each genre
SELECT films.genre, ROUND(AVG(films.score)::numeric, 2) AS average_score
FROM films
GROUP BY films.genre;