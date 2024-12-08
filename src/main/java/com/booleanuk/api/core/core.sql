CREATE TABLE writer(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
email TEXT);

CREATE TABLE director(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
country TEXT NOT NULL);

CREATE TABLE star(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
DOB DATE NOT NULL);

CREATE TABLE film(
id SERIAL PRIMARY KEY,
title TEXT,
year INT,
genre TEXT,
score INT,
writer_id INT,
director_id INT,
star_id INT,
CONSTRAINT fk_writer_id
    FOREIGN KEY(writer_id)
      REFERENCES writer(id),
CONSTRAINT fk_director_id
    FOREIGN KEY(director_id)
      REFERENCES director(id),
CONSTRAINT fk_star_id
    FOREIGN KEY(star_id)
      REFERENCES star(id));

INSERT INTO writer(name, email)
VALUES
('Arthur C Clarke', 'arthur@live.no'),
('George Lucas', 'george@live.no'),
('Harper Lee', 'harper@live.no'),
('James Cameron', 'james@live.no'),
('Boris Pasternak', 'boris@live.no'),
('Frederick Frank', 'fred@live.no'),
('Theodoros Angelo', 'theo@live.no');

INSERT INTO director(name, country)
VALUES
('Stanley Kubrick', 'USA'),
('George Lucas', 'Georgia'),
('Rob Mulligan', 'Afghanistan'),
('James Cameron', 'Australia'),
('Dave Lean', 'England'),
('Anthony Mann', 'Japan'),
('Christopher Nolan', 'Norway');

INSERT INTO star(name, DOB)
VALUES
('Keir Dullea', '2001-10-12'),
('Mark Hamill', '1990-07-25'),
('Rob Frank', '1987-03-20'),
('The Rock', '1985-10-23'),
('Jason Statham', '1990-12-23'),
('RDJ', '2000-10-27'),
('Ryan Reynolds', '1890-12-23');

INSERT INTO film(title,
year,
genre,
score,
writer_id,
director_id,
star_id)
VALUES
('2001: A Space Odyssey', 2001, 'SciFi', 9, 1, 3, 3),
('Star Wars: A New Hope', 1990, 'SciFi', 8, 2, 2, 3),
('To Kill A Mockingbird', 1980, 'Drama', 7, 3, 3, 3),
('Titanic', 2007, 'Romance', 8, 4, 3, 4),
('Dr Zhivago', 2010, 'SciFi', 6, 4, 3, 3),
('Soldier of Orange', 1996, 'Action', 8, 2, 4, 5),
('Three Colours: Blue', 2011, 'Action', 10, 1, 5, 5);


/*
Show the title and director name for all films
Show the title, director and star name for all films
Show the title of films where the director is from the USA
Show only those films where the writer and the director are the same person
Show directors and film titles for films with a score of 8 or higher
Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
*/

SELECT film.title, director.name from film JOIN director ON film.director_id = director.id;
SELECT film.title, director.name, star.name from film JOIN director ON film.director_id = director.id JOIN star ON film.star_id = star.id;
SELECT film.title from film JOIN director ON film.director_id = director.id WHERE director.country = 'USA';
SELECT film.title from film WHERE film.director_id = film.writer_id;
SELECT film.title, director.name FROM film JOIN director ON film.director_id = director.id WHERE film.score >= 8;
SELECT film.title, director.name FROM film JOIN director ON film.director_id = director.id WHERE film.title LIKE '%s%';
SELECT film.title, director.name, star.name FROM film JOIN director ON film.director_id = director.id JOIN star ON film.star_id = star.id;
SELECT film.title, director.name, star.name FROM film JOIN director ON film.director_id = director.id JOIN star ON film.star_id = star.id WHERE star.dob = '1990-07-25' ;
SELECT film.year, director.country FROM film JOIN director ON film.director_id = director.id;
SELECT film.year, director.country FROM film JOIN director ON film.director_id = director.id WHERE director.country = 'Afghanistan';
SELECT DISTINCT film.year, director.country FROM film JOIN director ON film.director_id = director.id WHERE director.country = 'Afghanistan';
SELECT film.title, film.score, star.name FROM film JOIN star ON film.star_id = star.id ORDER BY film.score DESC;





