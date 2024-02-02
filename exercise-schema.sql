CREATE TABLE IF NOT EXISTS person (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  birthdate DATE,
  email TEXT UNIQUE,
  country TEXT
);

CREATE TABLE IF NOT EXISTS film (
  id SERIAL PRIMARY KEY,
  film_title TEXT NOT NULL,
  film_genre TEXT,
  film_year SMALLINT,
  film_score SMALLINT
);


-- THIS TABLE COULD BE SPLIT INTO 'actor', 'writer' and 'director' TABLES
CREATE TABLE IF NOT EXISTS role (
  film_id INTEGER NOT NULL REFERENCES film(id),
  person_id INTEGER NOT NULL REFERENCES person(id),
  role_type TEXT NOT NULL,
  PRIMARY KEY (film_id, person_id, role_type)
);
