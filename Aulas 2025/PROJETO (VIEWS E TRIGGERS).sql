-- CRIANDO O PROJETO TSQL 2025 --
CREATE DATABASE ProjetoTSQL2025;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UTILIZANDO A BASE DE DADOS CRIADA --
USE ProjetoTSQL2025;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CRIANDO A TBLE CLIENTE --
CREATE TABLE Clientes(
	Nome VARCHAR(100),
    Endereço VARCHAR(100),
    Telefone VARCHAR(25),
    Email VARCHAR(100));
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
ALTER TABLE - Serve para realizar alterações mas tabelas. Ela espera dois argumentos:
		--> ADD - Adicionar campos na tabela;
		--> DROP - Remove campos de uma tabela.
		
Sendo assim, podemos observar que falta colocar alguns atributos como a chaave primaria na 
tabela. Tambem vamos adiconar o campo DataNascimento.
*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Clientes ADD DataNascimento DATETIME;
ALTER TABLE Clientes ADD Codigo INT AUTO_INCREMENT PRIMARY KEY;
-- Para o SQL Server substitua AUTO_INCREMENT por IDENTITY(1,1) --
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERINDO DADOS NA TABELA CLIENTES, UTILIZANDO O COMANDO INSERT / INTO --

INSERT INTO Clientes (
	Nome, 
    Endereço,
    Telefone,
    Email,
    DataNascimento)
VALUES
	("João da Silva", "Rua das Pedras, 123, São José dos Campos, SP", "(12)99752-9588", "joao@email.com", "1999-06-20"),
    ("Anderson Arantes", "Rua das Águas, 453, Maceió, AL", "(34)99654-3847", "anderson@email.com", "1970-03-23"),
    ("Ednaldo Barbosa", "Rua do Vento, 344, Belo Horizonte, MG", "(25)996438-2745", "ednaldo@email.com", "1967-01-03"),
    ("Cledemilson Borges", "Rua das Flores, 932, Rio de Janeiro, RJ", "(58)99264-7439", "cledemilson@email.com", "1984-10-16"),
    ("Silvio Santos", "Rua das Brasas, 648, Brasília, DF", "(13)99536-2648", "silvio@email.com", "2003-04-30"),
    ("Marcos Jesus", "Rua das Terras, 476, Fortaleza, CE", "(07)99740-2698", "marcos@email.com", "1990-09-11"),
    ("Marcelo Gonçalves", "Rua das Areias, 455, Cuiabá, MT", "(18)99638-2163", "marcelo@email.com", "1987-11-14"),
    ("Drauzio Júnior", "Rua das Folhas, 758, Manaus, AM", "(59)99768-3356", "drauzio@email.com", "1960-03-18"),
    ("Richard Augusto", "Rua das Neves, 998, Palmas, TO", "(74)99546-3277", "richard@email.com", "1974-12-19"),
    ("Felipe Almeida", "Rua das Gotas, 675, Salvador, BA", "(32)99556-9857", "felipe@email.com", "1991-07-01");
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Trabalhando com SELECT

O comando SELECT retorna as consultas registradas dentro do BANCO DE DADOS, como exemplo,
vamos consultar TODOS os registros da tabela CLientes utilizando  (*) para retornar todos 
os campos da tabela CIlentes.
*/
SELECT *
FROM Clientes;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Função GETDATE / CURDATE

A função GETDATE() para o SQL Server / CURDATE() para o workbench, usada para obter 
a data atual do sistema.
Você pode utlizar esse comando dentro de um contexto de consulta.
EXEMPLO:
*/
SELECT
	Codigo,
	Nome,
	now() as "Data Atual" -- GATDATE () AS [Data Atual] no Workbench ou NOW() AS "Data Atual" --
FROM
	CLientes;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Podemos adicionar ou subtrair valores diretamente da função, usando operadores aritméticos.
-- EXEMPLO --

