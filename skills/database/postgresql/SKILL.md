---
name: postgresql
description: "Use when working with PostgreSQL for relational DB design and SQL. Use ONLY when the task is about PostgreSQL, not MongoDB."
---

# PostgreSQL

Trabalhar com PostgreSQL para banco de dados relacional, incluindo
modelagem SQL, queries complexas e otimização.

## Objetivo

Projetar e implementar soluções de banco de dados relacional
robustas e performáticas com PostgreSQL.

## Fluxo de Trabalho

1. Modelar esquema relacional
2. Criar tabelas e relationships
3. Implementar queries SQL
4. Criar índices adequados
5. Configurar views e functions
6. Otimizar performance

## Critérios de Qualidade

- [ ] Normalização está aplicada
- [ ] Índices são criados para queries frequentes
- [ ] Foreign keys estão definidas
- [ ] Queries usam EXPLAIN para análise
- [ ] Transações são usadas quando necessário
- [ ] Migrations estão versionadas

## Limitações

- Não faz NoSQL (usar `@mongodb`)
- Não faz caching (usar `@redis`)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Sistema financeiro
- E-commerce com inventário
- Sistema de gestão
- Data warehouse

## Casos onde NÃO utilizar

- Para dados flexibles (usar `@mongodb`)
- Para cache de alta performance (usar `@redis`)
- Para logs de alta escrita (usar `@mongodb`)

## Exemplos

### Exemplo 1: Tabela com relaciones

**Entrada:**
```
Criar tabelas para sistema de pedidos
```

**Saída Esperada:**
```sql
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(id),
  total DECIMAL(10,2),
  status VARCHAR(20) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_status ON orders(status);
```

### Exemplo 2: Query complexa

**Entrada:**
```
Criar query para relatório de vendas
```

**Saída Esperada:**
```sql
SELECT 
  c.name,
  COUNT(o.id) as total_orders,
  SUM(o.total) as total_spent,
  AVG(o.total) as avg_order
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.created_at >= DATE_TRUNC('month', CURRENT_DATE)
GROUP BY c.id, c.name
HAVING SUM(o.total) > 1000
ORDER BY total_spent DESC;
```
