---
name: nodejs
description: "Use when working with Node.js for server-side dev, APIs, and runtime config. Use ONLY when the task is about Node.js, not NestJS or Express."
---

# Node.js

Desenvolver aplicações server-side com Node.js, incluindo APIs,
servidores HTTP, e configuração do runtime.

## Objetivo

Criar aplicações backend performáticas, escaláveis e com boa
arquitetura usando o ecossistema Node.js.

## Fluxo de Trabalho

1. Configurar projeto com package.json
2. Selecionar framework apropriado
3. Implementar rotas e controllers
4. Configurar middlewares
5. Gerenciar erros e logs
6. Otimizar performance

## Critérios de Qualidade

- [ ] Código é modular e organizado
- [ ] Erros são tratados adequadamente
- [ ] Async/await é usado corretamente
- [ ] Validação de input está implementada
- [ ] Variáveis de ambiente são gerenciadas
- [ ] Dependências são atualizadas

## Limitações

- Não faz framework específico (usar `@nestjs` ou `@express`)
- Não gerencia banco de dados (usar `@mongodb`, `@postgresql`)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar API REST rápida
- Implementar servidor WebSocket
- Criar CLI tool
- Integrar com serviços externos

## Casos onde NÃO utilizar

- Para framework completo (usar `@nestjs`)
- Para APIs simples (usar `@express`)
- Para frontend (usar `@react` ou `@nextjs`)

## Exemplos

### Exemplo 1: Servidor HTTP básico

**Entrada:**
```
Criar servidor HTTP com rotas
```

**Saída Esperada:**
```javascript
const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/api/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ status: 'ok' }));
  }
});

server.listen(3000);
```

### Exemplo 2: Middleware de autenticação

**Entrada:**
```
Criar middleware para verificar token
```

**Saída Esperada:**
```javascript
function authMiddleware(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1];
  
  if (!token) {
    return res.status(401).json({ error: 'Token required' });
  }
  
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (err) {
    res.status(401).json({ error: 'Invalid token' });
  }
}
```
