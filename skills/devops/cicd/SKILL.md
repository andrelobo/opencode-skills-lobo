---
name: cicd
description: "Use when working with CI/CD pipelines (GitHub Actions, GitLab CI). Use ONLY when the task is about pipeline config, not deployment."
---

# CI/CD

Configurar pipelines de integração contínua e entrega contínua usando GitHub Actions e GitLab CI.

## Objetivo

Automatizar build, teste e deploy de aplicações de forma confiável e reproduzível.

## Fluxo de Trabalho

1. Definir stages (build, test, deploy) e triggers (push, PR, schedule)
2. Gerenciar dependências, cache, secrets e variáveis de ambiente
3. Implementar testes, build e artefatos
4. Implementar deploy por ambiente e notificações de falha

## Critérios de Qualidade

- Passa em todos stages; cache configurado; secrets seguros; stages independentes; rollback; notificações; pipeline ≤15 min

## Limitações

- Sem deploy manual, containerização ou infraestrutura (usar @deploy, @docker, @cloud)
- GitHub/GitLab têm sintaxe própria

## Casos de Uso

- CI/deploy Node.js, Python, Go; testes PR; build e publicação de pacotes

## Casos onde NAO utilizar

- Deploy manual (@deploy), containerização (@docker), infraestrutura (@cloud)

## Exemplos

### GitHub Actions para Node.js

**Entrada:** `Pipeline CI para Node.js com testes e deploy`
**Saída:**
```yaml
name: CI/CD
on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]
env:
  NODE_VERSION: '20'
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'npm'
      - run: npm ci
      - run: npm run lint
  test:
    needs: lint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'npm'
      - run: npm ci
      - run: npm test
      - run: npm run test:e2e
  deploy:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
      - run: npm ci
      - run: npm run build
      - run: npx vercel --prod --token=${{ secrets.VERCEL_TOKEN }}
```
### GitLab CI multi-stage
**Entrada:** `Pipeline GitLab CI with cache and artifacts`
**Saida:**
```yaml
image: node:20-alpine
stages: [install, lint, test, build, deploy]
cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths: [node_modules/]
install_dependencies:
  stage: install
  script: npm ci
  artifacts:
    paths: [node_modules/]
lint_code:
  stage: lint
  script: npm run lint
run_tests:
  stage: test
  script: npm test
build_app:
  stage: build
  script: npm run build
  artifacts:
    paths: [dist/]
deploy_production:
  stage: deploy
  script: npm run deploy
  environment:
    name: production
    url: https://myapp.com
```
