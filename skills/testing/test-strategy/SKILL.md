---
name: test-strategy
description: "Use when defining testing strategy: pyramid, tools, metrics, processes. Use ONLY when the task is about test strategy, not test generation."
---

# Test Strategy

Define a estratégia de testes para um projeto, incluindo pirâmide
de testes, ferramentas, métricas e processos.

## Objetivo

Estabelecer uma estratégia de testes eficiente que equilibre
cobertura, velocidade e manutenibilidade.

## Fluxo de Trabalho

1. Analisar tipo de projeto e requisitos
2. Definir pirâmide de testes adequada
3. Selecionar framework e ferramentas
4. Definir métricas de cobertura
5. Definir processos de CI para testes
6. Definir padrões de naming de testes
7. Definir estratégia de testes para dados

## Critérios de Qualidade

- [ ] Pirâmide de testes é adequada ao projeto
- [ ] Frameworks são selecionados
- [ ] Métricas de cobertura são definidas
- [ ] Processos de CI são integrados
- [ ] Padrões de naming são definidos
- [ ] Estratégia de dados é clara
- [ ] Trade-offs são documentados
- [ ] Estratégia é iterativa e revisável

## Limitações

- Não gera testes específicos (usar `@test-generation`)
- Não revisa testes existentes
- Não configura ferramentas de teste
- Não depende de plugins ou MCP servers
- Não define testes para performance (usar `@performance`)

## Casos de Uso

- Iniciar novo projeto
- Reavaliar processos de qualidade
- Integrar testes no pipeline de CI
- Quando testes estão lentos ou frágeis

## Casos onde NÃO utilizar

- Para gerar testes específicos (usar `@test-generation`)
- Para revisar testes existentes
- Para configurar ferramentas de teste
- Em projetos com estratégia já definida

## Exemplos

### Exemplo 1: Pirâmide de testes para app web

**Entrada:**
```
Aplicação web com frontend React e backend Node.js
```

**Saída Esperada:**
```
Pirâmide de Testes:
- Unitários (70%): Funções puras, hooks, utils
- Integração (20%): API endpoints, componentes com dados
- E2E (10%): Fluxos críticos de usuário

Ferramentas:
- Unit: Jest + React Testing Library
- Integração: Supertest
- E2E: Playwright

Métricas:
- Cobertura mínima: 80% (unit), 60% (integração)
- Tempo máximo de suite: 5 min
```

### Exemplo 2: Estratégia para API

**Entrada:**
```
API REST com autenticação e banco de dados
```

**Saída Esperada:**
```
Estratégia:
- Unitários: Lógica de negócio pura
- Integração: Rotas + banco (com transactions)
- Contrato: OpenAPI validation
- Carga: k6 para endpoints críticos

Processos:
- Testes rodam em PR check
- Coverage report no PR
- Blocking se < 80% coverage
```
