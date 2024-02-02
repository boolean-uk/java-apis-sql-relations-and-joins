DROP TABLE films, directors, stars, writers, people;

CREATE TABLE IF NOT EXISTS people (
	id SERIAL PRIMARY KEY,
	name TEXT
);

CREATE TABLE IF NOT EXISTS directors (
	id SERIAL PRIMARY KEY,
	country TEXT,
    FOREIGN KEY(id) REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS stars (
	id SERIAL PRIMARY KEY,

	birth DATE,

	FOREIGN KEY(id) REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS writers (
	id SERIAL PRIMARY KEY,

	email TEXT,
	FOREIGN KEY(id) REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS films (
	id SERIAL PRIMARY KEY,
	title TEXT,
	release_year INT,
	genre TEXT,
	score INT,

	director_id INT,
	star_id int,
	writer_id int,

	UNIQUE(title),
	CONSTRAINT fk_director
		FOREIGN KEY(director_id)
			REFERENCES directors(id),
	CONSTRAINT fk_star
		FOREIGN KEY(star_id)
			REFERENCES stars(id),
	CONSTRAINT fk_write
		FOREIGN KEY(writer_id)
			REFERENCES writers(id)
);

INSERT INTO people (
 	name
)
VALUES
    ('Stanley Kubrick'),
    ('George Lucas'),
    ('Robert Mulligan'),
    ('James Cameron'),
    ('David Lean'),
    ('Anthony Mann'),
    ('Theodoros Angelopoulos'),
    ('Paul Verhoeven'),
    ('Krzysztof Kieslowski'),
    ('Jean-Paul Rappeneau');

INSERT INTO directors (
	id, country
)
VALUES
    (1, 'USA'),
    (2, 'USA'),
    (3, 'USA'),
    (4, 'Canada'),
    (5, 'UK'),
    (6, 'USA'),
    (7, 'Greece'),
    (8, 'Netherlands'),
    (9, 'Poland'),
    (10, 'France');


INSERT INTO stars (
	id, birth
)
VALUES
    (1, '1928-07-26'),
    (2, '1944-05-14'),
    (3, '1925-08-23'),
    (4, '1954-08-16'),
    (5, '1908-03-25'),
    (6, '1906-06-30'),
    (7, '1935-04-27'),
    (8, '1938-07-18'),
    (9, '1941-06-27'),
    (10, '1932-04-08');

INSERT INTO writers (
	id, email
)
VALUES
    (1, 'arthur@clarke.com'),
    (2, 'george@email.com'),
    (3, 'harper@lee.com'),
    (4, 'james@cameron.com'),
    (5, 'boris@boris.com'),
    (6, 'fred@frank.com'),
    (7, 'theo@angelopoulos.com'),
    (8, 'erik@roelfzema.com'),
    (9, 'email@email.com'),
    (10, 'edmond@rostand.com');


INSERT INTO films(
	title, director_id, star_id, writer_id, release_year, genre, score
)
Values
    ('2001: A Space Odyssey', 1, 1, 1, 1968, 'Science Fiction', 10),
    ('Star Wars: A New Hope', 2, 2, 2, 1977, 'Science Fiction', 7),
    ('To Kill A Mockingbird', 3, 3, 3, 1962, 'Drama', 10),
    ('Titanic', 4, 4, 4, 1997, 'Romance', 5),
    ('Dr Zhivago', 5, 5, 5, 1965, 'Historical', 8),
    ('El Cid', 6, 6, 6, 1961, 'Historical', 6),
    ('Voyage to Cythera', 7, 7, 7, 1984, 'Drama', 8),
    ('Soldier of Orange', 8, 8, 8, 1977, 'Thriller', 8),
    ('Three Colours: Blue', 9, 9, 9, 1993, 'Drama', 8),
    ('Cyrano de Bergerac', 10, 10, 10, 1990, 'Historical', 9);


