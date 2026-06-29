insert into humanos (nome, prof, nascimento, sexo, peso, altura, nacionalidade) values
('João Silva','Programador','1998-05-12','M',72.50,1.78,'Brasil'),
('Maria Oliveira','Médica','2000-09-21','F',58.30,1.65,'Brasil'),
('Pedro Santos','Engenheiro','1995-11-02','M',81.20,1.82,'Brasil'),
('Ana Costa','Professora','1999-01-18','F',55.90,1.68,'Brasil'),
('Lucas Pereira','Advogado','2002-03-14','M',69.40,1.74,'Brasil'),
('Juliana Lima','Arquiteta','1997-07-27','F',61.50,1.70,'Brasil'),
('Carlos Souza','Mecânico','1994-12-09','M',88.70,1.85,'Brasil'),
('Fernanda Rocha','Enfermeira','2001-04-30','F',59.80,1.66,'Brasil'),
('Gabriel Almeida','Designer','1996-08-15','M',75.30,1.80,'Brasil'),
('Beatriz Martins','Veterinária','1993-10-11','F',54.20,1.60,'Brasil'),
('Rafael Gomes','Policial','1990-06-03','M',83.10,1.83,'Brasil'),
('Camila Ribeiro','Dentista','1998-02-25','F',63.40,1.72,'Brasil'),
('Bruno Carvalho','Eletricista','1992-09-17','M',79.60,1.77,'Portugal'),
('Larissa Fernandes','Nutricionista','2003-05-20','F',57.10,1.64,'Brasil'),
('Thiago Barbosa','Motorista','1997-01-07','M',74.80,1.79,'Brasil'),
('Patrícia Melo','Farmacêutica','1991-11-23','F',65.00,1.71,'Brasil'),
('Felipe Araujo','Analista','1996-03-19','M',71.90,1.75,'Brasil'),
('Vanessa Dias','Psicóloga','1995-12-28','F',60.60,1.69,'Argentina'),
('Diego Moreira','Bombeiro','1989-04-16','M',85.40,1.84,'Brasil'),
('Renata Nunes','Jornalista','1994-08-10','F',56.70,1.63,'Brasil'),
('Eduardo Teixeira','Professor','2001-07-01','M',77.50,1.81,'Brasil'),
('Amanda Lopes','Recepcionista','2002-10-22','F',52.90,1.58,'Brasil'),
('Gustavo Freitas','Empresário','1993-02-13','M',82.30,1.86,'Brasil'),
('Bianca Castro','Secretária','1998-06-05','F',59.40,1.67,'Chile'),
('Leonardo Moura','Contador','1990-09-29','M',90.20,1.90,'Brasil'),
('Isabela Cardoso','Estudante','1997-04-08','F',55.60,1.62,'Brasil'),
('Henrique Pires','Programador','1999-12-01','M',73.70,1.76,'Brasil'),
('Natália Vieira','Engenheira','1996-05-26','F',64.10,1.73,'Brasil'),
('Matheus Correia','Professor','2000-08-19','M',68.90,1.72,'Brasil'),
('Gabriela Pinto','Médica','1995-03-11','F',57.80,1.65,'Espanha'),
('Daniel Cunha','Advogado','1991-01-30','M',80.10,1.82,'Brasil'),
('Carolina Farias','Arquiteta','1994-07-13','F',62.30,1.70,'Brasil'),
('Vinicius Moraes','Eletricista','1998-11-24','M',76.80,1.79,'Brasil'),
('Aline Monteiro','Enfermeira','2001-09-05','F',54.50,1.61,'Brasil'),
('André Rezende','Mecânico','1992-06-17','M',84.60,1.88,'Brasil'),
('Tatiane Alves','Psicóloga','1999-10-09','F',58.70,1.68,'Brasil'),
('Igor Batista','Motorista','1996-02-21','M',70.40,1.74,'Brasil'),
('Priscila Machado','Nutricionista','1993-12-14','F',63.20,1.71,'Uruguai'),
('Marcelo Neves','Policial','1988-08-06','M',91.30,1.87,'Brasil'),
('Elaine Ramos','Designer','1997-05-31','F',60.10,1.66,'Brasil'),
('Caio Duarte','Estudante','2003-01-27','M',67.80,1.73,'Brasil'),
('Mônica Brito','Contadora','1995-04-18','F',56.40,1.64,'Brasil'),
('Otávio Peixoto','Empresário','1990-07-22','M',86.20,1.85,'Brasil'),
('Débora Aguiar','Jornalista','1992-11-15','F',61.90,1.69,'Brasil'),
('Fábio Tavares','Analista','1998-09-08','M',74.20,1.77,'México'),
('Sabrina Leal','Recepcionista','2000-03-03','F',55.30,1.60,'Brasil'),
('Rodrigo Xavier','Programador','1994-06-12','M',78.40,1.80,'Brasil'),
('Jéssica Moraes','Dentista','1996-10-25','F',59.90,1.67,'Brasil'),
('Murilo Guedes','Engenheiro','1999-02-09','M',72.60,1.75,'Brasil'),
('Paula Siqueira','Veterinária','2001-08-28','F',57.50,1.65,'Canadá'),
('Alexandre Braga','Professor','1993-05-16','M',81.70,1.83,'Brasil'),
('Cristina Sales','Farmacêutica','1997-12-04','F',62.80,1.72,'Brasil'),
('Samuel Fonseca','Bombeiro','1995-01-20','M',75.90,1.78,'Brasil'),
('Luciana Coelho','Secretária','1992-09-02','F',58.20,1.66,'Brasil'),
('Nathan Reis','Programador','2002-04-24','M',69.80,1.76,'Brasil'),
('Melissa Andrade','Médica','1998-07-30','F',54.90,1.62,'Itália'),
('Yuri Campos','Advogado','1991-10-18','M',83.50,1.84,'Brasil'),
('Viviane Borges','Arquiteta','1994-02-07','F',60.40,1.68,'Brasil'),
('César Valente','Empresário','1989-03-26','M',88.10,1.89,'Brasil'),
('Helena Prado','Estudante','2000-11-13','F',56.80,1.64,'França');

