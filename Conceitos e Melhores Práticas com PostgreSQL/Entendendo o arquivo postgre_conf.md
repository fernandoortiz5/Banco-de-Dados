##### O arquivo postgresql.conf

Basicamente dentro desse arquivo, estão armazenadas todas as configurações relacionados ao servidor do PostgreSQL. Diversos parâmetros podem ser atualizados e editados para uma melhor performance do servidor.

Alguns desses parâmetros só podem ser alterados com a reinicialização do banco de dados.

Podemos através da `**view pg_settings**` configurada dentro do banco de dados visualizar todas as configurações existentes no arquivo `**postgresql.conf**`

Utilizamos o seguinte comando para visualizar a view e termos o retorno das configurações.

`SELECT name, setting``FROM pg_settings;`

Esse arquivo por *default* fica armazenado dentro do diretório de dados do cluster criado.