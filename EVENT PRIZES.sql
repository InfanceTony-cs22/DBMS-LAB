Event and Prizes
a) Primary and foreign keys.

sql
Copy code
ALTER TABLE Prizes ADD CONSTRAINT PK_Prizes PRIMARY KEY (prizeid);
ALTER TABLE Winners ADD CONSTRAINT FK_Winners_Prizes FOREIGN KEY (prizeid) REFERENCES Prizes (prizeid);
ALTER TABLE Winners ADD CONSTRAINT FK_Winners_Participant FOREIGN KEY (playerid) REFERENCES Participant (playerid);
b) Player ID with at least one digit.

sql
Copy code
ALTER TABLE Participant ADD CONSTRAINT CHK_PlayerID CHECK (REGEXP_LIKE(playerid, '.*\d+.*'));
c) Events with only female prize winners.

sql
Copy code
SELECT DISTINCT e.name
FROM Event e
WHERE NOT EXISTS (
    SELECT 1 FROM Participant p
    JOIN Winners w ON p.playerid = w.playerid
    WHERE w.eventid = e.eventid AND p.gender != 'F'
);
d) View of movies with actors and directors.

sql
Copy code
CREATE VIEW Movies_Actors_Directors AS
SELECT m.Title, a.Name AS Actor, d.Name AS Director
FROM MOVIES m
JOIN ACTORS a ON m.Actor_id = a.Actor_id
JOIN DIRECTORS d ON m.Director_id = d.Director_id;
e) Trigger to create 3 prizes.

sql
Copy code
CREATE OR REPLACE TRIGGER Create_Prizes
AFTER INSERT ON Event
FOR EACH ROW
BEGIN
    INSERT INTO Prizes (prizeid, eventid, rank) VALUES (seq_prizes.NEXTVAL, :NEW.eventid, 1);
    INSERT INTO Prizes (prizeid, eventid, rank) VALUES (seq_prizes.NEXTVAL, :NEW.eventid, 2);
    INSERT INTO Prizes (prizeid, eventid, rank) VALUES (seq_prizes.NEXTVAL, :NEW.eventid, 3);
END;
