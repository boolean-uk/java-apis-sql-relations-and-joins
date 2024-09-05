-- EXTENSION 2

-- Add a Cast table that links Films to Actors
-- (ie the Cast table contains details of all of the Actors in addition to the Star
-- who appear in the Film).


CREATE TABLE people(
	id serial PRIMARY KEY,
	name TEXT NOT NULL,
	dob DATE,
	country TEXT,
	email TEXT
);

CREATE TABLE film(
	id serial PRIMARY KEY,
	title TEXT NOT NULL,
	directorId INTEGER NOT NULL REFERENCES people,
	starId INTEGER NOT NULL REFERENCES people,
	writerId INTEGER NOT NULL REFERENCES people,
	year INTEGER NOT NULL,
	genre TEXT NOT NULL,
	score int NOT NULL
);


-- Then populate the tables with the data shown
INSERT INTO people(name, country)
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

INSERT INTO people(name, dob)
VALUES
	('Keir Dullea','1936-05-30'),
	('Mark Hamill','1951-09-25'),
	('Gregory Peck','1916-04-05'),
	('Leonardo DiCaprio','1974-11-11'),
	('Julie Christie','1940-04-14'),
	('Charlton Heston','1923-10-04'),
	('Manos Katrakis','1908-08-14'),
	('Rutger Hauer','1944-01-23'),
	('Juliette Binoche','1964-03-09'),
	('Gerard Depardieu','1948-12-27');

INSERT INTO people(name, email)
VALUES
	('Arthur C Clarke','arthur@clarke.com'),
-- 	('George Lucas','george@email.com'),
	('Harper Lee','harper@lee.com'),
	('James Cameron','james@cameron.com'),
	('Boris Pasternak','boris@boris.com'),
	('Frederick Frank','fred@frank.com'),
	('Theodoros Angelopoulos','theo@angelopoulos.com'),
	('Erik Hazelhoff Roelfzema','erik@roelfzema.com'),
	('Krzysztof Kieslowsk','email@email.com'),
	('Edmond Rostand','edmond@rostand.com');

INSERT INTO film(title, directorId, starId, writerId, year, genre, score) VALUES
	('2001: A Space Odyssey', 1, 11, 21, 1968, 'Science Fiction', 10),
	('Star Wars: A New Hope', 2, 12, 2, 1977, 'Science Fiction', 7),
	('To Kill A Mockingbird', 3, 13, 22, 1962, 'Drama', 10),
	('Titanic', 4, 14, 23, 1997, 'Romance', 5),
	('Dr Zhivago', 5, 15, 24, 1965, 'Historical', 8),
	('El Cid', 6, 16, 25, 1961, 'Historical', 6),
	('Voyage to Cythera', 7, 17, 26, 1984, 'Drama', 8),
	('Soldier of Orange', 8, 18, 27, 1977, 'Thriller', 8),
	('Three Colours: Blue', 9, 19, 28, 1993, 'Drama', 8),
	('Cyrano de Bergerac', 10, 20, 29, 1990, 'Historical', 9);


-- Cast table
-- Actors in movie, join table
CREATE TABLE casts(
-- 	id serial PRIMARY KEY,
	filmId INTEGER NOT NULL REFERENCES film,
	peopleId INTEGER NOT NULL REFERENCES people
);

INSERT INTO casts(filmId, peopleId)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(2,1),
	(2,2);


-- Show all actors in film 1
SELECT DISTINCT film.title, people.name
FROM film
JOIN casts AS actor ON film.id = 1
JOIN people ON people.id = actor.peopleId;
