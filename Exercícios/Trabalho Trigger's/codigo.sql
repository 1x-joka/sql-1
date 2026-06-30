create database db_Biblioteca;
use db_Biblioteca;

-- Criando as tabelas
create table livro (
id_livro int primary key auto_increment,
titulo_livro varchar(100) not null,
autor_livro varchar(100) not null,
categoria_livro varchar(20) not null,
anopublicacao int not null
);

create table cliente (
id_cliente int primary key auto_increment,
nome_cliente varchar(100) not null,
email_cliente varchar(100)
);

create table emprestimo (
id_emprestimo int primary key auto_increment,
data_emprestimo date not null,
data_devolucao date not null,
id_livro int,
id_cliente int,
foreign key (id_livro) references livro (id_livro),
foreign key (id_cliente) references cliente (id_cliente)
);

-- Insert's
insert into livro (titulo_livro, autor_livro, categoria_livro, anopublicacao)
values
('Dom Casmurro', 'Machado de Assis', 'Romance', 1899),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Infantil', 1943);

insert into cliente (nome_cliente, email_cliente)
values
('João Silva', 'joao.silva@email.com'),
('Maria Oliveira', 'maria.oliveira@email.com');

insert into emprestimo (data_emprestimo, data_devolucao, id_livro, id_cliente)
values
('2025-09-01', '2025-09-15', 1, 1),
('2025-09-05', '2025-09-20', 2, 2);

-- Selecionar todos os livros de ficção
select * from livro
where
categoria_livro = "Ficção";

-- Filtrar empréstimos realizados entre dois dados
select * from emprestimo
where data_emprestimo between '2025-09-01' and '2025-09-10';

-- Selecionar os 2 primeiros livros adicionados no banco
select * from livro
order by id_livro asc
limit 2;

-- Exibir todos os empréstimos com informações fornecidas sobre clientes e livros
select e.id_emprestimo, e.data_emprestimo, e.data_devolucao,
       l.titulo_livro, c.nome_cliente
from emprestimo e
join livro l on e.id_livro = l.id_livro
join cliente c on e.id_cliente = c.id_cliente;

-- Crie uma view para mostrar todos os empréstimos ativos (ainda não devolvidos)
create view vw_emprestimos_ativos as
select e.id_emprestimo, e.data_emprestimo, e.data_devolucao,
       l.titulo_livro, c.nome_cliente
from emprestimo e
join livro l on e.id_livro = l.id_livro
join cliente c on e.id_cliente = c.id_cliente
where e.data_devolucao is null;

-- Consulte a view
select * from vw_emprestimos_ativos;

-- Crie uma Trigger para atualizar os dados de devolução automaticamente com os dados atuais ao devolver o livro
delimiter $
create trigger trg_atualizar_devolucao
before update on emprestimo
for each row
begin
   if new.data_devolucao is null then
      set new.data_devolucao = curdate();
   end if;
end $
delimiter ;

-- Crie uma Trigger para impedir que um cliente empreste mais de 3 livros ao mesmo tempo
delimiter $
create trigger trg_limite_emprestimo
before insert on emprestimo
for each row
begin
   declare qtd int;
   select count(*) into qtd
   from emprestimo
   where id_cliente = new.id_cliente
   and data_devolucao is null;
   
   if qtd >= 3 then
      signal sqlstate '45000'
      set message_text = 'Cliente já possui 3 empréstimos ativos!';
   end if;
end $
delimiter ;

-- Tentar inserir o quarto empréstimo
insert into emprestimo (data_emprestimo, data_devolucao, id_livro, id_cliente)
values (curdate(), null, 1, 1);