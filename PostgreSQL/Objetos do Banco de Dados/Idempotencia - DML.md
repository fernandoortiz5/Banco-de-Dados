#### Idempotência - Conhecendo DML e Truncate

------

> Em matemática e ciência da computação, a **idempotência** é a propriedade que algumas operações têm de poderem ser aplicadas  várias vezes sem que o valor do resultado se altere após a aplicação  inicial. — Wikipedia

Vamos começar com um exemplo. Na criação de tabelas, se colocarmos o comando I`F NOT EXISTS` ou `IF EXISTS`, evitaremos diversos erros apenas adicionando a propriedade de idempotência através deles.

------

##### Boas práticas em DDL

É muito importante as tabelas possuírem campos que realmente serão utilizados ao longo da aplicação e que sirvam de atributos diretos a um objeto em comum.

- Criar ou acrescentar colunas que são *atributos básicos* do objeto e que seja realmente comum a todos os objetos pertinente a tabela.

- Cuidado com as *constraints*.

- Cuidado com o excesso de FK.

- Cuidado com o tamanho excessivo de colunas.

  ------

  ##### DML - Mais conhecido como CRUD

  ###### Estrutura SELECT:

  ```
  SELECT (campos,)
  FROM tabela
  [condições]
  ```

  **Exemplos**:

  ```
  SELECT numero, nome FROM banco;
  SELECT numero, nome FROM banco WHERE ativo IS TRUE;
  SELECT nome FROM banco WHERE email LIKE '%gmail.com';
  
  SELECT numero FROM agencia
  WHERE banco_numero IN (SELECT numero FROM banco WHERE nome ILIKE '%bradesco%')
  ```

  - `IS TRUE`: retorna se o campo ativo for verdadeiro.
  - `LIKE %`: Vai pesquisar toda a coluna, substituindo o sinal % por qualquer caractere.
  - `ILIKE %`: Igual ao `like`, mas diferencia maiúsculas e minúsculas.
  - `IN ()`: Faz um "`select` dentro de um `select`". As vezes pode ser feito,  mas se possível deve ser evitado, pois **consome recursos de forma não eficiente**.

  ###### Condições no SELECT:

  O `WHERE` é uma espécie de "estrutura condicional" do banco de dados, onde o `SELECT` só vai nos retornar o campo caso ele atenda a condição. Para  isso, podemos utilizar operadores condicionais, assim como em linguagens de programação.

  https://www.postgresql.org/docs/13/functions.html

  ##### SELECT com Idempotência

  ```
  SELECT (campos,)
  FROM tabela1
  WHERE EXISTIS(
      SELECT (campo,)
      FROM tabela2
      WHERE campo1 = valor1
      [AND/OR campoN = valorN]
  );
  ```

###### Evitar SELECT *

Muitas vezes precisamos de um único campo da tabela, mas damos o  comando SELECT * pela conveniência. Acontece que ao solicitarmos ao  retorno de todos os campos, pedimos mais dados, o que consome tráfego da rede de internet, da rede do servidor, da memória, etc...

Ao utilizar isso em testes ou durante o aprendizado podemos não notar o quanto isso pode ser nocivo. Mas se temos um site com vários acessos, esse consumo de memória pode travar ele, derrubar ele. Ou então esse  excesso de dados que o SELECT trás deixa o site mais lento, o que te  penaliza nas pesquisas do Google, e consequentemente no retorno das  visualizações do seu site. E muitos outros problemas, que um detalhe  pode acabar causando.

###### INSERT

```
INSERT INTO agencia(banco_numero,numero,nome) VALUES (341,1,'Centro da cidade');
```

###### INSERT com Idempotência

```
INSERT INTO agencia(banco_numero,numero,nome) VALUES (341,1,'Centro da cidade')
ON CONFLICT (banco_numero, numero) DO NOTHING;
```

**O comando `ON CONFLICT` serve para dizer que, se já houver esses dados  na tabela, o computador não precisa fazer nada, evitando assim o retorno de um erro.**

###### UPDATE

```
UPDATE (tabela) SET campo1 = novo_valor WHERE (condição);
```

###### DELETE

Também lembrar sempre de adicionar uma condição para não deletar a tabela toda.

------

##### TRUNCATE

O TRUNCATE esvazia toda a tabela

```
TRUNCATE [TABLE][ONLY] name [*][,...]
    [RESTART IDENTITY, CONTINUE IDENTITY] [CASCADE, RESTRICT]
```

- `RESTART IDENTITY`: Você reinicia a contagem de um número serial, com auto incremento. Assim as ids antigas serão reutilizadas
- `CONTINUE IDENTITY`: Essa é a opção padrão, que continua de onde os  dados anteriores pararam, mesmo que você os tenha excluído. Assim as ids antigas não serão reutilizadas
- `CASCADE`: Vai apagar toda a tabela, apagando também as referências em  outras tabelas. Por exemplo: Se você apagar um cliente que tenha ligação a pedidos que estão em outra tabela, ele também vai apagar esses  pedidos
- `RESTRICT`: Apaga apenas o que está na tabela, sem afetar as demais. Se você apagar um cliente que tenha ligação a pedidos que estão em outra  tabela, ele não vai apagar esses pedidos



Referências:

[Daniel Costa]: https://web.digitalinnovation.one/track/santander-fullstack-developer	"Santander Bootcamp | Full Stack Developer"

