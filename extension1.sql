DROP TABLE IF EXISTS films CASCADE;
DROP TABLE IF EXISTS directors CASCADE;
DROP TABLE IF EXISTS stars CASCADE;
DROP TABLE IF EXISTS writers CASCADE;
DROP TABLE IF EXISTS people CASCADE;

CREATE TABLE people(
  id serial primary key,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE writers(
  id serial primary key,
	email VARCHAR(255) NOT NULL,
  people_id INT REFERENCES people(id)
);

CREATE TABLE stars(
 	id serial primary key,
  dob INT NOT NULL,
  people_id INT REFERENCES people(id)
);

CREATE TABLE directors(
  id serial primary key,
  country VARCHAR(255) NOT NULL,
  people_id INT REFERENCES people(id)
);

CREATE TABLE films(
	id serial primary key,
  title VARCHAR(255) NOT NULL,
  year INT NOT NULL,
  genre VARCHAR(255) NOT NULL,
  score INT NOT NULL,
  director_id INT REFERENCES people(id),
  writer_id INT REFERENCES people(id),
  star_id INT REFERENCES people(id)
);

INSERT INTO people(name) VALUES
('Stanley Kubrick'), -- 1
('Arthur C Clarke'), -- 2
('Keir Dullea'),  -- 3
('George Lucas'), -- 4
('Mark Hamill'), -- 5
('Robert Mulligan'), -- 6
('Harper Lee'), --7
('Gregory Peck'), --8 
('James Cameron'), -- 9
('Leonardo DiCaprio'), -- 10
('David Lean'), -- 11
('Boris Pasternak'), -- 12
('Julie Christie'), -- 13 
('Anthony Mann'), -- 14
('Frederick Frank'), --15
('Charlton Heston'), -- 16
('Theodoros Angelopoulos'), --17
('Manos Katrakis'), --18
('Paul Verhoeven'), --19
('Erik Hazelhoff Roelfzema'), --20
('Rutger Hauer'), -- 21
('Krzysztof Kieslowski'), -- 22
('Juliette Binoche'), -- 23
('Jean-Paul Rappeneau'), -- 24
('Edmond Rostand'), -- 25
('Gerard Depardieu'); -- 26

SELECT * FROM people;
 
INSERT INTO writers(people_id, email) VALUES
(2, 'arthur@clarke.com'),
(4, 'george@email.com'),
(7, 'harper@lee.com'),
(9, 'james@cameron.com'),
(12, 'boris@boris.com'),
(15, 'fred@frank.com'),
(17, 'theo@angelopoulos.com'),
(20, 'erik@roelfzema.com'),
(22, 'email@email.com'),
(25, 'edmond@rostand.com');

SELECT * FROM writers;

INSERT INTO stars(people_id, dob) VALUES
(3, 19360530),
(5, 19510925),
(8, 19160405),
(10, 19741111),
(13, 19400414),
(16, 19231004),
(18, 19080814),
(21, 19440123),
(23, 19640309),
(26, 19481227);


INSERT INTO directors(people_id, country) VALUES
(1, 'USA'),
(4, 'USA'),
(6, 'USA'),
(9, 'Canada'),
(11, 'UK'),
(14, 'USA'),
(17, 'Greece'),
(19, 'Netherlands'),
(22, 'Poland'),
(24, 'France');


INSERT INTO films(id, title, year, genre, score, director_id, star_id, writer_id) VALUES
(1, '2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 3, 2),
(2, 'Star Wars: A New Hope', 1977, 'Science Fiction', 7, 4, 5, 4),
(3, 'To Kill A Mockingbird', 1962, 'Drama', 10, 6, 8, 7),
(4, 'Titanic', 1997, 'Romance', 5, 9, 10, 9),
(5, 'Dr Zhivago', 1965, 'Historical', 8, 11, 13, 12),
(6, 'El Cid', 1961, 'Historical', 6, 14, 16, 15),
(7, 'Voyage to Cythera', 1984, 'Drama', 8, 17, 18, 17),
(8, 'Soldier of Orange', 1977, 'Thriller', 8, 19, 21, 20),
(9, 'Three Colours: Blue', 1993, 'Drama', 8, 22, 23, 22),
(10, 'Cyrano de Bergerac', 1990, 'Historical', 9, 24, 26, 25);


SELECT * FROM films WHERE director_id = 11;
SELECT * FROM people WHERE id = 11;
SELECT * FROM directors;
-- Get director of each film
SELECT title, name AS director_name FROM films JOIN people ON people.id = films.director_id;

SELECT * FROM films;

SELECT * FROM films JOIN people on people.id = films.director_id;

SELECT title, people_dir.name AS director_name, people_star.name AS star_name, people_writer.name as writer_name FROM films 
	JOIN people people_dir on people_dir.id = films.director_id
  JOIN people people_star ON people_star.id = films.star_id
  JOIN people people_writer ON people_writer.id = films.writer_id;

SELECT * FROM films 
	JOIN people people_dir on people_dir.id = films.director_id
  JOIN people people_star ON people_star.id = films.star_id
  JOIN people people_writer ON people_writer.id = films.writer_id;

SELECT title, people.name AS director_name, directors.country FROM films
  JOIN people ON people.id = films.director_id
  JOIN directors ON people.id = directors.people_id 
  WHERE directors.country = 'USA';
 
 SELECT title, people.name AS director_name, directors.country, score FROM films
  JOIN people ON people.id = films.director_id
  JOIN directors ON people.id = directors.people_id 
  WHERE score >= 8;
 
SELECT title, people_dir.name AS director_name, people_writer.name AS writer_name FROM films
 JOIN people people_dir ON people_dir.id = films.director_id
 JOIN people people_writer ON people_writer.id = films.writer_id
 WHERE people_writer.name = people_dir.name;