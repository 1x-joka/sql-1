create database cadastro
default character set utf8 -- constraint (permite caracteres portugueses); utf8mb4 = constraint que suporta português e até emojis
default collate utf8_general_ci; -- constraint (CI = Case Isensitive; CADASTRO = Cadastro = cadastro)

create table pessoas (
	id int primary key not null auto_increment, -- caso tenha duas, ou mais, pessoas com o mesmo nome, sexo, etc. ela será diferenciada pelo seu ID (chave primária = número único)
	nome varchar(30) not null,
    nascimento date,
    sexo enum('M', 'F'), -- enum ao invés de char para maior restrição. ENUM só permite M ou F, char pode ser qualquer letra
    peso decimal(5,2), -- 5 casas ao todo, 2 números após a vírgula (ex.: XXX,XX)
    altura decimal(3,2),
    nacionalidade varchar(20) default 'Brasil' -- Se ninguém digitar nada, por padrão, será Brasil
    -- primary key (id) Outra forma de declarar uma PK
) default charset = utf8;

-- Tupla = Registro (em mysql)