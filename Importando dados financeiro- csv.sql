LOAD DATA INFILE 'C:/ProgramData/MySQL Server 8.0/Uploads/1T2024.csv'
INTO TABLE financeiro
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Data, @Registro_ANS, @CD_Conta_Contabil, @Descricao, @VL_Saldo_Inicial, @VL_Saldo_Final)
CHARACTER SET utf8mb4
SET 
    Data = STR_TO_DATE(@Data, '%Y-%m-%d'),
    Registro_ANS = NULLIF(@Registro_ANS, ''),
    CD_Conta_Contabil = NULLIF(@CD_Conta_Contabil, ''),
    Descricao = NULLIF(@Descricao, ''),
    VL_Saldo_Inicial = NULLIF(@VL_Saldo_Inicial, ''),
    VL_Saldo_Final = NULLIF(@VL_Saldo_Final, '');
