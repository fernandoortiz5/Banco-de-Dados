#### Administrando usuários e permissões no PostgreSQL

------

Aqui temos o intuito de abordar alguns conceitos relacionais com o gerenciamento de usuários e permissões de acesso do PostgreSQL.

> Nas versões **superiores** do PostgreSQL 8.1 o conceito de `users, roles e groups` são o mesmo conceito, possuem o mesmo efeito e a mesma função.

Quando definimos uma role com privilégio de administrador, estamos concedendo permissão total a ela, para edição geral de todas as tabelas. Baseada nessa role, podemos criar algumas roles específicas para cada tipo de atividade que envolva a sua aplicação.

Uma role, pode conter outras roles associadas a ela.

------

Utilizamos o comando `CREATE ROLE name [[WITH] option [...]].`

```
SUPERUSER, NOSUPERUSER,
CREATEDB, NOCREATEDB,
CREATEROLE, NOCREATEROLE,
INHERIT, NOINHERIT,
LOGIN, NOLOGIN,
REPLICATION, NOREPLICATION,
BYPASSRLS, NOBYPASSRLS,
CONNECTION LIMIT connlimit,
[ENCRYPTED] PASSWORD 'password', PASSWORD NULL,
VALID UNTIL 'timestamp',
IN ROLE role_name [, ...], (deprecated)
IN GROUP role_name [, ...], (deprecated)
ROLE role_name [, ...],
ADMIN role_name [, ...],
USER role_name [, ...], (deprecated)
SYSID uid (deprecated)
```

Vamos usar o seguinte exemplo. Iremos criar três roles e em seguida associar a suas devidas permissões.

```
CREATE ROLE administradores CREATEDB CREATEROLE INHERIT NOLOGIN REPLICATION BYPASSRLS
CONNECTION LIMIT -1;

CREATE ROLE professores NOCREATEDB NOCREATEROLE INHERIT NOLOGIN NOBYPASSRLS 
CONNECTION LIMIT 10;

CREATE ROLE alunos NOCREATEDB NOCREATEROLE INHERIT NOLOGIN NOBYPASSRLS
CONNECTION LIMIT 90;
```

Para que uma role assuma permissões (herde) de outra role, é necessário que a opção `INHERIT`, caso contrário ela não vai poder acessar nenhuma role superior.

Quando passamos o parâmetro `IN ROLE` estamos dizendo que essa role passa pertencer a role informada, e o parâmetro `ROLE` dizemos que a role informada passa a pertencer a nova role.

Seguindo em nosso exemplo, vamos criar uma role chamada fernando e dizer que essa role passa a herdar permissões de professores.

`CREATE ROLE fernando LOGIN CONNECTION LIMIT 1 PASSWORD '123' IN ROLE professores;`

Nesse exemplo, além de associar a role fernando a role professores, nós estamos que apenas uma pessoa por vez poderá se conectar com o usuário fernando (tudo isso graças ao `LOGIN CONNECTION LIMIT 1`)

Poderá acontecer casos em que você crie uma role e esqueça de associar em alguma role existente, ou até mesmo que queira fazer isso futuramente. Para isso, podemos utilizar o seguinte comando:

`GRANT professores TO fernando;`

Pode ainda ocorrer do fernando não ser mais um professor, ou não fazer mais parte do quadro de professores. Para isso não faria mais sentido deixar ele ainda com essa associação. Para isso podemos utilizar o seguinte comando para desassociá-lo. 

`REVOKE professores FROM fernando;`

Podemos ainda alterar uma role criada. É uma maneira bastante parecida com a criação. Utilizamos então o seguinte comando.

`ALTER ROLE fernando CREATEDB;`

Nesse caso, agora o usuário fernando teria permissões para criar novos bancos de dados, graças ao parâmetro `CREATEDB`.

Por fim, podemos também excluir. É uma maneira muito simples. Imagine que agora o Fernando não faça mais parte do quadro de funcionários da escola.

`DROP ROLE fernando;`

------

##### Administrando acessos com GRANT e REVOKE

GRANT e REVOKE são comandos utilizados para acesso e remoção de privilégios aos objetos do banco de dados. Dentre esses objetos estão: 

```
tabela, coluna, sequence, database, domain, foreign data wrapper, foreign server, function, language, large object, schema, tablespace, type
```

A seguir exemplos retirados da documentação do PostgreSQL de como utilizar os comandos GRANT para alguns objetos do banco de dados.

##### Database

```
GRANT {{CREATE, CONNECT, TEMPORARY, TEMP}[,...] ALL [PRIVILEGES]}
ON DATABASE database_name[,...]
TO role_specification[,...] [WITH GRANT OPTION]
```

##### Schema

```
GRANT {{CREATE, USAGE}[,...] ALL [PRIVILEGES]}
ON SCHEMA schema_name[,...]
TO role_specification[,...] [WITH GRANT OPTION]
```

##### Table

```
GRANT {{SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES,TRIGGER}[,...] ALL [PRIVILEGES]}
ON TABLE table_name[,...], ALL TABLES IN SCHEMA schema_name[,...]
TO role_specification[,...] [WITH GRANT OPTION]
```

Da mesma forma, o comando `REVOKE` retira as permissões de uma Role

##### Database

```
REVOKE [GRANT OPTION FOR]
{{CREATE, CONNECT, TEMPORARY, TEMP}[,...] ALL [PRIVILEGES]}
ON DATABASE database_name[,...]
FROM {[GROUP] role_name, PUBLIC}[,...]
[CASCADE, RESTRICT]
```

##### Schema

```
REVOKE [GRANT OPTION FOR]
{{CREATE, USAGE}[,...] ALL [PRIVILEGES]}
ON SCHEMA schema_name[,...]
FROM {[GROUP] role_name, PUBLIC}[,...]
[CASCADE, RESTRICT]
```

##### Table

```
REVOKE [GRANT OPTION FOR]
{{SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES,TRIGGER}[,...] ALL [PRIVILEGES]}
ON TABLE table_name[,...], ALL TABLES IN SCHEMA schema_name[,...]
FROM {[GROUP] role_name, PUBLIC}[,...]
[CASCADE, RESTRICT]
```

De forma simplificada, podemos por exemplo fazer:

```
REVOKE ALL ON ALL TABLES IN SCHEMA db-escola FROM fernando;
REVOKE ALL ON SCHEMA db-escola FROM fernando;
REVOKE ALL ON DATABASE db-escola FROM fernando;
```

Algumas vezes você não pode excluir uma Role porque ela possui várias permissões e o `database` ficar dependente dela. Ao executar os três  comandos acima e retirar todas as permissões da role, você deve ser  capaz de excluí-la com o comando `DROP ROLE` que já abordamos anteriormente!

Referências:

[Daniel Costa]: https://web.digitalinnovation.one/track/santander-fullstack-developer	"Santander Bootcamp | Full Stack Developer"

