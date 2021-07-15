#### O arquivo pg_hba.conf

------

Esse arquivo é responsável por manter o controle de autenticação dos usuários que terão acesso ao servidor PostgreSQL. Basicamente, através desse arquivo podemos definir que usuários terão acesso e no que os mesmo terão. Com isso, podemos ter diversos usuários, mas cada um com políticas de acessos diferentes.

Para isso, existem alguns tipos de autenticação que os usuários poderão ter:

- *TRUST:* Método de autenticação onde não existe a requisição de uma senha.
- *REJECT:* Método que rejeita todas as conexões.
- *MD5:* Utiliza o algoritmo de criptografia MD5.
- *PASSWORD:* Método que utiliza uma senha sem criptografia.
- *GSS:* Generic Security Server Application Program Interface. Método de autenticação automática.



Referências:

[Daniel Costa]: https://web.digitalinnovation.one/track/santander-fullstack-developer	"Santander Bootcamp | Full Stack Developer"

