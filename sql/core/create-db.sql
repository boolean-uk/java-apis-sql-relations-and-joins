DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS star;
DROP TABLE IF EXISTS writer;


CREATE TABLE IF NOT EXISTS director (
	directorId serial,
  name text,
  country text,
  PRIMARY KEY(directorId),
  UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS star (
	starId serial,
  name text,
  starDOB text,
  PRIMARY KEY(starId),
  UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS writer (
	writerId serial,
  name text,
  email text,
  PRIMARY KEY(writerId),
  UNIQUE(name),
  UNIQUE(email)
);




CREATE TABLE IF NOT EXISTS film (
    id serial,
  	directorId int,
  	starId int,
  	writerId int,
    title text,
    genre text,
    release_year int,
  	score int,
    PRIMARY KEY(id),
  	CONSTRAINT directorId
      FOREIGN KEY(directorId)
        REFERENCES director(directorId),
  	CONSTRAINT starId
      FOREIGN KEY(starId)
        REFERENCES star(starId),
  	CONSTRAINT writerId
      FOREIGN KEY(writerId)
        REFERENCES writer(writerid),
  	UNIQUE(title)
);