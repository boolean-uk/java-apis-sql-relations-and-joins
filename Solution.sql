/* Table Initialization */

CREATE TABLE IF NOT EXISTS directors (
	id SERIAL PRIMARY KEY,
	name TEXT,
	Country TEXT
);

CREATE TABLE IF NOT EXISTS stars (
	id SERIAL PRIMARY KEY,
	name TEXT,
	star_dob DATE
);

CREATE TABLE IF NOT EXISTS writers (
	id SERIAL PRIMARY KEY,
	name TEXT,
	email TEXT
);

CREATE TABLE IF NOT EXISTS films (
	id SERIAL PRIMARY KEY,
	title TEXT,
	director_id INT,
	star_id INT,
	writer_id INT,
	year INT,
	genre TEXT,
	score INT
);

ALTER TABLE films
	ADD CONSTRAINT fk_director
		FOREIGN KEY (director_id)
		REFERENCES directors(id);

ALTER TABLE films
	ADD CONSTRAINT fk_star
		FOREIGN KEY (star_id)
		REFERENCES stars(id);

ALTER TABLE films
	ADD CONSTRAINT fk_writer
		FOREIGN KEY (writer_id)
		REFERENCES writers(id);

/* Data Insertion */

INSERT INTO directors
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
	('Jean-Paul Rappeneau', 'France');

INSERT INTO stars
	(name, star_dob)
VALUES
	('Keir Dullea', '1936-05-30'),
	('Mark Hamill', '1951-09-25'),
	('Gregory Peck', '1916-04-05'),
	('Leonardo DiCaprio', '1974-11-11'),
	('Julie Christie', '1940-04-14'),
	('Charlton Heston', '1923-10-04'),
	('Manos Katrakis', '1908-08-14'),
	('Rutger Hauer', '1944-01-23'),
	('Juliette Binoche', '1964-03-09'),
	('Gerard Depardieu', '1948-12-27');

INSERT INTO writers
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

INSERT INTO films
	(title, director_id,star_id,writer_id,year,genre,score)
VALUES
	('2001: A Space Odyssey',1,1,1,1968,'Science Fiction',10),
	('Star Wars: A New Hope',2,2,2,1977,'Science Fiction',7),
	('To Kill A Mockingbird',3,3,3,1962,'Drama',10),
	('Titanic',4,4,4,1997,'Romance',5),
	('Dr Zhivago',5,5,5,1965,'Historical',8),
	('El Cid',6,6,6,1961,'Historical',6),
	('Voyage to Cythera',7,7,7,1984,'Drama',8),
	('Soldier of Orange',8,8,8,1977,'Thriller',8),
	('Three Colours: Blue',9,9,9,1993,'Drama',8),
	('Cyrano de Bergerac',10,10,10,1990,'Historical',9);

/* Core Queries */

	/* 1. Show the title and director name for all films */

	SELECT title,name FROM films
	JOIN directors
	ON films.director_id = directors.id;

	/* 2. Show the title, director and star name for all films */

	Select films.title as Film_title,directors.name as Director_name, stars.name as Star_name FROM films
	JOIN directors ON films.director_id = directors.id
	JOIN stars ON films.star_id = stars.id;

	/* 3.Show the title of films where the director is from the USA */

	SELECT films.title FROM films
	JOIN directors ON films.director_id = directors.id
	WHERE directors.country = 'USA';

	/* 4.Show only those films where the writer and the director are the same person */

	SELECT films.title FROM films
	JOIN directors ON films.director_id = directors.id
	JOIN writers ON films.writer_id = writers.id
	WHERE directors.name = writers.name;

	/* 5.Show directors and film titles for films with a score of 8 or higher */

	SELECT directors.name, films.title FROM films
	JOIN directors ON films.director_id = directors.id
	WHERE films.score >= 8;

	/* 6.Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables. */

	SELECT films.title as Title, directors.name as Director, directors.country as Director_Country, stars.name as Star,
		   stars.star_dob as Star_DOB, writers.name as Writer, writers.email as Writer_Email, films.year as Year, films.genre as Genre, films.score as score
	FROM films
	JOIN directors ON films.director_id = directors.id
	JOIN stars ON films.star_id = stars.id
	JOIN writers ON films.writer_id = writers.id;

	/* Extension 1 */

	CREATE TABLE IF NOT EXISTS people (
	id SERIAL PRIMARY KEY,
	name TEXT,
	country TEXT,
	dob DATE,
	email TEXT);

	INSERT INTO people (name,country)
	SELECT directors.name,directors.country FROM Directors;

	INSERT INTO people (name,dob)
	SELECT stars.name, stars.star_dob FROM stars;

	INSERT INTO people (name,email)
	SELECT writers.name, writers.email FROM writers;