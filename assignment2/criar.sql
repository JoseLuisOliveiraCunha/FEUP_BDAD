PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS Piscina;
DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Empregado;
DROP TABLE IF EXISTS Funcao;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS ItemUtilizacao;
DROP TABLE IF EXISTS ItemVenda;
DROP TABLE IF EXISTS Fornecedor;
DROP TABLE IF EXISTS Loja;
DROP TABLE IF EXISTS Ocorrencia;
DROP TABLE IF EXISTS Aula;
DROP TABLE IF EXISTS Modalidade;
DROP TABLE IF EXISTS Prova;
DROP TABLE IF EXISTS Atende;
DROP TABLE IF EXISTS Trabalha;
DROP TABLE IF EXISTS Possui;
DROP TABLE IF EXISTS Participa;
DROP TABLE IF EXISTS Leciona;
DROP TABLE IF EXISTS AulaModalidade;
DROP TABLE IF EXISTS TrabalhaLoja;
DROP TABLE IF EXISTS Vendido;
DROP TABLE IF EXISTS Utilizado;
DROP TABLE IF EXISTS Fornecido;
DROP TABLE IF EXISTS Desempenha;

PRAGMA foreign_keys = ON;

CREATE TABLE Piscina (
	ID INT PRIMARY KEY, 
	nome TEXT, 
	morada TEXT UNIQUE, 
	capacidade INT,
	CHECK(capacidade > 0 AND ID > 0));

CREATE TABLE Pessoa (
	ID INT PRIMARY KEY,
	CHECK(ID > 0));
	
CREATE TABLE Cliente (
	ID INT PRIMARY KEY, 
	nome TEXT, 
	mensalidade INT, 
	FOREIGN KEY(ID) REFERENCES Pessoa(ID),
	CHECK(mensalidade > 0));


CREATE TABLE Funcionario (
	ID INT PRIMARY KEY, 
	FOREIGN KEY(ID) REFERENCES Pessoa(ID));
	
CREATE TABLE Professor (
	ID INT PRIMARY KEY, 
	nome TEXT, 
	salario INT, 
	FOREIGN KEY(ID) REFERENCES Funcionario(ID),
	CHECK(salario > 0));

CREATE TABLE Empregado (
	ID INT PRIMARY KEY, 
	nome TEXT, 
	salario INT, 
	FOREIGN KEY(ID) REFERENCES Funcionario(ID),
	CHECK(salario > 0));

CREATE TABLE Funcao (
	nome TEXT PRIMARY KEY);

CREATE TABLE Item (
	numero_serie INT PRIMARY KEY, 
	nome TEXT, 
	custo INT,
	CHECK(custo > 0));

CREATE TABLE ItemUtilizacao (
	numero_serie INT PRIMARY KEY,  
	condicao INT, 
	FOREIGN KEY(numero_serie) REFERENCES Item(numero_serie),
	CHECK(condicao > 0 AND condicao < 6));

CREATE TABLE ItemVenda (
	numero_serie INT PRIMARY KEY, 
	preco INT, 
	FOREIGN KEY(numero_serie) REFERENCES Item(numero_serie),
	CHECK(preco > 0));

CREATE TABLE Fornecedor (
	contacto INT PRIMARY KEY,
	CHECK(contacto > 900000000 AND contacto < 1000000000));

CREATE TABLE Loja (
	nome TEXT PRIMARY KEY, 
	hora_abertura TEXT, 
	hora_fecho TEXT, 
	piscina INT, 
	FOREIGN KEY(piscina) REFERENCES Piscina(ID));

CREATE TABLE Ocorrencia (
	ID INT PRIMARY KEY, 
	hora_inicio TEXT, 
	hora_fim TEXT, 
	dia_semana TEXT); 

CREATE TABLE Aula (
	ID INT PRIMARY KEY, 
	FOREIGN KEY(ID) REFERENCES Ocorrencia(ID));

CREATE TABLE Modalidade (
	nome TEXT, 
	nivel INT, 
	PRIMARY KEY(nome,nivel));

