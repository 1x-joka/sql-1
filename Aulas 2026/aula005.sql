-- registro = linha = tupla

select * from seres_humanos;
select * from cursos;
drop database cadastro;

insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução à Linguaguem Java', '10', '29', '2000'),
('6', 'MySQL', 'Banco de Dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2018'),
('8', 'Sapateado', 'Danças Rítmicas', '40', '30', '2018'),
('9', 'Cozinha Árabe', 'Aprenda a fazer Kibe', '40', '30', '2018'),
('10', 'Youtuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2014');

update cursos -- atualize
set nome = 'HTML5' -- configure
where id_cursos = '1'; -- onde

update cursos
set nome = 'Java', carga = '40', ano = '2015' -- não precisa ser na mesma ordem
where id_cursos = '5'; -- usa-se id pois tem que se usar um parâmetro que só cada campo tem, ou seja, PK

update cursos
set nome = 'PHP', ano = '2015'
where id_cursos = '4'
limit 1; -- Limita quantas linhas serão afetadas (caso o dev erre o comando isso assegura)

-- MUDANDO O ANO E A CARGA EM TODO LUGAR QUE TIVER ANO = 2018 (é tão perigoso que tem que desativar o Safe, indo no Edit -> Preferences -> SQL Editor e desmarcar a última caixa)
update cursos
set ano = '2050', carga = '800'
where ano = '2018';

/*
	Se for usar UPDATE, use com SAFE ligado e com o banco de dados inativo
*/

-- APAGANDO LINHAS (crtl z não funciona, faça um backup do banco de dados)
delete from cursos
where id_cursos = 8;

delete from cursos
where ano = '2050'
limit 2;

-- APAGANDO TODAS AS LINHAS DE UMA TABELA (crtl z não funciona, faça um backup do banco de dados)
truncate cursos; -- truncar é apagar todos os registros