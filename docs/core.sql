
-- Query 1: Show the title and director name for all films
SELECT Films.title, Directors.name AS director_name
FROM Films
JOIN Directors ON Films.director_id = Directors.id;

-- Query 2: Show the title, director, and star name for all films
SELECT Films.title, Directors.name AS director_name, Stars.name AS star_name
FROM Films
JOIN Directors ON Films.director_id = Directors.id
JOIN Stars ON Films.star_id = Stars.id;

-- Query 3: Show the title of films where the director is from the USA
SELECT Films.title
FROM Films
JOIN Directors ON Films.director_id = Directors.id
WHERE Directors.country = 'USA';

-- Query 4: Show only those films where the writer and the director are the same person
SELECT Films.title
FROM Films
WHERE Films.director_id = Films.writer_id;

-- Query 5: Show directors and film titles for films with a score of 8 or higher
SELECT Directors.name AS director_name, Films.title
FROM Films
JOIN Directors ON Films.director_id = Directors.id
WHERE Films.score >= 8;

-- Query 6: Show all the films and genre for the writers
SELECT Films.title, Films.genre, Writers.name AS writer_name
FROM Films
JOIN Writers ON Films.writer_id = Writers.id;

-- Query 7: Show the title and year for the films with the director 'Quentin Tarantino'
SELECT Films.title, Films.year
FROM Films
JOIN Directors ON Films.director_id = Directors.id
WHERE Directors.name = 'Quentin Tarantino';

-- Query 8: Show the film title, name of the star and film genre
SELECT Films.title, Stars.name AS star_name, Films.genre
FROM Films
JOIN Stars ON Films.star_id = Stars.id;


-- Query 9: Show the film title and name for the director and writer
SELECT Films.title, Directors.name AS director_name, Writers.name AS writer_name
FROM Films
JOIN Directors ON Films.director_id = Directors.id
JOIN Writers ON Films.writer_id = Writers.id;

-- 10: Show the film title, name of the director for films made year 2000 or later.
SELECT Films.title, Directors.name AS director_name
FROM Films
JOIN Directors ON Films.director_id = Directors.id
WHERE Films.year >= 2000;
