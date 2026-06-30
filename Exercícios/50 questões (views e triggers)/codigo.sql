-- 1. Crie o banco de dados e todas as tabelas acima
create database db_questoes;
use db_questoes;

create table clientes (
    id_cliente int auto_increment primary key,
    nome_cliente varchar(100),
    email_cliente varchar(100),
    cidade_cliente varchar(100),
    data_cadastro date
);

create table fornecedores (
    id_fornecedor int auto_increment primary key,
    nome_fornecedor varchar(100),
    cidade_fornecedor varchar(100),
    telefone_fornecedor varchar(20)
);

create table produtos (
    id_produto int auto_increment primary key,
    nome_produto varchar(100),
    preco decimal(10,2),
    estoque int,
    id_fornecedor int,
    foreign key (id_fornecedor) references fornecedores(id_fornecedor)
);

create table pedidos (
    id_pedido int auto_increment primary key,
    id_cliente int,
    data_pedido date,
    valor_total decimal(10,2),
    foreign key (id_cliente) references clientes(id_cliente)
);

create table itens_pedido (
    id_item int auto_increment primary key,
    id_pedido int,
    id_produto int,
    quantidade int,
    preco_unitario decimal(10,2),
    foreign key (id_pedido) references pedidos(id_pedido),
    foreign key (id_produto) references produtos(id_produto)
);

-- 2. Insira no mínimo 5 registros em cada tabela
insert into clientes (nome_cliente, email_cliente, cidade_cliente, data_cadastro)
value
('Paulo Henrique', 'paulo.henrique3@email.com', 'São Paulo', '2025-01-10'),
('Joaquim Pereira Lima', 'joaquim.lima4@email.com', 'Curitiba', '2025-02-14'),
('Valeria Ferreira', null, 'Belo Horizonte', '2025-03-20'),
('Amanda Steele', 'amanda,steele5@email.com', 'São Paulo', '2025-04-02'),
('Fernanda Moreira', 'fer.moreira6@email.com', 'Rio de Janeiro', '2025-05-15');

insert into fornecedores (nome_fornecedor, cidade_fornecedor, telefone_fornecedor)
values
('Microsoft', 'São Paulo', '(11)99999-0001'),
('Multilaser', 'Curitiba', '(41)98888-0002'),
('Dell', 'São Paulo', '(11)97777-0003'),
('HP', 'Belo Horizonte', '(31)96666-0004'),
('Logitech', 'Rio de Janeiro', '(21)95555-0005');

insert into produtos (nome_produto, preco, estoque, id_fornecedor)
values
('Notebook Dell Inspiron', 3500.00, 15, 3),
('Mouse Gamer Logitech', 250.00, 40, 5),
('Teclado Mecânico Multilaser', 300.00, 25, 2),
('Monitor HP 24', 900.00, 10, 4),
('Notebook Microsoft Surface', 6500.00, 5, 1);

insert into pedidos (id_cliente, data_pedido, valor_total)
values
(1, curdate(), 1500.00),
(2, '2025-10-20', 3200.00),
(3, '2025-10-25', 250.00),
(1, '2025-10-26', 900.00),
(4, '2025-10-27', 6800.00);

insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
values
(1, 2, 3, 250.00),
(2, 1, 1, 3500.00),
(3, 2, 1, 250.00),
(4, 4, 1, 900.00),
(5, 5, 1, 6500.00);

-- 3. Exiba todos os dados da tabela clientes
select * from clientes;

-- 4. Liste todos os produtos ordenados pelo preço de forma decrescente.
select * from produtos
order by preco desc;

-- 5. Selecione os clientes das cidades de São Paulo ou Curitiba.
select * from clientes
where
cidade_cliente in ('São Paulo', 'Curitiba');

-- 6. Liste os produtos com preço entre R$100 e R$1000.
select * from produtos
where
preco between 100 and 1000;

-- 7. Exiba os produtos cujo nome contenha a palavra “Note”.
select * from produtos
where
nome_produto like '%Note%';

-- 8. Atualize o estoque de um produto específico.
update produtos set estoque = estoque - 2 -- pegando o valor atual da coluna estoque e diminua 2
where
id_produto = 1;

