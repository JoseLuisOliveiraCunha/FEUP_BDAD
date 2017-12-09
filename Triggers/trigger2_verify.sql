PRAGMA foreign_keys = ON;
.mode	columns
.headers	on

SELECT * FROM Participa WHERE Participa.ClienteID = 34;
INSERT INTO Participa VALUES (34, 12);
SELECT * FROM Participa WHERE Participa.ClienteID = 34;

/*caso que lanca erro e nao introduz na base de dados*/
SELECT * FROM Participa WHERE Participa.ClienteID = 47;
INSERT INTO Participa VALUES (47, 7); 
SELECT * FROM Participa WHERE Participa.ClienteID = 47;

SELECT * FROM Participa WHERE Participa.ClienteID = 87;
INSERT INTO Participa VALUES (87, 13);
SELECT * FROM Participa WHERE Participa.ClienteID = 87;

/*os deletes são feitos para repor o estado da base de dados antes do teste do gatilho*/
DELETE FROM Participa WHERE Participa.ClienteID = 34 and Participa.OcorrenciaID = 12;
DELETE FROM Participa WHERE Participa.ClienteID = 87 and Participa.OcorrenciaID = 13;
