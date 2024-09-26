CREATE TABLE Star(
  id SERIAL PRIMARY KEY,
  name TEXT,
  dob TEXT
  );

CREATE TABLE Director(
  id SERIAL PRIMARY KEY,
  name TEXT,
  country TEXT
  );

CREATE TABLE Writer(
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT
  );

CREATE TABLE Film(
  id SERIAL PRIMARY KEY,
  title TEXT,
  year INT,
  genre TEXT,
  star_id INT,
  director_id INT,
  writer_id INT,
  CONSTRAINT fk_star_id
  	FOREIGN KEY(star_id)
  		REFERENCES Star(id),
  CONSTRAINT fk_director_id
  	FOREIGN KEY(director_id)
  		REFERENCES Director(id),
  CONSTRAINT fk_writer_id
  	FOREIGN KEY(writer_id)
  		REFERENCES Writer(id)
  );


