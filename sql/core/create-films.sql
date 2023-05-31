CREATE TABLE IF NOT EXISTS films (
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	director_id INTEGER NOT NULL,
	star_id INTEGER NOT NULL,
	writer_id INTEGER NOT NULL,
	year INTEGER,
	genre TEXT,
	score INTEGER,
		FOREIGN KEY (director_id)
			REFERENCES director(id),
		FOREIGN KEY (star_id)
			REFERENCES star(id),
		FOREIGN KEY (writer_id)
			REFERENCES writer(id)
);

CREATE TABLE IF NOT EXISTS director (
	id SERIAL PRIMARY KEY,
	director_name TEXT,
	director_country TEXT
);

CREATE TABLE IF NOT EXISTS star (
	id SERIAL PRIMARY KEY,
	star_name TEXT,
	star_date_of_birth DATE
);

CREATE TABLE IF NOT EXISTS writer (
	id SERIAL PRIMARY KEY,
	writer_name TEXT,
	writer_email TEXT
);