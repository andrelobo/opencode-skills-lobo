---
name: api-design
description: "Use when designing REST, GraphQL, or gRPC APIs with endpoints and auth. Use ONLY when the task is about API design, not implementation."
---

# API Design

Guiar o design de APIs RESTful, GraphQL ou gRPC, seguindo boas
práticas de nomenclatura, versionamento, autenticação e documentação.

## Objetivo

Definir contratos de API claros, consistentes e que sigam padrões
da indústria.

## Fluxo de Trabalho

1. Analisar requisitos do domínio
2. Definir estrutura de endpoints
3. Definir contratos de request/response
4. Sugerir versionamento adequado
5. Definir padrões de autenticação
6. Sugerir paginação e filtros
7. Definir padrões de error handling
8. Documentar com OpenAPI/Swagger quando aplicável

## Critérios de Qualidade

- [ ] Endpoints seguem convenções REST
- [ ] Contratos são claros e completos
- [ ] Versionamento é definido
- [ ] Autenticação é especificada
- [ ] Paginação é implementada quando aplicável
- [ ] Error handling é consistente
- [ ] Documentação é gerada quando aplicável
- [ ] Nomenclatura é intuitiva

## Limitações

- Não implementa a API (código é responsabilidade do dev)
- Não testa API (usar `@test-generation`)
- Não documenta API existente (usar `@doc-writer`)
- Não depende de plugins ou MCP servers
- Não gerencia infraestrutura de deploy

## Casos de Uso

- Criar nova API
- Adicionar endpoints significativos
- Revisar design de API existente
- Migrar de uma versão de API para outra

## Casos onde NÃO utilizar

- Para implementar a API (código é responsabilidade do dev)
- Para testes de API (usar `@test-generation`)
- Para documentar API existente (usar `@doc-writer`)
- Em projetos sem API (CLIs, bibliotecas, etc.)

## Exemplos

### Exemplo 1: Design de endpoints REST

**Entrada:**
```
Sistema de gerenciamento de usuários
```

**Saída Esperada:**
```
Endpoints:
GET    /api/v1/users          - Listar usuários
POST   /api/v1/users          - Criar usuário
GET    /api/v1/users/:id      - Obter usuário
PUT    /api/v1/users/:id      - Atualizar usuário
DELETE /api/v1/users/:id      - Deletar usuário

GET    /api/v1/users/:id/posts - Listar posts do usuário

Response Format:
{
  "data": {},
  "meta": { "page": 1, "total": 100 },
  "links": { "next": "...", "prev": "..." }
}
```

### Exemplo 2: Error handling

**Entrada:**
```
Definir padrão de erros para API
```

**Saída Esperada:**
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": [
      {
        "field": "email",
        "message": "Must be a valid email address"
      }
    ]
  }
}
```

Status Codes:
- 200: Success
- 201: Created
- 400: Bad Request (validation errors)
- 401: Unauthorized
- 403: Forbidden
- 404: Not Found
- 409: Conflict
- 500: Internal Server Error
