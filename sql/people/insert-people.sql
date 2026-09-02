/* 26 people, not 30: Lucas, Cameron, Angelopoulos and Kieslowski each directed AND wrote,
   so they appear once here instead of once per role table. */

/* ids 1-10: the directors */
INSERT INTO people (id, first_name, last_name, date_of_birth, nationality, email) VALUES
(1, 'Stanley', 'Kubrick', NULL, 'USA', NULL),
(2, 'George', 'Lucas', NULL, 'USA', 'george@email.com'),
(3, 'Robert', 'Mulligan', NULL, 'USA', NULL),
(4, 'James', 'Cameron', NULL, 'Canada', 'james@cameron.com'),
(5, 'David', 'Lean', NULL, 'UK', NULL),
(6, 'Anthony', 'Mann', NULL, 'USA', NULL),
(7, 'Theodoros', 'Angelopoulos', NULL, 'Greece', 'theo@angelopoulos.com'),
(8, 'Paul', 'Verhoeven', NULL, 'Netherlands', NULL),
(9, 'Krzysztof', 'Kieslowski', NULL, 'Poland', 'email@email.com'),
(10, 'Jean-Paul', 'Rappeneau', NULL, 'France', NULL);

/* ids 11-20: the stars */
INSERT INTO people (id, first_name, last_name, date_of_birth, nationality, email) VALUES
(11, 'Keir', 'Dullea', '1936-05-30', NULL, NULL),
(12, 'Mark', 'Hamill', '1951-09-25', NULL, NULL),
(13, 'Gregory', 'Peck', '1916-04-05', NULL, NULL),
(14, 'Leonardo', 'DiCaprio', '1974-11-11', NULL, NULL),
(15, 'Julie', 'Christie', '1940-04-14', NULL, NULL),
(16, 'Charlton', 'Heston', '1923-10-04', NULL, NULL),
(17, 'Manos', 'Katrakis', '1908-08-14', NULL, NULL),
(18, 'Rutger', 'Hauer', '1944-01-23', NULL, NULL),
(19, 'Juliette', 'Binoche', '1964-03-09', NULL, NULL),
(20, 'Gerard', 'Depardieu', '1948-12-27', NULL, NULL);

/* ids 21-26: the writers who are not already in the list above */
INSERT INTO people (id, first_name, last_name, date_of_birth, nationality, email) VALUES
(21, 'Arthur C', 'Clarke', NULL, NULL, 'arthur@clarke.com'),
(22, 'Harper', 'Lee', NULL, NULL, 'harper@lee.com'),
(23, 'Boris', 'Pasternak', NULL, NULL, 'boris@boris.com'),
(24, 'Frederick', 'Frank', NULL, NULL, 'fred@frank.com'),
(25, 'Erik', 'Hazelhoff Roelfzema', NULL, NULL, 'erik@roelfzema.com'),
(26, 'Edmond', 'Rostand', NULL, NULL, 'edmond@rostand.com');
