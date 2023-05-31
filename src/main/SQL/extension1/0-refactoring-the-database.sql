-- First we make the table
CREATE TABLE IF NOT EXISTS Person(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);
-- then we add values
INSERT INTO Person (name)
SELECT name
FROM (
	SELECT name FROM writer
	UNION
	SELECT name FROM director
	UNION
	SELECT name FROM star
) AS temp1
-- We must change the tables that we had before
--Writer
ALTER TABLE writer
ADD COLUMN person_id INT REFERENCES Person (id);

UPDATE writer
SET person_id = Person.id
FROM Person
WHERE writer.name = Person.name;

--Director
ALTER TABLE director
ADD COLUMN person_id INT REFERENCES Person (id);

UPDATE director
SET person_id = Person.id
FROM Person
WHERE director.name = Person.name;

--Star
ALTER TABLE star
ADD COLUMN person_id INT REFERENCES Person (id);

UPDATE star
SET person_id = Person.id
FROM Person
WHERE star.name = Person.name;

-- And finally we can drop the column of name since it is in the Person table

ALTER TABLE writer DROP COLUMN name;
ALTER TABLE director DROP COLUMN name;
ALTER TABLE star DROP COLUMN name;

-- Finally let's check the changes to the tables:
SELECT * from writer;
SELECT * from director;
SELECT * from star;

-- To get their name to show, we will do:
-- For director
SELECT person.name AS director_name, director.country
FROM director, person
WHERE director.person_id = person.id

-- For writer
SELECT person.name AS writer_name, writer.email
FROM writer, person
WHERE writer.person_id = person.id

-- For star / actor
SELECT person.name AS actor_name, star.dob
FROM star, person
WHERE star.person_id = person.id