--refactored queries for extension 1
-- Show the title and director name for all films
SELECT title,people."name" FROM films JOIN people ON director_id=people.id;

-- Show the title, director and star name for all films
SELECT films.title, a.name as directors_name, b.name as stars_name  FROM films
JOIN people a ON director_id=a.id
JOIN people b ON star_id=b.id;

-- Show the title of films where the director is from the USA
SELECT title FROM films JOIN people ON director_id=people.id WHERE people.country='USA';

-- Show only those films where the writer and the director are the same person
SELECT films.* FROM films JOIN people a ON director_id=a.id JOIN  people b ON writer_id=b.id WHERE a."name"=b."name";

-- Show people and film titles for films with a score of 8 or higher
SELECT people."name", people.country,films.title FROM films JOIN people ON director_id=people.id WHERE score>=8;

-- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
-- Show the number of people per country
SELECT people.country,COUNT(people.country) FROM films JOIN people ON director_id=people.id GROUP BY people.country;

-- Show the average score per country
SELECT people.country, AVG(score) FROM films JOIN people ON director_id=people.id GROUP BY people.country;

-- Show all the films sorted by the star's names alphabetically
SELECT * FROM films JOIN people ON star_id=people.id ORDER BY people."name" ASC;

-- Show all the films sorted by the director's names alphabetically
SELECT * FROM films JOIN people ON director_id=people.id ORDER BY people."name" ASC;

-- Show all the films where the director is from Greece
SELECT * FROM films JOIN people ON director_id=people.id WHERE people.country='Greece';