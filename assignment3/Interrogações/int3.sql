.mode	columns
.headers	on
.nullvalue	NULL

SELECT name, ItemName, MAX(price) 
FROM (SELECT Piscina.nome AS name, Item.nome AS ItemName, ItemVenda.preco AS price 
	  FROM ItemVenda, Piscina, Possui, Item
	  WHERE Item.numero_serie = ItemVenda.numero_serie and Possui.ItemNrSerie = ItemVenda.numero_serie and Piscina.ID = Possui.PiscinaID ) 
GROUP BY name;
