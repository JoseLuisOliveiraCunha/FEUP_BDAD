.mode	columns
.headers	on
.nullvalue	NULL

CREATE TABLE ContagemAprovados AS
SELECT Piscina.nome as Name, COUNT(Prova.resultado) as Contagem 
FROM Piscina, Prova, Atende 
WHERE Prova.IDCliente = Atende.ClienteID and Piscina.ID = Atende.PiscinaID and Prova.resultado = "APROVADO" 
GROUP BY Piscina.nome;

SELECT ContagemAprovados.Name, ContagemAprovados.Contagem
FROM ContagemAprovados, (SELECT MAX(ContagemAprovados.Contagem) as Maximo FROM ContagemAprovados)
WHERE ContagemAprovados.Contagem = Maximo;

DROP TABLE IF EXISTS ContagemAprovados;