SELECT 
	Codigo,
    Nome,
    Email,
    curdate() - 5 as "Data Atual - Cinco Dias", -- GETDATE() - 5 as [Data Atual - Cinco DIas] --
    curdate() as "Data Atual",					-- GETDATE() as [Data Atual] --
    curdate() + 5 as "Data Atual + CInco Dias"  -- GETDATE() + 5 as [Data Atual + Cinco DIas] --
FROM
	Clientes;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Trabalhando com filtro de registro com o comando WHERE

Podemos filtrar os registros que desejamos visualizar com base em determinados critérios que
atendem a necessidade de negócio utilizando o comando WHERE. com ele é possivel determinar o 
que desejamos visualizar, comparando os campos com determin=nadas condições ewstabelecidas, 
usando operadores de comparação.
*/
SELECT 
	Codigo, 
	Nome,
	Endereço, 
	Telefone,
	Email,
	DataNascimento
FROM
	Clientes
WHERE
	Codigo >= 6;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
OPERADOR AND

Podemos utilizar o operador AND para limitar ou buscar pesquisas entre um registro e outro

Para podermos realizar uma seleção de clientes que possui código maior que 2 e a 
DataNascimento maior que 10/11/87
EXEMPLO:
*/
SELECT 
	Codigo, 
	Nome,
	Endereço, 
	Telefone,
	Email,
	DataNascimento
FROM
	Clientes
WHERE
	Codigo > 2 AND DataNascimento > 19871110;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Operador OR 

Assim como o AND, o operador OR serve para retornar uma lista de registros que 
satifaz uma ou outra condição
*/
SELECT 
	Codigo, 
	Nome,
	Endereço, 
	Telefone,
	Email,
	DataNascimento
FROM
	Clientes
WHERE
	Codigo > 7 OR DataNascimento > 19890708;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Operador BETWEEN

podemos fazer comparações de faixas de dados com o comando between utiizando um valor 
inicial e um finalde comparação. Para visualizar os registros com o campo de código 
maior ou igual a 4 e com datanascimento entre 1975 e 1985:
*/
select * from clientes
where 
codigo >= 4 and DataNascimento between '19850101' and '20001231';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Operador LIKE 
você pode utilizar o operador like nos seus códigos para realizar pesquisas aproximadas em
campos de caracteres

exemplo:
para consultar todos os registros da tabela com o primeiro caractere do campo nome igual a "M": 
*/
select 
	nome, 
    codigo ,
    endereço, 
    telefone, 
    email, 
    DataNascimento
from
	clientes
where nome like 'M%';
-- O caractere % permite realizatr a consulta aproximada, podemos utilizar o % para pesquisar o 
-- começo mas tambem o final de uma string
select
	nome, 
	codigo,
	endereço, 
	telefone,
    email, 
    DataNascimento
from
	clientes
where nome like '%O';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Comando TOP para SSMS ou LIMIT para o workbench

este comando permite limitar o numero de registros que serao mostrados pela instrução select, 
a qual recebe como argumento unico o número de registros a serem mostrados pela instrução (query)
*/
select 
	codigo,
	nome,
	telefone,
    email,
	DataNascimento
from 
	clientes
limit 5;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Ordenação de registro com comando ORDER BY

para dispor os registro em uma determinada ordem utilizamos o comando order by.
ele espera apenas uma indicaçao das colunas qm que você deseja ordenar a seleção desejada

exemplo:
para colocar os registros dda table clientes em ordem alfabetica do campo nome:
*/
select 
	codigo,
	nome,
	telefone,
    email,
	DataNascimento
from 
	clientes order by nome;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Atualização dos registros com o comando UPDATE

O comando update permite atualizar registros em tables do banco de dados, alterando o valor de uma ou mais colunas 
*/
update 
	clientes
set 
	nome = "Yuri Alberto",
	endereço = "Itaquera, São Paulo, SP",
	Telefone = "(11) 99752-9588",
	DataNascimento = "20000318",
	email = "yuri@email.com"
