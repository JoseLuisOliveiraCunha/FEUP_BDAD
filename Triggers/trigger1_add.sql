PRAGMA foreign_keys = ON;

CREATE TRIGGER gatilho1
BEFORE INSERT ON Professor
FOR EACH ROW
WHEN NOT EXISTS (SELECT * FROM Pessoa WHERE ID = New.ID)
BEGIN
	INSERT INTO Pessoa VALUES (New.ID);
	INSERT INTO Funcionario VALUES (New.ID);
End;