CREATE TABLE IF NOT EXISTS directors (
	director_id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	country TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS stars (
	star_id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	birth_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS writers (
	writer_id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS films (
	film_id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	year INTEGER CHECK(year > 1800),
	genre TEXT NOT NULL,
	score INTEGER CHECK(score >= 0 AND score <= 10),
	director_id INTEGER,
	star_id INTEGER,
	writer_id INTEGER,
	CONSTRAINT fk_director FOREIGN KEY(director_id) REFERENCES directors(director_id),
	CONSTRAINT fk_star FOREIGN KEY(star_id) REFERENCES stars(star_id),
	CONSTRAINT fk_writer FOREIGN KEY(writer_id) REFERENCES writers(writer_id)
);