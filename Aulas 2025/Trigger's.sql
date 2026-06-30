create database ExTrigger;
use ExTrigger;

create table EX2_Cliente (
codcliente int primary key,
nome varchar(255),
datanascimento date,
cpf varchar(11)
);

create table EX2_Pedido (
codpedido int primary key,
codcliente int,
datapedido date,
nf int, -- nf = Nota Fiscal
valortotal decimal(10,2),
foreign key (codcliente) references EX2_Cliente(codcliente)
);

create table EX2_Produto (
codproduto int primary key,
descricao varchar(255),
quantidade int
);

create table EX2_ItemPedido (
itempedido int primary key,
codpedido int,
numeroitem int,
valorunitario decimal(10,2),
quantidade int,
codproduto int,
foreign key (codpedido) references EX2_Pedido(codpedido),
foreign key (codproduto) references EX2_Produto(codproduto)
);

create table EX2_Log (
codlog int primary key,
datai datetime,
descricao varchar(255)
);

insert into EX2_Cliente (codcliente, nome, datanascimento, cpf)
values
(1, 'Maria da Silva', '1990-01-01', '12345678901'),
(2, 'Mario Sergio', '1985-05-15', '98765432101');

insert into EX2_Produto (codproduto, descricao, quantidade)
values
(1, 'Coca-Cola', 100),
(2, 'Fanta Laranja', 75);

insert into EX2_Pedido (codpedido, codcliente, datapedido, nf, valortotal)
values
(1, 1, '2025-09-01', 1001, 800.00),
(2, 1, '2025-09-22', 1002, 1200.00);

insert into EX2_ItemPedido (itempedido, codpedido, numeroitem, valounitario, quantidade, codproduto)
values
(1, 1, 1, 20.00, 2, 1),
(2, 2, 2, 15.00, 4, 2);

insert into EX2_Log (codlog, datai, descricao)
values
(1, '2025-08-08', 'Produto Faturado'),
(2, '2025-09-01', 'Produto saiu para entrega');

-- Trigger para baixar estoque após a venda
DELIMITER $
create trigger baixar_estoque_produto -- baixar estoque = tirar da reserva (estoque) e colocar para venda
after insert on EX2_ItemPedido -- Tudo que aconteceu depois que atualizou
for each row
begin
	update EX2_Produto -- Qualquer mudança na tabela..
    set quantidade = quatidade - new.quantidade -- Atualiza a quantidade no estoque
    where codproduto = new.codproduto; -- Mantém o mesmo código
end $
DELIMITER ;

-- Trigger para criar log de clientes modificados
DELIMITER $
create trigger log_clientes_modificados
after update on EX2_Cliente
for each row
begin
	insert into EX2_Log (datai, descricao)
    values
    (now(), concat('O cliente ', old.codcliente, ' foi modificado !!'));
end $
DELIMITER ;

-- Trigger para criar log de pedidos com valor total maior que R$100
DELIMITER $
create trigger log_pedidos_valor_alto
after insert on EX2_Pedido
for each row
begin
	if new.valortotal > 1000.00 then
		insert into EX2_Log(codlog, datai, descricao)
        values
        (now(), concat('O pedido ', new.codproduto, ' tem valor maior que R$1000.00'));
	end if;
end $
DELIMITER ;