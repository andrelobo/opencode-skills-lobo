---
name: docker-compose
description: "Use when working with Docker Compose for multi-container apps. Use ONLY when the task is about Docker Compose, not single containers."
---

# Docker Compose

Orquestrar múltiplos containers com Docker Compose, incluindo
serviços, redes e volumes.

## Objetivo

Configurar ambientes de desenvolvimento e produção com múltiplos
serviços de forma declarativa.

## Fluxo de Trabalho

1. Definir serviços necessários
2. Configurar redes e volumes
3. Definir variáveis de ambiente
4. Configurar dependências entre serviços
5. Configurar health checks
6. Otimizar para desenvolvimento

## Critérios de Qualidade

- [ ] Serviços estão isolados
- [ ] Redes estão configuradas
- [ ] Volumes são usados para persistência
- [ ] Variáveis de ambiente estão em .env
- [ ] Health checks estão configurados
- [ ] Dependências estão declaradas

## Limitações

- Não faz build de imagens (usar `@docker`)
- Não faz orquestração em cluster (usar Kubernetes)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Setup de desenvolvimento local
- Ambiente com múltiplos serviços
- Testes de integração
- Demo de sistema completo

## Casos onde NÃO utilizar

- Para container único (usar `@docker`)
- Para produção em cluster (usar Kubernetes)
- Para deploy simplificado (usar `@deploy`)

## Exemplos

### Exemplo 1: Stack completa

**Entrada:**
```
Criar compose para app com API, banco e cache
```

**Saída Esperada:**
```yaml
version: '3.8'

services:
  api:
    build: .
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/app
      - REDIS_URL=redis://cache:6379
    depends_on:
      db:
        condition: service_healthy
      cache:
        condition: service_healthy

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: app
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U user -d app"]
      interval: 5s
      timeout: 5s
      retries: 5

  cache:
    image: redis:7-alpine
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 5s
      timeout: 5s
      retries: 5

volumes:
  postgres_data:
```

### Exemplo 2: Desenvolvimento com hot reload

**Entrada:**
```
Configurar compose para desenvolvimento
```

**Saída Esperada:**
```yaml
version: '3.8'

services:
  api:
    build:
      context: .
      dockerfile: Dockerfile.dev
    volumes:
      - ./src:/app/src
      - /app/node_modules
    ports:
      - "3000:3000"
      - "9229:9229"
    command: npm run dev
```
