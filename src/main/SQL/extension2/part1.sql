CREATE TABLE IF NOT EXISTS actors (
	id SERIAL PRIMARY KEY,
	film_id INTEGER NOT NULL,
		CONSTRAINT fk_film
		FOREIGN KEY(film_id)
		REFERENCES films(id),
	actor_id INTEGER NOT NULL,
		CONSTRAINT fk_actor
		FOREIGN KEY(actor_id)
		REFERENCES people(id)
);