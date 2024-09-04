CREATE TABLE IF NOT EXISTS casts (
    film_id INTEGER,
    person_id INTEGER,
    CONSTRAINT fk_film_id
        FOREIGN KEY (film_id)
            REFERENCES films(film_id),
    CONSTRAINT fk_person_id
        FOREIGN KEY (person_id)
            REFERENCES persons(person_id)
);

INSERT INTO persons (person_name, person_email, person_country, person_dob) VALUES
('Gary Lockwood', 'gary.lockwood@example.com', 'USA', '1937-02-21'),
('William Sylvester', 'william.sylvester@example.com', 'USA', '1922-01-31'),
('Harrison Ford', 'harrison.ford@example.com', 'USA', '1942-07-13'),
('Carrie Fisher', 'carrie.fisher@example.com', 'USA', '1956-10-21'),
('John Megna', 'john.megna@example.com', 'USA', '1952-11-04'),
('Brock Peters', 'brock.peters@example.com', 'USA', '1927-07-02'),
('Kate Winslet', 'kate.winslet@example.com', 'UK', '1975-10-05'),
('Billy Zane', 'billy.zane@example.com', 'USA', '1966-02-24'),
('Omar Sharif', 'omar.sharif@example.com', 'Egypt', '1932-04-10'),
('Geraldine Chaplin', 'geraldine.chaplin@example.com', 'USA', '1944-07-31');


INSERT INTO casts (film_id, person_id) VALUES
    (1, 27),
    (1, 28),
    (2, 29),
    (2, 30),
    (3, 31),
    (3, 32),
    (4, 33),
    (4, 34),
    (5, 35),
    (5, 36);

SELECT person_name, films.film_name
FROM persons
JOIN casts ON casts.person_id = persons.person_id
JOIN films ON casts.film_id = films.film_id;
