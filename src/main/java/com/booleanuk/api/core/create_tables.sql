CREATE TABLE IF NOT EXISTS directors(
    director_id SERIAL PRIMARY KEY,
    director_name VARCHAR(50) NOT NULL,
    director_country VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS stars(
    star_id SERIAL PRIMARY KEY,
    star_name VARCHAR(50) NOT NULL,
    star_dob DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS writers(
    writer_id SERIAL PRIMARY KEY,
    writer_name VARCHAR(50) NOT NULL,
    writer_email VARCHAR(50) NOT NULL,
    UNIQUE(writer_email)
);

CREATE TABLE IF NOT EXISTS films(
    film_id serial PRIMARY KEY,
    film_name VARCHAR(255) NOT NULL,
    film_genre VARCHAR(50) NOT NULL,
    film_release_year INT NOT NULL CHECK (1800 <= film_release_year AND film_release_year <= 9999),
    film_score INT NOT NULL CHECK (0 <= film_score AND film_score <= 10),
    director_id INTEGER,
    star_id INTEGER,
    writer_id INTEGER,
    CONSTRAINT fk_director_id
        FOREIGN KEY (director_id)
            REFERENCES directors(director_id),
    CONSTRAINT fk_star_id
        FOREIGN KEY (star_id)
            REFERENCES stars(star_id),
    CONSTRAINT fk_writer_id
        FOREIGN KEY (writer_id)
            REFERENCES writers(writer_id)
);

