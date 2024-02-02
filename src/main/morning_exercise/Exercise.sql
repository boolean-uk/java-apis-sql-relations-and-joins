CREATE TABLE IF NOT EXISTS artists (
	id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT
);

-- Artists Table Entries --
INSERT INTO artists (name, email) VALUES
    ('Beyoncé', 'beyonce@example.com'),
    ('Ed Sheeran', 'edsheeran@example.com'),
    ('Taylor Swift', 'taylorswift@example.com'),
    ('Kendrick Lamar', 'kendricklamar@example.com'),
    ('Ariana Grande', 'arianagrande@example.com');



CREATE TABLE IF NOT EXISTS record_companies (
  id SERIAL PRIMARY KEY,
	name VARCHAR(50),
  address TEXT
);

-- Record Companies Table Entries --
INSERT INTO record_companies (name, address) VALUES
    ('Sony Music', '123 Music Street, Los Angeles, CA'),
    ('Universal Music Group', '456 Melody Avenue, New York, NY'),
    ('Warner Music Group', '789 Harmony Lane, Nashville, TN'),
    ('Republic Records', '321 Rhythm Road, Miami, FL'),
    ('Atlantic Records', '555 Beat Boulevard, Atlanta, GA');

DROP TABLE IF EXISTS albums;
CREATE TABLE IF NOT EXISTS albums (
    album_id SERIAL PRIMARY KEY,
    title TEXT,
  	artist_id INT,
  	record_company_id INT,
    year VARCHAR(50),
  	UNIQUE(title),
  	CONSTRAINT fk_artist
  		FOREIGN KEY(artist_id)
  			REFERENCES artists(id),
  	CONSTRAINT fk_record_company
  		FOREIGN KEY(record_company_id)
  			REFERENCES record_companies(id)
);

-- Albums Table Entries --
INSERT INTO albums
		(title, artist_id, record_company_id, year)
 VALUES
    ('Lemonade', 1, 1, '2016'),  -- Beyoncé's album under Sony Music
    ('÷ (Divide)', 2, 2, '2017'),  -- Ed Sheeran's album under Universal Music Group
    ('1989', 3, 3, '2014'),  -- Taylor Swift's album under Warner Music Group
    ('DAMN.', 4, 1, '2017'),  -- Kendrick Lamar's album under Sony Music
    ('Thank U, Next', 5, 4, '2019'),  -- Ariana Grande's album under Republic Records
    ('Dangerous Woman', 5, 4, '2016'),  -- Ariana Grande's album under Republic Records
    ('Sweetener', 5, 4, '2018'),  -- Ariana Grande's album under Republic Records
    ('Positions', 5, 4, '2020');  -- Ariana Grande's album under Republic Records



SELECT albums.title, artists.name
	FROM albums, artists
  WHERE albums.artist_id = artists.id;


SELECT title, name
	FROM albums
  	 JOIN artists
    	ON albums.artist_id = artists.id;
