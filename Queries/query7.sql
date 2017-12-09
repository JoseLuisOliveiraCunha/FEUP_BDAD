.mode	columns
.headers	on
.nullvalue	NULL

SELECT FornecedorContacto, COUNT(ItemNrSerie) FROM Fornecido GROUP BY FornecedorContacto;