#### DML e DDL

------

*Data Manipulation Language* ou DML (Linguagem de Manipulação de Dados) e se refere a todos os comandos que fazem a **manipulação** dos  dados em uma tabela. 

`INSERT, UPDATE, DELETE E SELECT`

> Vale dizer que algumas literaturas consideram que o comando `SELECT` como um *DQL, Data Query Language*.

*Data Definition Language* ou DDL (Linguagem de Definição de  Dados) e se refere a todos os comandos que modelam a tabela onde os  dados serão inseridos.

`CREATE, ALTER, DROP`

------

##### Exemplos DDL

```
CREATE DATABASE IF NOT EXISTS dadosbancarios;
ALTER DATABASE dadosbancarios OWNER TO diretoria;
DROP SCHEMA IF EXISTS bancos;

CREATE TABLE IF NOT EXISTS banco(
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR (50) NOT NULL,
    data_criacao TIMESTAMP NOT NULL DEFAULT NOW()
);

ALTER TABLE banco ADD COLUMN tem_poupanca BOOLEAN;
DROP TABLE IF EXISTS banco;
```

> Perceba que como o PK nunca pode ficar vazia, sempre deve ter um  valor, não precisamos declarar a condição NOT NULL nela, pois o PostgreSQL  já vai definir isso de forma padrão!      

##### Exemplos INSERT

```
INSERT INTO banco (codigo, nome, data_criacao)
VALUES (100, 'Banco do Brasil', now());

INSERT INTO banco (codigo, nome, data_criacao)
SELECT 100, 'Banco do Brasil, now();
```

##### Exemplos UPDATE

> ATENÇÃO: Muito cuidado com os *Updates*. Se você não colocar uma condição `WHERE`, a mudança ocorrerá em todas as linhas da tabela.

```
UPDATE banco SET
	codigo = 500
WHERE codigo = 100;

UPDATE banco SET
	data_criacao = now()
WHERE data_criacao IS NULL;
```

##### Exemplos DELETE

> ATENÇÃO: Assim como os *Updates*, a condição `WHERE` também é necessária.

```
DELETE FROM banco
WHERE codigo = 512;

DELETE FROM banco
WHERE nome = 'Conta Digital';
```

##### Exemplos SELECT

> Boas práticas: Evite sempre que puder o `SELECT *` (selecionar todos),  ele consome muita memória pois retorna todos os campos, o que nem sempre necessário

```
SELECT codigo, nome
FROM banco

SELECT codigo, nome
FROM banco
WHERE data_criacao > '2013-10-15 15:00:00';
```

##### Boas práticas

Os dois campos abaixo são uma boa prática utilizada no dia a dia do  desenvolvimento de bancos de dados. São dois campos que podem ser  criados em uma tabela para dizer se o objeto ao qual esse registro está  ligado está ativo ou inativo, e o segundo campo serve como guia para  sabermos a data de criação do dado.

```
ativo BOOLEAN NOT NULL DEFAULT TRUE,
data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
```

É uma boa prática também separar as tabelas de uma forma bem clara e  concisa. Um cliente por exemplo pode ter conta em vários bancos, ou até  mais de uma conta por banco. Dessa forma, o cliente pode e deve ser  colocado como uma tabela a parte. Dessa forma, depois basta relacionar  as tabelas de cliente com a de contas, por exemplo, ao invés de criar  uma única tabela com clientes e contas ligados em uma só. Você vai ter  mais tabelas no banco de dados, mas no dia a dia, para gerenciar  informações, alterar tabelas ou qualquer outra manutenção ou consulta  necessária, vai te facilitar muito mais se for feito de forma separada!

Referências:

[Daniel Costa]: https://web.digitalinnovation.one/track/santander-fullstack-developer	"Santander Bootcamp | Full Stack Developer"

