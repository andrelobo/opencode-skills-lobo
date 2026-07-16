---
name: rest
description: "Use when designing RESTful APIs with conventions, status codes, and resources. Use ONLY when the task is about REST, not GraphQL."
---

# REST

Projetar e implementar APIs RESTful seguindo convenções da
indústria, incluindo resources, status codes e HATEOAS.

## Objetivo

Criar APIs REST consistentes, intuitivas e que sigam padrões
estabelecidos.

## Fluxo de Trabalho

1. Definir resources e sub-resources
2. Criar endpoints RESTful
3. Definir status codes adequados
4. Implementar paginação
5. Configurar versionamento
6. Documentar com OpenAPI

## Critérios de Qualidade

- [ ] Resources são substantivos no plural
- [ ] Métodos HTTP são usados corretamente
- [ ] Status codes são semânticos
- [ ] Paginação está implementada
- [ ] Versionamento está definido
- [ ] Erros seguem padrão RFC 7807

## Limitações

- Não faz GraphQL (usar `@graphql`)
- Não faz WebSocket (usar `@websocket`)
- Não documenta com Swagger (usar `@swagger`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar API CRUD
- Integrar com sistemas legados
- Criar API pública
- Microserviços

## Casos onde NÃO utilizar

- Para queries flexíveis (usar `@graphql`)
- Para tempo real (usar `@websocket`)
- Para documentação (usar `@swagger`)

## Exemplos

### Exemplo 1: Endpoints RESTful

**Entrada:**
```
Criar API para gerenciar posts
```

**Saída Esperada:**
```
GET    /api/v1/posts          - Listar posts
POST   /api/v1/posts          - Criar post
GET    /api/v1/posts/:id      - Obter post
PUT    /api/v1/posts/:id      - Atualizar post
DELETE /api/v1/posts/:id      - Deletar post

GET    /api/v1/posts/:id/comments - Listar comentários
POST   /api/v1/posts/:id/comments - Criar comentário
```

### Exemplo 2: Resposta com paginação

**Entrada:**
```
Implementar paginação na listagem
```

**Saída Esperada:**
```json
{
  "data": [
    { "id": 1, "title": "Post 1" },
    { "id": 2, "title": "Post 2" }
  ],
  "meta": {
    "page": 1,
    "limit": 10,
    "total": 100,
    "totalPages": 10
  },
  "links": {
    "self": "/api/v1/posts?page=1",
    "next": "/api/v1/posts?page=2",
    "prev": null,
    "last": "/api/v1/posts?page=10"
  }
}
```
