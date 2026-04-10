# 🚀 Teste de Performance - BlazeDemo

## 📌 Objetivo

Este projeto tem como objetivo validar a performance do fluxo de **compra de passagem aérea** no site:

```
https://www.blazedemo.com
```

O teste foi desenvolvido utilizando **Apache JMeter**, simulando carga de usuários para avaliar o comportamento da aplicação sob estresse.

---

## 🎯 Cenário testado

Fluxo completo de compra de passagem:

1. Buscar voos
2. Selecionar voo
3. Finalizar compra

Critério de aceitação:

* ✔ 250 requisições por segundo (RPS)
* ✔ Percentil 90 (P90) menor que 2 segundos

---

## ⚙️ Tecnologias utilizadas

* Apache JMeter 5.6.3
* Java (JDK 17+)
* Git / GitHub
* Bash (execução via terminal)

---

---

## ▶️ Como executar o teste

### 1. Pré-requisitos

* Java instalado
* JMeter configurado no PATH

### 2. Executar o teste

```bash
bash run-test.sh
```

---

## 📊 Resultados obtidos

### 🔢 Métricas gerais

* Total de requisições: **10.461**
* Throughput médio: **~159 req/s**
* Tempo médio de resposta: **~1309 ms**
* Percentil 90 (P90): **~3035 ms**
* Taxa de erro: **~32%**

---

### 📍 Detalhamento por etapa

| Etapa            | Erros | Observação               |
| ---------------- | ----- | ------------------------ |
| Buscar voos      | 0%    | Funcionando corretamente |
| Selecionar voo   | 0%    | Funcionando corretamente |
| Finalizar compra | 100%  | Falha total              |

---

## ❌ Validação do critério de aceitação

| Critério               | Resultado                   |
| ---------------------- | --------------------------- |
| 250 req/s              | ❌ Não atingido (~159 req/s) |
| P90 < 2s               | ❌ Não atendido (~3s)        |
| Taxa de erro aceitável | ❌ Não atendido (~32%)       |

---

## 🔍 Análise técnica

Durante a execução do teste, foi identificado que:

* O sistema não conseguiu sustentar a carga de 250 requisições por segundo
* O tempo de resposta ultrapassou o limite estabelecido
* A etapa de **finalização da compra apresentou 100% de falha**

Possíveis causas:

* Falta de correlação completa de dados dinâmicos (ex: flightId)
* Limitação da própria aplicação BlazeDemo (ambiente de teste)
* Saturação sob carga elevada

---

## ⚠️ Conclusão

O sistema **não atendeu aos critérios de aceitação** definidos no desafio.

Foi possível observar degradação de performance sob carga, além de falhas funcionais no fluxo completo de compra.

---

## 💡 Considerações finais

* O teste demonstra corretamente a execução de um cenário real de ponta a ponta
* Os resultados indicam limitações da aplicação sob carga
* A análise evidencia pontos críticos de melhoria no sistema ou no fluxo testado

---

## 👨‍💻 Autor

@NatanaelLima - Projeto desenvolvido para fins de avaliação técnica em testes de performance.
