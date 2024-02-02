CREATE TABLE People(
  id SERIAL PRIMARY KEY,
  name TEXT,
  dob TEXT,
  country TEXT,
  email TEXT,
  role TEXT
  );

  DROP TABLE Film

  CREATE TABLE Film(
    id SERIAL PRIMARY KEY,
    title TEXT,
    year INT,
    genre TEXT,
    score INT,
    people_id INT,
    CONSTRAINT fk_people_id
    	FOREIGN KEY(people_id)
    		REFERENCES People(id)
    );