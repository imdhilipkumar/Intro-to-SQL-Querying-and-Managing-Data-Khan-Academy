/* Create table about the people and what they do here */
-- 1. Create Tables

CREATE TABLE movie_stars (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    birth_year INTEGER,
    country TEXT
);

CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    release_year INTEGER
);

CREATE TABLE starred_in (
    star_id INTEGER,
    movie_id INTEGER,
    FOREIGN KEY (star_id) REFERENCES movie_stars(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

CREATE TABLE relationships (
    person1_id INTEGER,
    person2_id INTEGER,
    relationship TEXT, -- e.g., "married", "siblings"
    FOREIGN KEY (person1_id) REFERENCES movie_stars(id),
    FOREIGN KEY (person2_id) REFERENCES movie_stars(id)
);

-- 2. Insert Data

-- Movie Stars
INSERT INTO movie_stars (name, birth_year, country) VALUES 
("Leonardo DiCaprio", 1974, "USA"),
("Kate Winslet", 1975, "UK"),
("Tom Hanks", 1956, "USA"),
("Rita Wilson", 1956, "USA");

-- Movies
INSERT INTO movies (title, release_year) VALUES 
("Titanic", 1997),
("Catch Me If You Can", 2002),
("Forrest Gump", 1994),
("Sleepless in Seattle", 1993);

-- Starred In (Actor-Movie Relationship)
INSERT INTO starred_in (star_id, movie_id) VALUES
(1, 1), -- Leo in Titanic
(2, 1), -- Kate in Titanic
(1, 2), -- Leo in Catch Me If You Can
(3, 2), -- Tom in Catch Me If You Can
(3, 3), -- Tom in Forrest Gump
(3, 4), -- Tom in Sleepless in Seattle
(4, 4); -- Rita in Sleepless in Seattle

-- Relationships
INSERT INTO relationships (person1_id, person2_id, relationship) VALUES
(3, 4, "married");

-- 3. Sample Queries

-- Q1: What movies has Leonardo DiCaprio starred in?
SELECT ms.name, m.title, m.release_year
FROM movie_stars ms
JOIN starred_in si ON ms.id = si.star_id
JOIN movies m ON m.id = si.movie_id
WHERE ms.name = "Leonardo DiCaprio";

-- Q2: Which stars acted together in the same movie?
SELECT m.title, ms1.name AS actor1, ms2.name AS actor2
FROM starred_in si1
JOIN starred_in si2 ON si1.movie_id = si2.movie_id AND si1.star_id < si2.star_id
JOIN movie_stars ms1 ON si1.star_id = ms1.id
JOIN movie_stars ms2 ON si2.star_id = ms2.id
JOIN movies m ON si1.movie_id = m.id;

-- Q3: Which movie stars are married to each other?
SELECT ms1.name AS person1, ms2.name AS person2, r.relationship
FROM relationships r
JOIN movie_stars ms1 ON r.person1_id = ms1.id
JOIN movie_stars ms2 ON r.person2_id = ms2.id
WHERE r.relationship = "married";

