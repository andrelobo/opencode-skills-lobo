---
name: typescript
description: "Use when working with TypeScript for type-safe dev with types, interfaces, and generics. Use ONLY when the task is about TypeScript, not frameworks."
---

# TypeScript

Desenvolver código tipado e seguro com TypeScript, incluindo
tipos, interfaces, generics e configuração de compilação.

## Objetivo

Criar código robusto, autodocumentado e com segurança em tempo
de compilação usando o sistema de tipos do TypeScript.

## Fluxo de Trabalho

1. Configurar tsconfig.json com strict mode
2. Definir tipos e interfaces para dados
3. Implementar type guards para runtime
4. Usar utility types para reutilização
5. Aplicar generics para flexibilidade
6. Configurar tipos para APIs externas
7. Validar tipos com ferramentas de lint

## Critérios de Qualidade

- [ ] tsconfig.json habilita strict mode
- [ ] Tipos são definidos antes da implementação
- [ ] Generics são usados corretamente
- [ ] Type guards protegem operações em runtime
- [ ] Utility types reduzem duplicação de código
- [ ] Nenhum uso desnecessário de `any`
- [ ] Tipos de retorno são explícitos em funções públicas

## Limitações

- Não faz configuração de framework (usar `@nestjs` ou `@express`)
- Não gerencia banco de dados (usar `@mongodb` ou `@postgresql`)
- Não faz deploy ou CI/CD (usar `@deploy` ou `@docker`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Definir contratos de API com tipos
- Criar componentes genéricos reutilizáveis
- Implementar type-safe event emitters
- Validar dados em runtime com type guards
- Configurar projeto com strict mode
- Tipar funções de callback e promises

## Casos onde NAO utilizar

- Para backend com Node.js puro (usar `@nodejs`)
- Para frontend com React (usar `@react`)
- Para APIs GraphQL (usar `@graphql`)
- Para testes (usar `@test-generation`)

## Exemplos

### Exemplo 1: Interface e type alias

**Entrada:**
```
Criar tipos para um usuario da API
```

**Saida Esperada:**
```typescript
interface Address {
  street: string;
  city: string;
  zipCode: string;
}

type UserRole = 'admin' | 'user' | 'moderator';

interface User {
  id: string;
  name: string;
  email: string;
  role: UserRole;
  address: Address;
  createdAt: Date;
}
```

### Exemplo 2: Generic type-safe function

**Entrada:**
```
Criar funcao generica que busca item por id
```

**Saida Esperada:**
```typescript
function findById<T extends { id: string }>(
  items: T[],
  id: string
): T | undefined {
  return items.find((item) => item.id === id);
}

const users: User[] = [];
const user = findById(users, '123');
```

### Exemplo 3: Type guard

**Entrada:**
```
Criar type guard para validar dados de entrada
```

**Saida Esperada:**
```typescript
function isUser(data: unknown): data is User {
  return (
    typeof data === 'object' &&
    data !== null &&
    'id' in data &&
    'email' in data &&
    typeof (data as User).email === 'string'
  );
}
```
