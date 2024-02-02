CREATE TABLE IF NOT EXISTS People (
 	id SERIAL PRIMARY KEY,
  name Text
);

CREATE TABLE IF NOT EXISTS Stars (
	id SERIAL PRIMARY KEY,
  dob TEXT,
  person_id INT,
  CONSTRAINT fk_person
  	FOREIGN KEY(person_id)
  		REFERENCES People(id)
);

CREATE TABLE IF NOT EXISTS Writers (
	id SERIAL PRIMARY KEY,
  email TEXT,
  person_id INT,
  CONSTRAINT fk_person
  	FOREIGN KEY(person_id)
  		REFERENCES People(id)
);

CREATE TABLE IF NOT EXISTS Directors (
	id SERIAL PRIMARY KEY,
  country TEXT,
  person_id INT,
  CONSTRAINT fk_person
  	FOREIGN KEY(person_id)
  		REFERENCES People(id)
);

CREATE TABLE IF NOT EXISTS Films (
	id SERIAL PRIMARY KEY,
  title TEXT,
  year INT,
  genre TEXT,
  score int CHECK (score BETWEEN 1 and 10),
	director_id INT,
  star_id INT,
  writer_id INT,
  CONSTRAINT fk_director
  	FOREIGN KEY(director_id)
  		REFERENCES Directors(id),
 	CONSTRAINT fk_star
  	FOREIGN KEY(star_id)
  		REFERENCES Stars(id),
  CONSTRAINT fk_writer
  	FOREIGN KEY(writer_id)
  		REFERENCES Writers(id),
  unique(title)
);

INSERT INTO People (name) VALUES
	('Keir Dullea'),
	('Mark Hamill'),
	('Gregory Peck'),
	('Leonardo DiCaprio'),
 	('Julie Christie'),
 	('Charlton Heston'),
  ('Manos Katrakis'),
  ('Rutger Hauer'),
  ('Juliette Binoche'),
  ('Gerard Depardieu'),
  ('Arthur C Clarke'),
  ('George Lucas'),
  ('Harper Lee'),
  ('James Cameron'),
  ('Boris Pasternak'),
  ('Frederick Frank'),
  ('Theodoros Angelopoulos'),
  ('Erik Hazelhoff Roelfzema'),
  ('Krzysztof Kieslowski'),
  ('Edmond Rostand'),
  ('Stanley Kubrick'),
  ('Robert Mulligan'),
  ('David Lean'),
  ('Anthony Mann'),
  ('Paul Verhoeven'),
  ('Jean-Paul Rappeneau');



-- Insert data into People table
INSERT INTO Stars (person_id, dob) VALUES
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

-- Writers
INSERT INTO Writers (person_id, email) VALUES
  (11, 'arthur@clarke.com'),
  (12, 'george@email.com'),
  (13, 'harper@lee.com'),
  (14, 'james@cameron.com'),
  (15, 'boris@boris.com'),
  (16, 'fred@frank.com'),
  (17, 'theo@angelopoulos.com'),
  (18, 'erik@roelfzema.com'),
  (19, 'email@email.com'),
  (20, 'edmond@rostand.com');

-- Directors
INSERT INTO Directors (person_id, country) VALUES
  (21, 'USA'),
  (12, 'USA'),
  (22, 'USA'),
  (14, 'Canada'),
  (23, 'UK'),
  (24, 'USA'),
  (17, 'Greece'),
  (25, 'Netherlands'),
  (19, 'Poland'),
  (26, 'France');

