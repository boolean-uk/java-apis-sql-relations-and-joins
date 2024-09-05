CREATE TABLE IF NOT EXISTS director (
                                        id SERIAL PRIMARY KEY,
                                        name TEXT,
                                        country TEXT
);


CREATE TABLE IF NOT EXISTS star (
                                    id SERIAL PRIMARY KEY,
                                    name TEXT,
                                    DOB TEXT
);


CREATE TABLE IF NOT EXISTS writer (
                                      id SERIAL PRIMARY KEY,
                                      name TEXT,
                                      email TEXT
);



CREATE TABLE film (
                      id SERIAL PRIMARY KEY,
                      title TEXT NOT NULL,
                      director_id INTEGER,
                      star_id INTEGER,
                      writer_id INTEGER,
                      year TEXT NOT NULL,
                      genre TEXT NOT NULL,
                      score INTEGER NOT NULL
  CONSTRAINT fk_director
    FOREIGN KEY(director_id)
      REFERENCES director(id),
    CONSTRAINT fk_star
      FOREIGN KEY(star_id)
        REFERENCES star(id)
  CONSTRAINT fk_writer
      FOREIGN KEY(writer_id)
        REFERENCES writer(id)
);
