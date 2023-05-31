-- Create table Person
CREATE TABLE IF NOT EXISTS Person (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);

-- Add all names to the Person table
INSERT INTO Person (name)
SELECT name
FROM (
	SELECT name FROM writer
	UNION 
	SELECT name FROM director
	UNION
	SELECT name FROM star
) AS tb1;

-- Check table
select * FROM Person;

-- Add the person_id column and create foreign key constraints
ALTER TABLE writer
ADD COLUMN person_id INT REFERENCES Person (id);

ALTER TABLE director
ADD COLUMN person_id INT REFERENCES Person (id);

ALTER TABLE star
ADD COLUMN person_id INT REFERENCES Person (id);

-- Update the person_id values
UPDATE writer
SET person_id = Person.id
FROM Person
WHERE writer.name = Person.name;

UPDATE director
SET person_id = Person.id
FROM Person
WHERE director.name = Person.name;

UPDATE star
SET person_id = Person.id
FROM Person
WHERE star.name = Person.name;


-- Remove the name column
ALTER TABLE writer DROP COLUMN name;

ALTER TABLE director DROP COLUMN name;

ALTER TABLE star DROP COLUMN name;