-- 9. exclua um cliente específico pelo nome.
delete from clientes
where
nome_cliente = 'Valeria Ferreira';

-- 10. Exiba o nome e e-mail de todos os clientes, mostrando “Sem e-mail” quando o campo for nulo.
select nome_cliente,
IFNULL(email_cliente, 'Sem e-mail')
as email_cliente from clientes;

-- 11. Faça uma consulta utilizando a função CURDATE() para mostrar a data atual.
select curdate() as data_atual;

-- 12. selecione todos os pedidos realizados na data atual.
select * from pedidos
where
data_pedido = curdate();

-- 13. exiba os pedidos cujo valor total seja maior que r$1000 e pertençam a clientes de são paulo.
select p.*
from pedidos p
join clientes c on p.id_cliente = c.id_cliente
where
p.valor_total > 1000 and c.cidade_cliente = 'São Paulo';

-- 14. selecione os produtos com estoque menor que 20 e preço maior que R$200.
select * from produtos
where
estoque < 20 and preco > 200;

-- 15. exiba os produtos com preço entre r$500 e r$1500, ordenados pelo nome.
select * from produtos
where
preco between 500 and 1500
order by nome_produto;

-- 16. liste todos os fornecedores cujo nome comece com a letra “m”.
select * from fornecedores
where
nome_fornecedor like 'm%';

-- 17. liste os clientes cujo nome termine com “a”.
select * from clientes
where
nome_cliente like '%a';

-- 18. mostre apenas os 3 produtos mais caros.
select * from produtos
order by preco desc
limit 3;

-- 19. mostre apenas os 5 produtos mais baratos.
select * from produtos
order by preco asc
limit 5;

-- 20. liste os clientes ordenados pela cidade em ordem alfabética.
select * from clientes
order by cidade_cliente asc;

-- 21. selecione todos os produtos cujo nome contenha a palavra “gamer”.
select * from produtos
where
nome_produto like '%gamer%';

-- 22. exiba o produto de menor preço.
select * from produtos
order by preco asc
limit 1;

-- 23. exiba o produto de maior preço.
select * from produtos
order by preco desc
limit 1;

-- 24. calcule o preço médio de todos os produtos.
select avg(preco) as preco_medio from produtos;

-- 25. exiba a soma total de todos os estoques de produtos.
select sum(estoque) as total_estoque from produtos;

-- 26. conte quantos produtos estão cadastrados.
select count(*) as total_produtos from produtos;

-- 27. mostre os produtos com preço acima da média.
select * from produtos
where preco > (select avg(preco) from produtos);

-- 28. crie uma consulta com inner join entre pedidos e clientes mostrando o nome do cliente e o valor total do pedido.
select c.nome_cliente, p.valor_total
from pedidos p
inner join clientes c on p.id_cliente = c.id_cliente;

-- 29. crie uma consulta com left join entre produtos e fornecedores mostrando produtos sem fornecedor (se houver).
select p.nome_produto, f.nome_fornecedor
from produtos p
left join fornecedores f on p.id_fornecedor = f.id_fornecedor
where p.id_fornecedor is null;

-- 30. crie uma consulta com right join entre produtos e fornecedores mostrando fornecedores sem produtos (se houver).
select p.nome_produto, f.nome_fornecedor
from produtos p
right join fornecedores f on p.id_fornecedor = f.id_fornecedor
where p.id_produto is null;

-- 31. liste os produtos agrupados por fornecedor e calcule o valor médio dos preços por fornecedor.
select f.nome_fornecedor, avg(p.preco) as media_preco
from produtos p
join fornecedores f on p.id_fornecedor = f.id_fornecedor
group by f.nome_fornecedor;

-- 32. calcule o valor total vendido em todos os pedidos.
select sum(valor_total) as total_vendido from pedidos;

-- 33. exiba o nome do cliente e o total gasto em pedidos, ordenando do maior para o menor.
select c.nome_cliente, sum(p.valor_total) as total_gasto
from pedidos p
join clientes c on p.id_cliente = c.id_cliente
group by c.nome_cliente
order by total_gasto desc;

