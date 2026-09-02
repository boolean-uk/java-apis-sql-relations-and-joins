/* Extension Task 1 versions of the queries in queries.sql.
   directors / stars / writers are gone: every join now goes to people, and the
   same table is joined more than once under different aliases (d, s, w). */

/* show the title and director name for all films */
SELECT f.title, d.first_name || ' ' || d.last_name AS director
FROM films f
JOIN people d ON f.director_id = d.id;

/* Show the title, director and star name for all films */
SELECT f.title,
       d.first_name || ' ' || d.last_name AS director,
       s.first_name || ' ' || s.last_name AS star
FROM films f
JOIN people d ON f.director_id = d.id
JOIN people s ON f.star_id = s.id;

/* show the title of all films where the director is from the USA */
SELECT f.title
FROM films f
JOIN people d ON f.director_id = d.id
WHERE d.nationality = 'USA';

/* Show only those films where the writer and the director are the same person */
/* this is the payoff of the refactor: two ids on the same row, no join needed to compare them */
SELECT f.title, d.first_name || ' ' || d.last_name AS director
FROM films f
JOIN people d ON f.director_id = d.id
WHERE f.director_id = f.writer_id;

/* Show directors and film titles for films with a score of 8 or higher */
SELECT f.title, d.first_name || ' ' || d.last_name AS director
FROM films f
JOIN people d ON f.director_id = d.id
WHERE f.score >= 8;

/* --- 5 more queries to demonstrate understanding of joins and other relationships between tables --- */

/* Show the title and star name for all films */
SELECT f.title, s.first_name || ' ' || s.last_name AS star
FROM films f
JOIN people s ON f.star_id = s.id;

/* Show the title and writer name for all films */
SELECT f.title, w.first_name || ' ' || w.last_name AS writer
FROM films f
JOIN people w ON f.writer_id = w.id;

/* Show the title and director name for all films released after 1980 */
SELECT f.title, d.first_name || ' ' || d.last_name AS director
FROM films f
JOIN people d ON f.director_id = d.id
WHERE f.release_year > 1980;

/* Show the title and star name for all films in the 'Drama' genre */
SELECT f.title, s.first_name || ' ' || s.last_name AS star
FROM films f
JOIN people s ON f.star_id = s.id
WHERE f.genre = 'Drama';

/* Show the title and writer name for all films with a score of 9 or higher */
SELECT f.title, w.first_name || ' ' || w.last_name AS writer
FROM films f
JOIN people w ON f.writer_id = w.id
WHERE f.score >= 9;

/* --- a few more, showing outer joins and aggregates rather than just inner joins --- */

/* Show every director and their films, including any director with no films at all */
/* now that everyone is in one table this returns all 26 people, with NULL titles
   for the ones who have never directed */
SELECT d.first_name || ' ' || d.last_name AS person, f.title
FROM people d
LEFT JOIN films f ON f.director_id = d.id
ORDER BY d.last_name;

/* Count how many films there are in each genre */
SELECT f.genre, COUNT(*) AS film_count
FROM films f
GROUP BY f.genre
ORDER BY film_count DESC;

/* Show each director country with its film count and average score */
SELECT d.nationality, COUNT(*) AS film_count, ROUND(AVG(f.score), 2) AS average_score
FROM films f
JOIN people d ON f.director_id = d.id
GROUP BY d.nationality
ORDER BY average_score DESC;

/* Show the title, star and star's date of birth for stars born before 1940 */
SELECT f.title,
       s.first_name || ' ' || s.last_name AS star,
       s.date_of_birth
FROM films f
JOIN people s ON f.star_id = s.id
WHERE s.date_of_birth < '1940-01-01'
ORDER BY s.date_of_birth;

/* --- new, only possible now that the three role tables are one --- */

/* Count each person's credits by joining films to people three times, once per role.
   Only people with at least one credit are shown. */
SELECT p.first_name || ' ' || p.last_name AS person,
       COUNT(DISTINCT fd.id) AS films_directed,
       COUNT(DISTINCT fs.id) AS films_starred_in,
       COUNT(DISTINCT fw.id) AS films_written
FROM people p
LEFT JOIN films fd ON fd.director_id = p.id
LEFT JOIN films fs ON fs.star_id = p.id
LEFT JOIN films fw ON fw.writer_id = p.id
GROUP BY p.id, p.first_name, p.last_name
HAVING COUNT(fd.id) + COUNT(fs.id) + COUNT(fw.id) > 0
ORDER BY person;

/* People in the database who have no credit on any film at all (should be none) */
SELECT p.first_name || ' ' || p.last_name AS person
FROM people p
LEFT JOIN films fd ON fd.director_id = p.id
LEFT JOIN films fs ON fs.star_id = p.id
LEFT JOIN films fw ON fw.writer_id = p.id
WHERE fd.id IS NULL AND fs.id IS NULL AND fw.id IS NULL;
