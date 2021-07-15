#### Tabelas e Colunas

------

Nos modelos de [bases de dados relacionais](https://pt.wikipedia.org/wiki/Banco_de_dados_relacional), a **tabela** é um conjunto de dados dispostos em número infinito de colunas e número ilimitado de linhas (ou tuplas).

As colunas são tipicamente consideradas os *campos* da  tabela, e caracterizam os tipos de dados que deverão constar na tabela  (numéricos, alfa-numéricos, datas, coordenadas, etc). O número de linhas pode ser interpretado como o número de combinações de valores dos  campos da tabela, e pode conter linhas idênticas, dependendo do objetivo. A forma de referenciar inequivocamente uma única linha é  através da utilização de uma [chave primária](https://pt.wikipedia.org/wiki/Chave_primária).

###### TB_PRODUTO

| CODIGO | NOME                         | MARCA     | TAMANHO | COR   |
| ------ | :--------------------------- | --------- | ------- | ----- |
| SKUH12 | CAMISETA MASC. POLO          | HERING    | G       | PRETA |
| SKUH13 | CAMISETA MASC. BASICA GOLA V | POLO WEAR | M       | AZUL  |

------

##### Chave Primária (PK)

Conhecidas também com *primary key* ou PK, essas chaves são um conjunto de 1 ou mais campos que nunca se repetem em uma tabela. Por não se repetirem, sua função é manter a integridade dos dados e também servem para referenciar outras tabelas através dos relacionamentos. A seguir algumas de suas características.

* Não podem haver duas ocorrências uma tabela com o mesmo conteúdo da PK.
* Não podem ser atributos opcionais, ou seja, que aceite valores nulo.
* Não podem conter informações voláteis.

##### Chave Estrangeira (FK)

Conhecidas também como *foreign key* ou FK, essas chaves contém campos que são referências de chaves primárias de outras tabelas ou da mesma tabela. Sua principal função é garantir a integridade referencial de outras tabelas.

##### Tipos de Dados

O PostgreSQL trabalha com diversos tipos de dados, entre eles, numéricos, monetários, texto, etc.

Os links redirecionam diretamente para a documentação oficial, onde tem todos os detalhes.

* [Tipos de Dados](https://www.postgresql.org/docs/13/datatype.html)



Referências:

[Daniel Costa]: https://web.digitalinnovation.one/track/santander-fullstack-developer	"Santander Bootcamp | Full Stack Developer"

