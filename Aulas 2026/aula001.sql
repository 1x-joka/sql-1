create database cadastro;
use cadastro;

drop database cadastro; -- deleta o banco de dados e os dados dentro dele completamente

create table pessoas (
	nome varchar(30),
    idade tinyint, -- tinyint = número inteiro pequeno (1 byte)
    sexo char(1),
    peso float,
    altura float,
    nacionalidade varchar(20)
);

describe pessoas; -- Me mostra o que tem na tabela (campos, valores/tipos primitivos, etc.)