where 
	codigo = 1;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Para verificar as alerações que foram modificadas, utilize:
select * from clientes;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Função ISNULL // IFNULL (Para o Workbench)
Esta função é utilizada para tratar campos com valores "Nulos", seja em consultas ou trechos de código SQL.
Vamos adicionar o campo CEP na tabel clientes para verificar o seu funcionamento.
*/
alter table clientes 
add CEP varchar(9);
/*
Ao executar o comando select * from clientes podemos verificar que a coluna CEP está com o identificador "null" 
em todos os registros da tabela, pois não realizamos nunhum update na coluna recém criada. Para fins de relatório 
e de apresentação de dados mais formais, é possivel trocar o identificador "null" por outro mais adequado
*/
select codigo as "Código", nome as "Nome", endereço as "Endereço", email as "Email", datanascimento as "Data de Nascimento",
ifnull(CEP, "CEP não Registrado") as CEP
from clientes;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
update clientes SET CEP = "12234-760" where Codigo = 6;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Exclusão de registros com o comando Delete
Para excluir um registro que foi inserido em uma tabela SQL, devemos utilizar o comando Delete, que assim como o 
comando Insert e Update, pode se utilizar a cláusula Where para filtrar os dados que serão excluidos

delete
clientes
where
codigo = 6; //SQL Server
*/
delete 
from clientes
where
codigo = 6;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Código Truncate Table
Para realizar a exclusao de todos os registros de uma tabela, utilizamos o comando truncate table
*/

truncate table Clientes;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Para excluir a tabel do seu banco de dados deverá utilizar o seguinte comando:
*/
drop table clientes;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Lista de Exercícios 1 - Estudo de caso de uma Biblioteca
Lista de Exercícios 2 - Estudo de caso de uma Universidade
Lista de Exercícios 3 - Estudo de caso de uma Lanchonete
*/

-- Criando a tabela produtos
create table Produtos (
	codigo int auto_increment primary key,
    descricao varchar(150),
    valor_venda numeric(4,2),
    ativo bit default(1) -- No SQLServer coloque ativo bit default(1)
);

create table Vendas (
	codigo int auto_increment primary key,
    cliente int references clientes (codigo),
    produto int,
    data_venda datetime,
    quantidade int,
    valor_venda numeric(8,2)
);

/*
Vamos criar a chave estrangeira e fazer o relacionamento da tabela VENDAS com a tabela PRODUTOS
*/

alter table Vendas add constraint fkProdutos 
foreign key(Produto) references Produtos (codigo);

/*
A instrução REFERENCES recebe como argumento a tabela e o campo em que a respectiva chave 
primária foi definida. Desta forma, todos os valores atribuidos aquela coluna devem ter 
uma correspondencia em outra tabela. O campo data_venda foi definida como DATETIME e com a instrução Default
atribuindo o valor da função GETDATE()
*/


insert into Produtos (
	descricao,
    valor_venda,
    ativo)
values
	("3DS MAX 2024- MODELAGEM, RENDER, EFEITOS", 161.90, 1),
    ("MICROCONTROLADORES ARDUÍNO, ELÉTRICA, EFEITOS", 181.20, 1),
    ("ACIONAMENTOS ELÉTRICOS", 94.00, 1),
	("ELETRÔNICA BÁSICA E PROJETOS COM ARDUÍNO", 129.50, 1),
    ("AUTOMAÇÃO INDUSTRIAL COM CLPs", 199.00, 1),
    ("INTRODUÇÃO À IMPRESSÃO 3D", 85.00, 1),
    ("REVIT PARA ARQUITETURA", 174.90, 1),
    ("PROGRAMAÇÃO C++ PARA ROBÓTICA", 112.30, 1),
    ("SOLDAGEM ELÉTRICA – TEORIA E PRÁTICA", 98.70, 1),
    ("DESENHO TÉCNICO MECÂNICO", 120.00, 1);
    
