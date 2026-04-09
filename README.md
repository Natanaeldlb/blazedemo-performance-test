# Teste de Performance - Blazedemo

## Objetivo
Automatizar um teste de carga para o cenário de compra de passagem aérea no site [Blazedemo](https://www.blazedemo.com), garantindo que o sistema suporte 250 requisições por segundo com tempo de resposta 90th percentil inferior a 2 segundos.

---

## Estrutura do Repositório
```text
blazedemo-performance-test/
├── README.md
├── scripts/
│   └── Test Plan.jmx       # Script do JMeter
├── reports/
│   ├── results.jtl              # Resultados do teste
│   └── html_report/             # Relatório HTML do teste
└── data/                        # Massa de dados (opcional)
````

---

## Instruções de Execução

1. **Instalar o Apache JMeter**

   * Download: [https://jmeter.apache.org/download_jmeter.cgi](https://jmeter.apache.org/download_jmeter.cgi)

2. **Abrir o Script**

   * Abra o JMeter → `File → Open` → selecione `scripts/blazedemo_test.jmx`

3. **Configurar o Thread Group**

   * Para teste de carga: 250 requisições/segundo
   * Para teste de pico: simular picos maiores conforme necessidade

4. **Executar o teste**

   * Clique em **Start** no JMeter
   * Os resultados serão salvos em `reports/results.jtl`

5. **Gerar relatório HTML**

   * Abra o terminal na pasta do repositório
   * Rode o comando:

     ```bash
     jmeter -g reports/results.jtl -o reports/html_report
     ```
   * Abra `reports/html_report/index.html` no navegador para visualizar os gráficos

---

## Relatório de Execução

* **Requisições por segundo:** 250
* **90th Percentil:** [INSIRA O VALOR DO SEU TESTE] ms
* **Tempo médio:** [INSIRA O VALOR DO SEU TESTE] ms
* **Critério de aceitação:** 90th percentil < 2000 ms

> ✅ O critério de aceitação **foi atendido** / ❌ **não foi atendido**
> Motivo: [explique se o sistema manteve a performance ou apresentou lentidão]

---

## Considerações

* O teste foi realizado simulando a compra completa de uma passagem aérea:

  1. Acessar página inicial
  2. Seleção de origem/destino
  3. Seleção de voo
  4. Preenchimento do formulário de compra
* Em cenários de pico, é recomendado aumentar a capacidade do servidor para manter o 90th percentil abaixo de 2s
* O script pode ser reutilizado e ajustado para outros volumes de carga ou diferentes endpoints

---