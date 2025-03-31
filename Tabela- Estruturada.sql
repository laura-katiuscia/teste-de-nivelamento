CREATE DATABASE IF NOT EXISTS Relatorio;
USE Relatorio;-- Tabela das operadoras de saúde
CREATE TABLE IF NOT EXISTS operadoras (
   Registro_ANS INT PRIMARY KEY,
   CNPJ BIGINT NOT NULL,
   Razao_Social VARCHAR (255) NOT NULL,
   Nome_Fantasia VARCHAR (255),
   Modalidade VARCHAR (100),
   Logradouro VARCHAR (255),
   Numero INT,
   Complemento VARCHAR (255),
   Bairro VARCHAR (100),
   Cidade VARCHAR (100),
   UF CHAR (2),
   CEP VARCHAR (10),
   DDD VARCHAR (5),
   Telefone VARCHAR (15),
   Fax VARCHAR (15),
   Endereco_eletronico VARCHAR (255),
   Representante VARCHAR (255),
   Cargo_Representante VARCHAR (255),
   Regiao_de_Comercializacao INT,
   Data_Registro_ANS DATE
);-- Tabela financeira com dados contábeis e sinistros
CREATE TABLE IF NOT EXISTS financeiro (
   id INT AUTO_INCREMENT PRIMARY KEY,
   Data DATE NOT NULL,
   Registro_ANS INT,
   CD_Conta_Contabil BIGINT,
   Descricao VARCHAR (255),
   VL_Saldo_Inicial DECIMAL (15, 2),
   VL_Saldo_Final DECIMAL (15, 2),
   FOREIGN KEY (Registro_ANS) REFERENCES operadoras (Registro_ANS)
);
