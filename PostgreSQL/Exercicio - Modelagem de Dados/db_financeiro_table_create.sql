CREATE TABLE public.banco (
	numero integer NOT NULL,
	nome varchar(50) NOT NULL,
	ativo boolean NOT NULL,
	data_criacao CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (numero)
);


CREATE TABLE public.agencia (
	banco_numero integer NOT NULL,
	numero integer NOT NULL,
	nome varchar(50) NOT NULL,
	ativo boolean NOT NULL,
	data_criacao CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (banco_numero, numero)
);


CREATE TABLE public.cliente (
	numero BIGSERIAL NOT NULL,
	nome varchar(120) NOT NULL,
	email varchar(250) NOT NULL,
	ativo boolean NOT NULL,
	data_criacao CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (numero)
);


CREATE TABLE public.conta_corrente (
	banco_numero integer NOT NULL,
	agencia_numero integer NOT NULL,
	numero bigint NOT NULL,
	digito smallint NOT NULL,
	cliente_numero bigint NOT NULL,
	ativo boolean NOT NULL,
	data_criacao CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (banco_numero, agencia_numero, numero, digito, cliente_numero)
);


CREATE TABLE public.tipo_transacao (
	id SMALLSERIAL NOT NULL,
	nome varchar(50) NOT NULL,
	ativo boolean NOT NULL,
	data_criacao CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.cliente_transacoes (
	id BIGSERIAL NOT NULL,
	banco_numero integer NOT NULL,
	agencia_numero integer NOT NULL,
	conta_corrente_numero bigint NOT NULL,
	conta_corrente_digito smallint NOT NULL,
	cliente_numero bigint NOT NULL,
	tipo_transacao_id smallint NOT NULL,
	ativo boolean NOT NULL,
	data_criacao CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.cliente_transacoes
	(banco_numero);
CREATE INDEX ON public.cliente_transacoes
	(agencia_numero);
CREATE INDEX ON public.cliente_transacoes
	(conta_corrente_numero);
CREATE INDEX ON public.cliente_transacoes
	(conta_corrente_digito);
CREATE INDEX ON public.cliente_transacoes
	(cliente_numero);
CREATE INDEX ON public.cliente_transacoes
	(tipo_transacao_id);


ALTER TABLE public.agencia ADD CONSTRAINT FK_agencia__banco_numero FOREIGN KEY (banco_numero) REFERENCES public.banco(numero);
ALTER TABLE public.conta_corrente ADD CONSTRAINT FK_conta_corrente__banco_numero FOREIGN KEY (banco_numero) REFERENCES public.agencia(banco_numero);
ALTER TABLE public.conta_corrente ADD CONSTRAINT FK_conta_corrente__agencia_numero FOREIGN KEY (agencia_numero) REFERENCES public.agencia(numero);
ALTER TABLE public.conta_corrente ADD CONSTRAINT FK_conta_corrente__cliente_numero FOREIGN KEY (cliente_numero) REFERENCES public.cliente(numero);
ALTER TABLE public.cliente_transacoes ADD CONSTRAINT FK_cliente_transacoes__banco_numero FOREIGN KEY (banco_numero) REFERENCES public.conta_corrente(banco_numero);
ALTER TABLE public.cliente_transacoes ADD CONSTRAINT FK_cliente_transacoes__agencia_numero FOREIGN KEY (agencia_numero) REFERENCES public.conta_corrente(agencia_numero);
ALTER TABLE public.cliente_transacoes ADD CONSTRAINT FK_cliente_transacoes__conta_corrente_numero FOREIGN KEY (conta_corrente_numero) REFERENCES public.conta_corrente(numero);
ALTER TABLE public.cliente_transacoes ADD CONSTRAINT FK_cliente_transacoes__conta_corrente_digito FOREIGN KEY (conta_corrente_digito) REFERENCES public.conta_corrente(digito);
ALTER TABLE public.cliente_transacoes ADD CONSTRAINT FK_cliente_transacoes__cliente_numero FOREIGN KEY (cliente_numero) REFERENCES public.conta_corrente(cliente_numero);
ALTER TABLE public.cliente_transacoes ADD CONSTRAINT FK_cliente_transacoes__tipo_transacao_id FOREIGN KEY (tipo_transacao_id) REFERENCES public.tipo_transacao(id);