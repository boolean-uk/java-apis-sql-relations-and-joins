CREATE TABLE IF NOT EXISTS people (
    person_id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT UNIQUE,
    birthDate TEXT,
    role TEXT,
    country TEXT
);


CREATE TABLE IF NOT EXISTS movies (
    movie_id SERIAL PRIMARY KEY,
    title TEXT,
    year TEXT,
    genre TEXT,
    score INTEGER,
    director_id INTEGER REFERENCES people(person_id),
    star_id INTEGER REFERENCES people(person_id),
    writer_id INTEGER REFERENCES people(person_id)
);

INSERT INTO people (name, email, birthDate, role, country) VALUES
    ('Stanley Kubrick', NULL, NULL, 'director', 'USA'),
    ('George Lucas', NULL, NULL, 'director', 'USA'),
    ('Robert Mulligan', NULL, NULL, 'director', 'USA'),
    ('James Cameron', NULL, NULL, 'director', 'Canada'),
    ('David Lean', NULL, NULL, 'director', 'UK'),
    ('Anthony Mann', NULL, NULL, 'director', 'USA'),
    ('Theodoros Angelopoulos', NULL, NULL, 'director', 'Greece'),
    ('Paul Verhoeven', NULL, NULL, 'director', 'Netherlands'),
    ('Krzysztof Kieslowski', NULL, NULL, 'director', 'Poland'),
    ('Jean-Paul Rappeneau', NULL, NULL, 'director', 'France'),
    ('Keir Dullea', NULL, '30/05/1936', 'star', NULL),
    ('Mark Hamill', NULL, '25/09/1951', 'star', NULL),
    ('Gregory Peck', NULL, '05/04/1916', 'star', NULL),
    ('Leonardo DiCaprio', NULL, '11/11/1974', 'star', NULL),
    ('Julie Christie', NULL, '14/04/1940', 'star', NULL),
    ('Charlton Heston', NULL, '04/10/1923', 'star', NULL),
    ('Manos Katrakis', NULL, '14/08/1908', 'star', NULL),
    ('Rutger Hauer', NULL, '23/01/1944', 'star', NULL),
    ('Juliette Binoche', NULL, '09/03/1964', 'star', NULL),
    ('Gerard Depardieu', NULL, '27/12/1948', 'star', NULL),
    ('Arthur C Clarke', 'arthur@clarke.com', NULL, 'writer', NULL),
    ('George Lucas', 'george@email.com', NULL, 'writer', NULL),
    ('Harper Lee', 'harper@lee.com', NULL, 'writer', NULL),
    ('James Cameron', 'james@cameron.com', NULL, 'writer', NULL),
    ('Boris Pasternak', 'boris@boris.com', NULL, 'writer', NULL),
    ('Frederick Frank', 'fred@frank.com', NULL, 'writer', NULL),
    ('Theodoros Angelopoulos', 'theo@angelopoulos.com', NULL, 'writer', NULL),
    ('Erik Hazelhoff Roelfzema', 'erik@roelfzema.com', NULL, 'writer', NULL),
    ('Krzysztof Kieslowski', 'email@email.com', NULL, 'writer', NULL),
    ('Edmond Rostand', 'edmond@rostand.com', NULL, 'writer', NULL);

INSERT INTO movies (title, year, genre, score, director_id, star_id, writer_id) VALUES
    ('2001: A Space Odyssey', '1968', 'Science Fiction', 10, 1, 11, 21),
    ('Star Wars: A New Hope', '1977', 'Science Fiction', 7, 2, 12, 22),
    ('To Kill A Mockingbird', '1962', 'Drama', 10, 3, 13, 23),
    ('Titanic', '1997', 'Romance', 5, 4, 14, 24),
    ('Dr Zhivago', '1965', 'Historical', 8, 5, 15, 25),
    ('El Cid', '1961', 'Historical', 6, 6, 16, 26),
    ('Voyage to Cythera', '1984', 'Drama', 8, 7, 17, 27),
    ('Soldier of Orange', '1977', 'Thriller', 8, 8, 18, 28),
    ('Three Colours: Blue', '1993', 'Drama', 8, 9, 19, 29),
    ('Cyrano de Bergerac', '1990', 'Historical', 9, 10, 20, 30);