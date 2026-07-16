---
name: openapi
description: "Use when working with OpenAPI spec for API design, validation, and tooling. Use ONLY when the task is about OpenAPI, not Swagger docs."
---

# OpenAPI

Trabalhar com especificação OpenAPI para design de APIs,
validação e integração com ferramentas.

## Objetivo

Usar OpenAPI como contrato de API para validação, geração
de código e integração.

## Fluxo de Trabalho

1. Definir esquema OpenAPI
2. Validar com ferramentas
3. Gerar código a partir do schema
4. Integrar com ferramentas de teste
5. Versionar especificação
6. Publicar contrato

## Critérios de Qualidade

- [ ] Esquema é válido
- [ ] Components estão reutilizados
- [ ] Security schemes estão definidas
- [ ] Servers estão configurados
- [ ] Webhooks estão documentados
- [ ] Versioning está implementado

## Limitações

- Não faz documentação visual (usar `@swagger`)
- Não implementa endpoints
- Não valida runtime
- Não depende de plugins ou MCP servers

## Casos de Uso

- Contrato de API
- Geração de client
- Validação de requests
- Integração com CI/CD

## Casos onde NÃO utilizar

- Para documentação visual (usar `@swagger`)
- Para implementação
- Para testes de integração

## Exemplos

### Exemplo 1: OpenAPI v3 básico

**Entrada:**
```
Criar especificação OpenAPI para API
```

**Saída Esperada:**
```yaml
openapi: 3.0.3
info:
  title: My API
  version: 1.0.0

servers:
  - url: http://localhost:3000
    description: Development
  - url: https://api.example.com
    description: Production

paths:
  /users:
    get:
      operationId: listUsers
      responses:
        '200':
          description: Success

components:
  schemas:
    User:
      type: object
      properties:
        id:
          type: string
        name:
          type: string
```

### Exemplo 2: Validar com Spectral

**Entrada:**
```
Criar regras de validação OpenAPI
```

**Saída Esperada:**
```yaml
# .spectral.yml
extends:
  - spectral:oas

rules:
  operation-operationId: error
  operation-description: warn
  oas3-api-servers: error
  path-params: error
```

Comando: `spectral lint openapi.yml`
