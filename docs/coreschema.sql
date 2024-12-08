

CREATE TABLE IF NOT EXISTS directors (id SERIAL PRIMARY KEY, name TEXT, country TEXT);

CREATE TABLE IF NOT EXISTS stars (id SERIAL PRIMARY KEY, name TEXT, dob TEXT);

CREATE TABLE IF NOT EXISTS writers (id SERIAL PRIMARY KEY, name TEXT, email TEXT);

CREATE TABLE IF NOT EXISTS films (
    id SERIAL PRIMARY KEY,
    title TEXT,
    year int,
    genre TEXT,
    score INT,
    directorId INT,
    starId INT,
    writerId INT,
    CONSTRAINT fk_director
        FOREIGN KEY(directorId)
            REFERENCES directors(id),
    CONSTRAINT fk_star
        FOREIGN KEY(starId)
            REFERENCES stars(id),
    CONSTRAINT fk_writer
        FOREIGN KEY(writerId)
            REFERENCES writers(id)
);






