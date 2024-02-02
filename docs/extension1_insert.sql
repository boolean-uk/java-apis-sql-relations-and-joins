INSERT INTO People(name, dob, country, email, role)
VALUES
	('Stanley Kubrick', '', 'USA', '', 'director'),
  ('George Lucas', '', 'USA', '', 'director'),
  ('Robert Mulligan', '', 'USA', '', 'director'),
  ('James Cameron', '', 'Canada', '', 'director'),
  ('David Lean', '', 'UK', '', 'director'),
  ('Anthony Mann', '', 'USA', '', 'director'),
  ('Theodoros Angelopoulos', '', 'Greece', '', 'director'),
  ('Paul Verhoeven', '', 'Netherlands', '', 'director'),
  ('Krzysztof Kieslowski', '', 'Poland', '', 'director'),
  ('Jean-Paul Rappeneau', '', 'France', '', 'director'),

  ('Keir Dullea', '30/05/1936', '', '', 'star'),
  ('Mark Hamill', '25/09/1951', '', '', 'star'),
  ('Gregory Peck', '05/04/1916', '', '', 'star'),
  ('Leonardo DiCaprio', '11/11/1974', '', '', 'star'),
  ('Julie Christie', '14/04/1940', '', '', 'star'),
  ('Charlton Heston', '04/10/1923', '', '', 'star'),
  ('Manos Katrakis', '14/08/1908', '', '', 'star'),
  ('Rutger Hauer', '23/01/1944', '', '', 'star'),
  ('Juliette Binoche', '09/03/1964', '', '', 'star'),
  ('Gerard Depardieu', '27/12/1948', '', '', 'star'),

  ('Arthur C Clarke', '', '', 'arthur@clarke.com', 'writer'),
  ('George Lucas', '', '', 'george@email.com', 'writer'),
  ('Harper Lee', '', '', 'harper@lee.com', 'writer'),
  ('James Cameron', '', '', 'james@cameron.com', 'writer'),
  ('Boris Pasternak', '', '', 'boris@boris.com', 'writer'),
  ('Frederick Frank', '', '', 'fred@frank.com', 'writer'),
  ('Theodoros Angelopoulos', '', '', 'theo@angelopoulos.com', 'writer'),
  ('Erik Hazelhoff Roelfzema', '', '', 'erik@roelfzema.com', 'writer'),
  ('Krzysztof Kieslowski', '', '', 'email@email.com', 'writer'),
  ('Edmond Rostand', '', '', 'edmond@rostand.com', 'writer')
;


  INSERT INTO Film(title, year, genre, score, people_id)
  VALUES
  ('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1),
  ('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2),
  ('To Kill A Mockingbird', 1962, 'Drama', 10, 3),
  ('Titanic', 1997, 'Romance', 5, 4),
  ('Dr Zhivago', 1965, 'Historical', 8, 5),
  ('El Cid', 1961, 'Historical', 6, 6),
  ('Voyage to Cythera', 1984, 'Drama', 8, 7),
  ('Soldier of Orange', 1977, 'Thriller', 8, 8),
  ('Three Colours: Blue', 1993, 'Drama', 8, 9),
  ('Cyrano de Bergerac', 1990, 'Historical', 9, 10)
;