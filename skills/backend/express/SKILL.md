---
name: express
description: "Use when building web apps and APIs with Express.js, middleware, and routing. Use ONLY when the task is about Express, not NestJS or Node.js."
---

# Express

Desenvolver APIs e aplicações web com Express.js, incluindo
roteamento, middlewares e configuração de servidor.

## Objetivo

Criar APIs e servidores web de forma rápida e flexível com
o framework mais popular do Node.js.

## Fluxo de Trabalho

1. Configurar servidor Express
2. Definir rotas e middlewares
3. Implementar controllers
4. Configurar error handling
5. Adicionar validação
6. Configurar CORS e seguranças

## Critérios de Qualidade

- [ ] Rotas são RESTful
- [ ] Middlewares são organizados
- [ ] Erros são tratados centralmente
- [ ] Validação está implementada
- [ ] CORS está configurado
- [ ] Logger está ativo

## Limitações

- Não tem opinionated structure (usar `@nestjs`)
- Não faz frontend (usar `@react`)
- Não gerencia estado (usar `@nestjs`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar API REST rápida
- Implementar middleware customizado
- Criar proxy reverso
- Integrar com bancos de dados

## Casos onde NÃO utilizar

- Para apps enterprise complexas (usar `@nestjs`)
- Para protótipos com estrutura (usar `@nestjs`)
- Para SSR (usar `@nextjs`)

## Exemplos

### Exemplo 1: Rota CRUD

**Entrada:**
```
Criar rotas para products
```

**Saída Esperada:**
```javascript
const express = require('express');
const router = express.Router();

router.get('/', async (req, res) => {
  const products = await Product.find();
  res.json(products);
});

router.post('/', async (req, res) => {
  const product = await Product.create(req.body);
  res.status(201).json(product);
});

router.put('/:id', async (req, res) => {
  const product = await Product.findByIdAndUpdate(req.params.id, req.body);
  res.json(product);
});

router.delete('/:id', async (req, res) => {
  await Product.findByIdAndDelete(req.params.id);
  res.status(204).send();
});

module.exports = router;
```

### Exemplo 2: Middleware de erro

**Entrada:**
```
Criar middleware para tratar erros
```

**Saída Esperada:**
```javascript
function errorHandler(err, req, res, next) {
  console.error(err.stack);
  
  res.status(err.status || 500).json({
    error: {
      message: err.message,
      ...(process.env.NODE_ENV === 'development' && { stack: err.stack })
    }
  });
}

module.exports = errorHandler;
```
