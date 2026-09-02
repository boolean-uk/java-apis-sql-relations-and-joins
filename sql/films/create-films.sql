-- Run this AFTER directors, stars and writers: it has foreign keys into all three.
CREATE TABLE films (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director_id INT REFERENCES directors(id),
    star_id INT REFERENCES stars(id),
    writer_id INT REFERENCES writers(id),
    release_year INT,
    genre VARCHAR(100),
    score INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
