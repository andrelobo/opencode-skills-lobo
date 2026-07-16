---
name: mongodb
description: "Use when working with MongoDB for NoSQL database design and queries. Use ONLY when the task is about MongoDB, not PostgreSQL."
---

# MongoDB

Trabalhar com MongoDB para banco de dados NoSQL, incluindo
modelagem de dados, queries e otimização.

## Objetivo

Projetar e implementar soluções de banco de dados NoSQL eficientes
com MongoDB.

## Fluxo de Trabalho

1. Modelar esquemas de documentos
2. Criar índices adequados
3. Implementar queries eficientes
4. Configurar replica sets
5. Otimizar performance
6. Implementar aggregation pipelines

## Critérios de Qualidade

- [ ] Documentos são desnormalizados quando necessário
- [ ] Índices são criados para queries frequentes
- [ ] Queries usam projection para limitar campos
- [ ] Aggregation pipelines são eficientes
- [ ] Conexões são gerenciadas adequadamente
- [ ] Validações de esquema estão configuradas

## Limitações

- Não faz relational queries (usar `@postgresql`)
- Não faz caching (usar `@redis`)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Armazenar dados de sessão
- Criar sistema de logging
- Implementar feed de atividades
- Armazenar dados de IoT

## Casos onde NÃO utilizar

- Para dados relacionais complexos (usar `@postgresql`)
- Para cache de alta performance (usar `@redis`)
- Para transações financeiras (usar `@postgresql`)

## Exemplos

### Exemplo 1: Schema com validação

**Entrada:**
```
Criar schema para usuários
```

**Saída Esperada:**
```javascript
db.createCollection("users", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["name", "email"],
      properties: {
        name: { bsonType: "string" },
        email: { bsonType: "string" },
        age: { bsonType: "int", minimum: 0 },
        createdAt: { bsonType: "date" }
      }
    }
  }
});
```

### Exemplo 2: Aggregation pipeline

**Entrada:**
```
Criar pipeline para estatísticas de vendas
```

**Saída Esperada:**
```javascript
db.sales.aggregate([
  { $match: { date: { $gte: ISODate("2024-01-01") } } },
  { $group: {
    _id: "$product",
    totalSales: { $sum: "$amount" },
    count: { $sum: 1 },
    avgSale: { $avg: "$amount" }
  }},
  { $sort: { totalSales: -1 } },
  { $limit: 10 }
]);
```
