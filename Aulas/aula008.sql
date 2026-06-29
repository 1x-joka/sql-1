/*
	========== WILDCARDS ==========
		--> %: pode ter nada (vazio) ou alguma coisa
				ex.: ht%ml% (começa com ht, termina com ml e algo no final, pode ser nada ou número como HTML4, HTML5, ETC.)
		--> _: exige que tenha um caractere (letra, número, etc.) (pode ser duplo, ex.: p__t (tem que ter p, dois caracteres e depois t))
*/

-- MOSTRANDO CURSOS QUE *COMEÇAM* COM A LETRA P
select nome, descricao from cursos
where nome like 'P%'; -- Case Sensitive, ou seja, P = p

-- MOSTRANDO CURSOS QUE *TERMINAM* COM A LETRA R
select nome, descricao from cursos
where nome like '%R';

-- MOSTRANDO OS CURSOS QUE TEM A LETRA R EM QUALQUER LUGAR
select nome, descricao from cursos
where nome like '%R%';

-- MOSTRANDO OS CURSOS QUE NÃO TEM A LETRA R EM LUGAR NENHUM
select nome, descricao from cursos
where nome not like '%R%';

-- MOSTRANDO OS CURSOS QUE O NOME COMEÇA COM PH E TERMINA COM P (Photoshop, PHP, etc.)
select * from cursos
where nome like 'PH%P';

-- MOSTRANDO OS CURSOS QUE O NOME COMEÇA COM PH E TERMINA COM P E UM NÚMERO OU VAZIO
select * from cursos
where nome like 'PH%P%';

-- MOSTRANDO OS CURSOS QUE COMEÇA COM PH, TERMINA COM P E TENHA ALGO NO FINAL (número, letra, etc.)
select * from cursos
where nome like 'ph%p_';

-- MOSTRANDO AS PESSOAS QUE TENHAM SILVA NO NOME
select nome from humanos
where nome like '%SILVA%';	

-- MOSTRANDO AS PESSOAS QUE TENHAM O SOBRENOME SILVA
insert into humanos value
('Silvana Albuquerque', 'Programadora', '1999-05-22', 'F', '56.00', '1.50', 'EUA');

select nome from humanos
where nome like '%SILVA'; -- "espaço" silva

/*
	========== DISTINGUINDO (DIFERENTE DE AGRUPAR) ==========
		--> pega os registros iguais e mostra apenas um
*/

-- TODAS AS CARGAS QUE TEM NO BANCO DE DADOS (APENAS UMA DE CADA)
select distinct carga from cursos;

-- TODAS AS NACIONALIDADES QUE TEM NO BANCO DE DADOS (APENAS UMA DE CADA)
select distinct nacionalidade from humanos
order by nacionalidade;

/*
	========== FUNÇÕES DE AGREGAÇÃO ==========
		--> seleciona ou totaliza algo
        --> pega somente um registro com aquela query (ex.: se eu pergunto qual foi a menor carga e o nome desse curso no ano de 2024, o sistema me retorna o primeiro que achar, mesmo que tenha dois com a mesma carga mínima)
			-> para resolver, usa-se funções de agrupamento
*/

-- QUANTOS CURSOS EU TENHO CADASTRADOS
select count(*) from cursos;

-- QUANTOS CURSOS ACIMA DE 40 HORAS DE CARGA EU TENHO CADASTRADOS
select count(*) from cursos
where carga > 40;

-- QUANTOS NOMES EU TENHO CADASTRADOS
select count(nome) from humanos;

-- QUAL É A MAIOR CARGA QUE EU TENHO
select max(carga) from cursos
order by carga, nome;

-- EM 2024, QUAL FOI O MÁXIMO DE TOTAL DE AULAS
select max(totaulas) from cursos
where ano = '2024';

-- EM 2025, QUAL FOI A MENOR CARGA E QUAL O NOME DESSE CURSO
select nome, min(carga) from cursos
where ano = '2025';

-- SOMA DO TOTAL DE AULAS DE TODOS OS ANOS
select sum(totaulas) from cursos;

-- SOMA DO TOTAL DE AULAS EM 2025
select sum(totaulas) from cursos
where ano = '2025';

-- MÉDIA DAS CARGAS EM 2023
select avg(carga) from cursos
where ano = '2023';