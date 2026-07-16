---
name: puppeteer
description: "Use when working with Puppeteer for automation, scraping, and PDFs. Use ONLY when the task is about Puppeteer, not Playwright."
---

# Puppeteer

Automatizar browsers com Puppeteer para scraping, geração de PDF
e automação de tarefas web.

## Objetivo

Automatizar interações com browser para scraping, geração de
relatórios e tarefas repetitivas.

## Fluxo de Trabalho

1. Configurar Puppeteer
2. Implementar navegação
3. Extrair dados
4. Gerar PDFs/screenshots
5. Tratar erros
6. Otimizar performance

## Critérios de Qualidade

- [ ] Browser é fechado corretamente
- [ ] Timeouts são configurados
- [ ] Erros são tratados
- [ ] Dados são validados
- [ ] Memória é gerenciada
- [ ] Rate limiting é implementado

## Limitações

- Não faz testes E2E (usar `@playwright`)
- não faz testes unitários
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Web scraping
- Gerar PDF de página
- Capturar screenshots
- Automatizar preenchimento de formulários

## Casos onde NÃO utilizar

- Para testes E2E (usar `@playwright`)
- Para testes de unidade
- Para APIs

## Exemplos

### Exemplo 1: Scraping básico

**Entrada:**
```
Extrair dados de uma página
```

**Saída Esperada:**
```javascript
const puppeteer = require('puppeteer');

async function scrape(url) {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  
  await page.goto(url);
  
  const data = await page.evaluate(() => {
    return Array.from(document.querySelectorAll('.item')).map(item => ({
      title: item.querySelector('h2')?.textContent,
      price: item.querySelector('.price')?.textContent
    }));
  });
  
  await browser.close();
  return data;
}
```

### Exemplo 2: Gerar PDF

**Entrada:**
```
Criar PDF de página web
```

**Saída Esperada:**
```javascript
async function generatePDF(url, outputPath) {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  
  await page.goto(url, { waitUntil: 'networkidle0' });
  
  await page.pdf({
    path: outputPath,
    format: 'A4',
    printBackground: true,
    margin: { top: '1cm', right: '1cm', bottom: '1cm', left: '1cm' }
  });
  
  await browser.close();
}
```
