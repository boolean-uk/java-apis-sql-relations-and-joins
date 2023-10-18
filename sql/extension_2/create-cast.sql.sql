-- Rename star table to actor
ALTER TABLE star RENAME TO actor;

-- Create film cast table
CREATE TABLE IF NOT EXISTS Film_Cast (
	id SERIAL PRIMARY KEY,
	film_id INT REFERENCES film(id),
	actor_id INT REFERENCES actor(id),
	star_id INT REFERENCES actor(id)
);

-- Populate film cast table
INSERT INTO Film_Cast (film_id, star_id, actor_id)
VALUES (1,1,2), (1,1,3),
	(2,2,1), (2,2,4), (2,2,5),
	(3,3,1), (3,3,2),
	(4,4,1), (4,4,8),
	(5,5,2), (5,5,3), (5,5,7),
	(6,6,1), (6,6,2),
	(7,7,9), (7,7,10),
	(8,8,6), (8,8,5), (8,8,10),
	(9,9,1), (9,9,5),
	(10,10,6), (10,10,8), (10,10,9);
	
-- Remove star_id from film table

ALTER TABLE film DROP COLUMN star_id;