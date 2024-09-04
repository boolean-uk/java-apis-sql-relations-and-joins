DROP TABLE IF EXISTS casts;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS stars;
DROP TABLE IF EXISTS writers;


CREATE TABLE IF NOT EXISTS persons (
  id serial PRIMARY KEY,
  name TEXT,
  email TEXT,
  date_of_birth TEXT,
  country TEXT
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
  		REFERENCES persons(id),
  CONSTRAINT fk_star
  	FOREIGN KEY(star_id)
  		REFERENCES persons(id),
  CONSTRAINT fk_writer
  	FOREIGN KEY(writer_id)
  		REFERENCES persons(id)
);


CREATE TABLE IF NOT EXISTS casts (
  film_id INTEGER,
  person_id INTEGER,
  CONSTRAINT fk_film
  	FOREIGN KEY(film_id)
  		REFERENCES films(id),
  CONSTRAINT fk_person
  	FOREIGN KEY(person_id)
  		REFERENCES persons(id)
);


INSERT INTO persons (name, email, date_of_birth, country) VALUES 
('Stanley Kubrick', NULL, NULL, 'USA'),
('George Lucas', 'george@email.com', '1944-05-14', 'USA'),
('Robert Mulligan', NULL, '1925-08-23', 'USA'),
('James Cameron', 'james@cameron.com', '1954-08-16', 'Canada'),
('David Lean', NULL, '1908-03-25', 'UK'),
('Anthony Mann', NULL, '1906-06-30', 'USA'),
('Theodoros Angelopoulos', 'theo@angelopoulos.com', '1935-04-27', 'Greece'),
('Paul Verhoeven', NULL, '1938-07-18', 'Netherlands'),
('Krzysztof Kieslowski', 'email@email.com', '1941-06-27', 'Poland'),
('Jean-Paul Rappeneau', NULL, '1932-04-08', 'France'),
('Keir Dullea', NULL, '1936-05-30', 'USA'),
('Mark Hamill', NULL, '1951-09-25', 'USA'),
('Gregory Peck', NULL, '1916-04-05', 'USA'),
('Leonardo DiCaprio', NULL, '1974-11-11', 'USA'),
('Julie Christie', NULL, '1940-04-14', 'UK'),
('Charlton Heston', NULL, '1923-10-04', 'USA'),
('Manos Katrakis', NULL, '1908-08-14', 'Greece'),
('Rutger Hauer', NULL, '1944-01-23', 'Netherlands'),
('Juliette Binoche', NULL, '1964-03-09', 'France'),
('Gerard Depardieu', NULL, '1948-12-27', 'France'),
('Arthur C Clarke', 'arthur@clarke.com', '1917-12-16', 'UK'),
('Harper Lee', 'harper@lee.com', '1926-04-28', 'USA'),
('Boris Pasternak', 'boris@boris.com', '1890-02-10', 'Russia'),
('Frederick Frank', 'fred@frank.com', NULL, 'USA'),
('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com', '1917-04-03', 'Netherlands'),
('Edmond Rostand', 'edmond@rostand.com', '1868-04-01', 'France');


INSERT INTO films (title, year, genre, score, director_id, star_id, writer_id) VALUES 
('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 11, 21),
('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 12, 2),
('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 13, 22),
('Titanic', 1997, 'Romance', 5, 4, 14, 4),
('Dr Zhivago', 1965, 'Historical', 8, 5, 15, 23),
('El Cid', 1961, 'Historical', 6, 6, 16, 24),
('Voyage to Cythera', 1984, 'Drama', 8, 7, 17, 7),
('Soldier of Orange', 1977, 'Thriller', 8, 8, 18, 25),
('Three Colours: Blue', 1993, 'Drama', 8, 9, 19, 9),
('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 20, 26);

INSERT INTO casts(film_id, person_id) VALUES (1, 1), (1, 2), (1, 3);

SELECT films.title, persons.name FROM films, persons WHERE films.director_id = persons.id;


SELECT films.title, director.name AS director, star.name AS star
FROM films
INNER JOIN persons AS director ON films.director_id = director.id
INNER JOIN persons AS star ON films.star_id = star.id;


SELECT films.title
FROM films
INNER JOIN persons AS director ON films.director_id = director.id
WHERE director.country = 'USA';


SELECT films.*
FROM films
INNER JOIN persons AS director ON films.director_id = director.id
INNER JOIN persons AS writer ON films.writer_id = writer.id
WHERE director.name = writer.name;


SELECT director.name AS director, films.title
FROM films
INNER JOIN persons AS director ON films.director_id = director.id
WHERE films.score >= 8;


--Show the total number of films directed by each person
SELECT director.name AS director, COUNT(films.id) AS film_count
FROM persons AS director
LEFT JOIN films ON films.director_id = director.id
GROUP BY director.name
ORDER BY film_count DESC;


--Show the title, star name, and their date of birth for all films
SELECT films.title, star.name AS star, star.date_of_birth
FROM films
INNER JOIN persons AS star ON films.star_id = star.id;


--Show the title of films released before 1970 along with their director and genre
SELECT films.title, director.name AS director, films.genre
FROM films
INNER JOIN persons AS director ON films.director_id = director.id
WHERE films.year < 1970;


--Show the persons name and the number of films they have written
SELECT writer.name AS writer, COUNT(films.id) AS film_count
FROM persons AS writer
LEFT JOIN films ON films.writer_id = writer.id
GROUP BY writer.name
ORDER BY film_count DESC;


--Show the titles of all films where the star was born after 1940
SELECT films.title, star.name AS star
FROM films
INNER JOIN persons AS star ON films.star_id = star.id
WHERE star.date_of_birth > '1940-01-01';


--Test for casts
SELECT persons.name, films.title FROM persons, films, casts 
WHERE persons.id = casts.person_id AND films.id = casts.film_id;
