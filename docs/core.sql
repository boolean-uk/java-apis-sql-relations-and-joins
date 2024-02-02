DROP TABLE Films;
DROP TABLE Stars;
DROP TABLE Directors;
DROP TABLE Writers;

CREATE TABLE IF NOT EXISTS Stars (
  id SERIAL PRIMARY KEY,
  name TEXT,
  dob TEXT
);

CREATE TABLE IF NOT EXISTS Directors (
  id SERIAL PRIMARY KEY,
  name TEXT,
  country TEXT
);

CREATE TABLE IF NOT EXISTS Writers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT
);

CREATE TABLE IF NOT EXISTS Films (
  id SERIAL PRIMARY KEY,
  title TEXT,
  year INT,
  genre TEXT,
  score INT,
  star_id INT,
  director_id INT,
  writer_id INT,
  UNIQUE(title),
  CONSTRAINT fk_star
      FOREIGN KEY(star_id)
          REFERENCES Stars(id),
  CONSTRAINT fk_director
      FOREIGN KEY(director_id)
          REFERENCES Directors(id),
  CONSTRAINT fk_writer
      FOREIGN KEY(writer_id)
          REFERENCES Writers(id)
);

INSERT INTO Stars
    (name, dob)
VALUES
	('Keir Dullea', '30/05/1936'),
    ('Mark Hamill', '25/09/1951'),
    ('Gregory Peck', '05/04/1916'),
    ('Leonardo DiCaprio', '11/11/1974'),
    ('Julie Christie', '14/04/1940'),
    ('Charlton Heston', '04/10/1923'),
    ('Manos Katrakis', '14/08/1908'),
    ('Rutger Hauer', '23/01/1944'),
    ('Juliette Binoche', '09/03/1964'),
    ('Gerard Depardieu', '27/12/1948')
;

INSERT INTO Directors
	(name, country)
VALUES
	('Stanley Kubrick', 'USA'),
    ('George Lucas', 'USA'),
    ('Robert Mulligan', 'USA'),
    ('James Cameron', 'Canada'),
    ('David Lean', 'UK'),
    ('Anthony Mann', 'USA'),
    ('Theodoros Angelopoulos', 'Greece'),
    ('Paul Verhoeven', 'Netherlands'),
    ('Krzysztof Kieslowski', 'Poland'),
    ('Jean-Paul Rappeneau', 'France')
;

INSERT INTO Writers
	(name, email)
VALUES
	('Arthur C Clarke', 'arthur@clarke.com'),
    ('George Lucas', 'george@email.com'),
    ('Harper Lee', 'harper@lee.com'),
    ('James Cameron', 'james@cameron.com'),
    ('Boris Pasternak', 'boris@boris.com'),
    ('Frederick Frank', 'fred@frank.com'),
    ('Theodoros Angelopoulos', 'theo@angelopoulos.com'),
    ('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
    ('Krzysztof Kieslowski', 'email@email.com'),
    ('Edmond Rostand', 'edmond@rostand.com')
;

INSERT INTO Films
	(title, year, genre, score, star_id, director_id, writer_id)
VALUES
	('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 1),
    ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
    ('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
    ('Titanic', 1997, 'Romance', 5, 4, 4, 4),
    ('Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
    ('El Cid', 1961, 'Historical', 6, 6, 6, 6),
    ('Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
    ('Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
    ('Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
    ('Odyssey', 1968, 'Romance', 9, 10, 10, 10)
;

SELECT title, directors.name
	FROM films
  	JOIN directors
    	ON director_id = directors.id
;

SELECT title, directors.name, stars.name
	FROM films
  	JOIN directors
    	ON director_id = directors.id
    JOIN stars
    	ON star_id = stars.id
;

SELECT title, directors.name, directors.country
	FROM films
  	JOIN directors
    	ON director_id = directors.id
    WHERE directors.country LIKE 'USA'
;

SELECT title, directors.name, writers.name
	FROM films
  	JOIN directors
    	ON director_id = directors.id
    JOIN writers
    	ON writer_id = writers.id
    WHERE directors.name = writers.name
;

SELECT title, directors.name, score
	FROM films
  	JOIN directors
    	ON director_id = directors.id
    WHERE score >= 8
;

-- 5 more --

SELECT title, stars.name, directors.name, writers.name, score
	FROM films
  	JOIN directors
    	ON director_id = directors.id
    JOIN writers
    	ON writer_id = writers.id
    JOIN stars
    	ON star_id = stars.id
;

SELECT title, stars.name, score, genre
	FROM films
    JOIN stars
    	ON star_id = stars.id
    WHERE genre LIKE 'Historical'
;

SELECT title, stars.name, directors.name, writers.name, score
	FROM films
  	JOIN directors
    	ON director_id = directors.id
    JOIN writers
    	ON writer_id = writers.id
    JOIN stars
    	ON star_id = stars.id
    WHERE directors.name LIKE '%J%'
    OR writers.name LIKE '%J%'
    OR stars.name LIKE '%J%'
;

SELECT title, directors.name, score, year, genre
	FROM films
  	JOIN directors
    	ON director_id = directors.id
    WHERE directors.country NOT LIKE 'USA'
;

SELECT films.id, title, directors.name, directors.country, stars.name, stars.dob, writers.name, writers.email, year, genre, score
	FROM films
  	JOIN directors
    	ON director_id = directors.id
    JOIN writers
    	ON writer_id = writers.id
    JOIN stars
    	ON star_id = stars.id
;
  
  