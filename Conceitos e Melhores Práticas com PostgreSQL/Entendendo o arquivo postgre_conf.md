#### O arquivo postgresql.conf[^'1']

Basicamente dentro desse arquivo, estão armazenadas todas as configurações relacionados ao servidor do ~~PostgreSQL~~. Diversos parâmetros podem ser atualizados e editados para uma melhor performance do servidor.

Alguns desses parâmetros só podem ser alterados com a reinicialização do banco de dados.

Podemos através da `view pg_settings` configurada dentro do banco de dados visualizar todas as configurações existentes no arquivo `postgresql.conf`

Utilizamos o seguinte comando para visualizar a `view` e termos o retorno das configurações.

```SELECT name, setting FROM pg_settings;```

Esse arquivo por *default* fica armazenado dentro do diretório de dados do cluster criado.

**Dentro do arquivo *postgresql.conf* existem diversos parâmetros importantes, entre eles:**

##### Configurações Internas:

- *LISTEN_ADDRESSES:*	Endereços TCP/IP das interfaces ou redes que o servidor PostgreSQL vai escutar ou liberar conexões.

- *PORT*: Porta TCP que o servidor PostgreSQL vai escutar. Por padrão a porta configurada é a **5432**. 

  > É uma prática de segurança recomendada alterar a porta padrão caso seu servidor esteja exposto a uma rede externa.

- *MAX_CONNECTIONS:* Número máximo de conexões simultâneas conectadas ao servidor PostgreSQL.

- *SUPER_USER_RESERVED_CONNECTIONS:* Número de conexões reservadas para conexões ao banco de dados através de super-usuários.

- *AUTHENTICATION_TIMEOUT*: Tempo máximo em segundos para o cliente conseguir uma conexão com o servidor PostgreSQL.

- *PASSWORD_ENCRYPTION:* Algoritmo de criptografia utilizado para senhas de novos usuários criados no banco de dados. É muito importante estudar qual algoritmo vai utilizar.

- *SSL:* Se o servidor PostgreSQL foi compilado e configurado com suporte SSL, esse parâmetro habilita a conexão criptografada por SSL.

##### Configurações de uso de memória:

- *SHARED_BUFFERS:* Tamanho de memória que é compartilhada do servidor PostgreSQL para cache de tabelas, índices e demais relacionamentos. 

  > É recomendado reservar 25% do valor total de sua memória RAM. Sempre manter um padrão que não use memória demais e nem que falte memória durante a aplicação.

- *WORK_MEM:* Tamanho de memória utilizado para operações de agrupamento e ordenação. `(ORDER BY, DISTINCT, MERGE JOINS)`

- *MAINTENANCE_WORK_MEM:* Tamanho de memória para executar operações administrativas como `VACUUM, INDEX, ALTER TABLE`

[^'1']: Texto elaborado a partir das aulas do Professor Daniel Costa no Santander Bootcamp | Full Stack Developer

