-- Database: ProjectBanco
-- Author: @FernandoOrtiz
CREATE DATABASE projectbanco
	WITH OWNER = postgres
		ENCODING = 'UTF8'
		TABLESPACE = pg_default
		LC_COLLATE = 'undefined'
		LC_CTYPE = 'undefined'
		CONNECTION LIMIT = -1;

COMMENT ON DATABASE projectbanco
	IS 'Projeto de Estudo sobre Banco de Dados PostgreSQL.
- Modelagem de um sistema bancário com transações de clientes.
- Apenas para fins didáticos.';