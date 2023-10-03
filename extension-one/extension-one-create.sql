CREATE TABLE IF NOT EXISTS people(
	person_id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	country TEXT,
	birth_date DATE,
	email TEXT
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
	CONSTRAINT fk_director FOREIGN KEY(director_id) REFERENCES people(person_id),
	CONSTRAINT fk_star FOREIGN KEY(star_id) REFERENCES people(person_id),
	CONSTRAINT fk_writer FOREIGN KEY(writer_id) REFERENCES people(person_id)
);