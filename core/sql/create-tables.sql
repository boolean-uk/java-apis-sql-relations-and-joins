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
    email TEXT,
    UNIQUE(email)
);

CREATE TABLE IF NOT EXISTS films (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    director_id INT,
    star_id INT,
    writer_id INT,
    year INT,
    genre TEXT,
    score INT,
    CONSTRAINT fk_director
    	FOREIGN KEY (director_id)
    		REFERENCES directors(id),
   	CONSTRAINT fk_star
    	FOREIGN KEY (star_id)
    		REFERENCES stars(id),
    CONSTRAINT fk_writer
    	FOREIGN KEY (writer_id)
    		REFERENCES writers(id)
);