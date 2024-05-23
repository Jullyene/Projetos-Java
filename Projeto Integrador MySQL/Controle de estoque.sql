CREATE DATABASE estoque;
DROP DATABASE estoque;

CREATE  TABLE produto(
id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_produto VARCHAR(45) NOT NULL,
quantidade INT NOT NULL,
descricao TINYTEXT,
preco DECIMAL(2) NOT NULL,
nome_fornecedor VARCHAR(45) NOT NULL,
status_disponibilidade BINARY NOT NULL,
data_vencimento DATE NOT NULL,
codigo_identificador INT NOT NULL
);

CREATE TABLE usuarios(
id_usuarios INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_usuario VARCHAR(45) NOT NULL,
senha_usuario INT UNIQUE,
grau_de_acesso VARCHAR(45),
fk_usuarios_Produto INT,
FOREIGN KEY (fk_usuarios_Produto) REFERENCES produto(id_produto),
fk_Usuarios_Desempenho_realizacao_atividades INT,
FOREIGN KEY (fk_Usuarios_Desempenho_realizacao_atividades) REFERENCES Desempenho_realizacao_atividades (id_Desempenho_realizacao_atividades)
);

CREATE TABLE Categoria_produto(
id_Categoria_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_categoria VARCHAR(45) NOT NULL,
fk_Categoria_produto_Produto INT,
FOREIGN KEY (fk_Categoria_produto_Produto) REFERENCES produto(id_produto)
);

CREATE TABLE Alertas(
id_Alertas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
produto_mais_vendidos VARCHAR(45),
produto_menos_vendidos VARCHAR(45),
baixo_estoque MEDIUMINT NOT NULL,
numero_produtos_vencidos MEDIUMINT,
tendencias MEDIUMTEXT,
notificacoes_tentativa_rebaixe DATE NOT NULL,
fk_Alertas_Produto INT,
FOREIGN KEY (fk_Alertas_Produto) REFERENCES produto(id_produto),
fk_Alertas_Eventos INT,
FOREIGN KEY (fk_Alertas_Eventos) REFERENCES Eventos(id_Eventos)
);

CREATE TABLE Eventos(
id_Eventos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
classificacao_eventos VARCHAR(45) NOT NULL
);

CREATE TABLE Eventos_Desempenho_realizacao_atividades(
fk_Eventos INT,
FOREIGN KEY (fk_Eventos) REFERENCES Eventos(id_Eventos),
fk_Desempenho_realizacao_atividades INT,
FOREIGN KEY (fk_Desempenho_realizacao_atividades) REFERENCES Desempenho_realizacao_atividades(id_Desempenho_realizacao_atividades)
);

CREATE TABLE Desempenho_realizacao_atividades(
id_Desempenho_realizacao_atividades INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
andamento_atividade_descricao MEDIUMTEXT NOT NULL,
andamento_atividade VARCHAR(45) NOT NULL
);

CREATE TABLE Vendas(
id_Vendas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
quantidade TINYINT NOT NULL,
data_venda DATE NOT NULL,
valor_unitário DECIMAL(4,2),
valor_total DECIMAL(4,2),
fk_Vendas_produto INT,
FOREIGN KEY (fk_Vendas_produto) REFERENCES produto(id_produto)
);

CREATE TABLE Registro_Entrada(
id_Registro_Entrada INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
quantidade_inicial INT NOT NULL,
origem VARCHAR(45) NOT NULL,
fornecedor VARCHAR(45) NOT NULL,
nome_conferente VARCHAR(45),
fk_Registro_Entrada_Produto INT,
FOREIGN KEY (fk_Registro_Entrada_Produto) REFERENCES produto(id_produto)
);

