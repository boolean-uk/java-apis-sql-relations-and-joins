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

-- Show directors and film titles for films with a score of 8 or higher

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.