insert into Vendas(
	cliente,
    produto,
    data_venda,
    quantidade,
    valor_venda)
values
	(1, 2, "20250514", 5, 84.00),
    (5, 9, "20250203", 2, 177.50),
    (3, 4, "20240210", 3, 150.00),
    (4, 7, "20250520", 1, 230.00),
    (2, 3, "20250301", 7, 210.00),
    (6, 5, "20240418", 4, 98.00),
    (7, 8, "20250615", 10, 540.00),
    (8, 1, "20250707", 2, 115.50),
    (9, 6, "20250125", 6, 125.00),
    ( 10, 10, "20250910", 8, 340.00);
    
/*
TEORIA DOS CONSJUNTOS E OS JOINS DE BD
O JOIN é uma cláusula de linguagem SQL que permite criar consultas combinando 
	resultados de uma ou duas tabelas por meio de valores comuns entre uma ou 
    varias colunas de cada tabela. Quando se fala de uma tabela, a referencia é
    feita a casos especificos cahmadas de JOIN de uma tabela com ela mesma;
    
COMANDO INNER JOIN 
O INNER JOIN consulta os registros de duas tabelas, verificando todos os
	regitros de cada um e selecionando os que tem valores em comum, com base no
    critério estabelecendo no JOIN.
Neste BD, criamos tres tabelas, sendo Clientes, Produtos e Vendas
	Estabelecemos dois relacionamentos entre Clientes e Vendas, e entre as tabelas 
    Produtos e Vendas, desta forma não é possivel inserir Vendas com Clientes que
    não existem, mas é possivel que existam Clientes que não realizam Vendas.
Para listar o Nome de cada Cliente e a data_venda tambem de cada Cliente, podemos 
	usar o comando INNER JOIN.
*/

select Nome, data_venda
from clientes c
inner join vendas v on (c.codigo = v.cliente);

/*
O INNER JOIN é considerado o tipo de JOIN padrão. Podemos executar o mesmo comando 
	anterior com outra sintaxe eliminando o INNER JOIN e obteremos o mesmO resultado
*/

select 
	nome,
    data_venda
from
	clientes c
join vendas v on (c.codigo = v.cliente);

/*
Com o INNER JOIN estamos trazendo a interação dos registros da tabela Clientes
	(ou conjunto A) e da tabela Vendas (conjunto B). 
*/

/*
COMANDO LEFT JOIN	

O left join, entre duas tabela hipoteticas A e B, vai trazer todos os registros da 
	tabela A independentemente  do critério estabelecido no JOIN, OU seja, se a tabela 
    A contem 100 registros e nenhum deles tem um correspondente na outra, baseado no 
    critério de comparação, ainda assim vai trazer 100 regsitros, porém onde a 
    correspondencia existir, os dados correspondentes serão registrados
*/

select 
	nome
    data_venda 
from 
	clientes c
left join vendas v on (c.codigo = v.cliente);

/*
COMANDO RIGT JOIN

O RIGHT JOIN produz um resultado semelhante ao LEFT JOIN, porém com a inversão da comparação
EX: em nosso BD criamos uma tabela chamada Produtos que se relaciona com a tabela Vendas.
	Podemnos listar  descrição de todos os produtos e a data de venda de cada um deles junto
	com os produtos que não realizaram vendas através de uma query.
*/

select 
	descricao,
    data_venda
from 
vendas v
right join produtos p on (p.codigo = v.produto);

/*
COMANDO CASE

O comando case avalia uma lista de condições verificadas em um ou mais campos e retorna apenas um (1) de vários (n) resultados possíveis
SINTAXE:

SELECT
	CASE
		WHEN <EXPRESSÃO LÓGICA 1>
			THEN <RESULTADO DA EXPRESSÃO 1>
		WHEN <EXPRESSÃO LÓGICA 2>
			THEN <RESULTADO DA EXPRESSÃO 2>
	ELSE
		<RESULTADO FORA DAS CONDIÇÕES LISTADAS>
	END
FROM
	<TABELA>
*/

