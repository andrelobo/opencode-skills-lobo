---
name: swagger
description: "Use when documenting APIs with Swagger/OpenAPI for interactive docs and code generation. Use ONLY when the task is about Swagger docs, not API design."
---

# Swagger

Documentar APIs com Swagger/OpenAPI para documentação interativa
e geração de código.

## Objetivo

Criar documentação de API interativa, completa e que facilite
a integração de desenvolvedores.

## Fluxo de Trabalho

1. Definir esquema OpenAPI
2. Documentar endpoints
3. Adicionar exemplos de request/response
4. Configurar autenticação
5. Adicionar exemplos de erro
6. Publicar documentação

## Critérios de Qualidade

- [ ] Schema é válido OpenAPI 3.0
- [ ] Endpoints estão documentados
- [ ] Request/response têm exemplos
- [ ] Autenticação está documentada
- [ ] Erros estão documentados
- [ ] Tags organizam endpoints

## Limitações

- Não faz design de API (usar `@rest`)
- Não implementa endpoints
- Não testa API (usar `@test-generation`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Documentar API pública
- Gerar client SDK
- Testar endpoints interativamente
- Integrar com Postman

## Casos onde NÃO utilizar

- Para design de API (usar `@rest`)
- Para implementação
- Para testes automatizados

## Exemplos

### Exemplo 1: Documentação de endpoint

**Entrada:**
```
Documentar endpoint de usuários
```

**Saída Esperada:**
```yaml
paths:
  /api/users:
    get:
      summary: List all users
      tags: [Users]
      parameters:
        - name: limit
          in: query
          schema:
            type: integer
            default: 10
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/User'
```

### Exemplo 2: Schema de erro

**Entrada:**
```
Documentar resposta de erro
```

**Saída Esperada:**
```yaml
components:
  schemas:
    Error:
      type: object
      properties:
        code:
          type: string
          example: VALIDATION_ERROR
        message:
          type: string
          example: Invalid input
        details:
          type: array
          items:
            type: object
            properties:
              field:
                type: string
              message:
                type: string
```
