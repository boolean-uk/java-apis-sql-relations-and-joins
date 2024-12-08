-- drop owned by demo_owner;
-- create schema public;

CREATE TABLE people(
    id serial primary key,
    name text
);

CREATE TABLE stars(
    id serial primary key,
    people_id int references people(id),
    dob text
);

CREATE TABLE directors(
    id serial primary key,
    people_id int references people(id),
    country text
);

CREATE TABLE writers(
    id serial primary key,
    people_id int references people(id),
    email text
);

CREATE TABLE genres(
    id serial primary key,
    name text
);

CREATE TABLE movies(
    id serial primary key,
    title text,
    year int,
    score int,
    genre_id int references genres(id),
    star_id int references stars(id),
    director_id int references directors(id),
    writer_id int references writers(id)
);


INSERT INTO genres
    (name)
VALUES
    ('Science Fiction'),
    ('Drama'),
    ('Romance'),
    ('Historical'),
    ('Thriller');

INSERT INTO people
    (name)
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
    ('Jean-Paul Rappeneau'),
    ('Arthur C Clarke'),
    ('Harper Lee'),
    ('Boris Pasternak'),
    ('Frederick Frank'),
    ('Erik Hazelhoff Roelfzema'),
    ('Edmond Rostand'),
    ('Keir Dullea'),
    ('Mark Hamill'),
    ('Gregory Peck'),
    ('Leonardo DiCaprio'),
    ('Julie Christie'),
    ('Charlton Heston'),
    ('Manos Katrakis'),
    ('Rutger Hauer'),
    ('Juliette Binoche'),
    ('Gerard Depardieu');

INSERT INTO stars
    (people_id, dob)
VALUES
    (17, '30/05/1936'),
    (18, '25/09/1951'),
    (19, '05/04/1916'),
    (20, '11/11/1974'),
    (21, '14/04/1940'),
    (22, '04/10/1923'),
    (23, '14/08/1908'),
    (24, '23/01/1944'),
    (25, '09/03/1964'),
    (26, '27/12/1948');

INSERT INTO writers
    (people_id, email)
VALUES
    (11, 'arthur@clarke.com'),
    (2, 'george@email.com'),
    (12, 'harper@lee.com'),
    (4, 'james@cameron.com'),
    (13, 'boris@boris.com'),
    (14, 'fred@frank.com'),
    (7, 'theo@angelopoulos.com'),
    (15, 'erik@roelfzema.com'),
    (9, 'email@email.com'),
    (16, 'edmond@rostand.com');

INSERT INTO directors
    (people_id, country)
VALUES
    (1, 'USA'),
    (2, 'USA'),
    (3, 'USA'),
    (4, 'Canada'),
    (5, 'UK'),
    (6, 'USA'),
    (7, 'Greece'),
    (8, 'Netherlands'),
    (9,  'Poland'),
    (10, 'France');

INSERT INTO movies
    (title, year, score, genre_id, star_id, director_id, writer_id)
VALUES
    ('2001: A Space Odyssey', 1968, 10, 1, 1, 1, 1),
    ('Star Wars: A New Hope', 1977, 7, 1, 2, 2, 2),
    ('To Kill A Mockingbird', 1962, 10, 2, 3, 3, 3),
    ('Titanic', 1997, 5, 3, 4, 4, 4),
    ('Dr Zhivago', 1965, 8, 4, 5, 5, 5),
    ('El Cid', 1961, 6, 4, 6, 6, 6),
    ('Voyage to Cythera', 1984, 8, 2, 7, 7, 7),
    ('Soldier of Orange', 1977, 8, 5, 8, 8, 8),
    ('Three Colours: Blue', 1993, 8, 2, 9, 9, 9),
    ('Cyrano de Bergerac', 1990, 9, 4, 10, 10, 10);