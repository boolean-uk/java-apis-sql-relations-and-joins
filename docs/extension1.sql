-- 1: Show the title and director name for all films
SELECT Films.title, Persons.name AS director_name
FROM Films
JOIN Persons ON Films.director_id = Persons.id;

-- 2: Show the title, director, and star name for all films
SELECT Films.title, Directors.name AS director_name, Stars.name AS star_name
FROM Films
JOIN Persons AS Directors ON Films.director_id = Directors.id
JOIN Persons AS Stars ON Films.star_id = Stars.id;

-- 3: Show the title of films where the director is from the USA
SELECT Films.title
FROM Films
JOIN Persons AS Directors ON Films.director_id = Directors.id
WHERE Directors.country = 'USA';

-- 4: Show only those films where the writer and the director are the same person
SELECT Films.title
FROM Films
WHERE Films.director_id = Films.writer_id;

-- 5: Show directors and film titles for films with a score of 8 or higher
SELECT Persons.name AS director_name, Films.title
FROM Films
JOIN Persons ON Films.director_id = Persons.id
WHERE Films.score >= 8;

--6: Show all the movies an actor been part of
SELECT Persons.name AS Actor, Films.title, films.genre, films.score
FROM Casts
JOIN Films AS Films ON Casts.film_id = Films.id
JOIN Persons AS Persons  ON Casts.people_id = Persons.id
WHERE Casts.people_id=3;