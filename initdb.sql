DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS stars;
DROP TABLE IF EXISTS writers;

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title varchar(255) NOT NULL,
  year integer NOT NULL,
  genre varchar(255) NOT NULL,
  score integer NOT NULL,

  star_id integer,
  director_id integer,
  writer_email varchar(255),

  UNIQUE(title),
  FOREIGN KEY(star_id) REFERENCES stars(id),
  FOREIGN KEY(director_id) REFERENCES directors(id),
  FOREIGN KEY(writer_email) REFERENCES writers(email),
);

CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL,
  birthday date NOT NULL
);

CREATE TABLE writers(
  email varchar(255) PRIMARY KEY,
  name varchar(255) NOT NULL
);

CREATE TABLE directors(
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL,
  country varchar(255) NOT NULL
);
