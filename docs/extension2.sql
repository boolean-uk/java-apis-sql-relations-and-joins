-- 1: Show the title and director name for all films
SELECT Films.title, Persons.name AS director_name
FROM Films
JOIN Persons ON Films.director_id = Persons.id;

-- 2: Show the title, director, and star name for all films
SELECT Films.title, Directors.name AS director_name, Stars.name AS star_name
FROM Films
JOIN Persons AS Directors ON Films.director_id = Directors.id
JOIN Stars ON Films.star_id = Stars.id;

-- 3: Show the title of films where the director is from the USA
SELECT Films.title
FROM Films
JOIN Persons ON Films.director_id = Persons.id
WHERE Persons.country = 'USA';

-- 4: Show only those films where the writer and the director are the same person
SELECT Films.title
FROM Films
WHERE Films.director_id = Films.writer_id;

-- 5: Show directors and film titles for films with a score of 8 or higher
SELECT Persons.name AS director_name, Films.title
FROM Films
JOIN Persons ON Films.director_id = Persons.id
WHERE Films.score >= 8;

-- 6 Show all persons who have worked on the film "Inception"
SELECT DISTINCT Persons.id, Persons.name, Persons.country, Persons.date_of_birth, Persons.email
FROM Persons
JOIN Films ON Persons.id = Films.director_id
   OR Persons.id = Films.writer_id
   OR Persons.id = Films.star_id
WHERE Films.title = 'Inception';
