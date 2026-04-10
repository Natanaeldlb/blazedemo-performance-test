# 🧪 Teste de Performance – BlazeDemo

## 📌 Objetivo

Este projeto tem como objetivo validar o desempenho da aplicação **BlazeDemo** no cenário de compra de passagem aérea, garantindo que o sistema suporte carga e mantenha tempos de resposta aceitáveis.

---

## 🌐 Sistema testado

URL: https://www.blazedemo.com

---

## 🎯 Cenário testado

Fluxo completo de compra de passagem aérea:

1. Buscar voos (Manaus → Recife)
2. Selecionar voo disponível
3. Preencher dados do comprador
4. Finalizar compra

---

## ⚙️ Ferramentas utilizadas

* Apache JMeter 5.6.3
* Java (JDK 11+)
* Execução via CLI (non-GUI mode)

---

## 🚀 Configuração do teste

* Usuários virtuais: 100 threads
* Ramp-up: 10 segundos
* Duração: 60 segundos
* Throughput configurado: ~250 requisições por segundo

---

## ▶️ Como executar

1. Acesse a pasta do projeto:

```bash
cd blazedemo-performance-test
```

2. Execute o teste:

```bash
jmeter -n -t scripts/TestPlan.jmx -l reports/results.jtl
```

3. Gerar relatório HTML:

```bash
jmeter -g reports/results.jtl -o reports/html_report
```

4. Abrir relatório:

```bash
reports/html_report/index.html
```

## Execução automatizada

O projeto possui integração com GitHub Actions para execução automática dos testes de performance a cada push na branch main.

O relatório é gerado e disponibilizado como artifact da pipeline.


---

## 📊 Resultados obtidos

* Throughput médio: **158.95 req/s**
* Percentil 90 (P90): **~4.1 segundos**
* Tempo médio de resposta: **~1.3 segundos**
* Taxa de erro: **32.38%**

---

## ❌ Critério de aceitação

* 250 requisições por segundo
* Percentil 90 menor que 2 segundos

---

## 📉 Análise dos resultados

O sistema **não atendeu ao critério de aceitação**.

Principais pontos:

* O throughput ficou abaixo do esperado (158.95 req/s vs 250 req/s)
* O tempo de resposta no percentil 90 ultrapassou o limite aceitável (4.1s)
* Foi identificada uma alta taxa de erro (32%)

---

## ⚠️ Problema identificado

A etapa **"Finalizar compra" apresentou 100% de falhas**, impactando diretamente o resultado geral do teste.

Isso ocorre devido à ausência de correlação de dados dinâmicos no script (ex: seleção do voo retornado na etapa anterior).

---

## 💡 Considerações técnicas

* O BlazeDemo é um ambiente de demonstração e não está preparado para alta carga
* A falta de correlação impacta a consistência do fluxo
* O aumento da carga evidenciou degradação de performance da aplicação

---

## 🏁 Conclusão

O sistema não suporta a carga proposta mantendo os requisitos de desempenho estabelecidos.

Para cenários reais, seria necessário:

* Implementar correlação de dados no script
* Ajustar a infraestrutura da aplicação
* Realizar testes com diferentes perfis de carga (carga e pico)

---

## 📁 Estrutura do projeto

```
blazedemo-performance-test/
├── scripts/
│   └── TestPlan.jmx
├── reports/
│   ├── results.jtl
│   └── html_report/
├── jmeter.log
└── README.md
```