PRAGMA foreign_keys = ON;

.mode	columns
.headers	on

SELECT "BEFORE INSERT";
SELECT * FROM Pessoa WHERE Pessoa.ID = 600;
SELECT * FROM Funcionario WHERE Funcionario.ID = 600;
SELECT * FROM Professor WHERE Professor.ID = 600;
INSERT INTO Professor VALUES (600, 'Nome Teste', 1000);
SELECT "AFTER INSERT";
SELECT * FROM Pessoa WHERE Pessoa.ID = 600;
SELECT * FROM Funcionario WHERE Funcionario.ID = 600;
SELECT * FROM Professor WHERE Professor.ID = 600;

/*os deletes são feitos para repor o estado da base de dados antes do teste do gatilho*/
DELETE FROM Professor WHERE Professor.ID = 600;
DELETE FROM Funcionario WHERE Funcionario.ID = 600;
DELETE FROM Pessoa WHERE Pessoa.ID = 600;
