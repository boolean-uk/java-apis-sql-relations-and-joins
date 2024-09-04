-- Show the title and director name for all films
SELECT title AS Film, name AS Director
FROM films f
JOIN directors d ON f.directorid=d.id
JOIN people p ON d.peopleId=p.id;

-- Show the title, director and star name for all films
SELECT f.title AS Film, d_people.name AS Director, s_people.name AS Stars
FROM films f
JOIN directors d ON f.directorid=d.id
JOIN people d_people ON d.peopleid=d_people.id
JOIN stars s ON f.starid=s.id
JOIN people s_people ON s.peopleid=s_people.id;


-- Show the title of films where the director is from the USA
SELECT f.title
FROM films f
JOIN directors d ON f.directorid=d.id
WHERE d.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT f.title AS Film
FROM films f
JOIN directors d ON f.directorid=d.id
JOIN writers w ON f.writerid=w.id
WHERE d.peopleId=w.peopleId;

-- Show directors and film titles for films with a score of 8 or higher
SELECT f.title AS Films_eight_or_more, p.name AS Director
FROM films f
JOIN directors d ON f.directorid=d.id
JOIN people p ON d.peopleid=p.id
WHERE f.score>=8;


-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.

-- 1: Show film title and writer for films with a score of 10
SELECT f.title AS Films_perfect_rating, p.name AS writer
FROM films f
JOIN writers w ON f.writerId=w.id
JOIN people p ON w.peopleid=p.id
WHERE f.score=10;

-- 2: Show film title and star for films released before 1970
SELECT f.title, p.name AS star
FROM films f
JOIN stars s ON f.starId=s.id
JOIN people p ON s.peopleid=p.id
WHERE f.year<1970;

-- 3: Show average film rating by director country
SELECT d.country, AVG(f.score)
FROM films f
JOIN directors d ON f.directorId=d.id
GROUP BY d.country;

-- 4: Show film title, genre, and star where the star was born before 1940
SELECT f.title, f.genre, p.name AS star
FROM films f
JOIN stars s ON f.starId=s.id
JOIN people p ON s.peopleid=p.id
WHERE s.dob < '1940-01-01';

-- 5: Show film title, genre, and director country
SELECT f.title, f.genre, d.country AS director_country
FROM films f
JOIN directors d ON f.directorId=d.id;






