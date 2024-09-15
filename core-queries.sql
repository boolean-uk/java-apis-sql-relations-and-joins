-- title and director for all films
SELECT title, name AS director
FROM films JOIN directors
    ON director_id = directors.id;

-- title, director and star of all films
SELECT title, d.name AS director, s.name AS star
FROM films
    JOIN directors AS d ON director_id = d.id
    JOIN actors AS s ON star_id = s.id;

-- title of films where the director is from the USA
SELECT title
FROM films JOIN directors
    ON director_id = directors.id
WHERE country = 'USA';

-- films where the writer and the director are the same person
SELECT title FROM films
    JOIN directors AS d ON director_id = d.id
    JOIN writers AS w ON writer_id = w.id
WHERE w.name = d.name;

-- directors and title for films with score 8 or higher
SELECT name AS director, title
FROM films JOIN directors
    ON director_id = directors.id
WHERE score >= 8;

-- movies and name of actors born 1960-1980
SELECT title, name AS actor
FROM films JOIN actors
    ON star_id = actors.id
WHERE dob BETWEEN '1960-01-01' AND '1980-12-31';

-- actors in movies that have been rated 7 or less
SELECT name AS actor
FROM films JOIN actors
    ON star_id = actors.id
WHERE score <= 7;

-- writers of historical movies
SELECT name AS writer
FROM films JOIN writers
    ON writer_id = writers.id
WHERE genre = 'Historical';

-- directors of movies made 1970-1990
SELECT name AS director
FROM films JOIN directors
    ON director_id = directors.id
WHERE year BETWEEN 1970 AND 1990;

-- movie title, director, writer and star of either romance or scifi movies
SELECT title, d.name AS director, w.name AS writer, s.name AS star
FROM films
    JOIN directors AS d ON director_id = d.id
    JOIN actors AS s ON star_id = s.id
    JOIN writers AS w ON writer_id = w.id
WHERE genre = 'Romance' OR genre = 'Science Fiction';