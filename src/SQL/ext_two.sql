-- Create tables

CREATE TABLE IF NOT EXISTS People (
	id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  email TEXT,
  date_of_birth TEXT,
  country TEXT);

CREATE TABLE IF NOT EXISTS Films (
	id SERIAL PRIMARY KEY,
  title TEXT,
  year INT,
  genre TEXT,
  score INT,
  writer_id INT,
  star_id INT,
  director_id INT,
  CONSTRAINT fk_writer
  	FOREIGN KEY(writer_id)
  		REFERENCES People(id),
 	CONSTRAINT fk_star
  	FOREIGN KEY(star_id)
  		REFERENCES People(id),
	CONSTRAINT fk_director
  	FOREIGN KEY(director_id)
  		REFERENCES People(id)
);

CREATE TABLE IF NOT EXISTS Casting (
	id SERIAL PRIMARY KEY,
  people_id int,
  film_id int,
  CONSTRAINT fk_people
  	FOREIGN KEY(people_id)
  		REFERENCES People(id),
	CONSTRAINT fk_film
  	FOREIGN KEY(film_id)
  		REFERENCES Films(id)
);

-- Insert data
INSERT INTO People (name, email) VALUES
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

INSERT INTO People (name, date_of_birth) VALUES
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


INSERT INTO People (name, country) VALUES
  ('Stanley Kubrick', 'USA'),
  ('Robert Mulligan', 'USA'),
  ('David Lean', 'UK'),
  ('Anthony Mann', 'USA'),
  ('Paul Verhoeven', 'Netherlands'),
  ('Jean-Paul Rappeneau', 'France');

UPDATE People
SET Country = 'USA'
WHERE name = 'George Lucas';

UPDATE People
SET Country = 'Poland'
WHERE name = 'Krzysztof Kieslowski';

UPDATE People
SET Country = 'Greece'
WHERE name = 'Theodoros Angelopoulos';

UPDATE People
SET Country = 'Canada'
WHERE name = 'James Cameron';

INSERT INTO Films (title, year, genre, score, writer_id, star_id, director_id) VALUES
  ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, (SELECT id FROM People WHERE name='Arthur C Clarke'), (SELECT id FROM People WHERE name='Keir Dullea'), (SELECT id FROM People WHERE name='Stanley Kubrick')),
  ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, (SELECT id FROM People WHERE name='George Lucas'), (SELECT id FROM People WHERE name='Mark Hamill'), (SELECT id FROM People WHERE name='George Lucas')),
  ('To Kill A Mockingbird', 1962, 'Drama', 10, (SELECT id FROM People WHERE name='Harper Lee'), (SELECT id FROM People WHERE name='Gregory Peck'), (SELECT id FROM People WHERE name='Robert Mulligan')),
  ('Titanic', 1997, 'Romance', 5, (SELECT id FROM People WHERE name='James Cameron'), (SELECT id FROM People WHERE name='Leonardo DiCaprio'), (SELECT id FROM People WHERE name='James Cameron')),
  ('Dr Zhivago', 1965, 'Historical', 8, (SELECT id FROM People WHERE name='Boris Pasternak'), (SELECT id FROM People WHERE name='Julie Christie'), (SELECT id FROM People WHERE name='David Lean')),
  ('El Cid', 1961, 'Historical', 6, (SELECT id FROM People WHERE name='Frederick Frank'), (SELECT id FROM People WHERE name='Charlton Heston'), (SELECT id FROM People WHERE name='Anthony Mann')),
  ('Voyage to Cythera', 1984, 'Drama', 8, (SELECT id FROM People WHERE name='Theodoros Angelopoulos'), (SELECT id FROM People WHERE name='Manos Katrakis'), (SELECT id FROM People WHERE name='Theodoros Angelopoulos')),
  ('Soldier of Orange', 1977, 'Thriller', 8, (SELECT id FROM People WHERE name='Erik Hazelhoff Roelfzema'), (SELECT id FROM People WHERE name='Rutger Hauer'), (SELECT id FROM People WHERE name='Paul Verhoeven')),
  ('Three Colours: Blue', 1993, 'Drama', 8, (SELECT id FROM People WHERE name='Krzysztof Kieslowski'), (SELECT id FROM People WHERE name='Juliette Binoche'), (SELECT id FROM People WHERE name='Krzysztof Kieslowski')),
  ('Cyrano de Bergerac', 1990, 'Historical', 9, (SELECT id FROM People WHERE name='Edmond Rostand'), (SELECT id FROM People WHERE name='Gerard Depardieu'), (SELECT id FROM People WHERE name='Jean-Paul Rappeneau'));

INSERT INTO Casting (people_id, film_id) VALUES
	(11, 1),
	(12, 2),
	(13, 3),
	(14, 3),
	(15, 5),
	(16, 6),
	(17, 7),
	(18, 8),
	(19, 9),
	(20, 10);

INSERT INTO Casting (people_id, film_id) VALUES
  (1, 1),
	(22, 1),
	(24, 1),
	(2, 1),
	(3, 4),
	(4, 4);

-- Show the title and director name for all films

SELECT title, people.name AS director
FROM films
INNER JOIN people
	on films.director_id = people.id;

-- Show the title, director and star name for all films

SELECT title, Directors.name AS director, Stars.name AS star
FROM Films
JOIN People AS Directors ON Films.director_id = Directors.id
JOIN People AS Stars ON Films.star_id = Stars.id;

-- Show the title of films where the director is from the USA

SELECT title
FROM films
INNER JOIN people
	on films.director_id = people.id
WHERE people.country = 'USA';

-- Show only those films where the writer and the director are the same person

SELECT title
FROM films
INNER JOIN people AS Directors
	on films.director_id = Directors.id
INNER JOIN people AS Writers
	on films.writer_id = Writers.id
WHERE Writers.name = Directors.name;

-- Show people and film titles for films with a score of 8 or higher

SELECT title, people.name AS director
FROM films
INNER JOIN people
	on films.director_id = people.id
WHERE score >= 8;

/* Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables. */

-- Show title and the name of the star in all movies with a star born in april

SELECT title,  people.name AS star
FROM films
INNER JOIN People
	on films.star_id = people.id
WHERE people.date_of_birth LIKE ('%/04/%');

-- Show title and writer of all movies that were released between 1968 and 1992

SELECT title, people.name AS writer
FROM films
INNER JOIN people
	on films.writer_id = people.id
WHERE year BETWEEN 1968 AND 1992;

-- Show title and director of all movies that are not dramas and the director is not from the USA

SELECT title, people.name AS director
FROM films
INNER JOIN people
	on films.director_id = people.id
WHERE genre <> 'Drama' AND people.country <> 'USA';

-- Show title, director and the director country of all movies where the director is not from USA, UK or Canada

SELECT title, people.name AS director, people.country AS director_country
FROM films
INNER JOIN people
	on films.director_id = people.id
WHERE people.country NOT IN ('USA', 'UK', 'Canada');

-- Show title, writer and director of all movies that were released in an odd year

SELECT title, Directors.name AS director, Writers.name AS writer
FROM films
INNER JOIN people AS Directors
	on films.director_id = Directors.id
INNER JOIN people AS Writers
	on films.writer_id = Writers.id
WHERE year % 2 = 1;

-- Show title and cast of all movies

SELECT title, People.name, People.name AS Star
FROM Casting
INNER JOIN people
	on casting.people_id = people.id
INNER JOIN films
	on casting.film_id = films.id
ORDER BY films.id;








