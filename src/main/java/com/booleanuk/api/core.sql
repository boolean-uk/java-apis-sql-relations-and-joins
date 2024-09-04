    -- Normalise the data so that it has multiple tables
    -- (Film, Director, Star and Writer) with an appropriate Primary Key for
    -- each and suitable Foreign Key relationships set up so that the data can
    -- still be linked together as needed.

   CREATE TABLE IF NOT EXISTS Films (
    id SERIAL PRIMARY KEY,
    title TEXT,
    year TEXT,
    genre TEXT,
    score INTEGER,
    director_id INTEGER,
    star_id INTEGER,
    writer_id INTEGER,
    CONSTRAINT fk_director
        FOREIGN KEY (director_id)
            REFERENCES Directors(id),
    CONSTRAINT fk_star
        FOREIGN KEY (star_id)
            REFERENCES Stars(id),
    CONSTRAINT fk_writer
        FOREIGN KEY (writer_id)
            REFERENCES Writers(id)
    );

    CREATE TABLE IF NOT EXISTS Directors (
    id SERIAL PRIMARY KEY,
    name TEXT,
    country TEXT
    );

    CREATE TABLE IF NOT EXISTS Stars (
    id SERIAL PRIMARY KEY,
    name TEXT,
    date_of_birth DATE
    );

    CREATE TABLE IF NOT EXISTS Writers (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT
    );

    -- Populate the tables with the data
    INSERT INTO Directors (name, country) VALUES
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

    INSERT INTO Stars (name, date_of_birth) VALUES
    ('Keir Dullea', '1936-05-30'),
    ('Mark Hamill', '1951-09-25'),
    ('Gregory Peck', '1916-04-05'),
    ('Leonardo DiCaprio', '1974-11-11'),
    ('Julie Christie', '1940-04-14'),
    ('Charlton Heston', '1923-10-04'),
    ('Manos Katrakis', '1908-08-14'),
    ('Rutger Hauer', '1944-01-23'),
    ('Juliette Binoche', '1964-03-09'),
    ('Gerard Depardieu', '1948-12-27');

    INSERT INTO Writers (name, email) VALUES
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

    INSERT INTO Films (id, title, year, genre, score, director_id, star_id, writer_id) VALUES
    ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1, 1),
    ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
    ('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
    ('Titanic', 1997, 'Romance', 5, 4, 4, 4),
    ('Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
    ('El Cid', 1961, 'Historical', 6, 6, 6, 6),
    ('Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
    ('Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
    ('Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
    ('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 10);

    -- Show the title and director name for all films
    SELECT f.title, d.name
       FROM Films f
    JOIN Directors d
        ON f.director_id = d.id;

    -- Show the title, director and star name for all films
    SELECT f.title AS film_title, d.name AS director, s.name AS star
       FROM Films f
    JOIN Directors d
        ON f.director_id = d.id
    JOIN Stars s
        ON f.star_id = s.id;

    -- Show the title of films where the director is from the USA
    SELECT f.title
       FROM Films f
    JOIN Directors d
        ON f.director_id = d.id
    WHERE d.country = 'USA';

    -- Show only those films where the writer and the director are the same person
        SELECT f.title
           FROM Films f
        JOIN Directors d
            ON f.director_id = d.id
        JOIN Writers w
            ON f.writer_id = w.id
        WHERE w.name = d.name;

    -- Show directors and film titles for films with a score of 8 or higher
    SELECT d.name AS director_name, f.title
        FROM Films f
    JOIN Directors d
        ON f.director_id = d.id
    WHERE f.score >= 8;

    -- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
        -- Show the title and star name for films released after the year 1980.
        SELECT f.title, s.name
            FROM Films f
        JOIN Stars s
            ON f.star_id = s.id
        WHERE f.year > '1980';

        -- Show the title and writer name for all films in the 'Drama' genre.
        SELECT f.title, w.name
            FROM Films f
        JOIN Writers w
            ON f.star_id = w.id
        WHERE f.genre = 'Drama'

        -- Show the title, director, and writer name for films with a score less than 7.
        SELECT f.title, d.name AS director_name, w.name AS writer_name
            FROM Films f
        JOIN Writers w
            ON f.writer_id = w.id
        JOIN Directors d
            ON f.director_id = d.id
        WHERE f.score < 7;

        -- Show the title and star name for films where the star was born after 1950.
         SELECT f.title, s.name
             FROM Films f
         JOIN Stars s
             ON f.star_id = s.id
         WHERE EXTRACT(YEAR FROM s.date_of_birth) > 1950;

        -- Show the title and director name for films where the director is not from the USA and the film score is greater than 5.
        SELECT f.title, d.name AS director_name
            FROM Films f
        JOIN Directors d
            ON f.director_id = d.id
        WHERE d.country != 'USA'
            AND f.score > 5;

