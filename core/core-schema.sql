CREATE TABLE IF NOT EXISTS directors(
    director_id SERIAL PRIMARY KEY,
    name TEXT,
    country TEXT
);
CREATE TABLE IF NOT EXISTS stars(
    star_id SERIAL PRIMARY KEY,
    name TEXT,
    birthDate TEXT
);

CREATE TABLE IF NOT EXISTS writers (
    writer_id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT
);

CREATE TABLE IF NOT EXISTS movies (
    movie_id SERIAL PRIMARY KEY,
    title TEXT,
    year TEXT,
    genre TEXT,
    score INTEGER,
    director_id INTEGER REFERENCES directors(director_id),
    star_id INTEGER REFERENCES stars(star_id),
    writer_id INTEGER REFERENCES writers(writer_id)
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

INSERT INTO stars (name, birthDate) VALUES
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

    INSERT INTO writers (name, email) VALUES
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

INSERT INTO movies (title, year, genre, score, director_id, star_id, writer_id) VALUES
    ('2001: A Space Odyssey', '1968', 'Science Fiction', 10, 1, 1, 1),
    ('Star Wars: A New Hope', '1977', 'Science Fiction', 7, 2, 2, 2),
    ('To Kill A Mockingbird', '1962', 'Drama', 10, 3, 3, 3),
    ('Titanic', '1997', 'Romance', 5, 4, 4, 4),
    ('Dr Zhivago', '1965', 'Historical', 8, 5, 5, 5),
    ('El Cid', '1961', 'Historical', 6, 6, 6, 6),
    ('Voyage to Cythera', '1984', 'Drama', 8, 7, 7, 7),
    ('Soldier of Orange', '1977', 'Thriller', 8, 8, 8, 8),
    ('Three Colours: Blue', '1993', 'Drama', 8, 9, 9, 9),
    ('Cyrano de Bergerac', '1990', 'Historical', 9, 10, 10, 10);




