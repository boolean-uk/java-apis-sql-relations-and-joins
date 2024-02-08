CREATE TABLE IF NOT EXISTS writers(
  id serial PRIMARY KEY,
  name text,
  email text);

CREATE TABLE IF NOT EXISTS actors(
  id serial PRIMARY KEY,
  name text,
  dob date);

CREATE TABLE IF NOT EXISTS directors(
  id serial PRIMARY KEY,
  name text,
  country text);

CREATE TABLE IF NOT EXISTS album(
  id serial PRIMARY KEY,
  title text,
  director_id int,
  star_id int,
  writer_id int,
  year int,
  genre text,
  score int,
  CONSTRAINT fk_director
  	FOREIGN KEY(director_id)
    REFERENCES directors(id),
  CONSTRAINT fk_star
  	FOREIGN KEY(star_id)
    REFERENCES actors(id),
  CONSTRAINT fk_writer
  	FOREIGN KEY(writer_id)
		REFERENCES writers(id)
);


INSERT INTO directors(
  	name, country
  	)
  	VALUES
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

INSERT INTO actors(
  	name, dob
  	)
  	VALUES
  	('Keir Dullea', '1936-05-30'),
    ('Mark Hamill', '1951-09-25'),
    ('Gregory Peck', '1916-04-05'),
    ('Leonardo DiCaprio', '1974-11-11'),
    ('Julie Chrisie', '1940-04-14'),
    ('Charlton Heston', '1923-10-04'),
    ('Manos Katrakis', '1908-08-14'),
    ('Rutger Hauer', '1944-01-23'),
    ('Juliette Binoche', '1964-03-09'),
    ('Gerard Depardieu', '1948-12-27');