-- 34. exiba os clientes que não possuem pedidos.
select * from clientes
where
id_cliente not in (select id_cliente from pedidos);

-- 35. crie uma consulta utilizando a função ifnull para mostrar texto substituto quando um campo estiver nulo.
select nome_cliente,
ifnull(email_cliente, 'email não informado') as email_cliente
from clientes;

-- 36. utilize a função case para classificar os produtos em “barato”, “médio” e “caro”.
select nome_produto,
case
    when preco < 500 then 'Barato'
    when preco between 500 and 2000 then 'Médio'
    else 'Caro'
end as classificacao
from produtos;

-- 37. crie uma view que mostre o resumo dos pedidos (id_pedido, nome_cliente, valor_total e data_pedido).
create view vw_resumo_pedidos as
select p.id_pedido, c.nome_cliente, p.valor_total, p.data_pedido
from pedidos p
join clientes c on p.id_cliente = c.id_cliente;

-- 38. crie uma trigger que atualize automaticamente o estoque após inserção em itens_pedido.
delimiter //
create trigger trg_atualiza_estoque
after insert on itens_pedido
for each row
begin
    update produtos
    set estoque = estoque - new.quantidade
    where id_produto = new.id_produto;
end //
delimiter ;

-- 39. mostre a quantidade total de pedidos realizados por cidade.
select c.cidade_cliente, count(p.id_pedido) as total_pedidos
from pedidos p
join clientes c on p.id_cliente = c.id_cliente
group by c.cidade_cliente;

-- 40. mostre o valor médio dos pedidos por cidade.
select c.cidade_cliente, avg(p.valor_total) as media_pedidos
from pedidos p
join clientes c on p.id_cliente = c.id_cliente
group by c.cidade_cliente;

-- 41. exiba o nome do cliente, o número do pedido e o valor total de cada pedido.
select c.nome_cliente, p.id_pedido, p.valor_total
from pedidos p
join clientes c on p.id_cliente = c.id_cliente;

-- 42. liste os produtos cujo estoque esteja entre 5 e 15 unidades.
select * from produtos
where
estoque between 5 and 15;

-- 43. exiba os pedidos realizados entre duas datas específicas.
select * from pedidos
where
data_pedido between '2025-10-20' and '2025-10-28';

-- 44. crie uma consulta que mostre o nome do produto, o fornecedor e o preço, apenas para produtos acima de r$1000.
select p.nome_produto, f.nome_fornecedor, p.preco
from produtos p
join fornecedores f on p.id_fornecedor = f.id_fornecedor
where
p.preco > 1000;

-- 45. exiba o nome do cliente e o total de produtos comprados (quantidade total) em todos os pedidos.
select c.nome_cliente, sum(i.quantidade) as total_produtos_comprados
from clientes c
join pedidos p on c.id_cliente = p.id_cliente
join itens_pedido i on p.id_pedido = i.id_pedido
group by c.nome_cliente;

-- 46. crie uma consulta que mostre o nome do fornecedor e o total de produtos fornecidos.
select f.nome_fornecedor, count(p.id_produto) as total_produtos
from fornecedores f
left join produtos p on f.id_fornecedor = p.id_fornecedor
group by f.nome_fornecedor;

-- 47. mostre todos os produtos cujo fornecedor esteja localizado na mesma cidade do cliente (utilizando join e where).
select distinct pr.nome_produto, f.nome_fornecedor, c.nome_cliente
from produtos pr
join fornecedores f on pr.id_fornecedor = f.id_fornecedor
join clientes c on f.cidade_fornecedor = c.cidade_cliente;

-- 48. exiba os pedidos com valor total maior que a média dos pedidos.
select * from pedidos
where
valor_total > (select avg(valor_total) from pedidos);

-- 49. liste todos os pedidos realizados hoje (utilizando curdate e between).
select * from pedidos
where
data_pedido between curdate() and curdate();

-- 50. exiba os produtos cujo nome contenha “teclado” ou “mouse” e estejam com estoque acima de 10 unidades.
select * from produtos
where
(nome_produto like '%teclado%' or nome_produto like '%mouse%')
and estoque > 10;