-- Films
INSERT INTO Films (title, year, genre, score, director_id, star_id, writer_id) VALUES
  ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 1),
  ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
  ('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
  ('Titanic', 1997, 'Romance', 5, 4, 4, 4),
  ('Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
  ('El Cid', 1961, 'Historical', 6, 6, 6, 6),
  ('Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
  ('Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
  ('Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
  ('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 10);

/* List all people */
SELECT name FROM people;

SELECT title, People.name AS Director FROM Films JOIN Directors ON Films.director_id = Directors.id JOIN People ON Directors.person_id = People.id;

SELECT title, Director, Star FROM Films
		JOIN
    	(SELECT People.name AS Director, Directors.id FROM Directors JOIN People ON Directors.person_id = People.id)
    AS Director_with_name ON Films.director_id = Director_with_name.id
  	JOIN
    	(SELECT People.name AS Star, Stars.id FROM Stars JOIN People ON Stars.person_id = People.id)
    AS Star_with_name ON Films.star_id = Star_with_name.id;

SELECT title FROM Films JOIN Directors ON Films.director_id = Directors.id WHERE Directors.country IN ('USA');

SELECT title FROM Films JOIN Directors ON Films.director_id = Directors.id JOIN Writers ON Films.writer_id = Writers.id WHERE Directors.name = Writers.name;

SELECT title FROM Films
		JOIN
    		(SELECT People.name AS Director, Directors.id FROM Directors
         JOIN People ON Directors.person_id = People.id)
    AS Director_with_name ON Films.director_id = Director_with_name.id
  	JOIN
    		(SELECT People.name AS Writer, Writers.id FROM Writers
         JOIN People ON Writers.person_id = People.id)
    AS Writer_with_name ON Films.writer_id = Writer_with_name.id
    WHERE Director = Writer;

SELECT title, People.name AS Director FROM Films
		JOIN Directors ON Films.director_id = Directors.id
    JOIN People ON Directors.person_id = People.id
    WHERE score >= 8;


/* Get full table as seen on github */
SELECT title,
      Director,
      Director_Country,
      Star,
      Star_DOB,
      Writer,
      Writer_Email,
      year,
      genre,
      score
    FROM Films
		JOIN
    		(SELECT People.name AS Director, Directors.country AS Director_Country, Directors.id FROM Directors
         JOIN People ON Directors.person_id = People.id)
    AS Director_with_name ON Films.director_id = Director_with_name.id
  	JOIN
    		(SELECT People.name AS Star, Stars.dob AS Star_DOB, Stars.id FROM Stars JOIN People ON Stars.person_id = People.id)
    AS Star_with_name ON Films.star_id = Star_with_name.id
		JOIN
    		(SELECT People.name AS Writer, Writers.email AS Writer_Email, Writers.id FROM Writers
         JOIN People ON Writers.person_id = People.id)
    AS Writer_with_name ON Films.writer_id = Writer_with_name.id;

/* How many movies each director has, distinct director each movie though, so only 1 in count */
SELECT People.name AS Director, COUNT(*) FROM Films
    JOIN Directors ON Films.director_id = Directors.id
    JOIN People ON Directors.person_id = people.id GROUP BY People.name;

/* Average score for all movies */
SELECT AVG(score) AS Average_Film_Scores FROM films;

/* Count of occurences for each score */
SELECT score, COUNT(score) FROM films GROUP BY score ORDER BY score desc;

/* Get films where the Star were less than 30 when playing in the film */
SELECT title, People.name AS Star, (year - CAST(SUBSTRING(Stars.dob, 7, 4) AS INT)) AS Age FROM Films
	JOIN Stars ON Films.star_id = Stars.id
  JOIN People ON stars.person_id = People.id
  WHERE (year - CAST(SUBSTRING(Stars.dob, 7, 4) AS INT)) < 30;

/* Info in less columns and more readable format */
SELECT
  CONCAT(Films.title, ' (', Films.genre, ')') AS Movie,
  CONCAT('Directed by ', Director_name, ' (',country,')', ' in ', CAST(Films.year AS TEXT)) AS Director,
  CONCAT('Starring ', Star_name, ' (', dob, ')') AS Star,
  CONCAT('Written by ', Writer_name, ' (', email, ')') AS Writer,
  CASE
    WHEN Films.score >= 9 THEN CONCAT('Highly Recommended', ' (',Films.score,')')
    WHEN Films.score >= 7 THEN CONCAT('Recommended', ' (',Films.score,')')
    ELSE CONCAT('Consider Watching', ' (',Films.score,')')
  END AS Recommendation
FROM Films
	JOIN
      (SELECT People.name AS Director_name, Directors.country AS country, Directors.id FROM Directors
       JOIN People ON Directors.person_id = People.id)
  AS Director_with_name ON Films.director_id = Director_with_name.id
  JOIN
      (SELECT People.name AS Star_name, Stars.dob AS dob, Stars.id FROM Stars JOIN People ON Stars.person_id = People.id)
  AS Star_with_name ON Films.star_id = Star_with_name.id
  JOIN
      (SELECT People.name AS Writer_name, Writers.email AS email, Writers.id FROM Writers
       JOIN People ON Writers.person_id = People.id)
  AS Writer_with_name ON Films.writer_id = Writer_with_name.id;