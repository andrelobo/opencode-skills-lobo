---
name: performance
description: "Use when optimizing app performance: complexity, profiling, memory, load. Use ONLY when the task is about performance, not code review."
---

# Performance

Analisar e otimizar performance de aplicações: complexidade algorítmica, profiling, memória, caching e testes de carga.

## Objetivo

Identificar gargalos de performance e aplicar otimizações eficazes com base em dados concretos e medições.

## Fluxo de Trabalho

1. Analisar complexidade algorítmica (Big O) e identificar hot spots
2. Executar profiling e detectar memory leaks
3. Avaliar e implementar caching com invalidação
4. Aplicar lazy loading onde aplicável
5. Otimizar queries de banco (índices, N+1)
6. Executar load tests com cenários realistas
7. Validar melhorias com medições antes/depois

## Critérios de Qualidade

- [ ] Profiling executado antes de otimizar
- [ ] Complexidade documentada e justificada
- [ ] Memory leaks identificados e corrigidos
- [ ] Caching com estratégia de invalidação definida
- [ ] Queries usando índices apropriadamente
- [ ] Load test com cenários realistas
- [ ] Melhorias quantificadas com métricas

## Limitações

- Não faz monitoramento contínuo (usar `@observabilidade`)
- Não altera arquitetura do sistema (usar `@arquitetura`)
- Não faz deploy de otimizações (usar `@deploy`)

## Casos de Uso

**Utilizar quando:**
- Endpoint com queries lentas ou tempo de resposta alto
- Sistema com consumo excessivo de memória
- Preparação para alta demanda (Black Friday, lançamentos)
- Refatoração de algoritmos ou bundle size ineficiente

**NÃO utilizar quando:**
- Monitoramento pós-deploy (usar `@observabilidade`)
- Mudar estrutura geral do sistema (usar `@arquitetura`)
- Problemas de disponibilidade (usar `@deploy`)
- Revisão superficial de código (usar `@code-review`)

## Exemplos

### Exemplo 1: Otimizar complexidade algorítmica

**Antes:**
```javascript
// O(n³) - loop + includes()
function findDuplicates(arr) {
  const duplicates = [];
  for (let i = 0; i < arr.length; i++) {
    for (let j = i + 1; j < arr.length; j++) {
      if (arr[i] === arr[j] && !duplicates.includes(arr[i])) {
        duplicates.push(arr[i]);
      }
    }
  }
  return duplicates;
}
```

**Depois:**
```javascript
// O(n) - Sets para busca O(1)
function findDuplicates(arr) {
  const seen = new Set();
  const duplicates = new Set();
  for (const item of arr) {
    if (seen.has(item)) duplicates.add(item);
    seen.add(item);
  }
  return [...duplicates];
}
```

### Exemplo 2: Corrigir memory leak com cache limitado

**Antes:**
```javascript
const cache = {}; // Cresce indefinidamente
function getUser(id) {
  if (!cache[id]) cache[id] = fetch(`/api/users/${id}`).then(r => r.json());
  return cache[id];
}
```

**Depois:**
```javascript
const cache = new Map();
const MAX_CACHE_SIZE = 100;

function getUser(id) {
  if (cache.has(id)) return cache.get(id);
  if (cache.size >= MAX_CACHE_SIZE) cache.delete(cache.keys().next().value);
  const promise = fetch(`/api/users/${id}`).then(r => r.json());
  cache.set(id, promise);
  return promise;
}
```