INSERT INTO writers(
  	name, email
  	)
  	VALUES
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


    INSERT INTO movies
	(title, year, genre, score, director_id, star_id, writer_id)
  VALUES 
  	('2001: A Space Odyssey',1968,'Science Fiction',10,1,1,1),
  	('Star Wars: A New Hope',1977,'Science Fiction',7,2,2,2),
  	('To Kill A Mockingbird',1962,'Drama',10,3,3,3),
  	('Titanic',1997,'Romance',5,4,4,4),
  	('Dr Zhivago',1965,'Historical',8,5,5,5),
  	('El Cid',1961,'Historical',6,6,6,6),
  	('Voyage to Cythera',1984,'Drama',8,7,7,7),
  	('Soldier of Orange',1977,'Thriller',8,8,8,8),
  	('Three Colours: Blue',1993,'Drama',8,9,9,9),
  	('Cyrano de Bergerac',1990,'Historical',9,10,10,10);

    SELECT title, directors.name as director_name from movies
        JOIN directors on director_id = directors.id;

    SELECT title, directors.name as director_name, actors.name as star_name from movies
        JOIN actors on star_id = actors.id
        JOIN directors on director_id = directors.id;

    SELECT title, directors.name as director_name, writers.name as writer_name from movies
	    JOIN writers on writer_id = writers.id
	    JOIN directors on director_id = directors.id
	    WHERE writers.name = directors.name;

    SELECT title, directors.name as director_name from movies
	    JOIN directors on director_id = directors.id
	    WHERE score >= 8;

	SELECT title, directors.country AS country from movies
        join directors on director_id = directors.id
        where country = 'USA';

    /*
        Finds all movies with an american director that have a score of 7 or higher
    */
    SELECT title, directors.name as director_name, directors.country as director_country, score from movies
	    JOIN directors on director_id = directors.id
	    WHERE score >= 7 AND directors.country = 'USA';

    /*
        Queries for the same table as the table given in core. The names in the colomns are not always the same
    */
    SELECT title, directors.name AS director_name, directors.country AS director_country,
	    actors.name AS star_name, actors.dob AS star_dob, writers.name AS writer_name,
        writers.email AS writer_email, year, genre, score FROM movies
  	        JOIN directors ON director_id = directors.id
            JOIN actors ON star_id = actors.id
            JOIN writers ON writer_id = writers.id;

    /*
        Queries for the title of movies and the info for their star-actor
    */
    SELECT title, actors.name AS star_name, actors.dob AS star_dob FROM movies
        JOIN actors ON star_id = actors.id;

    /*
        Queries for movies that had stars below the age of 40 upon release
    */
    SELECT title, actors.name AS star_name, year-extract(year FROM actors.dob) as star_age FROM movies
        JOIN actors ON star_id = actors.id
        WHERE year-extract(year FROM actors.dob) <= 40;

    /*
        Queries for title, name of star, age of star and director for movies with star actors below the age of 30 upon release
    */
    SELECT title, actors.name AS star_name, year-extract(year FROM actors.dob) as star_age, directors.name as director_name FROM movies
        JOIN actors ON star_id = actors.id
        JOIN directors ON director_id = directors.id
        WHERE year-extract(year FROM actors.dob) <= 30;

    /*
        EXTENTION 1
    */

        CREATE TABLE persons(
            id serial PRIMARY KEY,
            name text,
            dob date,
            email text,
            country text
            );

        INSERT INTO persons
	        (name, dob, email, country)
            VALUES
                ('Stanley Kubrick', null, null, 'USA'),
                ('George Lucas', null, 'george@email.com', 'USA'),
                ('Robert Mulligan', null, null, 'USA'),
                ('James Cameron', null, 'james@cameron.com', 'Canada'),
                ('David Lean', null, null, 'UK'),
                ('Anthony Mann', null, null, 'USA'),
                ('Theodoros Angelopoulos', null, 'theo@angelopoulos.com', 'Greece'),
                ('Paul Verhoeven', null, null, 'Netherlands'),
                ('Krzysztof Kieslowski', null, 'email@email.com', 'Poland'),
                ('Jean-Paul Rappeneau', null, null, 'France'),
                ('Arthur C Clarke', null, 'arthur@clarke.com', null),
                ('Harper Lee', null, 'harper@lee.com', null),
                ('Boris Pasternak', null, 'boris@boris.com', null),
                ('Frederick Frank', null, 'fred@frank.com', null),
                ('Erik Hazelhoff Roelfzema', null, 'erik@roelfzema.com', null),
                ('Edmond Rostand', null, 'edmond@rostand.com', null),
                ('Keir Dullea', '1936-05-30', null, null),
                ('Mark Hamill', '1951-09-25', null, null),
                ('Gregory Peck', '1916-04-05', null, null),
                ('Leonardo DiCaprio', '1974-11-11', null, null),
                ('Julie Chrisie', '1940-04-14', null, null),
                ('Charlton Heston', '1923-10-04', null, null),
                ('Manos Katrakis', '1908-08-14', null, null),
                ('Rutger Hauer', '1944-01-23', null, null),
                ('Juliette Binoche', '1964-03-09', null, null),
                ('Gerard Depardieu', '1948-12-27', null, null);
        
        CREATE TABLE directors(
            id serial PRIMARY KEY,
            person_id int,
            CONSTRAINT fk_person
  	        FOREIGN KEY(person_id)
            REFERENCES persons(id)
            );

        CREATE TABLE actors(
            id serial PRIMARY KEY,
            person_id int,
            CONSTRAINT fk_person
  	        FOREIGN KEY(person_id)
            REFERENCES persons(id)
            );

        CREATE TABLE writers(
            id serial PRIMARY KEY,
            person_id int,
            CONSTRAINT fk_person
  	        FOREIGN KEY(person_id)
            REFERENCES persons(id)
            );



        INSERT INTO directors
	        (person_id)
            VALUES
  	            (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

        INSERT INTO writers
	        (person_id)
            VALUES
  	            (2), (4), (7), (9), (11), (12), (13), (14), (15), (16);

        INSERT INTO actors
	        (person_id)
            VALUES
  	            (17), (18), (19), (20), (21), (22), (23), (24), (25), (26);

        INSERT INTO movies
	        (title, year, genre, score, director_id, star_id, writer_id)
            VALUES 
                ('2001: A Space Odyssey',1968,'Science Fiction',10,1,1,5),
                ('Star Wars: A New Hope',1977,'Science Fiction',7,2,2,1),
                ('To Kill A Mockingbird',1962,'Drama',10,3,3,6),
                ('Titanic',1997,'Romance',5,4,4,2),
                ('Dr Zhivago',1965,'Historical',8,5,5,7),
                ('El Cid',1961,'Historical',6,6,6,6),
                ('Voyage to Cythera',1984,'Drama',8,7,7,3),
                ('Soldier of Orange',1977,'Thriller',8,8,8,9),
                ('Three Colours: Blue',1993,'Drama',8,9,9,5),
                ('Cyrano de Bergerac',1990,'Historical',9,10,10,10);

        /*
            Couldn't get the queries to work.
        */