---
name: code-generation
description: "Use when generating, scaffolding or refactoring code with AI, including boilerplate. Use ONLY for programmatic code creation, not code review."
---

# Code Generation com IA

Gerar, scaffolding e refatorar código usando IA de forma estruturada,
com validação e seguindo convenções do projeto existente.

## Objetivo

Acelerar o desenvolvimento criando código funcional, validado e
alinhado com as convenções e stack do projeto.

## Fluxo de Trabalho

1. Analisar o código existente e identificar convenções do projeto
2. Verificar dependências, frameworks e padrões já utilizados
3. Definir o escopo exato do código a ser gerado
4. Gerar o código seguindo style guide e arquitetura existente
5. Validar sintaxe, tipos e imports
6. Verificar se o código gerado não viola segurança (sem secrets, sem eval)
7. Rodar lint e typecheck se disponíveis no projeto
8. Testar o código gerado em isolamento quando possível
9. Integrar ao projeto respeitando a estrutura de diretórios
10. Revisar edge cases e cenarios de falha

## Critérios de Qualidade

- [ ] Código segue convenções de estilo do projeto
- [ ] Imports utilizam caminhos relativos ou aliases já configurados
- [ ] Tipos estão corretos (TypeScript) ou anotados (Python)
- [ ] Não há secrets, tokens ou chaves hardcoded
- [ ] Não há uso de eval(), exec() ou funções perigosas sem necessidade
- [ ] Funções e módulos possuem nomes descritivos
- [ ] Tratamento de erros adequado ao contexto
- [ ] Código não duplica funcionalidade existente no projeto
- [ ] Validação de inputs em pontos de entrada
- [ ] Lint e typecheck passam sem erros

## Limitações

- Não substitui revisão humana para lógica de negócio crítica
- Não gera testes automaticamente (usar `@test-generation`)
- Não faz deploy do código gerado (usar `@deploy`)
- Não substitui scaffolding de projeto inteiro (usar CLI do framework)
- Pode gerar código desatualizado se o contexto do projeto estiver incompleto

## Casos de Uso

- Criar boilerplate de componentes, services ou controllers
- Gerar schemas de validação a partir de interfaces
- Scaffolding de endpoints REST ou rotas
- Refatoração assistida de código legado
- Code completion para trechos repetitivos
- Geração de tipos e interfaces a partir de dados existentes
- Criar funções utilitárias seguindo padrões do projeto
- Transformar código entre linguagens ou paradigmas

## Casos onde NÃO utilizar

- Para lógica de negócio com regras complexas sem validação humana
- Para código de segurança crítica (auth, criptografia) sem review
- Para projetos sem testes automatizados (risco de regressão)

## Exemplos

### Exemplo 1: Scaffolding de Componente React

**Entrada:**
```
Criar componente UserCard que recebe name, email e avatar, seguindo
padrões do projeto (React + TypeScript + CSS Modules)
```

**Saída Esperada:**
```typescript
import styles from "./UserCard.module.css";

interface UserCardProps {
  name: string;
  email: string;
  avatar: string;
}

export function UserCard({ name, email, avatar }: UserCardProps) {
  return (
    <div className={styles.card}>
      <img src={avatar} alt={name} className={styles.avatar} />
      <div className={styles.info}>
        <h3 className={styles.name}>{name}</h3>
        <span className={styles.email}>{email}</span>
      </div>
    </div>
  );
}
```

### Exemplo 2: Refatoração Assistida

**Entrada:**
```
Refatorar esta função para usar async/await e tratar erros adequadamente:
function fetchData(url) { return fetch(url).then(r => r.json()); }
```

**Saída Esperada:**
```typescript
async function fetchData(url: string): Promise<unknown> {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`HTTP ${response.status}: ${response.statusText}`);
    }
    return await response.json();
  } catch (error) {
    if (error instanceof Error) {
      console.error(`Falha ao buscar dados de ${url}:`, error.message);
    }
    throw error;
  }
}
```
