List movies directed by 'XXXX'.

sql
Copy code
SELECT Title
FROM MOVIES
WHERE Director = 'XXXX';
b) Movies with actors in two or more films.

sql
Copy code
SELECT Title
FROM MOVIES
WHERE Actor_id IN (
    SELECT Actor_id
    FROM MOVIES
    GROUP BY Actor_id
    HAVING COUNT(*) > 1
);
c) Actors in movies before 2010 and after 2015.

sql
Copy code
SELECT DISTINCT a.Name
FROM ACTORS a
JOIN MOVIES m1 ON a.Actor_id = m1.Actor_id
JOIN MOVIES m2 ON a.Actor_id = m2.Actor_id
WHERE m1.Year < 2010 AND m2.Year > 2015;
d) Create a view of movies with actor and director.

sql
Copy code
CREATE VIEW Movies_Actor_Director AS
SELECT m.Title, a.Name AS Actor, d.Name AS Director
FROM MOVIES m
JOIN ACTORS a ON m.Actor_id = a.Actor_id
JOIN DIRECTORS d ON m.Director_id = d.Director_id;