select
	Codigo,
    Descricao,
    case
		when ValorVenda between 0 and 100
			then 'Bronze'
		when ValorVenda between 101 and 200
			then 'Prata'
		when ValorVenda between 201 and 300
			then 'Ouro'
		when ValorVenda > 300
			then 'Platina'
	else
		'Não Classificado!'
	end as 'Tipo do Produto' -- No SQLServer coloque end as [Tipo do Produto]
from
	Produtos;
    
/*
FUNÇÕES DE AGREGAÇÃO

As funções de agregação realizam cálculos com um conjunto de valores determinados pela condição estabelecida em cláusulas GROUP BY, retornando um valor único para aquele conjunto.
Para que você possa entender melhor a utilização das funções de agregação, vamos utilizar diversos exemplos.

-- USO DO COUNT --
A função COUNT pode ser usada para contar o número de registros estabelecidos em uma condição GROUP BY. Exemplo: Para contar o número de compras realizadas por cada cliente em um
determinado dia, podemos usar o seguinte script:
*/

select
	Nome,
    DataVenda,
    count(*) as TotalVendas
from Clientes C
inner join Vendas V on (V.Cliente = C.Codigo)
group by
	Nome, DataVenda;
    
/*
Soma dos valores com SUM

A função SUM soma valores numéricos em um conjunto de valores estabelecidos pelo GROUP BY. A tabela VENDAS tem um campo determinado "ValorVenda", que armazena o valor pelo qual
o produto foi vendido. Podemos executar o seguinte script para conhecer o valor vendido para cada cliente
*/

select
	Nome,
    DataVenda,
    sum(ValorVendas) as TotalVendas
from
	Clientes C
inner join Vendas V on (V.Cliente = C.Codigo)
group by Nome, DataVenda;

		-- OUTRA FORMA --
select
	Nome,
    P.Descricao,
    V.ValorVenda as TotalVendas,
    P.ValorVenda as ValorVendaProduto,
    (V.ValorVenda - P.ValorVenda) as Descricao
from
	Clientes C
inner join Vendas V on (V.Cliente = C.Codigo)
inner join Produtos P on (V.Produtos = P.Codigo)
order by Nome;

/*
A query anterior retorna uma listagem de cada um dos clientes e os produtos comprados por eles, assim como o valor venda, o valor de venda cadastrado na tabela produtos (coluna "Valor
VendaProduto") e o cálculo do desconto ofertado ao cliente, que é a diferença entre o valor de venda e o valor de venda cadastrado na tabela produtos. Para calcularmos o total de vendas
e o total de desconto para cada cliente, podemos executar:
*/

select
	Nome,
    sum(V.ValorVenda) as TotalVendas,
    sum(quantidade * P.ValorVenda) as ValorVendaProduto,
    sum(quantidade * V.ValorVenda) - sum (quantidade * P.ValorVenda) as Desconto
from
	Clientes C
inner join Vendas V on (V.Cliente = C.Codigo)
inner join Produtos P on (V.Produto = P.Codigo)
group by Nome;

/*
Comando AVG

O comando AVG tira a média aritmética do ValorVenda da tabela Vendas utilizamos:
*/

select
	avg (ValorVenda) as MediaValorVenda
from
	Vendas;
    
/*
Outra função de agregação é a instrução MIN e MAX, onde:
	--> MIN - Valor MÍNIMO de um conjunto de valores
	--> MAX - Valor MÁXIMO de um conjunto de valores
*/

-- Utilização do MIN --
select
	Nome,
    min(ValorVenda) as MenorVenda
from
	Clientes C
inner join Vendas V on (C.Codigo = V.Codigo)
group by C.Nome;

-- Utilização do MAX --

select
	Nome,
    max(ValorVenda) as MaiorVenda
from
	Clientes C