-- Mudando algumas coisas
update humanos
set nacionalidade = 'Alemanha'
where nacionalidade = 'Brasil';

update humanos
set nacionalidade = 'Suíça'
where id % 2 = 0;

update humanos
set nacionalidade = 'Islândia'
where id % 3 = 0;

select * from humanos;

insert into cursos (nome, descricao, carga, totaulas, ano) values
('SQLServer','Banco de dados Microsoft SQL Server',60,45,2025),
('PostgreSQL','Banco de dados PostgreSQL',60,45,2025),
('OracleDB','Banco de dados Oracle',80,60,2024),
('SQLite','Banco de dados SQLite',30,20,2023),
('MariaDB','Banco de dados MariaDB',50,35,2024),
('Redis','Banco de dados em memória Redis',40,30,2025),
('Firebase','Backend com Firebase',50,40,2025),
('TypeScript','Programação com TypeScript',60,50,2025),
('NextJS','Framework Next.js',70,55,2025),
('NuxtJS','Framework Nuxt.js',70,55,2024),
('SASS','Pré-processador CSS SASS',40,30,2023),
('TailwindCSS','Framework Tailwind CSS',40,30,2025),
('ExpressJS','Backend com Express.js',60,45,2025),
('NestJS','Framework NestJS',80,60,2025),
('SpringBoot','Framework Spring Boot',90,70,2024),
('Hibernate','Persistência com Hibernate',60,45,2023),
('Django','Framework Django',80,60,2025),
('Flask','Framework Flask',50,40,2024),
('FastAPI','APIs com FastAPI',60,45,2025),
('Laravel','Framework Laravel',80,65,2024),
('CodeIgniter','Framework CodeIgniter',60,45,2023),
('RubyOnRails','Framework Ruby on Rails',80,60,2022),
('GoLang','Programação em Go',70,55,2025),
('Rust','Programação em Rust',80,65,2025),
('Kotlin','Desenvolvimento Kotlin',70,55,2024),
('Swift','Desenvolvimento iOS com Swift',70,55,2024),
('Flutter','Apps com Flutter',80,60,2025),
('ReactNative','Apps com React Native',80,60,2025),
('Unity','Desenvolvimento de Jogos Unity',100,80,2023),
('UnrealEngine','Desenvolvimento de Jogos Unreal Engine',120,90,2024);

-- colocando auto_increment no id_cursos
alter table cursos
modify id_cursos int not null auto_increment;

-- VER TODOS OS DADOS DA TABELA CURSOS
select * from cursos;

-- VER TODOS OS DADOS EM ORDEM ALFABÉTICA DO NOME
select * from cursos
order by nome;

-- VER TODOS OS DADOS EM ORDEM ALFABÉTICA INVERSA DO NOME
select * from cursos
order by nome desc; -- NÃO É DESC DE DESCRIBE, E SIM DE DESCENDANT

-- FILTRANDO COLUNAS
select nome, carga, ano from cursos -- mostra somente os campos nome, carga e ano
order by ano; -- ano em forma crescente

select ano, nome, carga from cursos
order by ano, nome; -- caso tenha anos iguais, dentro dele será ordenado em nome na ordem alfabética

-- FILTRANDO LINHAS
select nome, descricao, carga from cursos
where ano = '2023'
order by nome;

/*
	Query = solicitação/pergunta
*/

select nome, descricao, carga, ano from cursos
where ano <= '2024'
order by ano desc, nome;

select nome, descricao, ano from cursos
where ano != '2024' -- != é igual a <>
order by ano, nome;

-- SELECIONANDO INTERVALOS (OPERADORES RELACIONAIS)
select * from cursos
where totaulas between '20' and '50' -- between restringe faixas de valores
order by totaulas;

select * from cursos
where ano in ('2022', '2024') -- in permite colocar valores específicos
order by ano;

-- COMBINANDO TESTES (OPERADORES LÓGICOS + OPERADORES RELACIONAIS)
select * from cursos
where carga > 45 and totaulas < 50
order by ano;

select * from cursos
where carga > 45 or totaulas < 50
order by ano;