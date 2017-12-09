.mode	columns
.headers	on
.nullvalue	NULL

SELECT Cliente.ID, Cliente.nome 
FROM Cliente, Participa, Utilizado, ItemUtilizacao
WHERE Cliente.ID = Participa.ClienteID 
	and Participa.OcorrenciaID = Utilizado.OcorrenciaID
	and Utilizado.ItemUtilizacaoNrSerie = ItemUtilizacao.numero_serie
	and ItemUtilizacao.condicao <= 2;
	
	
