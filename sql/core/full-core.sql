DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS star;
DROP TABLE IF EXISTS writer;


CREATE TABLE IF NOT EXISTS director (
	directorId serial,
  name text,
  country text,
  PRIMARY KEY(directorId),
  UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS star (
	starId serial,
  name text,
  starDOB text,
  PRIMARY KEY(starId),
  UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS writer (
	writerId serial,
  name text,
  email text,
  PRIMARY KEY(writerId),
  UNIQUE(name),
  UNIQUE(email)
);




CREATE TABLE IF NOT EXISTS film (
    id serial,
  	directorId int,
  	starId int,
  	writerId int,
    title text,
    genre text,
    release_year int,
  	score int,
    PRIMARY KEY(id),
  	CONSTRAINT directorId
      FOREIGN KEY(directorId)
        REFERENCES director(directorId),
  	CONSTRAINT starId
      FOREIGN KEY(starId)
        REFERENCES star(starId),
  	CONSTRAINT writerId
      FOREIGN KEY(writerId)
        REFERENCES writer(writerid),
  	UNIQUE(title)
);



INSERT INTO writer
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
  ('Edmond Rostand', 'edmond@rostand.com');


INSERT INTO star
	(name, starDOB)
VALUES
	('Keir Dullea','30/05/1936'),
  ('Mark Hamill','25/09/1951'),
  ('Gregory Peck','05/04/1916'),
  ('Leonardo DiCaprio','11/11/1974'),
  ('Julie Christie','14/04/1940'),
  ('Charlton Heston','04/10/1923'),
  ('Manos Katrakis','14/08/1908'),
  ('Rutger Hauer','23/01/1944'),
  ('Juliette Binoche','09/03/1964'),
  ('Gerard Depardieu','27/12/1948');



INSERT INTO director
	(name, country)
VALUES
	('Stanley Kubrick','USA'),
  ('George Lucas','USA'),
  ('Robert Mulligan','USA'),
  ('James Cameron','Canada'),
  ('David Lean','UK'),
  ('Anthony Mann','USA'),
  ('Theodoros Angelopoulos','Greece'),
  ('Paul Verhoeven','Netherlands'),
  ('Krzysztof Kieslowski','Poland'),
  ('Jean-Paul Rappeneau','France');



INSERT INTO film
	(directorId, starId, writerId, title, genre, release_year, score)
VALUES
	(1,1,1,'2001: A Space Odyssey','Science Fiction',1968,10),
  (2,2,2,'Star Wars: A New Hope','Science Fiction',1977,7),
  (3,3,3,'To Kill A Mockingbird','Drama',1962,10),
  (4,4,4,'Titanic','Romance',1997,5),
  (5,5,5,'Dr Zhivago','Historical',1965,8),
  (6,6,6,'El Cid','Historical',1961,6),
  (7,7,7,'Voyage to Cythera','Drama',1984,8),
  (8,8,8,'Soldier of Orange','Thriller',1977,8),
  (9,9,9,'Three Colours: Blue','Drama',1993,8),
  (10,10,10,'Cyrano de Bergerac','Historical',1990,9);



SELECT film.title, director.name FROM film JOIN director ON film.directorid = director.directorid GROUP BY title, name;


SELECT film.title, director.name AS directorname, star.name AS starname
FROM film
	JOIN director ON film.directorid = director.directorid
	JOIN star ON film.starid = star.starid
GROUP BY title, directorName, starname;



SELECT film.title AS title FROM film JOIN director ON film.directorid = director.directorid WHERE director.country LIKE 'USA';


SELECT film.title AS title FROM film
	JOIN director ON film.directorid = director.directorid
  JOIN writer ON film.writerid = writer.writerid
WHERE director.name = writer.name;


SELECT director.name AS directorname, film.title as title FROM film
	JOIN director ON film.directorid = director.directorid
WHERE film.score >= 8;



--My queries

--Get films where director name is the same as writer and film is released after 1990 ordered ascendingly
SELECT film.title AS title, writer.name as writername, film.release_year as releaseyear FROM film
	JOIN director ON film.directorid = director.directorid
  JOIN writer ON film.writerid = writer.writerid
WHERE director.name = writer.name AND film.release_year > 1990
GROUP BY writername, releaseyear, title
ORDER BY film.release_year ASC;



--Get movies where the director name is the same as writer
SELECT film.title, director.name, writer.name FROM director, film, writer
WHERE director.name = writer.name
AND film.directorid = director.directorid
AND film.writerid = writer.writerid;



--Check for movies with stars that doesn't contain 0 in date of birth
SELECT film.title, star.name, star.stardob as dateOfBirth FROM film, star
WHERE film.starid = star.starid
AND star.stardob NOT LIKE '%0%';


--Get movies from USA ordered descendingly
SELECT film.title, director.country FROM film, director
WHERE film.directorid = director.directorid
AND director.country LIKE 'USA'
ORDER BY film.title DESC;

--Get movies with release dates before 1980 where the star is born before 1950
SELECT film.title, film.release_year, star.name, star.stardob FROM film, star
WHERE film.starid = star.starid
AND film.release_year < 1980
AND (star.stardob LIKE '________0%'
OR star.stardob LIKE '________1%'
OR star.stardob LIKE '________2%'
OR star.stardob LIKE '________3%'
OR star.stardob LIKE '________4%'
AND (star.stardob LIKE '_________1%')
OR star.stardob LIKE '_________2%'
OR star.stardob LIKE '_________3%'
OR star.stardob LIKE '_________4%'
OR star.stardob LIKE '_________5%'
OR star.stardob LIKE '_________6%'
OR star.stardob LIKE '_________7%'
OR star.stardob LIKE '_________8%'
OR star.stardob LIKE '_________9%');