CREATE TABLE Prova (
	IDCliente INT, 
	nomeMod TEXT, 
	nivelMod INT, 
	data TEXT, 
	resultado TEXT, 
	FOREIGN KEY(IDCliente) REFERENCES Cliente(ID), 
	FOREIGN KEY(nomeMod, nivelMod) REFERENCES Modalidade(nome, nivel), 
	PRIMARY KEY (IDCliente, nomeMod, nivelMod));

CREATE TABLE Atende (
	ClienteID INT, 
	PiscinaID INT, 
	FOREIGN KEY(PiscinaID) REFERENCES Piscina(ID), 
	FOREIGN KEY(ClienteID) REFERENCES Cliente(ID), 
	PRIMARY KEY (PiscinaID, ClienteID));

CREATE TABLE Trabalha (
	FuncionarioID INT PRIMARY KEY, 
	PiscinaID INT, 
	FOREIGN KEY(PiscinaID) REFERENCES Piscina(ID), 
	FOREIGN KEY(FuncionarioID) REFERENCES Funcionario(ID));

CREATE TABLE Possui (
	ItemNrSerie INT PRIMARY KEY, 
	PiscinaID INT, 
	FOREIGN KEY(PiscinaID) REFERENCES Piscina(ID), 
	FOREIGN KEY(ItemNrSerie) REFERENCES Item(numero_serie));

CREATE TABLE Participa (
	ClienteID INT, 
	OcorrenciaID INT, 
	FOREIGN KEY(ClienteID) REFERENCES Cliente(ID), 
	FOREIGN KEY(OcorrenciaID) REFERENCES Ocorrencia(ID), 
	PRIMARY KEY (ClienteID, OcorrenciaID));

CREATE TABLE Leciona (
	AulaID INT PRIMARY KEY, 
	ProfessorID INT, 
	FOREIGN KEY(AulaID) REFERENCES Aula(ID), 
	FOREIGN KEY(ProfessorID) REFERENCES Professor(ID));

CREATE TABLE AulaModalidade (
	AulaID INT PRIMARY KEY, 
	nomeMod TEXT, 
	nivelMod TEXT, 
	FOREIGN KEY(AulaID) REFERENCES Aula(ID), 
	FOREIGN KEY(nomeMod, nivelMod) REFERENCES Modalidade(nome, nivel)); 

CREATE TABLE TrabalhaLoja (
	EmpregadoID INT PRIMARY KEY, 
	LojaNome TEXT, 
	FOREIGN KEY(EmpregadoID) REFERENCES Empregado(ID), 
	FOREIGN KEY(LojaNome) REFERENCES Loja(nome));

CREATE TABLE Vendido (
	ItemVendaNrSerie INT PRIMARY KEY, 
	LojaNome TEXT, 
	FOREIGN KEY(ItemVendaNrSerie) REFERENCES ItemVenda(numero_serie), 
	FOREIGN KEY(LojaNome) REFERENCES Loja(nome));

CREATE TABLE Utilizado (
	ItemUtilizacaoNrSerie INT, 
	OcorrenciaID INT, 
	FOREIGN KEY(ItemUtilizacaoNrSerie) REFERENCES ItemUtilizacao(numero_serie), 
	FOREIGN KEY(OcorrenciaID) REFERENCES Ocorrencia(ID), 
	PRIMARY KEY(ItemUtilizacaoNrSerie, OcorrenciaID));

CREATE TABLE Fornecido (
	ItemNrSerie INT PRIMARY KEY, 
	FornecedorContacto INT, 
	FOREIGN KEY(ItemNrSerie) REFERENCES Item(numero_serie), 
	FOREIGN KEY(FornecedorContacto) REFERENCES Fornecedor(contacto));

CREATE TABLE Desempenha (
	EmpregadoID INT PRIMARY KEY, 
	FuncaoNome TEXT, 
	FOREIGN KEY(EmpregadoID) REFERENCES Empregado(ID), 
	FOREIGN KEY(FuncaoNome) REFERENCES Funcao(nome));


