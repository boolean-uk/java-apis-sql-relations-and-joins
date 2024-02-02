DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS star;
DROP TABLE IF EXISTS writer;
DROP TABLE IF EXISTS people;


CREATE TABLE IF NOT EXISTS people (
	peopleId serial,
  name text,
  PRIMARY KEY(peopleId),
  UNIQUE(name)
);


CREATE TABLE IF NOT EXISTS director (
	directorId serial,
	peopleId int,
  country text,
  PRIMARY KEY(directorId),
  CONSTRAINT peopleId
  	FOREIGN KEY(peopleId)
  		REFERENCES people(peopleId)
);

CREATE TABLE IF NOT EXISTS star (
	starId serial,
  peopleId int,
  starDOB text,
  PRIMARY KEY(starId),
  CONSTRAINT peopleId
  	FOREIGN KEY(peopleId)
  		REFERENCES people(peopleId)
);

CREATE TABLE IF NOT EXISTS writer (
	writerId serial,
	peopleId int,
  email text,
  PRIMARY KEY(writerId),
  CONSTRAINT peopleId
  	FOREIGN KEY(peopleId)
  		REFERENCES people(peopleId),
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



INSERT INTO people
	(name)
VALUES
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
  ('Stanley Kubrick'),
  ('Robert Mulligan'),
  ('David Lean'),
  ('Anthony Mann'),
  ('Paul Verhoeven'),
  ('Jean-Paul Rappeneau');


INSERT INTO writer
	(peopleId, email)
VALUES
	(1, 'arthur@clarke.com'),
  (2, 'george@email.com'),
  (3, 'harper@lee.com'),
  (4, 'james@cameron.com'),
  (5, 'boris@boris.com'),
  (6, 'fred@frank.com'),
  (7, 'theo@angelopoulos.com'),
  (8, 'erik@roelfzema.com'),
  (9, 'email@email.com'),
  (10, 'edmond@rostand.com');


INSERT INTO star
	(peopleId, starDOB)
VALUES
	(11,'30/05/1936'),
  (12,'25/09/1951'),
  (13,'05/04/1916'),
  (14,'11/11/1974'),
  (15,'14/04/1940'),
  (16,'04/10/1923'),
  (17,'14/08/1908'),
  (18,'23/01/1944'),
  (19,'09/03/1964'),
  (20,'27/12/1948');



INSERT INTO director
	(peopleId, country)
VALUES
	(21,'USA'),
  (2,'USA'),
  (22,'USA'),
  (4,'Canada'),
  (23,'UK'),
  (24,'USA'),
  (7,'Greece'),
  (25,'Netherlands'),
  (9,'Poland'),
  (26,'France');

  SELECT * FROM director;

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




SELECT film.title, people.name FROM film
JOIN director ON film.directorid = director.directorid
JOIN people ON director.peopleid = people.peopleid
GROUP BY title, name;


SELECT film.title, directorpeople.name AS directorname, starpeople.name AS starname
FROM film
JOIN director ON film.directorid = director.directorid
JOIN people AS directorpeople ON director.peopleid = directorpeople.peopleid
JOIN star ON film.starid = star.starid
JOIN people AS starpeople ON star.peopleid = starpeople.peopleid;




SELECT film.title, people.name AS directorname
FROM film
	JOIN director ON film.directorid = director.directorid
  JOIN people ON director.peopleid = people.peopleid
GROUP BY title, people.name;



SELECT film.title AS title FROM film JOIN director ON film.directorid = director.directorid WHERE director.country LIKE 'USA';


SELECT film.title AS title FROM film
	JOIN director ON film.directorid = director.directorid
  JOIN writer ON film.writerid = writer.writerid
  JOIN people AS writerpeople ON writer.peopleid = writerpeople.peopleid
  JOIN people AS directorpeople ON director.peopleid = directorpeople.peopleid
WHERE writerpeople = directorpeople;


SELECT directorpeople.name AS directorname, film.title as title FROM film
	JOIN director ON film.directorid = director.directorid
  JOIN people AS directorpeople ON director.peopleid = directorpeople.peopleid
WHERE film.score >= 8;



--My queries

--Get films where director name is the same as writer and film is released after 1990 ordered ascendingly
SELECT film.title AS title, writerpeople.name as writername, film.release_year as releaseyear FROM film
	JOIN director ON film.directorid = director.directorid
  JOIN writer ON film.writerid = writer.writerid
  JOIN people AS writerpeople ON writer.peopleid = writerpeople.peopleid
  JOIN people AS directorpeople ON director.peopleid = directorpeople.peopleid
WHERE directorpeople.name = writerpeople.name AND film.release_year > 1990
GROUP BY writername, releaseyear, title
ORDER BY film.release_year ASC;



--Get movies where the director name is the same as writer
SELECT film.title, directorpeople.name, writerpeople.name FROM film
	JOIN director ON film.directorid = director.directorid
  JOIN writer ON film.writerid = writer.writerid
  JOIN people AS writerpeople ON writer.peopleid = writerpeople.peopleid
  JOIN people AS directorpeople ON director.peopleid = directorpeople.peopleid
WHERE directorpeople.name = writerpeople.name
AND film.directorid = director.directorid
AND film.writerid = writer.writerid;



--Check for movies with stars that doesn't contain 0 in date of birth
SELECT film.title, starpeople.name, star.stardob as dateOfBirth FROM film, star
	JOIN people AS starpeople ON star.peopleid = starpeople.peopleid
WHERE film.starid = star.starid
AND star.stardob NOT LIKE '%0%';


--Get movies from USA ordered descendingly
SELECT film.title, director.country FROM film, director
WHERE film.directorid = director.directorid
AND director.country LIKE 'USA'
ORDER BY film.title DESC;

--Get movies with release dates before 1980 where the star is born before 1950
SELECT film.title, film.release_year, starpeople.name, star.stardob FROM film, star
	JOIN people AS starpeople ON star.peopleid = starpeople.peopleid
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



