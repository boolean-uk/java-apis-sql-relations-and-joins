-- add all the names seperate

INSERT INTO people (name)
SELECT DISTINCT name FROM director
WHERE name NOT IN (SELECT name FROM people);

INSERT INTO people (name)
SELECT DISTINCT name FROM star
WHERE name NOT IN (SELECT name FROM people);

INSERT INTO people (name)
SELECT DISTINCT name FROM writer
WHERE name NOT IN (SELECT name FROM people);

-- update the values so that we get the correct data to people who are both writers and directors

UPDATE people
SET country = director.country
    FROM director
WHERE people.name = director.name
  AND people.country IS NULL;

UPDATE people
SET dob = star.dob
    FROM star
WHERE people.name = star.name
  AND people.dob IS NULL;

UPDATE people
SET email = writer.email
    FROM writer
WHERE people.name = writer.name
  AND people.email IS NULL;