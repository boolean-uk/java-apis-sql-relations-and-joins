CREATE TABLE IF NOT EXISTS film (
		id SERIAL PRIMARY KEY,
		title TEXT NOT NULL,
		director_id INT NOT NULL,
		star_id INT NOT NULL,
		writer_id INT NOT NULL,
		year INT,
		genre TEXT,
		score INT,
		CONSTRAINT fk_director
			FOREIGN KEY (director_id)
				REFERENCES director(id),
		CONSTRAINT fk_star
			FOREIGN KEY (star_id)
				REFERENCES star(id),
		CONSTRAINT fk_writer
			FOREIGN KEY (writer_id)
				REFERENCES writer(id)

);

CREATE TABLE IF NOT EXISTS director (
		id SERIAL PRIMARY KEY,
		name TEXT NOT NULL,
		country TEXT
);

CREATE TABLE IF NOT EXISTS star (
		id SERIAL PRIMARY KEY,
		name TEXT NOT NULL,
		dob DATE
);

CREATE TABLE IF NOT EXISTS writer (
		id SERIAL PRIMARY KEY,
		name TEXT NOT NULL,
		email TEXT
)