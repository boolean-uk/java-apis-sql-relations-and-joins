CREATE TABLE boolean_uk.people (
    person_id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(255) NOT NULL,
    dob_or_country VARCHAR(255),
    email VARCHAR(255) UNIQUE NULL,
    role ENUM('Star', 'Director', 'Writer')
);

ALTER TABLE boolean_uk.films 
ADD COLUMN actor_id INT,
ADD COLUMN writer_id INT,
ADD FOREIGN KEY (actor_id) REFERENCES boolean_uk.people(person_id),
ADD FOREIGN KEY (writer_id) REFERENCES boolean_uk.people(person_id);

ALTER TABLE boolean_uk.films 
ADD FOREIGN KEY (director_id) REFERENCES boolean_uk.people(person_id);

SELECT f.title, p.fullname AS director_name
FROM boolean_uk.films f
INNER JOIN boolean_uk.people p ON f.director_id = p.person_id
WHERE p.role = 'Director';

SELECT f.title, d.fullname AS director_name, s.fullname AS star_name
FROM boolean_uk.films f
INNER JOIN boolean_uk.people d ON f.director_id = d.person_id
INNER JOIN boolean_uk.people s ON f.actor_id = s.person_id
WHERE d.role = 'Director' AND s.role = 'Star';

SELECT f.title
FROM boolean_uk.films f
INNER JOIN boolean_uk.people d ON f.director_id = d.person_id
INNER JOIN boolean_uk.people w ON f.writer_id = w.person_id
WHERE d.fullname = w.fullname;
