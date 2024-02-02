CREATE TABLE IF NOT EXISTS people (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS directors (
    id SERIAL PRIMARY KEY,
    person_id INT,
    country TEXT,
    CONSTRAINT fk_person
        FOREIGN KEY (person_id)
            REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS stars (
    id SERIAL PRIMARY KEY,
    person_id INT,
    dob TEXT,
    CONSTRAINT fk_person
        FOREIGN KEY (person_id)
            REFERENCES people(id)
);

CREATE TABLE IF NOT EXISTS writers (
    id SERIAL PRIMARY KEY,
    person_id INT,
    email TEXT,
    UNIQUE(email),
    CONSTRAINT fk_person
        FOREIGN KEY (person_id)
            REFERENCES people(id)
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