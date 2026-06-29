/*
	========== WILDCARDS ==========
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