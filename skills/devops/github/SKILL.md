---
name: github
description: "Use when working with GitHub for repos, PRs, Actions, and collaboration. Use ONLY when the task is about GitHub, not Git."
---

# GitHub

Usar GitHub para gerenciar repositórios, pull requests, GitHub
Actions e colaboração em equipe.

## Objetivo

Gerenciar código e colaboração de forma eficiente usando as
funcionalidades do GitHub.

## Fluxo de Trabalho

1. Criar e configurar repositório
2. Gerenciar branches e proteções
3. Criar pull requests
4. Configurar GitHub Actions
5. Gerenciar issues e projetos
6. Configurar CODEOWNERS

## Critérios de Qualidade

- [ ] Branch protection está configurada
- [ ] PR templates existem
- [ ] CI/CD está via GitHub Actions
- [ ] CODEOWNERS está definido
- [ ] Issues são documentadas
- [ ] Release notes são geradas

## Limitações

- Não faz Git local (usar `@git-workflow`)
- Não faz deploy (usar `@deploy`)
- Não faz code review (usar `@code-review`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Gerenciar repositório open source
- Configurar CI/CD com Actions
- Automatizar releases
- Colaborar em equipe

## Casos onde NÃO utilizar

- Para Git local (usar `@git-workflow`)
- Para code review (usar `@code-review`)
- Para deploy (usar `@deploy`)

## Exemplos

### Exemplo 1: GitHub Actions workflow

**Entrada:**
```
Criar workflow para CI/CD
```

**Saída Esperada:**
```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      
      - run: npm ci
      - run: npm test
      - run: npm run lint

  deploy:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm run build
      - name: Deploy
        run: echo "Deploying..."
```

### Exemplo 2: CODEOWNERS

**Entrada:**
```
Criar CODEOWNERS para time
```

**Saída Esperada:**
```
# Frontend
/src/components/ @frontend-team
/src/pages/ @frontend-team

# Backend
/src/api/ @backend-team
/src/services/ @backend-team

# DevOps
/Dockerfile @devops-team
/.github/ @devops-team

# Default
* @tech-leads
```
