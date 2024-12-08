CREATE TABLE Directors(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE Stars(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  DOB date
);

CREATE TABLE Writers(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL
);

CREATE TABLE Films (
  id SERIAL,
  title TEXT NOT NULL,
  year INT,
  genre TEXT NOT NULL,
  score INT,
  directorId INT,
  starId INT,
  writerId INT,
  UNIQUE(title),
  CONSTRAINT fk_director
  	FOREIGN KEY(directorId)
  		REFERENCES Directors(id),
  CONSTRAINT fk_star
  	FOREIGN KEY(starId)
  		REFERENCES Stars(id),
  CONSTRAINT fk_writer
  	FOREIGN KEY(writerId)
  		REFERENCES Writers(id)
);
