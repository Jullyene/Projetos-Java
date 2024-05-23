USE estoque;

SELECT ROUTINE_DEFINITION FROM information_schema.routines WHERE ROUTINE_SCHEMA = 'estoque'
AND ROUTINE_NAME = 'BuscaProduto'AND ROUTINE_TYPE = 'PROCEDURE';

SHOW CREATE PROCEDURE BuscaProduto;

SELECT * FROM mysql.user WHERE User = 'Jullyene' OR User = 'Júlia' OR User = 'Sandro';

SELECT*FROM registro_entrada;


GRANT ALL PRIVILEGES ON `estoque`.`usuarios` TO 'Jullyene'@'localhost';
GRANT SELECT, INSERT, UPDATE ON `estoque`.`usuarios` TO 'Júlia'@'localhost';
GRANT SELECT ON `estoque`.`usuarios` TO 'Sandro'@'localhost';



/*Soma de tudo que foi vendido e soma total por produto:*/
SELECT quantidade, data_venda, valor_unitario, (quantidade * valor_unitario) AS valor_total, fk_Vendas_produto,(SELECT SUM(quantidade * valor_unitario) FROM Vendas) AS soma_total FROM Vendas;



INSERT INTO Registro_Entrada(quantidade_inicial,origem,nome_conferente,fk_Registro_Entrada_Produto) 
VALUES(45,'Apti Alimentos','Jacinto Neves',1);

INSERT INTO Registro_Entrada(quantidade_inicial,origem,nome_conferente,fk_Registro_Entrada_Produto) 
VALUES(24,'General Mills','Jacinto Neves',2);

INSERT INTO Registro_Entrada(quantidade_inicial,origem,nome_conferente,fk_Registro_Entrada_Produto) 
VALUES(24,'DFS Holding','Jacinto Neves',3);

INSERT INTO Registro_Entrada(quantidade_inicial,origem,nome_conferente,fk_Registro_Entrada_Produto) 
VALUES(24,'Germani Alimentos','Letícia Lima',4);

INSERT INTO Registro_Entrada(quantidade_inicial,origem,nome_conferente,fk_Registro_Entrada_Produto) 
VALUES(30,'Melitta South America','Letícia Lima',5);

INSERT INTO Registro_Entrada(quantidade_inicial,origem,nome_conferente,fk_Registro_Entrada_Produto) 
VALUES(25,'Filial','Letícia Lima',6);

INSERT INTO Registro_Entrada(quantidade_inicial,origem,nome_conferente,fk_Registro_Entrada_Produto) 
VALUES(29,'Dias Branco','João Souza',7);

INSERT INTO Registro_Entrada(quantidade_inicial,origem,nome_conferente,fk_Registro_Entrada_Produto) 
VALUES(33,'Dias Branco','João Souza',8);

INSERT INTO Registro_Entrada(quantidade_inicial,origem,nome_conferente,fk_Registro_Entrada_Produto) 
VALUES(42,'Dias Branco','João Souza',9);

INSERT INTO Registro_Entrada(quantidade_inicial,origem,nome_conferente,fk_Registro_Entrada_Produto) 
VALUES(43,'Orquídea Alimentos','Maria Silva',10);


/*ids dos produtos mais vendidos*/
SELECT fk_Vendas_produto, SUM(quantidade) AS total_vendido FROM Vendas GROUP BY fk_Vendas_produto
ORDER BY total_vendido DESC LIMIT 20;


/*ids dos produtos menos vendidos*/
SELECT fk_Vendas_produto, SUM(quantidade) AS total_vendido FROM Vendas GROUP BY fk_Vendas_produto
ORDER BY total_vendido ASC LIMIT 20;
 

/*Calcular baixo estoque*/
SELECT * FROM Produto WHERE quantidade < 80;



/*Dados de produtos Vencidos*/
INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Apti Bolinho de chuva tradicional 300g',11,'Vencido',6.99,'Apti Alimentos LTDA','0','2023-06-30',8642097530124);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Pão de queijo Yoki',13,'Vencido',8.29, 'General Mills',0,'2023-05-20',1234567890123);

INSERT INTO produto(nome_produto,quantidade,descricao,preco,nome_fornecedor,status_disponibilidade,data_vencimento,codigo_identificador)
VALUES('Pão de queijo Fritz e Frida', 7, 'Vencido',7.89,' DFS Holding',0,'2023-06-30',9876543210987);


/*Quantidade de produtos vencidos:*/
SELECT COUNT(*) AS numero_produtos_vencidos FROM Produto WHERE data_vencimento < CURDATE();

/*Dados dos produtos com suas respectivas categorias*/
SELECT p.*, c.nome_categoria FROM produto p JOIN categoria_produto c ON p.id_produto = c.fk_Categoria_produto_Produto;

/*
Relacionar tabela produtos com a Categoria_produtos
 Relacionar tabela produto com a subconsulta de produtos vencidos
 Relacionar posteriormente a tabela usuario com a tabela produto com a tabela Desempenho_realizacao_atividades
 Relacionar posteriormente a tabela Alerta com a tabela produto e com a tabela Eventos
 Relacionar posteriormente a tabela produto com a tabela categoria produto  
 Relacionar posteriormente essa tabela Registro_Entrada com a de Vendas*/
 
 
/*Buscar produto no Banco de Dados*/
DROP PROCEDURE IF EXISTS BuscaProduto;
DELIMITER //

CREATE PROCEDURE BuscaProduto(
    IN Nome_Produto VARCHAR(45)
)
BEGIN
    SET @Nome_Produto = CONCAT('%', Nome_Produto, '%');

    SELECT p.*
    FROM produto p
    WHERE p.nome_produto LIKE @Nome_Produto;
END //

DELIMITER ;

CALL BuscaProduto('Whey Protein brigadeiro 25g');

SELECT p.*, cp.nome_categoria
FROM produto p
JOIN categoria_produto cp ON p.id_produto = cp.fk_Categoria_produto_Produto;

SELECT p.*
FROM produto p
WHERE p.id_produto IN (
    SELECT codigo_identificador
    FROM produto
    WHERE data_vencimento < CURDATE()
);

SELECT u.*, p.* FROM usuarios u
JOIN produto p ON u.fk_usuarios_Produto = p.id_produto
JOIN Desempenho_realizacao_atividades d ON u.fk_Usuarios_Desempenho_realizacao_atividades = d.id_Desempenho_realizacao_atividades;

SELECT a.*, p.*, e.* FROM Alertas a
JOIN produto p ON a.fk_Alertas_Produto = p.id_produto
JOIN Eventos e ON a.fk_Alertas_Eventos = e.id_eventos;

SELECT p.*, cp.nome_categoria FROM produto p
JOIN categoria_produto cp ON p.id_produto = cp.fk_Categoria_produto_Produto;

SELECT re.*, v.* FROM Registro_Entrada re
JOIN Vendas v ON re.id_Registro_Entrada = v.fk_Vendas_produto;

SELECT u.*, d.* FROM usuarios u
JOIN Desempenho_realizacao_atividades d ON u.id_usuarios = d.id_Desempenho_realizacao_atividades;