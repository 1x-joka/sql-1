/*
	=========== AGRUPANDO REGISTROS ===========
*/

-- SELECIONANDO OS REGISTROS AGRUPADOS POR CARGA
select carga from cursos
group by carga; -- o resultado visual pode ter sido o mesmo de um 'distinct', mas a lógica foi totalmente diferente

-- CONTANDO QUANTAS CARGAS ESTÃO AGRUPADAS (QUANTO TEM DE CADA CARGA)
select carga, count(nome) from cursos
group by carga;

-- CONTANDO QUANTOS CURSOS DE CARGA 60 EU TENHO COM 45 AULAS
select carga, count(nome) from cursos
where totaulas = 45
group by carga;

-- MOSTRANDO QUANTOS CURSOS EU TENHO EM CADA ANO
select ano, count(nome) from cursos
group by ano;

/*
	=========== AGRUPANDO E AGREGANDO ===========
		--> having: só pode trabalhar com o campo que você agrupou
*/

-- MOSTRANDO AS CARGAS AGRUPADAS SOMENTE MAIORES QUE 3
select carga, count(nome) from cursos
group by carga
having count(nome) > 2;

-- MOSTRANDO APENAS OS CURSOS, POR ANO, ACIMA DE 4 EM ORDEM DECRESCENTE
select ano, count(*) from cursos
group by ano
having count(ano) > 4
order by count(*) desc;

/*
	'having' pro 'group by' é semelhante ao 'where' pro select
*/

-- MOSTRANDO APENAS OS CURSOS QUE TEM A CARGA MAIOR QUE A MÉDIA ATÉ 2024
select carga, count(*) from cursos
where ano <= '2024'
group by carga
having carga > (select avg(carga) from cursos); -- select dentro do outro