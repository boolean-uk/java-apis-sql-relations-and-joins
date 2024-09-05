CREATE TABLE People (
    person_id SERIAL PRIMARY KEY,
    name TEXT,
    dob DATE NULL,
    country TEXT NULL,
    email TEXT NULL
);

CREATE TABLE Film (
    film_id SERIAL PRIMARY KEY,
    title TEXT,
    year INT,
    genre TEXT,
    score INT,
    director_id INT,
    star_id INT,
    writer_id INT,
    FOREIGN KEY (director_id) REFERENCES People(person_id),
    FOREIGN KEY (star_id) REFERENCES People(person_id),
    FOREIGN KEY (writer_id) REFERENCES People(person_id)
);

INSERT INTO People (name, dob, country, email)
VALUES
    ('Stanley Kubrick', '1928-07-26', 'USA', NULL),
    ('George Lucas', '1944-05-14', 'USA', 'george@email.com'),
    ('Robert Mulligan', '1925-08-23', 'USA', NULL),
    ('James Cameron', '1954-08-16', 'Canada', 'james@cameron.com'),
    ('David Lean', '1908-03-25', 'UK', NULL),
    ('Anthony Mann', '1906-06-30', 'USA', NULL),
    ('Theodoros Angelopoulos', '1935-04-27', 'Greece', 'theo@angelopoulos.com'),
    ('Paul Verhoeven', '1938-07-18', 'Netherlands', NULL),
    ('Krzysztof Kieslowski', '1941-06-27', 'Poland', 'email@email.com'),
    ('Jean-Paul Rappeneau', '1932-04-08', 'France', NULL),
    ('Keir Dullea', '1936-05-30', NULL, NULL),
    ('Mark Hamill', '1951-09-25', NULL, NULL),
    ('Gregory Peck', '1916-04-05', NULL, NULL),
    ('Leonardo DiCaprio', '1974-11-11', NULL, NULL),
    ('Julie Christie', '1940-04-14', NULL, NULL),
    ('Charlton Heston', '1923-10-04', NULL, NULL),
    ('Manos Katrakis', '1908-08-14', NULL, NULL),
    ('Rutger Hauer', '1944-01-23', NULL, NULL),
    ('Juliette Binoche', '1964-03-09', NULL, NULL),
    ('Gerard Depardieu', '1948-12-27', NULL, NULL),
    ('Arthur C Clarke', NULL, NULL, 'arthur@clarke.com'),
    ('Harper Lee', NULL, NULL, 'harper@lee.com'),
    ('Boris Pasternak', NULL, NULL, 'boris@boris.com'),
    ('Frederick Frank', NULL, NULL, 'fred@frank.com'),
    ('Erik Hazelhoff Roelfzema', NULL, NULL, 'erik@roelfzema.com'),
    ('Edmond Rostand', NULL, NULL, 'edmond@rostand.com');

INSERT INTO Film (title, year, genre, score, director_id, star_id, writer_id)
VALUES
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
