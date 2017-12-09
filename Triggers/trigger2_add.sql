PRAGMA foreign_keys = ON;

CREATE TRIGGER gatilho2
BEFORE INSERT ON Participa
FOR EACH ROW
WHEN NOT( EXISTS (SELECT * FROM Aula WHERE Aula.ID = New.OcorrenciaID) and
		  EXISTS (SELECT * FROM Prova, AulaModalidade WHERE
			AulaModalidade.AulaID = New.OcorrenciaID and
			((Prova.IDCliente = New.ClienteID
			and Prova.nomeMod = AulaModalidade.nomeMod
			and Prova.nivelMod >= AulaModalidade.nivelMod-1 and Prova.resultado = "APROVADO")
			or AulaModalidade.nivelMod = 1)))
BEGIN
	SELECT RAISE(ABORT, "cliente nao possui habilitacoes necessarias");
END;