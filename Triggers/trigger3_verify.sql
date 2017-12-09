PRAGMA foreign_keys = ON;

.mode	columns
.headers	on

SELECT * FROM Cliente WHERE Cliente.ID = 1;
SELECT * FROM Participa WHERE Participa.ClienteID = 1;
INSERT INTO Participa VALUES (1, 4);
SELECT * FROM Cliente WHERE Cliente.ID = 1;
SELECT * FROM Participa WHERE Participa.ClienteID = 1;

/*o delete e update são feitos para repor o estado da base de dados antes do teste do gatilho*/
DELETE FROM Participa WHERE Participa.ClienteID = 1 and Participa.OcorrenciaID = 4;
UPDATE Cliente
	SET mensalidade = mensalidade - 10
	WHERE ID = 1;