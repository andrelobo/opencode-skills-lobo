---
name: javascript
description: "Use when working with JavaScript for dev, ES6+, modules, and async/await. Use ONLY when the task is about JavaScript, not TypeScript or frameworks."
---

# JavaScript

Desenvolver aplicacoes com JavaScript moderno, incluindo ES6+,
modulos, async/await, e entendimento do event loop.

## Objetivo

Criar codigo limpo, performatico e moderno usando os recursos
disponiveis do JavaScript atual (ES6+).

## Fluxo de Trabalho

1. Configurar projeto com package.json
2. Selecionar gerenciador de pacotes (npm ou yarn)
3. Usar modules (import/export) em vez de require
4. Implementar async/await para operacoes assincronas
5. Aplicar closures e higher-order functions
6. Entender e respeitar o event loop
7. Configurar ESLint para qualidade de codigo

## Critérios de Qualidade

- [ ] ES6+ e utilizado consistentemente (const, let, arrow functions)
- [ ] Modules (import/export) em vez de CommonJS require
- [ ] Async/await para promises em vez de callbacks
- [ ] Closures sao usadas para encapsulamento
- [ ] Event loop e respeitado (operacoes bloqueantes evitadas)
- [ ] package.json esta organizado com scripts uteis
- [ ] Dependencias estao atualizadas e seguras

## Limitacoes

- Nao faz tipagem estatica (usar `@typescript`)
- Nao faz framework especifico (usar `@express` ou `@nestjs`)
- Nao gerencia banco de dados (usar `@mongodb` ou `@postgresql`)
- Nao depende de plugins ou MCP servers

## Casos de Uso

- Criar scripts de automacao
- Implementar APIs com Node.js
- Processar dados com funcoes funcionais
- Integrar com APIs externas usando fetch
- Criar utilities e helpers reutilizaveis
- Manipular DOM em ambientes browser

## Casos onde NAO utilizar

- Para tipagem estatica (usar `@typescript`)
- Para frontend com React (usar `@react`)
- Para GraphQL (usar `@graphql`)
- Para testes (usar `@test-generation`)

## Exemplos

### Exemplo 1: Modulos com ES6

**Entrada:**
```
Criar modulo para servico de email
```

**Saida Esperada:**
```javascript
// emailService.js
export function sendEmail(to, subject, body) {
  return fetch('/api/email', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ to, subject, body }),
  });
}

// app.js
import { sendEmail } from './emailService.js';
```

### Exemplo 2: Async/await com error handling

**Entrada:**
```
Criar funcao para buscar dados de API externa
```

**Saida Esperada:**
```javascript
async function fetchUser(id) {
  try {
    const response = await fetch(`/api/users/${id}`);

    if (!response.ok) {
      throw new Error(`HTTP ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.error('Failed to fetch user:', error.message);
    return null;
  }
}
```

### Exemplo 3: Closure para encapsulamento

**Entrada:**
```
Criar contador com estado privado
```

**Saida Esperada:**
```javascript
function createCounter(initial = 0) {
  let count = initial;

  return {
    increment: () => ++count,
    decrement: () => --count,
    getCount: () => count,
  };
}

const counter = createCounter(10);
counter.increment();
counter.getCount();
```
