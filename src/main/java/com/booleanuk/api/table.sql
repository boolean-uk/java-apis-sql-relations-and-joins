CREATE TABLE director (
                          director_id SERIAL PRIMARY KEY,
                          name        TEXT NOT NULL,
                          country     TEXT NOT NULL
);

CREATE TABLE writer (
                        writer_id SERIAL PRIMARY KEY,
                        name      TEXT NOT NULL,
                        email     TEXT NOT NULL UNIQUE
);

CREATE TABLE star (
                      star_id SERIAL PRIMARY KEY,
                      name    TEXT NOT NULL,
                      dob     DATE NOT NULL
);

CREATE TABLE film (
                      film_id SERIAL PRIMARY KEY,
                      title TEXT NOT NULL,
                      year  INT  NOT NULL,
                      genre TEXT NOT NULL,
                      score INT  NOT NULL CHECK (score BETWEEN 0 AND 10),
                      director_id INT  NOT NULL REFERENCES director(director_id),
                      writer_id   INT  NOT NULL REFERENCES writer(writer_id)
);

CREATE TABLE film_star (
                           film_id INT NOT NULL REFERENCES film(film_id) ON DELETE CASCADE,
                           star_id INT NOT NULL REFERENCES star(star_id) ON DELETE CASCADE,
                           PRIMARY KEY (film_id, star_id)
);
