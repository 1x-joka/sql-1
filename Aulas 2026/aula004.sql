-- column = campo na tabela

create database cadastro
default character set utf8
default collate utf8_general_ci;

create table pessoas (
	id int primary key not null auto_increment,
	nome varchar(30) not null,
    nascimento date,
    sexo enum('M', 'F'),
    peso decimal(5,2),
    altura decimal(3,2),
    nacionalidade varchar(20) default 'Brasil'
) default charset = utf8;

-- ADICIONANDO UMA COLUNA NA TABELA
alter table pessoas
add column profissao varchar(10); -- column é opcional, pode-se retirar que terá o mesmo sentido

desc pessoas; -- desc = abreviação de "describe"

-- APAGANDO UMA COLUNA DA TABELA
alter table pessoas
drop column profissao;

-- MUDANDO A POSIÇÃO DO CAMPO "PROFISSÃO" NA TABELA (APÓS O NOME)
alter table pessoas
add column profissao varchar(10) after nome; -- não existe before

-- ADICIONANDO O CAMPO "CODIGO" ANTES DO INT
alter table pessoas
add codigo int first; -- como não existe before, usamos first para indicar que será o primeiro campo da tabela

-- ALTERANDO O TIPO PRIMITIVO DO CAMPO "PROFISSÃO"
alter table pessoas
modify column profissao varchar(20); -- modify não permite renomear o campo, apenas o tipo primitivo dele

-- ALTERANDO A CONSTRAINT DO CAMPO "PROFISSÃO"
alter table pessoas
modify column profissao varchar(20) not null default ''; -- sem o default vazio quebra, pois ao adicionar o campo na tabela, o SQL já o coloca como nulo, portanto temos que admitir que pode começar '' (vazio) usando o default

-- RENOMEANDO UM CAMPO
alter table pessoas
change column profissao prof varchar(20); -- perde as configurações de " not null default '' "

-- RENOMEANDO A TABELA
alter table pessoas
rename to seres_humanos;

desc seres_humanos;

/*
============ CRIANDO UMA NOVA TABELA ============
*/

create table if not exists cursos ( -- só cria a tabela if not exists (se não existir)
	nome varchar(30) not null unique, -- unique pois não existem dois cursos com o mesmo nome (não confundir com PK, ela tem outras características)
    descricao text, -- text = textos longos (parágrafos, etc.)
    carga int unsigned, -- unsigned = sem sinal (economiza 1 byte pra cada registro que tenha carga registrada)
    totaulas int,
    ano year default '2026'
) default charset = utf8;

alter table cursos
add column id_cursos int primary key first;

/*
CASO FAÇA DO JEITO ANTIGO...

alter table cursos
add primary key (id_cursos);
*/

create table if not exists teste (
	id_teste int primary key,
    nome varchar(10),
    idade int
);

-- APAGANDO A TABELA
drop table if exists teste;