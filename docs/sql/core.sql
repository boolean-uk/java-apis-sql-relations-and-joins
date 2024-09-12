CREATE TABLE Director(id SERIAL, name TEXT, country TEXT);
CREATE TABLE Star(id SERIAL, name TEXT, dob TEXT);
CREATE TABLE Writer(id SERIAL, name TEXT, email TEXT);

INSERT INTO Director (name, country) VALUES
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

INSERT INTO Writer (name, email) VALUES
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

INSERT INTO Star (name, dob) VALUES
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

ALTER TABLE Director
ADD PRIMARY KEY (id);

ALTER TABLE Star
ADD PRIMARY KEY (id);

ALTER TABLE Writer
ADD PRIMARY KEY (id);

CREATE TABLE Film(
	id SERIAL,
	title TEXT,
	year INTEGER,
	genre TEXT,
	score INTEGER,
	directorId INTEGER,
	starId INTEGER,
	writerId INTEGER,
	FOREIGN KEY(directorId) REFERENCES Director(id),
	FOREIGN KEY(starId) REFERENCES Star(id),
	FOREIGN KEY(writerId) REFERENCES Writer(id)
);

INSERT INTO Film (title, year, genre, score, directorId, starId, writerId) VALUES
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

--i
SELECT title, director.name AS director
FROM film
INNER JOIN director
ON directorid = director.id;
--ii
SELECT title, director.name AS director, star.name AS Star
FROM film
INNER JOIN director
ON directorid = director.id
INNER JOIN star
ON starId = star.id;
--iii
SELECT title
FROM film
INNER JOIN director
ON directorid = director.id
where director.country like 'USA';
--iv
SELECT title
FROM film
INNER JOIN director
ON directorid = director.id
INNER JOIN writer
ON writerid = writer.id
WHERE director.name LIKE writer.name;
--v
SELECT title, director.name AS director, score
FROM film
INNER JOIN director
ON directorid = director.id
where score >= 8;
--vi
-- cross join
SELECT *
FROM film
CROSS JOIN director;

-- highest score in each genre
SELECT film.genre, MAX(score)
FROM film;

-- how many films per year
SELECT year, COUNT(*) AS NumberOfFilms
FROM Film
GROUP BY year
ORDER BY year;

-- average score by director country
SELECT Director.country AS Country, AVG(Film.score) AS AverageScore
FROM Film
INNER JOIN Director ON Film.directorId = Director.id
GROUP BY Director.country;

-- age of star when featured in film
SELECT Film.title, Star.name AS StarName, (Film.year - EXTRACT(YEAR FROM Star.dob)) AS AgeWhenFeatured
FROM Film
INNER JOIN Star
ON Film.starId = Star.id;