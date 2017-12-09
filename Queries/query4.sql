.mode	columns
.headers	on
.nullvalue	NULL

SELECT Cliente.nome, Prova.nivelMod, Prova.data FROM Cliente, Prova WHERE Cliente.ID = Prova.IDCliente and Prova.resultado = "APROVADO" and Prova.nomeMod = "Costas";