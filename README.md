# 🏦 BCB GraphQL API

Uma API moderna desenvolvida em Python que atua como uma camada (wrapper) inteligente sobre os dados públicos e endpoints REST do **Banco Central do Brasil (BCB)**. O objetivo principal é unificar e transformar consultas complexas de dados econômicos em queries eficientes utilizando **GraphQL**, além de tratar grandes volumes de séries temporais com **Pandas**.

## 🚀 Funcionalidades & Arquitetura

- **Camada GraphQL:** Permite que o cliente (seja um app mobile ou dashboard) solicite exatamente os campos que precisa (ex: apenas o valor da Taxa Selic de um período específico), evitando *overfetching*.
- **Data Pipeline com Pandas:** Os dados brutos vindos das APIs do Banco Central (frequentemente em formatos legados ou JSONs densos) são injetados em DataFrames do Pandas para limpeza, tratamento de valores nulos, conversão de tipos de dados e indexação temporal de forma performática.
- **Ambiente Isolado:** Arquitetura limpa utilizando ambientes virtuais nativos (`venv`) do Python.

## 🛠️ Stack Técnica

- **Linguagem:** Python 3.11+
- **Framework Web:** FastAPI (Alta performance e documentação assíncrona nativa)
- **GraphQL:** Strawberry / Ariadne (Engine GraphQL baseada em tipagem moderna)
- **Análise de Dados:** Pandas (Manipulação e higienização das séries temporais)
- **Servidor:** Uvicorn

## 📈 Exemplo de Query Planejada (GraphQL)

```graphql
query GetEconomicIndicator {
  indicador(nome: "SELIC") {
    nome
    unidade
    series(dataInicio: "2026-01-01", dataFim: "2026-05-01") {
      data
      valor
    }
  }
}
