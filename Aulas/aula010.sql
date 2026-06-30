/*
	========== InnoDB ==========
		--> Engine: máquina/mecanismo de criação de tabelas
        --> mecanismo criado pela InnoBase (pertencente a Oracle) e permite a criação de tabelas com algumas características:
			-> suportar chaves estrangeiras
		--> suporta as 4 regras de boa transação: ACID
	========== MyISAM ==========
		--> mais antiga
        --> não da suporte as 4 regras
	========== XtraDB ==========
		--> mais recente
        --> suporta as 4 regras
	========== TRANSAÇÃO ==========
		--> tudo aquilo que você pede pro banco de dados, ele executa e retorna uma resposta (requisição -> resposta)
	========== ACID ==========
		--> A: Atomicidade (tarefa não pode ser dividida em sub-tarefas. Ex.: o banco de dados salva somente metade dos dados pedidos)
        --> C: Consistência (um banco de dados permanece consistente após uma transação. Ex.: se antes da requisição o banco de dados está OK, ele tem que permanecer OK após a resposta)
        --> I: Isolamento (quando se tem duas transações feitas em paralelo elas têm que ser executadas de forma isolada. Ex.: se dois usuário pedem duas transações ao mesmo tempo no MySQL, elas não podem interferir uma na outra)
        --> D: Durabilidade (a transação tem que durar o tempo necessário. Ex.: se um dado de um cliente é salvo, ele tem que permanecer intacto, sem modificações, até você fazer uma ou simplesmente não fazer, como um update, delete, etc., ele não pode sumir ou ser alterado do nada)
*/

-- ADICIONANDO UMA COLUNA QUALQUER
alter table humanos
add cursopreferido int;

-- TRANSFORMANDO-A EM CHAVE ESTRANGEIRA USANDO COMO REFERÊNCIA/ESTANDO LIGADA A CHAVE DE ID_CURSOS (FK LIGADA A PK)
alter table humanos
add foreign key (cursopreferido) references cursos(id_cursos);

-- FALANDO QUE A ANA COSTA (id = 4) GOSTA DO CURSO DE DJANGO (id = 7)
update humanos
set cursopreferido = '7'
where id = '4';

-- FAZENDO, PELO RESULT SET, OU RESULT GRID, O DO RESTANTE (CÓDIGO AUTOMÁTICO DO SQL APÓS CLICAR EM APPLY)
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '1' WHERE (`id_humanos` = '1');
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '23' WHERE (`id_humanos` = '2');
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '6' WHERE (`id_humanos` = '3');
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '9' WHERE (`id_humanos` = '6');
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '11' WHERE (`id_humanos` = '5');
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '15' WHERE (`id_humanos` = '7');
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '24' WHERE (`id_humanos` = '8');
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '2' WHERE (`id_humanos` = '10');
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '3' WHERE (`id_humanos` = '9');
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '2' WHERE (`id_humanos` = '11');
UPDATE `cadastro`.`humanos` SET `cursopreferido` = '2' WHERE (`id_humanos` = '12'); -- cada pessoa pode ter apenas um curso preferido, mas um curso pode ser preferido por várias pessoas

-- ERRO DE INTEGRIDADE REFERENCIAL (NÃO CONSIGO MUDAR UM CAMPO SE ISSO IRÁ AFETAR MINHA TRANSAÇÃO)
delete from cursos
where id_cursos = '3'; -- Enquanto um curso tiver relacionamento com um humano, ele não poderá ser apagado pois daria erro de inconsistênica (uma pessoa iria preferir um curso que nem existe)

-- APAGANDO UM CURSO QUE NÃO TEM RELACIONAMENTO COM NINGUÉM (ÊXITO)
delete from cursos
where id_cursos = '19';

alter table humanos
change id id_humanos int not null auto_increment; -- não coloca 'primary key' pois o sistema irá achar que você quer criar outra primary key

/*
	========== JOIN ==========
		--> usa-se para pegar dados da tabela A e relacionar com dados da tabela B
        --> usa-se sempre 'on' para que a cada 1 registro da tabela A seja relacionado com 1 registro da tabela B (por meio do conceito de PK e FK)
        --> quando não se especifica qual join é, por definição, é inner join
*/

/*
	========== INNER JOIN ==========
		--> se relacionam apenas quem tem ligações, quem não tiver curso preferido não irá aparecer
        --> consulta o que tem relações NAS DUAS TABELAS
*/

-- MOSTRANDO O NOME DA PESSOA (TABELA HUMANOS), O NÚMERO DO CURSO PREFERIDO (TABELA HUMANOS), O NOME DO CURSO PREFERIDO (TABELA CURSOS) E O ANO DO CURSO PREFERIDO (TABELA CURSOS)
select humanos.nome, humanos.cursopreferido, cursos.nome, cursos.ano
from humanos inner join cursos
on cursos.id_cursos = humanos.cursopreferido; -- fazendo a ligação da chave primária do curso com o curso preferido do humano

-- MOSTRANDO O NOME DA PESSOA, O NOME DO CURSO E A DESCRIÇÃO DELE. COLOQUE O NOME EM ORDEM
select humanos.nome, cursos.nome, cursos.descricao
from humanos inner join cursos
on cursos.id_cursos = humanos.cursopreferido
order by humanos.nome;

-- APELIDANDO TABELAS
select h.nome, h.cursopreferido, c.nome, c.ano
from humanos as h inner join cursos as c
on c.id_cursos = h.cursopreferido
order by h.nome;

/*
	========== LEFT (outer) JOIN ==========
        --> consulta o que tem relações DANDO PREFERÊNCIA NA TABELA DA ESQUERDA
*/

-- MOSTRANDO O NOME DA PESSOA, O NÚMERO DO CURSO PREFERIDO, O NOME DO CURSO PREFERIDO E O ANO DO CURSO PREFERIDO. INCLUSIVE QUEM NÃO TEM CURSO PREFERIDO
select h.nome, h.cursopreferido, c.nome, c.ano
from humanos as h left join cursos as c -- nesse caso, a tabela A (esquerda) é humanos
on c.id_cursos = h.cursopreferido;

/*
	========== RIGHT (outer) JOIN ==========
        --> consulta o que tem relações DANDO PREFERÊNCIA NA TABELA DA DIREITA
*/

-- MOSTRANDO O NOME DA PESSOA, O NÚMERO DO CURSO PREFERIDO, O NOME DO CURSO PREFERIDO E O ANO DO CURSO PREFERIDO. INCLUSIVE OS CURSOS QUE NINGUÉM PREFERE
select h.nome, h.cursopreferido, c.nome, c.ano
from humanos as h right join cursos as c -- nesse caso, a tabela B (direita) é cursos
on c.id_cursos = h.cursopreferido;