CREATE TABLE IF NOT EXISTS director (
                                        id SERIAL PRIMARY KEY,
                                        name TEXT,
                                        country TEXT
);


CREATE TABLE IF NOT EXISTS star (
                                    id SERIAL PRIMARY KEY,
                                    name TEXT,
                                    DOB TEXT
);


CREATE TABLE IF NOT EXISTS writer (
                                      id SERIAL PRIMARY KEY,
                                      name TEXT,
                                      email TEXT
);



CREATE TABLE IF NOT EXISTS books (
                                     id SERIAL PRIMARY KEY,
                                     title TEXT not null,
                                     year TEXT not null,
                                     genre TEXT not null,
                                     score INTEGER not null,
                                     author_id INTEGER,
                                     publisher_id INTEGER,
                                     CONSTRAINT fk_author
                                     FOREIGN KEY(author_id)
    REFERENCES author(id),
    CONSTRAINT fk_publisher
    FOREIGN KEY(publisher_id)
    REFERENCES publisher(id)
    );