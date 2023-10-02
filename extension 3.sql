create table boolean_uk.cast(
 cast_id INT PRIMARY KEY AUTO_INCREMENT,
 film_id INT,
 person_id INT,
 role_name VARCHAR(255),
 FOREIGN KEY (film_id) REFERENCES boolean_uk.films(film_id),
 FOREIGN KEY (person_id) REFERENCES boolean_uk.people(person_id)
);

INSERT INTO boolean_uk.people (fullname, dob_or_country, role)
VALUES ('Johnny Depp', '09/06/1963', 'Star'),
       ('Will Smith', '25/09/1968', 'Star');
    
INSERT INTO boolean_uk.cast (film_id, person_id, role_name) VALUES 
	(1, 1, 'leading role 1'),
    (1, 2, 'leading role 2');
    

