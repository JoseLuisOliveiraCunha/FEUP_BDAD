.mode	columns
.headers	on
.nullvalue	NULL

SELECT Cliente.nome, MAX(cont) as Maximo FROM Cliente,(SELECT ClienteID as cID, COUNT(OcorrenciaID) as cont FROM Participa GROUP BY ClienteID) WHERE cID = Cliente.ID;