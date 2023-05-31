SELECT person.name
FROM writer, person, director
WHERE writer.person_id = person.id AND writer.person_id= director.person_id