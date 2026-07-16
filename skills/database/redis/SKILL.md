---
name: redis
description: "Use when working with Redis for caching, sessions, queues, and real-time data. Use ONLY when the task is about Redis, not MongoDB or PostgreSQL."
---

# Redis

Trabalhar com Redis para caching, sessões, filas e dados
em tempo real, incluindo estruturas de dados e pub/sub.

## Objetivo

Implementar soluções de caching e dados em tempo real eficientes
com Redis.

## Fluxo de Trabalho

1. Configurar conexão Redis
2. Selecionar estrutura de dados
3. Implementar caching strategy
4. Configurar TTLs adequados
5. Implementar pub/sub quando necessário
6. Monitorar performance

## Critérios de Qualidade

- [ ] TTLs são definidos para chaves
- [ ] Estruturas de dados são adequadas
- [ ] Conexões são gerenciadas
- [ ] Memória está otimizada
- [ ] Keys seguem padrão de nomenclatura
- [ ] Pub/sub é usado para eventos

## Limitações

- Não faz persistência primária (usar `@mongodb` ou `@postgresql`)
- Não faz queries complexas (usar `@postgresql`)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Cache de sessões
- Filas de processamento
- Contadores de taxa
- Chat em tempo real

## Casos onde NÃO utilizar

- Para dados persistentes (usar `@postgresql`)
- Para dados complexos (usar `@mongodb`)
- Para cache simples (usar memória local)

## Exemplos

### Exemplo 1: Cache com TTL

**Entrada:**
```
Implementar cache para dados de usuário
```

**Saída Esperada:**
```javascript
async function getUserCached(userId) {
  const cacheKey = `user:${userId}`;
  
  // Tentar buscar do cache
  const cached = await redis.get(cacheKey);
  if (cached) {
    return JSON.parse(cached);
  }
  
  // Buscar do banco
  const user = await db.users.findById(userId);
  
  // Salvar no cache por 1 hora
  await redis.setex(cacheKey, 3600, JSON.stringify(user));
  
  return user;
}
```

### Exemplo 2: Fila com Bull

**Entrada:**
```
Criar fila para processar emails
```

**Saída Esperada:**
```javascript
const Queue = require('bull');

const emailQueue = new Queue('emails', {
  redis: { host: 'localhost', port: 6379 }
});

// Adicionar job
await emailQueue.add('send', {
  to: 'user@example.com',
  subject: 'Welcome!',
  body: 'Hello!'
});

// Processar jobs
emailQueue.process('send', async (job) => {
  await sendEmail(job.data);
});
```
