CREATE TABLE casts(id SERIAL PRIMARY KEY, film_id int, actor_id int, FOREIGN KEY (film_id) REFERENCES films(id), FOREIGN KEY (actor_id) REFERENCES actors(people_id))
INSERT INTO casts(film_id, actor_id)
VALUES
(1,2),
(1,3),
(1,4),
(2,3),
(2,4),
(2,5),
(2,6),
(4,5),
(4,6),
(4,7),
(4,8),
(6,7),
(6,8),
(6,9),
(6,10);
