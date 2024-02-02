DROP TABLE IF EXISTS people;
CREATE TABLE IF NOT EXISTS people (
	person_id SERIAL PRIMARY KEY,
	name TEXT,
	country TEXT,
	date_of_birth DATE,
	email TEXT,
	UNIQUE(name)
);

-------------------------------------------------

DROP TABLE IF EXISTS directors;
CREATE TABLE IF NOT EXISTS directors (
  director_id SERIAL PRIMARY KEY,
  person_id INT,
  UNIQUE(person_id),
  CONSTRAINT fk_director
  	FOREIGN KEY(person_id)
  		REFERENCES people(person_id)
);

-------------------------------------------------

DROP TABLE IF EXISTS stars;
CREATE TABLE IF NOT EXISTS stars (
	star_id SERIAL PRIMARY KEY,
	person_id INT,
	UNIQUE(person_id),
	CONSTRAINT fk_star
		FOREIGN KEY(person_id)
			REFERENCES people(person_id)
);

-------------------------------------------------

DROP TABLE IF EXISTS writers;
CREATE TABLE IF NOT EXISTS writers (
	writer_id SERIAL PRIMARY KEY,
	person_id INT,
	UNIQUE(person_id),
	CONSTRAINT fk_writer
		FOREIGN KEY(person_id)
			REFERENCES people(person_id)
);

-------------------------------------------------

DROP TABLE IF EXISTS movies;
CREATE TABLE IF NOT EXISTS movies(
	movie_id SERIAL PRIMARY KEY,
	title TEXT,
	director_id INT,
	star_id INT,
	writer_id INT,
	year INT,
	genre TEXT,
	score INT,
    UNIQUE(title),
    CONSTRAINT fk_director
        FOREIGN KEY(director_id)
            REFERENCES directors(director_id),
    CONSTRAINT fk_star
        FOREIGN KEY(star_id)
            REFERENCES stars(star_id),
    CONSTRAINT fk_writer
        FOREIGN KEY(writer_id)
            REFERENCES writers(writer_id)
);

-------------------------------------------------

INSERT INTO people
    (name, country, date_of_birth, email)
VALUES
    ('Stanley Kubrick', 'USA', null, null),
    ('George Lucas', 'USA', null, 'george@email.com'),  -- combine for George Lucas --
    ('Robert Mulligan', 'USA', null, null),
    ('James Cameron', 'Canada', null, 'james@cameron.com'),  -- combine for James Cameron --
    ('David Lean', 'UK', null, null),
    ('Anthony Mann', 'USA', null, null),
    ('Theodoros Angelopoulos', 'Greece', null, 'theo@angelopoulos.com'),  -- combine for Theodoros Angelopoulos --
    ('Paul Verhoeven', 'Netherlands', null, null),
    ('Krzysztof Kieslowski', 'Poland', null, 'email@email.com'),  -- combine forr Krzysztof Kieslowski --
    ('Jean-Paul Rappeneau', 'France', null, null),
    ('Keir Dullea', null, '1936-05-30', null),
    ('Mark Hamill', null, '1951-09-25', null),
    ('Gregory Peck', null, '1916-04-05', null),
    ('Leonardo DiCaprio', null, '1974-11-11', null),
    ('Julie Christie', null, '1940-04-14', null),
    ('Charlton Heston', null, '1923-10-04', null),
    ('Manos Katrakis', null, '1908-08-14', null),
    ('Rutger Hauer', null, '1944-01-23', null),
    ('Juliette Binoche', null, '1964-03-09', null),
    ('Gerard Depardieu', null, '1948-12-27', null),
    ('Arthur C Clarke', null, null, 'arthur@clarke.com'),
    ('Harper Lee', null, null, 'harper@lee.com'),
    ('Boris Pasternak', null, null, 'boris@boris.com'),
    ('Frederick Frank', null, null, 'fred@frank.com'),
    ('Erik Hazelhoff Roelfzema', null, null, 'erik@roelfzema.com'),
    ('Edmond Rostand', null, null, 'edmond@rostand.com');

-------------------------------------------------

INSERT INTO directors
	(person_id)
VALUES
	(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO stars
	(person_id)
VALUES
	(11), (12), (13), (14), (15), (16), (17), (18), (19), (20);

INSERT INTO writers
	(person_id)
VALUES
	(2), (4), (7), (9), (21), (22), (23), (24), (25), (26);

-------------------------------------------------

INSERT INTO movies
	(title, director_id, star_id, writer_id, year, genre, score)
VALUES
	('2001: A Space Odyssey', 1, 1, 5, 1968, 'Science Fiction', 10),
    ('Star Wars: A New Hope', 2, 2, 1, 1977, 'Science Fiction', 7),
    ('To Kill A Mockingbird', 3, 3, 6, 1962, 'Drama', 10),
    ('Titanic', 4, 4, 2, 1997, 'Romance', 5),
    ('Dr Zhivago', 5, 5, 7, 1965, 'Historical', 8),
    ('El Cid', 6, 6, 8, 1961, 'Historical', 6),
    ('Voyage to Cythera', 7, 7, 3, 1984, 'Drama', 8),
    ('Soldier of Orange', 8, 8, 9, 1977, 'Thriller', 8),
    ('Three Colours: Blue', 9, 9, 4, 1993, 'Drama', 8),
    ('Cyrano de Bergerac', 10, 10, 10, 1990, 'Historical', 9);

-------------------------------------------------