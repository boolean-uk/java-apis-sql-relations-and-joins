-- Show the title and director name for all films
SELECT films.title AS Film, directors.name AS Director
FROM films
NATURAL JOIN directors;

-- Show the title, director and star name for all films
SELECT f.title AS Film, d.name AS Director, s.name AS Stars
FROM films f
INNER JOIN directors d ON f.directorid=d.id
INNER JOIN stars s ON s.id=f.starid;

-- Show the title of films where the director is from the USA
SELECT f.title
FROM films f
INNER JOIN directors d ON f.directorid=d.id
WHERE d.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT f.title AS Film, d.name AS Director_and_writer
FROM films f
INNER JOIN directors d ON f.directorid=d.id
INNER JOIN writers w ON f.writerid=w.id
WHERE d.name=w.name;

-- Show directors and film titles for films with a score of 8 or higher
SELECT f.title AS Films_eight_or_more, d.name AS Director
FROM films f
INNER JOIN directors d ON f.directorid=d.id
WHERE f.score>=8;


-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

-- 1: Show film title and writer for films with a score of 10
SELECT f.title AS Films_perfect_rating, w.name AS writer
FROM films f
INNER JOIN writers w ON f.writerId=w.id
WHERE f.score=10;

-- 2: Show film title and star for films released before 1970
SELECT f.title, s.name AS star
FROM films f
INNER JOIN stars s ON f.starId=s.id
WHERE f.year<1970;

-- 3: Show average film rating by director country
SELECT d.country, AVG(f.score)
FROM films f
INNER JOIN directors d ON f.directorId=d.id
GROUP BY d.country;

-- 4: Show film title, genre, and star where the star was born before 1940
SELECT f.title, f.genre, s.name AS star
FROM films f
INNER JOIN stars s ON f.starId=s.id
WHERE s.dob < '1940-01-01';

-- 5: Show film title, genre, and director country
SELECT f.title, f.genre, d.country AS director_country
FROM films f
INNER JOIN directors d ON f.directorId=d.id;


