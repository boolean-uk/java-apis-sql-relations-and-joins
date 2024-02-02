

/*EXTENSION 1*/

DROP TABLE film;
DROP TABLE writer;
DROP TABLE director;
DROP TABLE star;

CREATE TABLE people (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
role TEXT NOT NULL,
DOB DATE,
email TEXT,
country TEXT
);

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
      REFERENCES people(id),
CONSTRAINT fk_director_id
    FOREIGN KEY(director_id)
      REFERENCES people(id),
CONSTRAINT fk_star_id
    FOREIGN KEY(star_id)
      REFERENCES people(id));

INSERT INTO people
(name, role, DOB, email, country)
VALUES
('Arthur C Clarke', 'Writer', NULL, 'arthur@live.no', NULL),
('George Lucas', 'Writer', NULL, 'george@live.no', NULL),
('Harper Lee', 'Writer', NULL, 'harper@live.no', NULL),
('James Cameron', 'Director', NULL, 'james@live.no', 'Australia'),
('Boris Pasternak', 'Director', NULL, 'boris@live.no', 'Norway'),
('Frederick Frank', 'Director', NULL, 'fred@live.no', 'Japan'),
('Theodoros Angelo', 'Star', '2001-10-12', 'theo@live.no', NULL),
('Keir Dullea', 'Star', '2001-10-12', NULL, NULL),
('Mark Hamill', 'Star', '1990-07-25', NULL, NULL),
('Rob Frank', 'Star', '1987-03-20', NULL, NULL),
('The Rock', 'Star', '1985-10-23', NULL, NULL),
('Jason Statham', 'Star', '1990-12-23', NULL, NULL),
('RDJ', 'Star', '2000-10-27', NULL, NULL),
('Ryan Reynolds', 'Star', '1890-12-23', NULL, NULL);


INSERT INTO film(title,
year, genre, score, writer_id, director_id, star_id)
VALUES
('2001: A Space Odyssey', 2001, 'SciFi', 9, 1, 3, 3),
('Star Wars: A New Hope', 1990, 'SciFi', 8, 2, 2, 3),
('To Kill A Mockingbird', 1980, 'Drama', 7, 3, 3, 3),
('Titanic', 2007, 'Romance', 8, 4, 3, 4),
('Dr Zhivago', 2010, 'SciFi', 6, 4, 3, 3),
('Soldier of Orange', 1996, 'Action', 8, 2, 4, 5),
('Three Colours: Blue', 2011, 'Action', 10, 1, 5, 5);

SELECT film.title, people.name from film JOIN people ON film.director_id = people.id;

SELECT film.title, people.name AS director_name, people_star.name AS star_name FROM film JOIN people ON film.director_id = people.id JOIN people AS people_star ON film.star_id = people_star.id

SELECT film.title from film JOIN people ON film.director_id = people.id WHERE people.country = 'USA';

SELECT film.titlefrom film WHERE film.director_id = film.writer_id;

SELECT film.title, film.score, people.name AS director_name FROM film JOIN people ON film.director_id = people.id WHERE film.score >= 8;

SELECT film.title, people.name FROM film JOIN people ON film.director_id = people.id WHERE film.title LIKE '%s%';

SELECT film.title, people.name AS director_name, people_star.name AS star_name FROM film JOIN people ON film.director_id = people.id JOIN people AS people_star ON film.star_id = people_star.id;

SELECT film.title, people.name, people_star.name FROM film JOIN people ON film.director_id = people.id JOIN people AS people_star ON film.star_id = people_star.id WHERE people_star.dob = '1990-07-25' ;

SELECT film.year, people.country FROM film JOIN people ON film.director_id = people.id;

SELECT film.year, people.country FROM film JOIN people ON film.director_id = people.id WHERE people.country = 'Afghanistan';

SELECT DISTINCT film.year, people.country FROM film JOIN people ON film.director_id = people.id WHERE people.country = 'Afghanistan';

SELECT film.title, film.score, people.name FROM film JOIN people ON film.star_id = people.id ORDER BY film.score DESC;




