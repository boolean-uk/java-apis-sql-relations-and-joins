DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS stars;
DROP TABLE IF EXISTS writers;

CREATE TABLE IF NOT EXISTS directors(
  id serial PRIMARY KEY,
  name TEXT,
  country TEXT
);

CREATE TABLE IF NOT EXISTS stars(
	id serial PRIMARY KEY,
  name TEXT,
  date_of_birth TEXT
);

CREATE TABLE IF NOT EXISTS writers(
	id serial PRIMARY KEY,
  name TEXT,
  email TEXT
);

CREATE TABLE IF NOT EXISTS films (
  id serial PRIMARY KEY,
  title TEXT,
  year INTEGER,
  genre TEXT,
  score INTEGER,
  director_id INTEGER,
  star_id INTEGER,
  writer_id INTEGER,
  CONSTRAINT fk_director
  	FOREIGN KEY(director_id)
  		REFERENCES directors(id),
  CONSTRAINT fk_star
  	FOREIGN KEY(star_id)
  		REFERENCES stars(id),
  CONSTRAINT fk_writer
  	FOREIGN KEY(writer_id)
  		REFERENCES writers(id)
);
  
INSERT INTO directors (name, country) VALUES 
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

INSERT INTO stars (name, date_of_birth) VALUES 
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

INSERT INTO writers (name, email) VALUES 
('Arthur C Clarke', 'arthur@clarke.com'),
('George Lucas', 'george@lucas.com'),
('Harper Lee', 'harper@lee.com'),
('James Cameron', 'james@cameron.com'),
('Boris Pasternak', 'boris@boris.com'),
('Frederick Frank', 'fred@frank.com'),
('Theodoros Angelopoulos', 'theo@angelopoulos.com'),
('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
('Krzysztof Kieslowski', 'krzysztof@kieslowski.com'),
('Edmond Rostand', 'edmond@rostand.com');

INSERT INTO films (title, year, genre, score, director_id, star_id, writer_id) VALUES 
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


SELECT films.title, directors.name FROM films, directors WHERE films.director_id = directors.id;


SELECT films.title, directors.name, stars.name FROM films, directors, stars WHERE films.director_id = directors.id AND films.star_id = stars.id;


SELECT films.title FROM films, directors WHERE films.director_id = directors.id AND directors.country = 'USA';


SELECT films.* FROM films, directors, writers WHERE films.director_id = directors.id AND films.writer_id = writers.id AND directors.name = writers.name;


SELECT directors.*, films.title FROM directors, films WHERE directors.id = films.director_id AND films.score >= 8;


--Show the total number of films directed by each director
SELECT directors.name AS director, COUNT(films.id) AS film_count FROM directors
LEFT JOIN films ON films.director_id = directors.id GROUP BY directors.name ORDER BY film_count DESC;


--Show the title, star name, and their date of birth for all films
SELECT films.title, stars.name AS star, stars.date_of_birth
FROM films INNER JOIN stars ON films.star_id = stars.id;



--Show the title of films released before 1970 along with their director and genre
SELECT films.title, directors.name AS director, films.genre
FROM films INNER JOIN directors ON films.director_id = directors.id WHERE films.year < 1970;


--Show the writer name and the number of films they have written
SELECT writers.name AS writer, COUNT(films.id) AS film_count
FROM writers LEFT JOIN films ON films.writer_id = writers.id GROUP BY writers.name ORDER BY film_count DESC;


--Show the titles of all films where the star was born after 1940
SELECT films.title, stars.name AS star
FROM films INNER JOIN stars ON films.star_id = stars.id WHERE stars.date_of_birth > '1940-01-01';
