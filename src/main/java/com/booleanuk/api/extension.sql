-- Extension Task 1
-- Create the People table
CREATE TABLE IF NOT EXISTS People (
    id SERIAL PRIMARY KEY,
    name TEXT,
    country TEXT,
    date_of_birth DATE,
    email TEXT
);

-- Modify the Films table to reference the People table
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
            REFERENCES People(id),
    CONSTRAINT fk_star
        FOREIGN KEY (star_id)
            REFERENCES People(id),
    CONSTRAINT fk_writer
        FOREIGN KEY (writer_id)
            REFERENCES People(id)
);

    -- Populate the tables with the data
    INSERT INTO People (name, country, date_of_birth, email) VALUES
    ('Stanley Kubrick', 'USA', NULL, NULL),
    ('George Lucas', 'USA', NULL, 'george@email.com'),
    ('Robert Mulligan', 'USA', NULL, NULL),
    ('James Cameron', 'Canada', NULL, 'james@cameron.com'),
    ('David Lean', 'UK', NULL, NULL),
    ('Anthony Mann', 'USA', NULL, NULL),
    ('Theodoros Angelopoulos', 'Greece', NULL, 'theo@angelopoulos.com'),
    ('Paul Verhoeven', 'Netherlands', NULL, NULL),
    ('Krzysztof Kieslowski', 'Poland', NULL, 'email@email.com'),
    ('Jean-Paul Rappeneau', 'France', NULL, NULL),
    ('Keir Dullea', NULL, '1936-05-30', NULL),
    ('Mark Hamill', NULL, '1951-09-25', NULL),
    ('Gregory Peck', NULL, '1916-04-05', NULL),
    ('Leonardo DiCaprio', NULL, '1974-11-11', NULL),
    ('Julie Christie', NULL, '1940-04-14', NULL),
    ('Charlton Heston', NULL, '1923-10-04', NULL),
    ('Manos Katrakis', NULL, '1908-08-14', NULL),
    ('Rutger Hauer', NULL, '1944-01-23', NULL),
    ('Juliette Binoche', NULL, '1964-03-09', NULL),
    ('Gerard Depardieu', NULL, '1948-12-27', NULL),
    ('Arthur C Clarke', NULL, NULL, 'arthur@clarke.com'),
    ('Harper Lee', NULL, NULL, 'harper@lee.com'),
    ('Boris Pasternak', NULL, NULL, 'boris@boris.com'),
    ('Frederick Frank', NULL, NULL, 'fred@frank.com'),
    ('Erik Hazelhoff Roelfzema', NULL, NULL, 'erik@roelfzema.com'),
    ('Edmond Rostand', NULL, NULL, 'edmond@rostand.com');

   INSERT INTO Films (title, year, genre, score, director_id, star_id, writer_id) VALUES
    ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 11, 1),
    ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 12, 2),
    ('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 13, 22),
    ('Titanic', 1997, 'Romance', 5, 4, 14, 4),
    ('Dr Zhivago', 1965, 'Historical', 8, 5, 15, 23),
    ('El Cid', 1961, 'Historical', 6, 6, 16, 24),
    ('Voyage to Cythera', 1984, 'Drama', 8, 7, 17, 7),
    ('Soldier of Orange', 1977, 'Thriller', 8, 8, 18, 25),
    ('Three Colours: Blue', 1993, 'Drama', 8, 9, 19, 9),
    ('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 20, 26);


    -- Show the title and director name for all films
    SELECT f.title, p.name AS director_name
        FROM Films f
    JOIN People p
        ON f.director_id = p.id;

    -- Show the title, director and star name for all films
    SELECT f.title AS film_title, d.name AS director, s.name AS star
        FROM Films f
    JOIN People d
        ON f.director_id = d.id
    JOIN People s
        ON f.star_id = s.id;

    -- Show the title of films where the director is from the USA
    SELECT f.title
        FROM Films f
    JOIN People p
        ON f.director_id = p.id
    WHERE p.country = 'USA';

    -- Show only those films where the writer and the director are the same person
    SELECT f.title
        FROM Films f
    WHERE f.director_id = f.writer_id;

    -- Show directors and film titles for films with a score of 8 or higher
    SELECT p.name AS director_name, f.title
        FROM Films f
    JOIN People p
        ON f.director_id = p.id
    WHERE f.score >= 8;

   -- Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.
       -- Show the title and star name for films released after the year 1980.
       SELECT f.title, s.name AS star_name
            FROM Films f
       JOIN People s
           ON f.star_id = s.id
       WHERE f.year > '1980';

       -- Show the title and writer name for all films in the 'Drama' genre.
       SELECT f.title, w.name AS writer_name
            FROM Films f
       JOIN People w
           ON f.writer_id = w.id
       WHERE f.genre = 'Drama';

       -- Show the title, director, and writer name for films with a score less than 7.
       SELECT f.title, d.name AS director_name, w.name AS writer_name
            FROM Films f
       JOIN People w
           ON f.writer_id = w.id
       JOIN People d
           ON f.director_id = d.id
       WHERE f.score < 7;

       -- Show the title and star name for films where the star was born after 1950.
       SELECT f.title, s.name AS star_name
            FROM Films f
       JOIN People s
           ON f.star_id = s.id
       WHERE EXTRACT(YEAR FROM s.date_of_birth) > 1950;

       -- Show the title and director name for films where the director is not from the USA and the film score is greater than 5.
       SELECT f.title, d.name AS director_name
            FROM Films f
       JOIN People d
            ON f.director_id = d.id
       WHERE d.country != 'USA'
            AND f.score > 5;

