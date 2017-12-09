PRAGMA foreign_keys = ON;

CREATE TRIGGER gatilho3
AFTER INSERT ON Participa
FOR EACH ROW
BEGIN
	UPDATE Cliente
	SET mensalidade = mensalidade + 10
	WHERE ID = New.ClienteID;
END;

