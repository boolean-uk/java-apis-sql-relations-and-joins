DROP TABLE IF EXISTS Films, People, Directors, Stars, Writers;

CREATE TABLE IF NOT EXISTS People (
 id SERIAL PRIMARY KEY,
 name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Directors (
 id SERIAL PRIMARY KEY,
 peopleId INT,
 CONSTRAINT fk_people FOREIGN KEY (peopleId) REFERENCES people(id),
 country VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Stars (
 id SERIAL PRIMARY KEY,
 peopleId INT,
 CONSTRAINT fk_people FOREIGN KEY (peopleId) REFERENCES people(id),
 dob DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Writers (
 id SERIAL PRIMARY KEY,
 peopleId INT,
 CONSTRAINT fk_people FOREIGN KEY (peopleId) REFERENCES people(id),
 email VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Films (
 id SERIAL PRIMARY KEY,
 title VARCHAR(50) NOT NULL,
 directorId INT,
 starId INT,
 writerId INT,
 year INTEGER NOT NULL,
 genre VARCHAR(50) NOT NULL,
 score INTEGER NOT NULL CHECK (score > 0 AND score <= 10),
 CONSTRAINT fk_directors FOREIGN KEY (directorId) REFERENCES directors(id),
 CONSTRAINT fk_stars FOREIGN KEY (starId) REFERENCES stars(id),
 CONSTRAINT fk_writers FOREIGN KEY (writerId) REFERENCES writers(id)
);