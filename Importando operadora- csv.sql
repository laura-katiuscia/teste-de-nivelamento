SELECT 
    op.Razao_Social, 
    op.Nome_Fantasia, 
    SUM(f.VL_Saldo_Final - f.VL_Saldo_Inicial) AS Total_Sinistros
FROM financeiro f
JOIN operadoras op ON f.Registro_ANS = op.Registro_ANS
WHERE f.CD_Conta_Contabil = 463919 -- Código contábil de sinistros (ajustar se necessário)
AND f.Data >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY op.Razao_Social, op.Nome_Fantasia
ORDER BY Total_Sinistros DESC
LIMIT 10;
