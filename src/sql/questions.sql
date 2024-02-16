SELECT title,directors.name FROM films JOIN directors ON director_id = directors.id;

SELECT title,directors.name as director_name, stars.name as star_name FROM films JOIN directors ON director_id = directors.id JOIN stars ON star_id = stars.id;

SELECT title FROM films JOIN directors ON director_id = directors.id WHERE directors.country = 'USA';

SELECT films.* FROM films JOIN directors ON director_id = directors.id writers ON writer_id = writers.id WHERE directors.name = writers.name;

SELECT directors.name, directors.country, films.title FROM films ON director_id = directors.id WHERE score >= 8;

SELECT * FROM films JOIN stars ON star_id = stars.id ORDER BY stars.dob DESC;

SELECT * FROM films JOIN writers ON writer_id = writers.id ORDER BY writers.name ASC;

SELECT * FROM films JOIN directors ON director_id = directors.id WHERE directors.country = 'Canada';

SELECT directors.country, AVG(score) FROM films JOIN directors ON director_id = directors.id GROUP BY directors.country;

SELECT films.score, COUNT(films.score) FROM films JOIN films ON film_id = films.id GROUP BY films.score;
