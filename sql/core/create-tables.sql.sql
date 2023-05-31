CREATE TABLE IF NOT EXISTS Director (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	country TEXT
);

CREATE TABLE IF NOT EXISTS Star (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	dob DATE
);

CREATE TABLE IF NOT EXISTS Writer (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT
);

CREATE TABLE IF NOT EXISTS Film (
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	genre TEXT,
	year INT,
	score INT,
	director_id INT REFERENCES director(id),
	star_id INT REFERENCES star(id),
	writer_id INT REFERENCES writer(id)
);
