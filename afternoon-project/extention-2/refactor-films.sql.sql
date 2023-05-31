CREATE TABLE IF NOT EXISTS films_actors(
    id SERIAL PRIMARY KEY,
    films_id INTEGER NOT NULL,
    actors_id INTEGER NOT NULL,
    CONSTRAINT fk_films_PK FOREIGN KEY (films_id) REFERENCES films(id),
    CONSTRAINT fk_actor_PK FOREIGN KEY (actors_id) REFERENCES actors(id)
);