-- Create People table
CREATE TABLE People(
    id SERIAL PRIMARY KEY,
    name TEXT
);


-- Create Writers table
CREATE TABLE Writers(
    id SERIAL PRIMARY KEY,
    email TEXT,
    people_id INT,
    CONSTRAINT fk_people
    	FOREIGN KEY(people_id)
        	REFERENCES People(id)
);

-- Create Directors table
CREATE TABLE Directors(
    id SERIAL PRIMARY KEY,
    country TEXT,
    people_id INT,
    CONSTRAINT fk_people_directors
    	FOREIGN KEY(people_id)
        	REFERENCES People(id)
);

-- Create Stars table
CREATE TABLE Stars(
    id SERIAL PRIMARY KEY,
    DOB TEXT,
    people_id INT,
    CONSTRAINT fk_people_stars
    	FOREIGN KEY(people_id)
        	REFERENCES People(id)
);



-- Create Films table
CREATE TABLE Films (
    id SERIAL PRIMARY KEY,
    title TEXT,
    year INT,
    genre TEXT,
    score INT,
    writer_id INT,
    director_id INT,
    star_id INT,
    UNIQUE(title),
    CONSTRAINT fk_writer
        FOREIGN KEY(writer_id)
            REFERENCES Writers(id),
    CONSTRAINT fk_star
    	FOREIGN KEY(star_id)
        	REFERENCES Stars(id),
    CONSTRAINT fk_director
    	FOREIGN KEY(director_id)
        	REFERENCES Directors(id)
);




-- Populate People table
INSERT INTO People (name) VALUES
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
  --
  ('Keir Dullea'),
  ('Mark Hamill'),
  ('Gregory Peck'),
  ('Leonardo DiCaprio'),
  ('Julie Christie'),
  ('Charlton Heston'),
  ('Manos Katrakis'),
  ('Rutger Hauer'),
  ('Juliette Binoche'),
  ('Gerard Depardieu'),
  --
  ('Arthur C Clarke'),
  ('Harper Lee'),
  ('Boris Pasternak'),
  ('Frederick Frank'),
  ('Erik Hazelhoff Roelfzema'),
  ('Edmond Rostand')
 ;
-- Populate Directors table
INSERT INTO
    Directors (country, people_id)
VALUES
    ('USA', 1),
    ('USA', 2),
    ('USA', 3),
    ('Canada', 4),
    ('UK', 5),
    ('USA', 6),
    ('Greece', 7),
    ('Netherlands', 8),
    ('Poland', 9),
    ('France', 10);

-- Populate Writers table
INSERT INTO
    Writers (Email, people_id)
VALUES
    ('arthur@clarke.com', 21),
    ('george@email.com', 2),
    ('harper@lee.com', 22),
    ('james@cameron.com', 4),
    ('boris@boris.com', 23),
    ('fred@frank.com', 24),
    ('theo@angelopoulos.com', 7),
    ('erik@roelfzema.com', 25),
    ('email@email.com', 9),
    ('edmond@rostand.com', 26);

-- Populate Stars table
INSERT INTO
    Stars (DOB, people_id)
VALUES
    ('30/05/1936', 11),
    ('25/09/1951', 12),
    ('05/04/1916', 13),
    ('11/11/1974', 14),
    ('14/04/1940', 15),
    ('04/10/1923', 16),
    ('14/08/1908', 17),
    ('23/01/1944', 18),
    ('09/03/1964', 19),
    ('27/12/1948', 20);


-- Populate Films table
INSERT INTO Films (title, year, genre, score, writer_id, director_id, star_id) VALUES
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


--The SELECT statements remains the same except for
--Show only those films where the writer and the director are the same person

SELECT Films.title
FROM Films
JOIN Writers ON Films.writer_id = Writers.id
JOIN Directors ON Films.director_id = Directors.id
WHERE Writers.people_id = Directors.people_id;
