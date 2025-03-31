SELECT 
    op.Razao_Social, 
    op.Nome_Fantasia, 
    SUM(f.VL_Saldo_Final - f.VL_Saldo_Inicial) AS Total_Despesas
FROM financeiro f
JOIN operadoras op ON f.Registro_ANS = op.Registro_ANS
WHERE f.CD_Conta_Contabil LIKE '4639%' -- Padrão de código para despesas médicas hospitalares
AND f.Data >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY op.Razao_Social, op.Nome_Fantasia
ORDER BY Total_Despesas DESC
LIMIT 10;

