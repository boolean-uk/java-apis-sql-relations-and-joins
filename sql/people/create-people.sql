/* Actors, Directors and Writers all identify people (using a Foreign Key) that are present in a single People table*/

/* email moved here from writers, date_of_birth from stars, nationality from directors.country.
   They are nullable because the source data only knows one of them per person. */
CREATE TABLE people (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    nationality VARCHAR(50),
    email VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
