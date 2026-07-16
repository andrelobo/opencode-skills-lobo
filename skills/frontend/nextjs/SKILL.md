---
name: nextjs
description: "Use when working with Next.js for SSR, SSG, routing, and API routes. Use ONLY when the task is about Next.js, not plain React."
---

# Next.js

Desenvolver aplicações full-stack com Next.js, incluindo SSR, SSG,
roteamento, API routes e otimização de performance.

## Objetivo

Criar aplicações web performáticas com renderização server-side,
SEO otimizado e experiência de desenvolvimento moderna.

## Fluxo de Trabalho

1. Definir estratégia de renderização (SSR/SSG/ISR)
2. Configurar rotas e layouts
3. Implementar API routes quando necessário
4. Configurar middleware
5. Otimizar imagens e fontes
6. Implementar metadata para SEO

## Critérios de Qualidade

- [ ] Renderização é adequada ao conteúdo
- [ ] Rotas são organizadas corretamente
- [ ] API routes seguem padrões REST
- [ ] Middleware é usado para autenticação
- [ ] Imagens usam next/image
- [ ] Metadata está completa para SEO

## Limitações

- Não faz apenas SPA (usar `@react`)
- Não gerencia estado global (usar Zustand/Redux)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar site com SEO otimizado
- Implementar dashboard com SSR
- Criar e-commerce com ISR
- Integrar com CMS headless

## Casos onde NÃO utilizar

- Para SPAs puras (usar `@react`)
- Para apps mobile (usar React Native)
- Para sites estáticos simples

## Exemplos

### Exemplo 1: Página com SSR

**Entrada:**
```
Criar página de produtos com dados do servidor
```

**Saída Esperada:**
```jsx
// app/products/page.js
async function ProductsPage() {
  const products = await fetch('https://api.example.com/products');
  const data = await products.json();
  
  return (
    <ul>
      {data.map(product => (
        <li key={product.id}>{product.name}</li>
      ))}
    </ul>
  );
}

export default ProductsPage;
```

### Exemplo 2: API Route

**Entrada:**
```
Criar endpoint para criar usuário
```

**Saída Esperada:**
```jsx
// app/api/users/route.js
import { NextResponse } from 'next/server';

export async function POST(request) {
  const body = await request.json();
  
  const user = await db.users.create({
    data: body
  });
  
  return NextResponse.json(user, { status: 201 });
}
```
