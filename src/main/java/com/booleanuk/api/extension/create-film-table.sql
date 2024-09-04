CREATE TABLE film (
                      id SERIAL PRIMARY KEY,
                      title TEXT NOT NULL,
                      director_id INTEGER REFERENCES people(id),
                      star_id INTEGER REFERENCES people(id),
                      writer_id INTEGER REFERENCES people(id),
                      year TEXT NOT NULL,
                      genre TEXT NOT NULL,
                      score INTEGER NOT NULL
);

