---
name: graphql
description: "Use when designing GraphQL APIs with schemas, resolvers, and queries. Use ONLY when the task is about GraphQL, not REST."
---

# GraphQL

Projetar e implementar APIs com GraphQL, incluindo schemas,
resolvers, mutations e subscriptions.

## Objetivo

Criar APIs flexíveis e eficientes que permitem ao cliente
solicitar exatamente os dados que precisa.

## Fluxo de Trabalho

1. Definir schema GraphQL
2. Criar types e inputs
3. Implementar resolvers
4. Configurar mutations
5. Implementar subscriptions
6. Otimizar com DataLoader

## Critérios de Qualidade

- [ ] Schema é tipado e documentado
- [ ] Resolvers são eficientes
- [ ] N+1 queries são evitadas
- [ ] Erros são tratados adequadamente
- [ ] Subscriptions são usadas para real-time
- [ ] Schema é versionado

## Limitações

- Não faz REST (usar `@rest`)
- Não faz WebSocket (usar `@websocket`)
- Não documenta com Swagger (usar `@swagger`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- API para aplicação móvel
- Microserviços com múltiplos clientes
- Dados relacionais complexos
- Real-time com subscriptions

## Casos onde NÃO utilizar

- Para APIs simples (usar `@rest`)
- Para download de arquivos
- Para APIs públicas simples

## Exemplos

### Exemplo 1: Schema GraphQL

**Entrada:**
```
Criar schema para blog
```

**Saída Esperada:**
```graphql
type Query {
  posts(limit: Int, offset: Int): [Post!]!
  post(id: ID!): Post
}

type Mutation {
  createPost(input: CreatePostInput!): Post!
  updatePost(id: ID!, input: UpdatePostInput!): Post!
  deletePost(id: ID!): Boolean!
}

type Post {
  id: ID!
  title: String!
  content: String!
  author: User!
  comments: [Comment!]!
  createdAt: DateTime!
}

input CreatePostInput {
  title: String!
  content: String!
}
```

### Exemplo 2: Resolver com DataLoader

**Entrada:**
```
Implementar resolver eficiente
```

**Saída Esperada:**
```javascript
const resolvers = {
  Query: {
    posts: (_, { limit, offset }) => postLoader.batch({ limit, offset }),
    post: (_, { id }) => postLoader.load(id)
  },
  Post: {
    author: (post) => userLoader.load(post.authorId),
    comments: (post) => commentLoader.load(post.id)
  }
};
```