inner join Vendas V on (C.Codigo = V.Codigo)
group by C.Nome;

/*
CRIACAO DOS VIEWS

Uma view é uma tabela criada 'virutalmente' atraves de uma QUERY, que define seu conteudo e metadados.

A VIEW tem uma série de propósitos como por exemplo, fazer com que todos os desenvolvedores
ultiizem a mesma regra de negocio ao acessar um SET de dados
ou, por questoes de seguranca limitar o acesso aos objetos propriamente ditos para determinados usuarios, delegando a eles acesso apenas as VIEWS.

A sintaxe para criacao da VIEW é bastante simples. Basta ultilizar o comando Create VIEW informando como argumento o nome da view a ser criada,
o prefixo as e a query definira a consulta a ser realizada.

Exemplo: para cria uma view listando apenas os clientes ativos ultiliza-se:
*/

Create View vwClientesAtivos
	AS
		SELECT
        Codigo,
        Descricao,
        ValorVenda,
        Ativo
From
	Produtos
Where
	Ativo = 1;
    
/*
Para acessar a VIEW criada, ultilizamos:
*/
select * from vwClientesAtivos;

/*
CRIAÇÃO DAS TRIGGERS

--> Trigger, do inglês, significa gatilho. No contexto de banco de dados, triggers são procedimentos armazenados, disparados por eventos de atualização, exclusão ou inserção
	em tabelas do SGBD

--> Para entender melhor como aplicar trigger em nosso exemplo, vamos acompanhar:
	Criar uma tabela denominada ProdutoHistorico, que deve armazenas todas as alterações realizadas na tabela Produtos
    --> Primeiramente vamos criar a tabela ProdutoHistorico, que deve ter a mesma estrutura da tabela Produtos, com um campo adicional denominado DataAlteracao
    que vai armazenar a data da operação e um campo TipoAlteracao que vai armazenar um string. Na atualização é preciso diferenciar os valores como estavam antes do
    UPDATE e como ficaram depois do UPDATE.
Vamos observar:

DELIMITER $$ -- Assim que começa a Trigger
	create trigger UpdateProduto -- Quais foram as atualizações (Update) de preço
    before update on Produtos -- Todos os produtos antes do Update (Pode ter After)
    for each row
    begin
		insert into ProdutoHistorico(Codigo, Descricao, ValorVenda, Ativo, DataAlteracao, TipoAlteracao)
        values (old.Codigo, old.Descricao, old.ValorVenda, old.Ativo, curdate(), 'Update OLD'); -- Puxando tudo que foi modificado
        insert into ProdutoHistorico(Codigo, Descricao, ValorVenda, Ativo, DataAlteracao, TipoAlteracao)
        values (new.Codigo, new.Descricao, new.ValorVenda, new.Ativo, curdate(), 'Update NEW'); -- Puxando tudo que foi modificado
	END
DELIMITER;

Observe que a Trigger deve referenciar sempre uma tabela, portanto a declaração de criação do procedimento: CREATE TRIGGER UpdateProdutos
O argumento FOR UPDATE determina que a Trigger captura apenas os eventos de atualização de dados. Os eventos de inserção e exclusão não serão
capturados pela Trigger

No corpo da TRIGGER, no contexto UPDATE, o desenvolvedor tem acesso a duas tabelas virtuais, sendo INSERTED e DELETED
	--> INSERTED - é um set de dados com os novos valores
    --> DELETED - é um set de dados com valores antigos
*/

update Produtos
	set Descricao = 'Tecnologia em Python 4° Edição'
    where Codigo = 3;
    
-- Agora para executar essa consulta na tabela ProdutoHistorico:
select * from ProdutoHistorico;

/*
Algumas opções de eventos que podem ser aplicadas à Trigger:
	--> BEFORE INSERT
    --> AFTER INSERT
    --> BEFORE UPDATE
    --> AFTER UPDATE
    --> BEFORE DELETE
    --> AFTER DELETE
*/