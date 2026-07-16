---
name: react
description: "Use when working with React components, hooks, and state management. Use ONLY when the task is about React, not Next.js or others."
---

# React

Desenvolver interfaces de usuário com React, incluindo componentes,
hooks, gerenciamento de estado e otimização de performance.

## Objetivo

Criar componentes React reutilizáveis, performáticos e com boa
experiência de desenvolvimento.

## Fluxo de Trabalho

1. Analisar requisitos da interface
2. Decompor em componentes
3. Definir estado e props
4. Implementar hooks necessários
5. Otimizar re-renders
6. Testar componentes

## Critérios de Qualidade

- [ ] Componentes são reutilizáveis
- [ ] Estado é minimizado
- [ ] Effects têm dependências corretas
- [ ] Keys são estáveis em listas
- [ ] Memos são usados quando necessário
- [ ] Componentes são pequenos e focados

## Limitações

- Não gerencia roteamento (usar Next.js)
- Não faz SEO (usar Next.js)
- Não gerencia estado global complexo (usar Zustand/Redux)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar componente de UI reutilizável
- Implementar formulário complexo
- Otimizar performance de lista
- Integrar com API

## Casos onde NÃO utilizar

- Para aplicações com SSR/SSG (usar `@nextjs`)
- Para rotas e páginas (usar `@nextjs`)
- Para SEO (usar `@nextjs`)

## Exemplos

### Exemplo 1: Componente com useState

**Entrada:**
```
Criar contador com incremento e decremento
```

**Saída Esperada:**
```jsx
function Counter() {
  const [count, setCount] = useState(0);
  
  return (
    <div>
      <button onClick={() => setCount(c => c - 1)}>-</button>
      <span>{count}</span>
      <button onClick={() => setCount(c => c + 1)}>+</button>
    </div>
  );
}
```

### Exemplo 2: Hook customizado

**Entrada:**
```
Criar hook para busca com debounce
```

**Saída Esperada:**
```jsx
function useDebounce(value, delay) {
  const [debouncedValue, setDebouncedValue] = useState(value);
  
  useEffect(() => {
    const timer = setTimeout(() => setDebouncedValue(value), delay);
    return () => clearTimeout(timer);
  }, [value, delay]);
  
  return debouncedValue;
}
```
