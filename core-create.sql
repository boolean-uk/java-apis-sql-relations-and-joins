CREATE TABLE actor (
    id serial PRIMARY KEY,
    name text NOT NULL,
    dob date
);

CREATE TABLE director (
    id serial PRIMARY KEY,
    name text NOT NULL,
    country text,
);

CREATE TABLE writer (
    id serial PRIMARY KEY,
    name text NOT NULL,
    email text UNIQUE
);

CREATE TABLE films (
    id serial PRIMARY KEY,
    name text NOT NULL,
    year int NOT NULL,
    director_id int NOT NULL,
    star_id int NOT NULL,
    writer_id int NOT NULL,
    genre text,
    score int,
    FOREIGN KEY (director_id) REFERENCES director(id),
    FOREIGN KEY (star_id) REFERENCES actor(id),
    FOREIGN KEY (writer_id) REFERENCES writer(id)
);
