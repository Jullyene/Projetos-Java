USE estoque;
SELECT*FROM mysql.user;
/*DESCRIBE usuarios;*/
SELECT*FROM usuarios;

SELECT*FROM produto;

SELECT*FROM Desempenho_realizacao_atividades;

SELECT*FROM Eventos;

ALTER TABLE Vendas DROP COLUMN valor_total;

ALTER TABLE Vendas CHANGE COLUMN valor_unitário valor_unitario DECIMAL(10,2);

ALTER TABLE Registro_Entrada DROP COLUMN fornecedor;

SELECT*FROM eventos_desempenho_realizacao_atividades;



ALTER TABLE produto MODIFY COLUMN codigo_identificador BIGINT NOT NULL;
ALTER TABLE produto MODIFY COLUMN preco DECIMAL(4,2) NOT NULL;
ALTER TABLE produto MODIFY COLUMN status_disponibilidade TINYINT NOT NULL;

CREATE USER 'Jullyene'@'localhost' IDENTIFIED BY 'xinximplim09:)_';
SET @hash_senha = bcrypt_hash('xinximplim09:)_', 12);
INSERT INTO usuarios (nome_usuario, senha_usuario, grau_de_acesso, fk_usuarios_Produto, fk_Usuarios_Desempenho_realizacao_atividades)
VALUES ('Jullyene', @hash_senha, 'acesso_total', 1, 1);

CREATE USER 'Júlia'@'localhost' IDENTIFIED BY 'pipocaSaudave(:_=';
SET @hash_senha = bcrypt_hash('pipocaSaudave(:_=', 12);
INSERT INTO usuarios (nome_usuario, senha_usuario, grau_de_acesso, fk_usuarios_Produto, fk_Usuarios_Desempenho_realizacao_atividades)
VALUES ('Júlia', @hash_senha, 'acesso_leitura_gravação', 2, 2);

CREATE USER 'Sandro'@'localhost' IDENTIFIED BY '1895AS40;)_-';
SET @hash_senha = bcrypt_hash('1895AS40;)_-', 12);
INSERT INTO usuarios (nome_usuario, senha_usuario, grau_de_acesso, fk_usuarios_Produto, fk_Usuarios_Desempenho_realizacao_atividades)
VALUES ('Sandro', @hash_senha, 'acesso_leitura', 3, 2);




INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Apti Bolinho de chuva tradicional 300g',9,'Produto está presente apenas na prateleira, zerado no depósito',6.99,'Apti Alimentos LTDA','1','2023-07-31',8642097530124);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Pão de queijo Yoki',23,'Produto presente apenas na prateleira, zerado no depósito',8.29, 'General Mills',1,'2023-08-04',1234567890123);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Pão de queijo Fritz e Frida', 1, 'Produto presente apenas na prateleira, zerado no depósito',7.89,' DFS Holding',1,'2023-07-31',9876543210987);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Germani Maria',2,'Produto presente apenas na prateleira, zerado no depósito',8.25,'Germani Alimentos',1,'2025-03-17',5312708641751);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Melitta 500g extraforte', 7,'Produto presente nas prateleiras e no depósito com variação de datas de vencimento',14.69,'Melitta South America',1,'2024-05-27',2468135795312);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Whey Protein brigadeiro 25g',18,'Produto presente apenas na prateleira,o mesmo não pode ficar no depósito, todas as unidades devem ir para a prateleira logo quando chegam',4.99,'Whey Protein Growth',1,'2024-02-24',8901234561315);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Piraquê maizena 200g',17,'Produto presente apenas na prateleira, zerado no depósito',7.99,'Dias Branco',1,'2023-08-02',2468135795316);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Isabela Picnic 350g',2,'Produto presente apenas na prateleira, zerado no depósito',7.99,'Dias Branco',1,'2023-12-07',9876543215439);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Isabela Cream cracker 350g',18,'Produto presente na prateleira e no depósito',6.99,'Dias Branco',1,'2024-02-02',4567890123012);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Orquídea leite 400g',16,'Produto presente apenas na prateleira',8.15,'Orquídea Alimentos',1,'2023-08-10',8901234567892);



INSERT INTO Desempenho_realizacao_atividades(andamento_atividade_descricao,andamento_atividade)
VALUES('Reposição do café Bom Jesus Tradicional 500g','FAZENDO');

INSERT INTO Desempenho_realizacao_atividades(andamento_atividade_descricao,andamento_atividade)
VALUES('Reposição do leite condensado Italac 395g','FAZENDO');

INSERT INTO Desempenho_realizacao_atividades(andamento_atividade_descricao,andamento_atividade)
VALUES('Reposição do biscoito Germani Sortido 800g','FAZENDO');

INSERT INTO Desempenho_realizacao_atividades(andamento_atividade_descricao,andamento_atividade)
VALUES('Reposição do Filtro de Papel Brigitta 103','FEITO');

INSERT INTO Desempenho_realizacao_atividades(andamento_atividade_descricao,andamento_atividade)
VALUES('Reposição do Filtro de Papel Brigitta 102','FEITO');

INSERT INTO Desempenho_realizacao_atividades(andamento_atividade_descricao,andamento_atividade)
VALUES('Reposição do Achocolatado Nescau 370g','FEITO');

