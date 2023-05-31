--    1. Show the title and director name for all films
SELECT title,directors.director_name from films JOIN directors ON films.director_id = directors.id;
--    2. Show the title, director and star name for all films
SELECT title,directors.director_name,stars.star_name from films JOIN directors ON films.director_id = directors.id JOIN stars ON films.star_id = stars.id;
--    3. Show the title of films where the director is from the USA
SELECT title from films JOIN directors ON films.director_id = directors.id WHERE directors.country='USA';
--    4. Show only those films where the writer and the director are the same person
SELECT films.id,films.title from films JOIN directors ON films.director_id =directors.id JOIN writers ON films.writer_id=writers.id WHERE directors.director_name=writers.writer_name;
--    5. Show directors and film titles for films with a score of 8 or higher
SELECT directors.director_name,films.title from films JOIN directors ON films.director_id = directors.id where score>=8;
--    6. Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
SELECT films.title,directors.director_name,stars.star_name,writers.writer_name FROM films JOIN writers ON films.writer_id = writers.id JOIN stars ON films.star_id = stars.id JOIN directors ON films.director_id = directors.id WHERE year>=1980;