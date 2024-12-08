CREATE TABLE IF NOT EXISTS Directors(
	id Serial PRIMARY KEY,
	name TEXT,
	country TEXT
);

CREATE TABLE IF NOT EXISTS  Stars(
	id Serial PRIMARY KEY,
	name TEXT,
	DOB TEXT
);

CREATE TABLE IF NOT EXISTS  Writers(
	id Serial PRIMARY KEY,
	name TEXT,
	email TEXT,
	UNIQUE(email)
);

CREATE TABLE IF NOT EXISTS Movies(
    id Serial PRIMARY KEY,
    title TEXT,
    director_id INTEGER,
    star_id INTEGER,
    writer_id INTEGER,
    year INTEGER,
    genre TEXT,
    score INTEGER,
    FOREIGN KEY(director_id) REFERENCES directors(id),
    FOREIGN KEY (star_id) REFERENCES Stars(id),
    FOREIGN KEY(writer_id) REFERENCES Writers(id)
);
