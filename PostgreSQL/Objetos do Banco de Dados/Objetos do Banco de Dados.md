#### Objetos do Banco de Dados PostgreSQL

------

Alguns objetos do PostgreSQL são muito importantes para que possamos utilizá-los corretamente.

------

##### Database

É considerado o banco de dados em si. Ao acessar uma `database` nos deparamos com `schemas` e objetos, como `tables, views, types, functions`, entre outros. Cada `database` é separada uma da outra e compartilha apenas informações de usuários e configurações do servidor PostgreSQL, caso estejam fazendo parte de um mesmo cluster.

##### Schemas

É considerado um grupo de objetos, como `tables, views, types, functions`, entre outros. Através de `schemas` é possível relacionar diversos objetos entre si. Por exemplo, o `schema public` (criado por default) e um `schema` escola podem ter tabelas com o mesmo nome relacionados entre si.

##### Objetos

São basicamente as `tables, views, types, sequences` e outros objetos pertencentes ao `schema`.

------

Para manipularmos objetos dentro do PostgreSQL utilizamos alguns comandos. Entre eles:

```
CREATE DATABASE name
    [ [ WITH ] [ OWNER [=] user_name ]
           [ TEMPLATE [=] template ]
           [ ENCODING [=] encoding ]
           [ LOCALE [=] locale ]
           [ LC_COLLATE [=] lc_collate ]
           [ LC_CTYPE [=] lc_ctype ]
           [ TABLESPACE [=] tablespace_name ]
           [ ALLOW_CONNECTIONS [=] allowconn ]
           [ CONNECTION LIMIT [=] connlimit ]
           [ IS_TEMPLATE [=] istemplate ] ]
```

```
ALTER DATABASE name RENAME TO new_name
ALTER DATABASE name OWNER TO {new_owner, CURRENT_USER, SESSION_USER}
ALTER DATABASE name SET TABLESPACE new_tablespace
```

```
DROP DATABASE [name]
```

------

```
CREATE SCHEMA schema_name [AUTHORIZATION role_specification]
```

```
ALTER SCHEMA name RENAME TO new_name
ALTER SCHEMA name OWNER TO {new_owner, CURRENT_USER, SESSION_USER}
```

```
DROP SCHEMA [nome]
```

> Uma boa prática para se seguir é utilizar o comando `IF NOT EXISTS`

```
CREATE SCHEMA IF NOT EXISTS schema_name
DROP SCHEMA IF EXISTS
```



Referências:

[Daniel Costa]: https://web.digitalinnovation.one/track/santander-fullstack-developer	"Santander Bootcamp | Full Stack Developer"

