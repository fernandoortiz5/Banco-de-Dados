#### Hierarquia e Arquitetura do PostgreSQL

------

Basicamente é subdivido da seguinte maneira.

Um `cluster` é uma coleção de banco de dados que compartilham as mesmas configurações (todos os arquivos de configuração) do servidor ~~PostgreSQL~~ e do Sistema Operacional. Dessa maneira, é como se cada `cluster` fosse uma parte da instalação do servidor PostgreSQL.

Podemos ter mais de um `cluster` por computador, de tal forma que cada cluster pode escutar em uma porta para acesso e transmissão de dados, por exemplo.

Temos também as `databases`, que são conjunto de `schemas` com seus objetos e relações (tabelas, funções e views).

E por fim temos os `schemas` que são um conjunto de objetos e relações (tabelas, funções, views e etc)

> Schema e Database no MySQL são a mesma coisa, diferente do PostgreSQL que são objetos diferentes.



Referências:

[Daniel Costa]: https://web.digitalinnovation.one/track/santander-fullstack-developer	"Santander Bootcamp | Full Stack Developer"

