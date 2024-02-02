CREATE TABLE IF NOT EXISTS Stars (
	id SERIAL PRIMARY KEY,
  name TEXT,
  dob TEXT
);

CREATE TABLE IF NOT EXISTS Writers (
	id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT
);

CREATE TABLE IF NOT EXISTS Directors (
	id SERIAL PRIMARY KEY,
  name TEXT,
  country TEXT
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

-- Stars
INSERT INTO Stars (name, dob) VALUES
  ('Keir Dullea', '30/05/1936'),
  ('Mark Hamill', '25/09/1951'),
  ('Gregory Peck', '05/04/1916'),
  ('Leonardo DiCaprio', '11/11/1974'),
  ('Julie Christie', '14/04/1940'),
  ('Charlton Heston', '04/10/1923'),
  ('Manos Katrakis', '14/08/1908'),
  ('Rutger Hauer', '23/01/1944'),
  ('Juliette Binoche', '09/03/1964'),
  ('Gerard Depardieu', '27/12/1948');

-- Writers
INSERT INTO Writers (name, email) VALUES
  ('Arthur C Clarke', 'arthur@clarke.com'),
  ('George Lucas', 'george@email.com'),
  ('Harper Lee', 'harper@lee.com'),
  ('James Cameron', 'james@cameron.com'),
  ('Boris Pasternak', 'boris@boris.com'),
  ('Frederick Frank', 'fred@frank.com'),
  ('Theodoros Angelopoulos', 'theo@angelopoulos.com'),
  ('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
  ('Krzysztof Kieslowski', 'email@email.com'),
  ('Edmond Rostand', 'edmond@rostand.com');

-- Directors
INSERT INTO Directors (name, country) VALUES
  ('Stanley Kubrick', 'USA'),
  ('George Lucas', 'USA'),
  ('Robert Mulligan', 'USA'),
  ('James Cameron', 'Canada'),
  ('David Lean', 'UK'),
  ('Anthony Mann', 'USA'),
  ('Theodoros Angelopoulos', 'Greece'),
  ('Paul Verhoeven', 'Netherlands'),
  ('Krzysztof Kieslowski', 'Poland'),
  ('Jean-Paul Rappeneau', 'France');

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

SELECT title, Directors.name AS Director FROM Films
	JOIN Directors ON Films.director_id = Directors.id;

SELECT title, Directors.name AS Director, Stars.name AS Star FROM Films
	JOIN Directors ON Films.director_id = Directors.id
  JOIN Stars ON Films.star_id = Stars.id;

SELECT title FROM Films
	JOIN Directors ON Films.director_id = Directors.id
  WHERE Directors.country IN ('USA');

SELECT title FROM Films
	JOIN Directors ON Films.director_id = Directors.id
	JOIN Writers ON Films.writer_id = Writers.id
  WHERE Directors.name = Writers.name;

SELECT title, Directors.name AS Director FROM Films
	JOIN Directors ON Films.director_id = Directors.id
  WHERE score >= 8;

/* Get full table as seen on github */
SELECT title,
	Directors.name AS Director,
  Directors.country AS Director_Country,
  Stars.name AS Star,
  Stars.dob AS Star_DOB,
  Writers.name AS Writer,
  Writers.email AS Writer_Email,
  year, genre, score
FROM Films
JOIN Directors ON Films.director_id = Directors.id
JOIN Stars ON Films.star_id = Stars.id
JOIN Writers ON Films.writer_id = Writers.id;

/* How many movies each director has, distinct director each movie though, so only 1 in count */
SELECT Directors.name AS Director, COUNT(*) FROM Films
	JOIN Directors ON Films.director_id = Directors.id
  GROUP BY Directors.name;

/* Average score for all movies */
SELECT AVG(score) AS Average_Film_Scores FROM films;

/* Count of occurences for each score */
SELECT score, COUNT(score) FROM films GROUP BY score ORDER BY score desc;

/* Get films where the Star were less than 30 when playing in the film */
SELECT title, Stars.name AS Star, (year - CAST(SUBSTRING(Stars.dob, 7, 4) AS INT)) AS Age FROM Films
  JOIN Stars ON Films.star_id = Stars.id
  WHERE (year - CAST(SUBSTRING(Stars.dob, 7, 4) AS INT)) < 30;

/* Info in less collumns and more readable format */
SELECT
  CONCAT(Films.title, ' (', Films.genre, ')') AS Movie,
  CONCAT('Directed by ', Directors.name, ' (',Directors.country,')', ' in ', CAST(Films.year AS TEXT)) AS Director,
  CONCAT('Starring ', Stars.name, ' (', Stars.dob, ')') AS Star,
  CONCAT('Written by ', Writers.name, ' (', Writers.email, ')') AS Writer,
  CASE
    WHEN Films.score >= 9 THEN CONCAT('Highly Recommended', ' (',Films.score,')')
    WHEN Films.score >= 7 THEN CONCAT('Recommended', ' (',Films.score,')')
    ELSE CONCAT('Consider Watching', ' (',Films.score,')')
  END AS Recommendation
FROM Films
JOIN Directors ON Films.director_id = Directors.id
JOIN Stars ON Films.star_id = Stars.id
JOIN Writers ON Films.writer_id = Writers.id;