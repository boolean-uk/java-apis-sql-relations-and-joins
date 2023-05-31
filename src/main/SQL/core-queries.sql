
SELECT title,directors."name" FROM movies JOIN directors ON director_id=directors.id; -- Show the title and director name for all films
SELECT title,directors."name" as director_name, stars."name" as star_name FROM movies JOIN directors ON director_id=directors.id JOIN stars ON star_id=stars.id; -- Show the title, director and star name for all films
SELECT title FROM movies JOIN directors ON director_id=directors.id WHERE directors.country='USA';-- Show the title of films where the director is from the USA
SELECT movies.* FROM movies JOIN directors ON director_id=directors.id JOIN  writers ON writer_id=writers.id WHERE directors."name"=writers."name";-- Show only those films where the writer and the director are the same person
SELECT directors."name", directors.country,movies.title FROM movies JOIN directors ON director_id=directors.id WHERE score>=8;-- Show directors and film titles for films with a score of 8 or higher

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
SELECT directors.country,COUNT(directors.country) FROM movies JOIN directors ON director_id=directors.id GROUP BY directors.country; -- number of directors country
SELECT directors.country, AVG(score) FROM movies JOIN directors ON director_id=directors.id GROUP BY directors.country;-- average per country
SELECT * FROM movies JOIN stars ON star_id=stars.id ORDER BY stars."name" ASC;
SELECT * FROM movies JOIN directors ON director_id=directors.id ORDER BY directors."name" ASC;
SELECT * FROM movies JOIN directors ON director_id=directors.id WHERE directors.country='Greece';

