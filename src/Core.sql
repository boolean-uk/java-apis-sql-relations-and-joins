--Setup
CREATE TABLE directors (id SERIAL PRIMARY KEY, name TEXT, country TEXT);

CREATE TABLE stars (id SERIAL PRIMARY KEY, name TEXT, date_of_birth DATE);

CREATE TABLE writers (id SERIAL PRIMARY KEY, name TEXT, email TEXT);

CREATE TABLE films (
	id SERIAL PRIMARY KEY,
	title TEXT,
	year INTEGER,
	genre TEXT,
	score INTEGER,
	directorId INTEGER,
	starId INTEGER,
	writerId INTEGER,
	CONSTRAINT fkDirector
		FOREIGN KEY(directorId)
			REFERENCES directors(id),
	CONSTRAINT fkStar
		FOREIGN KEY(starId)
			REFERENCES stars(id),
	CONSTRAINT fkWriter
		FOREIGN KEY(writerId)
			REFERENCES writers(id)
);



--Directors
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
--More directors to make the selects more varied
INSERT INTO directors
	(name, country)
VALUES
	('Martin Scorsese', 'USA'),
	('Quentin Tarantino', 'USA'),
	('Tim Burton', 'USA');
--DROP TABLE directors

--Stars
INSERT INTO stars
	(name, date_of_birth)
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
--More stars to make the selects more vaired
INSERT INTO stars
	(name, date_of_birth)
VALUES
	('Jack Nicholson', '1937-04-22'),
	('Sam Worthington', '1976-08-02'),
	('Ewan McGregor', '1971-03-31');
--DROP TABLE stars

--Writers
INSERT INTO writers
	(name, email)
VALUES
	('Arthur C Clarke', 'arthur@clarke.com'),
	('George Lucas', 'george@email.com'),
	('Harper Lee','harper@lee.com'),
	('James Cameron','james@cameron.com'),
	('Boris Pasternak','boris@boris.com'),
	('Frederick Frank','fred@frank.com'),
	('Theodoros Angelopoulos','theo@angelopoulos.com'),
	('Erik Hazelhoff Roelfzema','erik@roelfzema.com'),
	('Krzysztof Kieslowski','email@email.com'),
	('Edmond Rostand','edmond@rostand.com');
--More writers to make the selects more varied
INSERT INTO writers
	(name, email)
VALUES
	('Stanley Kubrick', 'stanley@kubrick.com'),
	('Terence Winter', 'terence@winter.com'),
	('Quentin Tarantino', 'quentin@tarantino.com')
	('Sam Hamm', 'sam@hamm.com'),
	('Jonathan Gems', 'jonathan@gems.com');
--DROP TABLE writers

INSERT INTO films
	(title, year, genre, score, directorId, starId, writerId)
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
--More movies to make the selects more varies
INSERT INTO films
	(title, year, genre, score, directorId, starId, writerId)
VALUES
	('The Shining', 1980, 'Thriller', 8, 1, 11, 11),
	('Star Wars: The Phantom Menace', 1999, 'Science Fiction', 6, 2, 13, 2),
	('Avatar', 2009, 'Science Fiction', 8, 4, 12, 4),
	('The Wolf of Wall Street', 2013, 'Comedy', 8, 11, 4, 12),
	('Django Unchained', 2012, 'Historical', 9, 12, 4, 13),
	('Batman', 1989, 'Action', 8, 13, 11, 14),
	('Mars Attacks!', 1996, 'Comedy', 6, 13, 11, 15);

--DROP TABLE films;





--queries for 6.i-6.vi
SELECT title, name
FROM films, directors
WHERE directorid=directors.id;


SELECT title, directors.name, stars.name
FROM films, directors, stars
WHERE directorid=directors.id AND starId=stars.id;


SELECT title
FROM films, directors
WHERE directorid=directors.id AND directors.country='USA';


SELECT title, year, genre, score, directors.name as director_and_writer
FROM films, directors, writers
WHERE films.directorid=directors.id AND directors.name=writers.name;


SELECT name, title
FROM directors, films
WHERE score >= 8 AND directors.id=directorid;




--What writer you want for a movie based on genre
SELECT
	genre,
	name,
	email,
	score
FROM writers
LEFT JOIN films
ON writers.id=writerid
ORDER BY genre, score DESC;


--Comparing star dob vs movie release
SELECT
	name,
	year,
	date_of_birth
FROM stars
LEFT JOIN films
ON stars.id=starId;


--Find films directed by a specific director and starring a specific actor
SELECT title, directors.name as dir_name, stars.name as star_name
FROM films
INNER JOIN directors ON directorid=directors.id
INNER JOIN stars ON films.starid=stars.id
WHERE directors.name='Stanley Kubrick' AND stars.name='Keir Dullea';


--Average score by genre (doesn't use join, but is interesting and good training)
SELECT genre, AVG(score) AS avg_score
FROM films
GROUP BY genre;


--Highest score a directors movie has gotten
SELECT directors.name, MAX(score) as highest_scored_movie
FROM films
INNER JOIN directors ON directorid=directors.id
GROUP BY name
ORDER BY highest_scored_movie DESC;


--Star who appeared in most films
SELECT stars.name, COUNT(*) AS num_films
FROM films
INNER JOIN stars ON starid=stars.id
GROUP BY stars.name
ORDER BY COUNT(*) DESC;


--Country who produced the most directors
SELECT directors.country, COUNT(*) AS num_directors
FROM films
INNER JOIN directors ON directorid=directors.id
GROUP BY directors.country
ORDER BY COUNT(*) DESC;