-- Where necessary refactor the queries to take advantage of this new structure

-- New tables
CREATE TABLE IF NOT EXISTS Person(
    person_id SERIAL PRIMARY KEY,
    person_name VARCHAR(50) NOT NULL,
    person_email VARCHAR(50),
    person_country VARCHAR(30),
    person_dob DATE
);

CREATE TABLE IF NOT EXISTS Director(
    director_id SERIAL PRIMARY KEY,
    person_id int REFERENCES Person(person_id) NOT NULL
);

CREATE TABLE IF NOT EXISTS Star(
    star_id SERIAL PRIMARY KEY,
    person_id int REFERENCES Person(person_id) NOT NULL
);

CREATE TABLE IF NOT EXISTS Writer(
    writer_id SERIAL PRIMARY KEY,
    person_id int REFERENCES Person(person_id) NOT NULL
);




-- Insert statements
INSERT INTO Person (person_name, person_email, person_country, person_dob) VALUES
('Stanley Kubrick', NULL, 'USA', NULL),
('George Lucas', 'george@email.com', 'USA', NULL),
('Robert Mulligan', NULL, 'USA', NULL),
('James Cameron', 'james@cameron.com', 'Canada', NULL),
('David Lean', NULL, 'UK', NULL),
('Anthony Mann', NULL, 'USA', NULL),
('Theodoros Angelopoulos', 'theo@angelopoulos.com', 'Greece', NULL),
('Paul Verhoeven', NULL, 'Netherlands', NULL),
('Krzysztof Kieslowski', 'email@email.com', 'Poland', NULL),
('Jean-Paul Rappeneau', NULL, 'France', NULL),

('Keir Dullea', NULL, NULL, '1936-05-30'),
('Mark Hamill', NULL, NULL, '1951-09-25'),
('Gregory Peck', NULL, NULL, '1916-04-05'),
('Leonardo DiCaprio', NULL, NULL, '1974-11-11'),
('Julie Christie', NULL, NULL, '1940-04-14'),
('Charlton Heston', NULL, NULL, '1923-10-04'),
('Manos Katrakis', NULL, NULL, '1908-08-14'),
('Rutger Hauer', NULL, NULL, '1944-01-23'),
('Juliette Binoche', NULL, NULL, '1964-03-09'),
('Gerard Depardieu', NULL, NULL, '1948-12-27'),

('Arthur C Clarke', 'arthur@clarke.com', NULL, NULL),
('Harper Lee', 'harper@lee.com', NULL, NULL),
('Boris Pasternak', 'boris@boris.com', NULL, NULL),
('Frederick Frank', 'fred@frank.com', NULL, NULL),
('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com', NULL, NULL),
('Edmond Rostand', 'edmond@rostand.com', NULL, NULL);


