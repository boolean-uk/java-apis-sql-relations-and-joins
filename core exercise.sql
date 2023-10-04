CREATE TABLE IF NOT EXISTS films (
	id SERIAL PRIMARY KEY,
	title TEXT,
	year INTEGER,
	genre TEXT,
	score INTEGER,
	director_id INTEGER,
	CONSTRAINT fk_directors
		FOREIGN KEY(director_id)
		REFERENCES directors(id),
	star_id INTEGER,
	CONSTRAINT fk_stars
		FOREIGN KEY(star_id)
		REFERENCES stars(id),
	writer_id INTEGER,
	CONSTRAINT fk_writers
		FOREIGN KEY(writer_id)
		REFERENCES writers(id)
);

CREATE TABLE IF NOT EXISTS directors (
	id SERIAL PRIMARY KEY,
	director_name TEXT,
	country TEXT
);

CREATE TABLE IF NOT EXISTS stars (
	id SERIAL PRIMARY KEY,
	star_name TEXT,
	date_of_birth TEXT
);

CREATE TABLE IF NOT EXISTS writers (
    id SERIAL PRIMARY KEY,
    writer_name TEXT,
    email TEXT
);

INSERT INTO films
(title, year, genre, score, director_id, star_id, writer_id)

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
('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 10);

INSERT INTO directors
(director_name, country)

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

INSERT INTO stars
(star_name, date_of_birth)

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
    ('Gerard Depardieu', '27/12/1948');


INSERT INTO writers
(writer_name, email)

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

SELECT title, director_name
FROM films
JOIN directors
ON directors.id = films.director_id;

SELECT title, director_name, star_name
FROM films
JOIN directors
ON directors.id = films.director_id
JOIN stars
ON stars.id = films.star_id;

SELECT title, director_name, country
FROM films
JOIN directors ON directors.id = films.director_id
WHERE directors.country = 'USA';

SELECT title, director_name
FROM films
JOIN directors ON directors.id = films.director_id
JOIN writers ON directors.director_name = writers.writer_name;

SELECT title, director_name, score
FROM films
JOIN directors ON directors.id = films.director_id
WHERE score >= 8;

SELECT title, director_name, score, country
FROM films
JOIN directors ON directors.id = films.director_id
WHERE score >= 8 AND directors.country = 'USA';

SELECT genre, star_name 
FROM films
JOIN stars ON stars.id = films.director_id;

SELECT title, year, genre, score, star_name, director_name, writer_name
FROM films
JOIN stars ON stars.id = films.star_id
JOIN writers ON writers.id = films.writer_id
JOIN directors ON directors.id = films.director_id;

SELECT star_name, score
FROM films
JOIN stars ON stars.id = films.star_id
WHERE score > 7;

SELECT genre, director_name
FROM films
JOIN directors ON directors.id = films.director_id
WHERE genre = 'Historical';