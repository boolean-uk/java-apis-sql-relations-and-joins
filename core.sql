DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS stars;
DROP TABLE IF EXISTS writers;


CREATE TABLE writers(
 	id serial primary key,
 	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL
);

CREATE TABLE stars(
	id serial primary key,
  name VARCHAR(255) NOT NULL,
  dob INT NOT NULL
);

CREATE TABLE directors(
	id serial primary key,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL
);

CREATE TABLE films(
	id serial primary key,
  title VARCHAR(255) NOT NULL,
  year INT NOT NULL,
  genre VARCHAR(255) NOT NULL,
  score INT NOT NULL,
  writers_id INT references writers(id),
  stars_id INT references stars(id),
  director_id INT references directors(id)
);



INSERT INTO writers(id, name, email) VALUES
(1, 'Arthur C Clarke', 'arthur@clarke.com'),
(2, 'George Lucas', 'george@email.com'),
(3, 'Harper Lee', 'harper@lee.com'),
(4, 'James Cameron', 'james@cameron.com'),
(5, 'Boris Pasternak', 'boris@boris.com'),
(6, 'Frederick Frank', 'fred@frank.com'),
(7, 'Theodoros Angelopoulos', 'theo@angelopoulos.com'),
(8, 'Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
(9, 'Krzysztof Kieslowski', 'email@email.com'),
(10, 'Edmond Rostand', 'edmond@rostand.com');

INSERT INTO stars(id, name, dob) VALUES
(1, 'Keir Dullea', 19360530),
(2, 'Mark Hamill', 19510925),
(3, 'Gregory Peck', 19160405),
(4, 'Leonardo DiCaprio', 19741111),
(5, 'Julie Christie', 19400414),
(6, 'Charlton Heston', 19231004),
(7, 'Manos Katrakis', 19080814),
(8, 'Rutger Hauer', 19440123),
(9, 'Juliette Binoche', 19640309),
(10, 'Gerard Depardieu', 19481227);


INSERT INTO directors(id, name, country) VALUES
(1, 'Stanley Kubrick', 'USA'),
(2, 'George Lucas', 'USA'),
(3, 'Robert Mulligan', 'USA'),
(4, 'James Cameron', 'Canada'),
(5, 'David Lean', 'UK'),
(6, 'Anthony Mann', 'USA'),
(7, 'Theodoros Angelopoulos', 'Greece'),
(8, 'Paul Verhoeven', 'Netherlands'),
(9, 'Krzysztof Kieslowski', 'Poland'),
(10, 'Jean-Paul Rappeneau', 'France');


INSERT INTO films(id, title, year, genre, score, writers_id, stars_id, director_id) VALUES
(1, '2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 1),
(2, 'Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
(3, 'To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
(4, 'Titanic', 1997, 'Romance', 5, 4, 4, 4),
(5, 'Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
(6, 'El Cid', 1961, 'Historical', 6, 6, 6, 6),
(7, 'Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
(8, 'Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
(9, 'Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
(10, 'Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 10);


SELECT * FROM films;

SELECT title, directors.name FROM films 
	INNER JOIN directors ON directors.id = films.director_id;

SELECT title, directors.name AS director_name, stars.name AS star_name FROM films 
	INNER JOIN directors ON directors.id = films.director_id 
  INNER JOIN stars ON stars.id = films.id;


SELECT title, directors.name AS director_name, directors.country as country FROM films 
	INNER JOIN directors ON directors.id = films.director_id 
  WHERE directors.country = 'USA';
  
SELECT title, directors.name AS director_name, writers.name AS writer_name FROM films
	INNER JOIN directors ON directors.id = films.director_id 
  INNER JOIN writers ON writers.id = films.writers_id 
  WHERE writers.name = directors.name;


SELECT title, score, directors.name AS director_name FROM films
 INNER JOIN directors ON directors.id = films.director_id
 WHERE score >= 8;

SELECT title, score, year, directors.name AS director_name, stars.name AS star_name, stars.dob AS star_dob, writers.name AS writer_name FROM films
	INNER JOIN directors ON directors.id = films.director_id
  INNER JOIN stars ON stars.id = films.stars_id
  INNER JOIN writers ON writers.id = films.writers_id
  WHERE stars.dob > 19510924;


SELECT title, score, year, directors.name AS director_name, stars.name AS star_name, writers.name AS writer_name FROM films
	INNER JOIN directors ON directors.id = films.director_id
  INNER JOIN stars ON stars.id = films.stars_id
  INNER JOIN writers ON writers.id = films.writers_id
  WHERE year > 1980 AND score >= 8;
  
