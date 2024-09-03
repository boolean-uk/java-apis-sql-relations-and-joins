-- film data
DROP TABLE IF EXISTS films;

CREATE TABLE IF NOT EXISTS films(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    director SERIAL NOT NULL,
    star SERIAL NOT NULL,
    writer SERIAL NOT NULL,
    year INT NOT NULL,
    genre TEXT NOT NULL,
    score INT NOT NULL
);

select * from films;





