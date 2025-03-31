const express = require('express');
const fs = require('fs');
const csv = require('csv-parser');
const app = express();
const port = 3000;
const cors = require('cors');

app.use(express.json());
app.use(cors());

const filePath = 'operadoras.csv'; // Nome do arquivo CSV

// Função para ler o CSV e converter para JSON
function readCSVFile() {
    return new Promise((resolve, reject) => {
        const results = [];
        fs.createReadStream(filePath)
            .pipe(csv())
            .on('data', (data) => results.push(data))
            .on('end', () => resolve(results))
            .on('error', (err) => reject(err));
    });
}

// Função para busca textual na lista de operadoras
async function searchOperadoras(query) {
    if (!query) return [];
    query = query.toLowerCase();
    const operadoras = await readCSVFile();

    return operadoras
        .map(op => {
            const relevancia = (op.razao_social.toLowerCase().includes(query) ? 2 : 0) +
                               (op.nome_fantasia.toLowerCase().includes(query) ? 1 : 0);
            return { ...op, relevancia };
        })
        .filter(op => op.relevancia > 0)
        .sort((a, b) => b.relevancia - a.relevancia);
}

// Rota de busca
app.get('/buscar', async (req, res) => {
    try {
        const { q } = req.query;
        const resultados = await searchOperadoras(q);
        res.json(resultados);
    } catch (error) {
        res.status(500).json({ error: 'Erro ao processar o arquivo CSV' });
    }
});

app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
});
