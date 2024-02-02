CREATE TABLE IF NOT EXISTS people (
	id SERIAL PRIMARY KEY,
	name TEXT,
	country TEXT,
	dob TEXT,
	email TEXT,
	UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS film (
	id SERIAL PRIMARY KEY,
	title TEXT,
	year INT,
	genre TEXT,
	score INT,
	director_id INT,
	star_id INT,
	writer_id INT,
	UNIQUE(title),
	CONSTRAINT fk_director
		FOREIGN KEY (director_id)
			REFERENCES people(id),
	CONSTRAINT fk_star
		FOREIGN KEY (star_id)
			REFERENCES people(id),
	CONSTRAINT fk_writer
		FOREIGN KEY (writer_id)
			REFERENCES people(id)
);


INSERT INTO people
	(name, country)
VALUES
  ('Stanley Kubrick', 'USA'),
  ('Robert Mulligan', 'USA'),
  ('David Lean', 'UK'),
  ('Anthony Mann', 'USA'),
  ('Paul Verhoeven', 'Netherlands'),
  ('Jean-Paul Rappeneau', 'France');

INSERT INTO people
	(name, dob)
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

INSERT INTO people
	(name, email)
VALUES
  ('Arthur C Clarke', 'arthur@clarke.com'),
  ('Harper Lee', 'harper@lee.com'),
  ('Boris Pasternak', 'boris@boris.com'),
  ('Frederick Frank', 'fred@frank.com'),
  ('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com'),
  ('Edmond Rostand', 'edmond@rostand.com');

INSERT INTO people
	(name, country, email)
VALUES
  ('George Lucas', 'USA', 'george@email.com'),
  ('James Cameron', 'Canada', 'james@cameron.com'),
  ('Theodoros Angelopoulos', 'Greece', 'theo@angelopoulos.com'),
  ('Krzysztof Kieslowski', 'Poland', 'email@email.com');

INSERT INTO film
	(title, year, genre, score, director_id, star_id, writer_id)
VALUES
  ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 7, 17),
  ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 23, 8, 23),
  ('To Kill A Mockingbird', 1962, 'Drama', 10, 2, 9, 18),
  ('Titanic', 1997, 'Romance', 5, 24, 10, 24),
  ('Dr Zhivago', 1965, 'Historical', 8, 3, 11, 19),
  ('El Cid', 1961, 'Historical', 6, 4, 12, 20),
  ('Voyage to Cythera', 1984, 'Drama', 8, 25, 13, 25),
  ('Soldier of Orange', 1977, 'Thriller', 8, 5, 14, 21),
  ('Three Colours: Blue', 1993, 'Drama', 8, 26, 15, 26),
  ('Cyrano de Bergerac', 1990, 'Historical', 9, 6, 16, 22);