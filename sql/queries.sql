/* show the title and director name for all films */
SELECT f.title, d.name
FROM films f
JOIN directors d ON f.director_id = d.id;

/* Show the title, director and star name for all films */
SELECT f.title, d.name AS director, s.name AS star
FROM films f
JOIN directors d ON f.director_id = d.id
JOIN stars s ON f.star_id = s.id;

/* show the title of all films where the director is from the USA */
SELECT f.title
FROM films f
JOIN directors d ON f.director_id = d.id
WHERE d.country = 'USA';

/* Show only those films where the writer and the director are the same person */
/* matched on name, because directors and writers have separate id spaces until
   the people table in Extension Task 1 */
SELECT f.title, d.name
FROM films f
JOIN directors d ON f.director_id = d.id
JOIN writers w ON f.writer_id = w.id
WHERE d.name = w.name;

/* Show directors and film titles for films with a score of 8 or higher */
SELECT f.title, d.name
FROM films f
JOIN directors d ON f.director_id = d.id
WHERE f.score >= 8;

/* --- 5 more queries to demonstrate understanding of joins and other relationships between tables --- */

/* Show the title and star name for all films */
SELECT f.title, s.name
FROM films f
JOIN stars s ON f.star_id = s.id;

/* Show the title and writer name for all films */
SELECT f.title, w.name
FROM films f
JOIN writers w ON f.writer_id = w.id;

/* Show the title and director name for all films released after 1980 */
SELECT f.title, d.name
FROM films f
JOIN directors d ON f.director_id = d.id
WHERE f.release_year > 1980;

/* Show the title and star name for all films in the 'Drama' genre */
SELECT f.title, s.name
FROM films f
JOIN stars s ON f.star_id = s.id
WHERE f.genre = 'Drama';

/* Show the title and writer name for all films with a score of 9 or higher */
SELECT f.title, w.name
FROM films f
JOIN writers w ON f.writer_id = w.id
WHERE f.score >= 9;