INSERT INTO Desempenho_realizacao_atividades(andamento_atividade_descricao,andamento_atividade)
VALUES('Reposição de biscoito Germani Mignon',' À FAZER');

INSERT INTO Desempenho_realizacao_atividades(andamento_atividade_descricao,andamento_atividade)
VALUES('Reposição de biscoito Água e Sal Zezé',' À FAZER');

INSERT INTO Desempenho_realizacao_atividades(andamento_atividade_descricao,andamento_atividade)
VALUES('Reposição de biscoito Anelu Goiaba', 'À FAZER');


INSERT INTO Eventos(classificacao_eventos) VALUES('Leve');
INSERT INTO Eventos(classificacao_eventos) VALUES('Moderado');
INSERT INTO Eventos(classificacao_eventos) VALUES('Alto');


ALTER TABLE Alertas
DROP COLUMN produto_mais_vendidos,
DROP COLUMN produto_menos_vendidos,
DROP COLUMN baixo_estoque,
DROP COLUMN numero_produtos_vencidos;


INSERT INTO Alertas(tendencias,notificacoes_tentativa_rebaixe,fk_Alertas_Produto,fk_Alertas_Eventos)
VALUES('Tendência sazonal','2023-07-31',1,1);

INSERT INTO Alertas (tendencias, notificacoes_tentativa_rebaixe, fk_Alertas_Produto, fk_Alertas_Eventos)
VALUES ('Tendência de crescimento', '2023-08-04', 1, 2);

INSERT INTO Alertas (tendencias, notificacoes_tentativa_rebaixe, fk_Alertas_Produto, fk_Alertas_Eventos)
VALUES ('Tendência de declínio', '2023-07-31', 2, 3);

/*Alertar quando um produto tem prazo dentre 15 dias para vencer: (tirando como referência a data do computador e calculando os produtos no intervalo de 15 dias)*/
SELECT * FROM produto WHERE data_vencimento <= DATE_ADD(NOW(), INTERVAL 15 DAY);


INSERT INTO Vendas(quantidade,data_venda,valor_unitário,fk_Vendas_produto)
VALUES(30,'2023-07-01',6.99,1);

INSERT INTO Vendas(quantidade,data_venda,valor_unitário,fk_Vendas_produto)
VALUES(10,'2023-07-04',8.29,2);

INSERT INTO Vendas(quantidade,data_venda,valor_unitário,fk_Vendas_produto)
VALUES(5,'2023-06-01',7.89,3);

INSERT INTO Vendas(quantidade,data_venda,valor_unitário,fk_Vendas_produto)
VALUES(8,'2023-05-01',8.25,4);

INSERT INTO Vendas(quantidade,data_venda,valor_unitário,fk_Vendas_produto)
VALUES(2,'2023-07-15',14.69,5);

INSERT INTO Vendas(quantidade,data_venda,valor_unitário,fk_Vendas_produto)
VALUES(9,'2023-07-14',4.99,6);

INSERT INTO Vendas(quantidade,data_venda,valor_unitário,fk_Vendas_produto)
VALUES(6,'2023-07-09',7.99,7);

INSERT INTO Vendas(quantidade,data_venda,valor_unitário,fk_Vendas_produto)
VALUES(1,'2023-07-06',7.99,8);

INSERT INTO Vendas(quantidade,data_venda,valor_unitário,fk_Vendas_produto)
VALUES(4,'2023-07-05',6.99,9);

INSERT INTO Vendas(quantidade,data_venda,valor_unitário,fk_Vendas_produto)
VALUES(15,'2023-07-16',8.15,10);


INSERT INTO Eventos_desempenho_realizacao_atividades(fk_eventos,fk_Desempenho_realizacao_atividades)
VALUES(1,2);

INSERT INTO Eventos_desempenho_realizacao_atividades(fk_eventos,fk_Desempenho_realizacao_atividades)
VALUES(2,2);

INSERT INTO Eventos_desempenho_realizacao_atividades(fk_eventos,fk_Desempenho_realizacao_atividades)
VALUES(3,2);


INSERT INTO categoria_produto(nome_categoria,fk_Categoria_produto_Produto) VALUES('Mercearia',1);

INSERT INTO categoria_produto(nome_categoria,fk_Categoria_produto_Produto) VALUES('Mercearia',2);

INSERT INTO categoria_produto(nome_categoria,fk_Categoria_produto_Produto) VALUES('Mercearia',3);

INSERT INTO categoria_produto(nome_categoria,fk_Categoria_produto_Produto) VALUES('Mercearia',4);

INSERT INTO categoria_produto(nome_categoria,fk_Categoria_produto_Produto) VALUES('Mercearia',5);

INSERT INTO categoria_produto(nome_categoria,fk_Categoria_produto_Produto) VALUES('Mercearia',6);

INSERT INTO categoria_produto(nome_categoria,fk_Categoria_produto_Produto) VALUES('Mercearia',7);

INSERT INTO categoria_produto(nome_categoria,fk_Categoria_produto_Produto) VALUES('Mercearia',8);

INSERT INTO categoria_produto(nome_categoria,fk_Categoria_produto_Produto) VALUES('Mercearia',9);

INSERT INTO categoria_produto(nome_categoria,fk_Categoria_produto_Produto) VALUES('Mercearia',10);
