-- Show the title and director name for all films
SELECT movies.title,directors.name FROM movies JOIN directors ON movies.director_id = directors.id;

-- Show the title, director and star name for all films
SELECT movies.title,directors.name,star.name from movies as m
    JOIN directors as d ON m.director_id = d.id
    JOIN star as s ON m.star_id = s.id;

-- Show the title of films where the director is from the USA
SELECT movies.title FROM movies, directors
	WHERE movies.director_id = directors.id AND directors.country = 'USA';

-- Show only those films where the writer and the director are the same person
SELECT * FROM movies JOIN directors ON directors.id = movies.director_id JOIN writer ON writer.id = movies.writer_id WHERE directors.name = writer.name;


-- Show directors and film titles for films with a score of 8 or higher
SELECT directors.name, movies.title FROM directors JOIN movies ON directors.id = movies.director_id  where movies.score > 8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
-- Get all the information from the database almost like the monolithic table
SELECT * FROM movies as m
	JOIN directors as d ON  m.director_id = d.id
	JOIN stars as s ON m.star_id = s.id
	JOIN writer as w ON m.writer_id = w.id ORDER BY m.id;

-- Print writers from these movies in historical order of the movie
SELECT writer.name  FROM writer JOIN movies ON movies.writer_id = writer.id ORDER BY movies.year;

-- Print the directors names whose movies stars starts withs G
SELECT directors.name  FROM directors JOIN movies ON movies.director_id = directors.id JOIN stars ON stars.id = movies.star_id WHERE stars.name LIKE 'G%';

-- Print the movie title of all movies where the writers emails ends with email.com
SELECT m.title FROM movies as m
	JOIN directors as d ON d.id = m.director_id
	JOIN writer as w ON w.id = m.writer_id
	WHERE w.writer_email LIKE '%email.com';

-- Print the directors countries which stars where born in march
SELECT d.country FROM directors as d
	JOIN movies as m ON m.director_id = d.id
	JOIN stars as s ON s.id = m.star_id
	WHERE s.date_of_birth LIKE '%/03/%';