-- Show the title and director name for all films
SELECT title,directors."name" FROM movies JOIN directors ON director_id=directors.id;

-- Show the title, director and star name for all films
SELECT title,directors."name" as director_name, stars."name" as star_name FROM movies JOIN directors ON director_id=directors.id JOIN stars ON star_id=stars.id;

-- Show the title of films where the director is from the USA
SELECT title FROM movies JOIN directors ON director_id=directors.id WHERE directors.country='USA';

-- Show only those films where the writer and the director are the same person
SELECT movies.* FROM movies JOIN directors ON director_id=directors.id JOIN  writers ON writer_id=writers.id WHERE directors."name"=writers."name";

-- Show directors and film titles for films with a score of 8 or higher
SELECT directors."name", directors.country,movies.title FROM movies JOIN directors ON director_id=directors.id WHERE score>=8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
-- Show the number of directors per country
SELECT directors.country,COUNT(directors.country) FROM movies JOIN directors ON director_id=directors.id GROUP BY directors.country;

-- Show the average score per country
SELECT directors.country, AVG(score) FROM movies JOIN directors ON director_id=directors.id GROUP BY directors.country;

-- Show all the films sorted by the star's names alphabetically
SELECT * FROM movies JOIN stars ON star_id=stars.id ORDER BY stars."name" ASC;

-- Show all the films sorted by the star's names alphabetically
SELECT * FROM movies JOIN directors ON director_id=directors.id ORDER BY directors."name" ASC;

-- Show all the films where the director is from Greece
SELECT * FROM movies JOIN directors ON director_id=directors.id WHERE directors.country='Greece';

