CREATE DATABASE bd_vsconnect;

USE bd_vsconnect;


CREATE TABLE tb_usuario (
id BINARY(16) NOT NULL,
nome VARCHAR (255) NOT NULL,
email VARCHAR (255) NOT NULL UNIQUE,
senha VARCHAR(255) NOT NULL,
endereco VARCHAR(255) NOT NULL,
cep VARCHAR(10),
tipo_usuario TINYINT NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE tb_servico (
id BINARY(16) NOT NULL,
titulo VARCHAR(255) NOT NULL,
descricao TEXT NOT NULL,
proposta DECIMAL(10,2) NOT NULL,
status_servico VARCHAR(255) NOT NULL,
id_cliente BINARY(16),
id_dev BINARY(16),
PRIMARY KEY (id),
FOREIGN KEY (id_cliente) REFERENCES tb_usuario (id),
FOREIGN KEY (id_dev) REFERENCES tb_usuario (id)
);

CREATE TABLE tb_cotacao(
id BINARY(16) NOT NULL,
id_dev BINARY(16) NOT NULL,
id_servico BINARY(16) NOT NULL,
valor DECIMAL(10,2),
PRIMARY KEY (id),
FOREIGN KEY (id_dev) REFERENCES tb_usuario(id),
FOREIGN KEY (id_servico) REFERENCES tb_servico(id)
);


CREATE TABLE tb_tech(
id BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL UNIQUE,
PRIMARY KEY(id)
);

CREATE TABLE tb_dev_tech(
id_dev BINARY(16) NOT NULL,
id_tech BINARY(16) NOT NULL,
FOREIGN KEY (id_dev) REFERENCES tb_usuario(id),
FOREIGN KEY (id_tech) REFERENCES tb_tech(id)
);


CREATE TABLE tb_tech_servico (
id_tech BINARY(16) NOT NULL,
id_servico BINARY(16) NOT NULL,
FOREIGN KEY (id_tech) REFERENCES tb_tech(id),
FOREIGN KEY (id_servico) REFERENCES tb_servico(id)
);


INSERT INTO tb_usuario values (

UUID_TO_BIN (UUID()),
"Ordilei",
"Ordilei@gmail.com",
"sena@138",
"Rua Amandis,100",
"0844100",
0
);

INSERT INTO tb_tech VALUES (UUID_TO_BIN(UUID()), "html");
INSERT INTO tb_tech VALUES (UUID_TO_BIN(UUID()), "css");

SELECT BIN_TO_UUID(id), nome FROM tb_usuario;

SELECT * FROM tb_usuario WHERE id = UUID_TO_BIN("352e5787-6ed4-11ee-9e2c-b445067b7b01");

DELETE FROM tb_usuario WHERE id = UUID_TO_BIN("352e5787-6ed4-11ee-9e2c-b445067b7b01");

UPDATE tb_usuario SET tipo_usuario = 1 WHERE id = UUID_TO_BIN("5c8d7c3c-6ed7-11ee-9e2c-b445067b7b01");

SELECT * FROM tb_usuario;

/* SELECT * FROM tb_usuario; - SELECIONA TUDO DA TABELA */ 

/*SELECT BIN_TO_UUID(id), nome, tipo_usuario FROM tb_usuario;*/

SELECT * FROM tb_servico;

INSERT INTO tb_servico VALUES
    (UUID_TO_BIN(UUID()), "Dashboard", "Desenvolver uma dashboard com informações importantes do nosso controle de vendas.", "3000", "Concluído", UUID_TO_BIN("5c8d7c3c-6ed7-11ee-9e2c-b445067b7b01"), NULL),
    (UUID_TO_BIN(UUID()), "Desenvolvimento de site institucional - Gateway de Pagamento / Fintech", "Desenvolver um site responsivo que seja utilizado como uma plataforma de apresentação do nosso gateway de pagamento. O objetivo principal deste projeto é criar um site atraente e informativo, que demonstre as funcionalidades e benefícios do nosso gateway de pagamento para potenciais clientes.", "1300", "Em andamento", UUID_TO_BIN("5c8d7c3c-6ed7-11ee-9e2c-b445067b7b01"), NULL),
    (UUID_TO_BIN(UUID()), "Preciso da estrutura de uma HomePage", "Preciso fazer uma tela somente estruturada em HTML para minha empresa.", "1000", "Pendente", UUID_TO_BIN("5c8d7c3c-6ed7-11ee-9e2c-b445067b7b01"), NULL);

SELECT BIN_TO_UUID(id), nome FROM tb_tech;
SELECT BIN_TO_UUID(id), titulo FROM tb_servico;

SELECT * FROM tb_tech_servico;

INSERT INTO tb_tech_servico VALUES(
	UUID_TO_BIN("376249ab-6ed4-11ee-9e2c-b445067b7b01"), UUID_TO_BIN("f122b7ab-6edc-11ee-9e2c-b445067b7b01")
);

INSERT INTO tb_tech_servico VALUES(
	UUID_TO_BIN("376249ab-6ed4-11ee-9e2c-b445067b7b01"), UUID_TO_BIN("f122bf7d-6edc-11ee-9e2c-b445067b7b01")
);

INSERT INTO tb_tech_servico VALUES(
	UUID_TO_BIN("376249ab-6ed4-11ee-9e2c-b445067b7b01"), UUID_TO_BIN("f122c069-6edc-11ee-9e2c-b445067b7b01")
);

SELECT BIN_TO_UUID(id), nome, tipo_usuario FROM tb_usuario;
SELECT BIN_TO_UUID(id), nome FROM tb_tech;
SELECT BIN_TO_UUID(id), titulo FROM tb_servico;

SELECT * FROM tb_dev_tech;

INSERT INTO tb_dev_tech VALUES (
UUID_TO_BIN("376249ab-6ed4-11ee-9e2c-b445067b7b01"), UUID_TO_BIN("f122c069-6edc-11ee-9e2c-b445067b7b01")

);

SELECT BIN_TO_UUID(id), nome, tipo_usuario FROM tb_usuario;
SELECT BIN_TO_UUID(id), nome FROM tb_tech;
SELECT BIN_TO_UUID(id), titulo FROM tb_servico;

SELECT * FROM tb_cotacao;

INSERT INTO tb_cotacao VALUES (
UUID_TO_BIN(UUID()),
UUID_TO_BIN("5c8d7c3c-6ed7-11ee-9e2c-b445067b7b01"),
UUID_TO_BIN("f122b7ab-6edc-11ee-9e2c-b445067b7b01"),
5000.00
);
