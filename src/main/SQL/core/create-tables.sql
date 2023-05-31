CREATE TABLE IF NOT EXISTS directors (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	country TEXT
);

CREATE TABLE IF NOT EXISTS stars (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	dob TEXT
);

CREATE TABLE IF NOT EXISTS writers (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT
);

CREATE TABLE IF NOT EXISTS movies (
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	director_id INTEGER NOT NULL,
		CONSTRAINT fk_director
		FOREIGN KEY(director_id)
		REFERENCES directors(id),
	star_id INTEGER NOT NULL,
		CONSTRAINT fk_star
		FOREIGN KEY(star_id)
		REFERENCES stars(id),
	writer_id INTEGER NOT NULL,
		CONSTRAINT fk_writer
		FOREIGN KEY(writer_id)
		REFERENCES writers(id),
	year INTEGER,
	genre TEXT,
	score FLOAT
);