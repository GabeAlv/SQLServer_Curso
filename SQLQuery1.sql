-- Criando o banco de dados por completo:

CREATE DATABASE teste01 ON PRIMARY -- Comando para criar o banco de dados e colocando os arquivos de dados no filegroup primary
(
	NAME = teste01, -- Nome logico do arquivo de dados
	FILENAME = 'C:\SQL\teste01.mdf', -- Caminho fisico onde o arquivo .mdf vai ser salvo
	SIZE = 6MB, -- tamanho inicial do arquivo de dados
	MAXSIZE = 15MB, -- tamanho maximo do arquivo de dados
	FILEGROWTH = 10% -- crescimento automatico do arquivo: aumenta 10% quando o espaço acabar
) 
LOG ON -- Define as configuracoes do arquivo de dados
(
	NAME = teste01_log, -- Nome logico do arquivo de log do banco
	FILENAME = 'C:\SQL\teste01.ldf', -- caminho fisico do arquivo de log
	SIZE = 1MB, -- tamanho inicial do arquivo de log
	FILEGROWTH = 1MB -- Crescimento automatico do log: aumenta 1MB quando necessario
)
GO -- Executa o bloco de codigo acima

-- Consultar bancos existentes

SELECT name -- 
FROM master.sys.databases
ORDER BY name;

EXEC sp_databases;

-- Seleciona banco a usar
USE teste01;

 -- verificar informacoes adicionais sobre um banco especifico
EXEC sp_helpdb teste01;

-- Excluir banco de dados
DROP DATABASE teste02;

-- Excluir banco em uso
USE MASTER
GO
ALTER DATABASE teste01 SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE teste01;