INSERT INTO Director (person_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

INSERT INTO Star (person_id) VALUES
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

INSERT INTO Writer (person_id) VALUES
(21),
(2),
(22),
(4),
(23),
(24),
(7),
(25),
(9),
(26);

INSERT INTO Film (film_name, film_genre, film_release_year, film_score, director_id, star_id, writer_id) VALUES
('2001: A Space Odyssey', 'Science Fiction', 1968, 10,
(SELECT director_id FROM Director JOIN Person ON Director.person_id = Person.person_id WHERE Person.person_name = 'Stanley Kubrick'),
(SELECT star_id FROM Star JOIN Person ON Star.person_id = Person.person_id WHERE person_name = 'Keir Dullea'),
(SELECT writer_id FROM Writer Join Person ON Writer.person_id = Person.person_id WHERE person_name = 'Arthur C Clarke')),

('Star Wars: A New Hope', 'Science Fiction', 1977, 7,
    (SELECT director_id FROM Director JOIN Person ON Director.person_id = Person.person_id WHERE Person.person_name = 'George Lucas'),
    (SELECT star_id FROM Star JOIN Person ON Star.person_id = Person.person_id WHERE person_name = 'Mark Hamill'),
    (SELECT writer_id FROM Writer Join Person ON Writer.person_id = Person.person_id WHERE person_name = 'George Lucas')),

('To Kill A Mockingbird', 'Drama', 1962, 10,
    (SELECT director_id FROM Director JOIN Person ON Director.person_id = Person.person_id WHERE Person.person_name = 'Robert Mulligan'),
    (SELECT star_id FROM Star JOIN Person ON Star.person_id = Person.person_id WHERE person_name = 'Gregory Peck'),
    (SELECT writer_id FROM Writer Join Person ON Writer.person_id = Person.person_id WHERE person_name = 'Harper Lee')),

('Titanic', 'Romance', 1997, 5,
    (SELECT director_id FROM Director JOIN Person ON Director.person_id = Person.person_id WHERE Person.person_name = 'James Cameron'),
    (SELECT star_id FROM Star JOIN Person ON Star.person_id = Person.person_id WHERE person_name = 'Leonardo DiCaprio'),
    (SELECT writer_id FROM Writer Join Person ON Writer.person_id = Person.person_id WHERE person_name = 'James Cameron')),

('Dr Zhivago', 'Historical', 1965, 8,
    (SELECT director_id FROM Director JOIN Person ON Director.person_id = Person.person_id WHERE Person.person_name = 'David Lean'),
    (SELECT star_id FROM Star JOIN Person ON Star.person_id = Person.person_id WHERE person_name = 'Julie Christie'),
    (SELECT writer_id FROM Writer Join Person ON Writer.person_id = Person.person_id WHERE person_name = 'Boris Pasternak')),

('El Cid', 'Historical', 1961, 6,
    (SELECT director_id FROM Director JOIN Person ON Director.person_id = Person.person_id WHERE Person.person_name = 'Anthony Mann'),
    (SELECT star_id FROM Star JOIN Person ON Star.person_id = Person.person_id WHERE person_name = 'Charlton Heston'),
    (SELECT writer_id FROM Writer Join Person ON Writer.person_id = Person.person_id WHERE person_name = 'Frederick Frank')),

('Voyage to Cythera', 'Drama', 1984, 8,
    (SELECT director_id FROM Director JOIN Person ON Director.person_id = Person.person_id WHERE Person.person_name = 'Theodoros Angelopoulos'),
    (SELECT star_id FROM Star JOIN Person ON Star.person_id = Person.person_id WHERE person_name = 'Manos Katrakis'),
    (SELECT writer_id FROM Writer Join Person ON Writer.person_id = Person.person_id WHERE person_name = 'Theodoros Angelopoulos')),

('Soldier of Orange', 'Thriller', 1977, 8,
    (SELECT director_id FROM Director JOIN Person ON Director.person_id = Person.person_id WHERE Person.person_name = 'Paul Verhoeven'),
    (SELECT star_id FROM Star JOIN Person ON Star.person_id = Person.person_id WHERE person_name = 'Rutger Hauer'),
    (SELECT writer_id FROM Writer Join Person ON Writer.person_id = Person.person_id WHERE person_name = 'Erik Hazelhoff Roelfzema')),

('Three Colours: Blue', 'Drama', 1993, 8,
    (SELECT director_id FROM Director JOIN Person ON Director.person_id = Person.person_id WHERE Person.person_name = 'Krzysztof Kieslowski'),
    (SELECT star_id FROM Star JOIN Person ON Star.person_id = Person.person_id WHERE person_name = 'Juliette Binoche'),
    (SELECT writer_id FROM Writer Join Person ON Writer.person_id = Person.person_id WHERE person_name = 'Krzysztof Kieslowski')),

('Cyrano de Bergerac', 'Historical', 1990, 9,
    (SELECT director_id FROM Director JOIN Person ON Director.person_id = Person.person_id WHERE Person.person_name = 'Jean-Paul Rappeneau'),
    (SELECT star_id FROM Star JOIN Person ON Star.person_id = Person.person_id WHERE person_name = 'Gerard Depardieu'),
    (SELECT writer_id FROM Writer Join Person ON Writer.person_id = Person.person_id WHERE person_name = 'Edmond Rostand'));



