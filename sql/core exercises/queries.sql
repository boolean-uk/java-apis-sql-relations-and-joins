1. Show the title and director name for all films
    SELECT film.title, director.name AS director_name
    FROM film
    JOIN director ON film.director_id = director.id;

2. Show the title, director and star name for all films
    SELECT film.title, director.name AS director_name, star.name AS star_name
    FROM film
    JOIN director ON film.director_id = director.id
    JOIN star ON film.star_id = star.id;

3. Show the title of films where the director is from the USA
    SELECT film.title
    FROM film
    JOIN director ON film.director_id = director.id
    WHERE director.country = 'USA';

4. Show only those films where the writer and the director are the same person
    SELECT *
    FROM film
    JOIN writer ON film.writer_id = writer.id
    JOIN star ON film.star_id = star.id
    WHERE writer.name = star.name;

5. Show directors and film titles for films with a score of 8 or higher
    SELECT director.name AS director_name, film.title
    FROM film
    JOIN director ON film.director_id = director.id
    WHERE film.score >= 8;

6. Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
    SELECT film.title, director.name AS director_name, star.name AS star_name, writer.name AS writer_name
    FROM film
    JOIN writer ON film.writer_id = writer.id
    JOIN star ON film.star_id = star.id
    JOIN director ON film.director_id = director.id
    WHERE film.year >= 1980;