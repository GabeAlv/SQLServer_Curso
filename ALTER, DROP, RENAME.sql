-- Gerenciamento de tabelas
-- ALTER, DROP, RENAME

-- ALTER TABLE NomeTabela 
-- ADD ou DROP ou ALTER + Objeto

-- Adicionamos uma nova coluna, usando os comando ALTER TABLE e logo em seguida o ADD
ALTER TABLE Livro
ADD Edi��o SMALLINT;

--Alterar o tipo de dado de uma coluna
ALTER TABLE Livro
ALTER COLUMN Edic�o TINYINT

-- Adicionar chave prim�ria
ALTER TABLE NomeTabela
ADD PRIMARY KEY (Coluna);

-- Excluir uma constraint de uma coluna
ALTER TABLE NomeTabela
DROP CONSTRAINT NomeDaConstraint

-- Excluir coluna
ALTER TABLE Livro
DROP COLUMN Edi��o

-- Excluir tabela: DROP TABLE
DROP TABLE NomeTabela;

-- Renomear tabela
-- sp_rename 'nome atual', 'novo nome';
sp_rename 'Tbl_Livros', 'Livro'

