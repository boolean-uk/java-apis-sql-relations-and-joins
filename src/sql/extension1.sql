DROP TABLE films
DROP TABLE directors
DROP TABLE writers
DROP TABLE stars

CREATE TABLE People (id SERIAL PRIMARY KEY, name TEXT UNIQUE)

INSERT INTO People(name)
VALUES
('Stanley Kubrick'),
('George Lucas'),
('Robert Mulligan'),
('James Cameron'),
('David Lean'),
('Anthony Mann'),
('Theodoros Angelopoulos'),
('Paul Verhoeven'),
('Krzysztof Kieslowski'),
('Jean-Paul Rappeneau');

CREATE TABLE directors(people_id int, FOREIGN KEY(people_id) REFERENCES people(id), country TEXT)

ALTER TABLE directors ADD UNIQUE (people_id)

CREATE TABLE actors(people_id int, FOREIGN KEY(people_id) REFERENCES people(id), dob TEXT)

ALTER TABLE actors ADD UNIQUE(people_id)

CREATE TABLE writers (people_id int, FOREIGN KEY(people_id) REFERENCES people(id), email TEXT)

ALTER TABLE writers ADD UNIQUE(people_id)

INSERT INTO actors(people_id, dob)
VALUES

(1, '30/05/1936'),
(2, '25/09/1951'),
(3, '05/04/1916'),
(4, '11/11/1974'),
(5, '14/04/1940'),
(6, '04/10/1923'),
(7, '14/08/1908'),
(8, '23/01/1944'),
(9, '09/03/1964'),
(10, '27/12/1948');

INSERT INTO directors(people_id, country)
VALUES
(11, 'USA'),
(12, 'USA'),
(13, 'USA'),
(14, 'Canada'),
(15, 'UK'),
(16, 'USA'),
(17, 'Greece'),
(18, 'Netherlands'),
(19, 'Poland'),
(20, 'France');

INSERT INTO writers (people_id, email)
VALUES
(21, 'arthur@clarke.com'),
(12, 'george@email.com'),
(22, 'harper@lee.com'),
(14, 'james@cameron.com'),
(23, 'boris@boris.com'),
(24, 'fred@frank.com'),
(17, 'theo@angelopoulos.com'),
(25, 'erik@roelfzema.com'),
(19, 'email@email.com'),
(26, 'edmond@rostand.com');

CREATE TABLE films(id SERIAL PRIMARY KEY, title TEXT, year int, genre TEXT, score int, director_id int, star_id int, writer_id int, FOREIGN KEY (director_id) REFERENCES directors(people_id), FOREIGN KEY (star_id) REFERENCES actors(people_id), FOREIGN KEY (writer_id) REFERENCES writers(people_id))

INSERT INTO films(title, year, genre, score, director_id, star_id, writer_id)
VALUES
('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 11, 1, 21),
('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 12, 2, 12),
('To Kill A Mockingbird', 1962, 'Drama', 10, 13, 3, 22),
('Titanic', 1997, 'Romance', 5, 14, 4, 14),
('Dr Zhivago', 1965, 'Historical', 8, 15, 5, 23),
('El Cid', 1961, 'Historical', 6, 16, 6, 24),
('Voyage to Cythera', 1984, 'Drama', 8, 17, 7, 17),
('Soldier of Orange', 1977, 'Thriller', 8, 18, 8, 25),
('Three Colours: Blue', 1993, 'Drama', 8, 19, 9, 19),
('Cyrano de Bergerac', 1990, 'Historical', 9, 20, 10, 26);


SELECT films.title, people.name FROM films INNER JOIN directors ON films.director_id = people_id INNER JOIN people ON people_id = people.id;

SELECT films.title, a.name as director, b.name as star FROM films JOIN people a ON films.director_id = a.id JOIN people b ON films.director_id = b.id;

SELECT films.title FROM films INNER JOIN directors ON films.director_id = directors.people_id WHERE directors.country = 'USA';

SELECT films.title FROM films INNER JOIN directors ON films.director_id = directors.people_id INNER JOIN writers ON films.writer_id = writers.people_id WHERE directors.people_id = writers.people_id;

SELECT people.name AS director, films.title AS film FROM films INNER JOIN directors ON films.director_id = directors.people_id INNER JOIN people on people_id = people.id WHERE score >= 8;




