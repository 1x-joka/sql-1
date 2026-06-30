/*
	=========== INNER JOIN COM VÁRIAS TABELAS ===========
		--> usa-se 2 joins no mesmo comando para consultar dados de 3 tabelas
*/

create table humanos_assiste_curso (
	id_assiste int primary key auto_increment,
    data_assiste date,
    id_humanos int,
    id_cursos int,
    foreign key (id_humanos) references humanos(id_humanos), -- fazendo com que o id_humanos dessa tabela se ligue ao id_humanos da tabela originária
    foreign key (id_cursos) references cursos(id_cursos)
) default charset = utf8;

insert into humanos_assiste_curso
values
(default, '2024-03-01', '1', '2'),
(default, '2025-12-22', '6', '3'),
(default, '2024-12-01', '22', '12'),
(default, '2026-05-12', '1', '18');

select * from humanos_assiste_curso;

-- MOSTRANDO TODOS OS DADOS DAS DUAS TABELAS (HUMANOS E ASSISTE)
select * from
humanos h join humanos_assiste_curso gac
on h.id_humanos = gac.id_humanos;

-- MOSTRANDO O NOME DO HUMANO E O CÓDIGO DO CURSO QUE ELE FAZ
select h.nome, id_cursos from
humanos h join humanos_assiste_curso gac
on h.id_humanos = gac.id_assiste;

-- MOSTRANDO O NOME DO HUMANO E O NOME DO CURSO QUE ELE FAZ (QUE ESTÁ NA OUTRA TABELA)
select h.id_humanos, h.nome, c.nome from
humanos h join humanos_assiste_curso gac
on h.id_humanos = gac.id_humanos
join cursos c
on c.id_cursos = gac.id_cursos
order by h.id_humanos;

/*
	=========== A ESTUDAR ===========
		--> tipos de atributos
        --> tipos de relacionamentos
        --> relacionamentos ternários
        --> triggers
        --> views
*/