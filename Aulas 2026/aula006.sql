/*
========== EXPORTAR(BACKUP OU DUMP) BANCO DE DADOS ==========
	1. Clique em Server
    2. Data Export
		2.1 Selecione o Schema
        2.2 Selecione os objetos dentro do Schema (inclusive View's)
        2.3 Escolha se quer exportar apenas os dados (Dump Data Only), apenas a estrutura (Dump Structure Only) ou os dois/banco todo (Dump Structure and Data)
        2.4 Pode-se exportar também: Stored Procedures, Events e Triggers
        2.5 Escolha qual tipo de exportação você quer: Export to Dump Project Folder (o projeto inteiro/tudo que está na pasta) ou Export to Self-Contained File (arquivo único)
		2.6 Se quiser, marque Include Create Schema: Faz com que você não precise criar o banco de dados e usar novamente (create database e use), você vai ter que digitar o comando novamente
        2.7 Start Export
	3. Pode mexer o quanto quiser (truncate, delete, etc.)
*/

/*
========== IMPORTAR BANCO DE DADOS ==========
	1. Clique em Server
    2. Data Import
		2.1 Import from Dump Project Folder (a pasta inteira) ou Import from Self-Contained File (apenas um arquivo)
        2.2 Start Import
*/