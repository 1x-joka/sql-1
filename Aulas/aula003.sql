/*
DDL: Data Definition Language
- Comandos de definição
	ex.: create, alter, drop, truncate, rename, comment, etc.
*/

/*
DML: Data Manipulation Language
- Comandos de manipulação
	ex.: insert, select, update, delete, etc.
*/

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

insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Joaquim', '2008-10-30', 'M', '73.0', '1.74', 'Brasil'), -- ocultamos o id pois é auto_increment (o próprio sistema já coloca)
(default, 'Maria', '1999-12-30', 'F', '52.2', '1.65', 'Portugal'),
(default, 'Creuza', '1920-12-30', 'F', '52.2', '1.65', default);

select * from pessoas;

/*

======== Caso a ordem da lista for a mesma do sql, pode-se ocultar. ========

insert into pessoas values
(default, 'Joaquim', '2008-10-30', 'M', '73.0', '1.74', 'Brasil'), -- ocultamos o id pois é auto_increment (o próprio sistema já coloca)
(default, 'Maria', '1999-12-30', 'F', '52.2', '1.65', 'Portugal'),
(default, 'Creuza', '1920-12-30', 'F', '52.2', '1.65', default);
*/