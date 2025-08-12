CREATE DATABASE Biblioteca; --Criando o banco de dados

--Primeiro criar tabelas que não há chaves estrangeiras

CREATE TABLE Autor ( --Criando a tabela Autor
	IdAutor SMALLINT IDENTITY, 
	NomeAutor VARCHAR(50) NOT NULL,
	SobrenomeAutor VARCHAR(60) NOT NULL,
	CONSTRAINT pk_id_autor PRIMARY KEY(IdAutor)
	);

CREATE TABLE Editora ( --Criando a tabela Editora
	IdEditora SMALLINT PRIMARY KEY IDENTITY,
	NomeEditora VARCHAR(50) NOT NULL
	);

CREATE TABLE Assunto( --Criando a tabela Assunto
	IdAssunto TINYINT PRIMARY KEY IDENTITY,
	NomeAssunto VARCHAR(25) NOT NULL
	);

CREATE TABLE Livro( --Criando a tabela Livro
	IdLivro SMALLINT PRIMARY KEY IDENTITY(100,1),
	NomeLivro VARCHAR(70) NOT NULL,
	ISBN13 CHAR(13) UNIQUE NOT NULL,
	DataPub DATE,
	PreçoLivro MONEY NOT NULL,
	NumeroPaginas SMALLINT NOT NULL,
	IdEditora SMALLINT NOT NULL,
	IdAssunto TINYINT NOT NULL,
	CONSTRAINT fk_id_editora FOREIGN KEY(IdEditora) -- Definindo a chave estrangeira
	  REFERENCES Editora(IdEditora) ON DELETE CASCADE, -- Fazendo referencia a tabela editora e a coluna IdEditora, se excluir uma editora os livros dela tambem são excluidos
	CONSTRAINT fk_id_assunto FOREIGN KEY(IdAssunto)
	  REFERENCES Assunto(IdAssunto) ON DELETE CASCADE,
	CONSTRAINT verifica_preco CHECK(PreçoLivro >=0)
	);

CREATE TABLE LivroAutor(
	IdLivro SMALLINT NOT NULL,
	IdAutor SMALLINT NOT NULL,
	CONSTRAINT fk_id_autor FOREIGN KEY(IdAutor) REFERENCES Autor(IdAutor),
	CONSTRAINT fk_id_livro FOREIGN KEY(IdLivro) REFERENCES Livro(IdLivro),
	CONSTRAINT pk_livro_autor PRIMARY KEY(IdLivro, IdAutor)
	);


SELECT name FROM Biblioteca.sys.tables; --Verifica os nomes das tabelas do banco de dados

-- Verificar se uma tabela foi criada, além de outras informações

sp_help Autor;

