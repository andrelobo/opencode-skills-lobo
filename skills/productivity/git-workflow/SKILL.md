---
name: git-workflow
description: "Use when managing git workflows: branching, merge vs rebase, conflicts. Use ONLY when the task is about git workflow, not commits."
---

# Git Workflow

Gerenciar workflows de git, incluindo branching strategies, merge
vs rebase, resolução de conflitos e boas práticas de versionamento.

## Objetivo

Estabelecer e manter um fluxo de trabalho git eficiente e
colaborativo para a equipe.

## Fluxo de Trabalho

1. Analisar necessidade do projeto
2. Sugerir branching strategy adequada
3. Guiar resolução de conflitos
4. Recomendar merge vs rebase
5. Gerenciar stashes e worktrees
6. Guiar bisect para encontrar bugs
7. Configurar hooks úteis

## Critérios de Qualidade

- [ ] Branching strategy é clara
- [ ] Conflitos são resolvidos adequadamente
- [ ] Merge vs rebase é recomendado corretamente
- [ ] Histórico é limpo e organizado
- [ ] Branches são temporárias e descartadas
- [ ] Tags são usadas para versões
- [ ] Hooks são configurados quando necessário

## Limitações

- Não escreve commits (usar `@commit-convention`)
- Não gera changelog (usar `@changelog`)
- Não configura CI/CD (usar `@ci-cd`)
- Não depende de plugins ou MCP servers
- Não resolve problemas de merge que são bugs de código

## Casos de Uso

- Iniciar projeto novo (definir estratégia)
- Resolver conflito de merge complexo
- Fazer release (tags, branches)
- Revisar histórico de commits

## Casos onde NÃO utilizar

- Para escrever commits (usar `@commit-convention`)
- Para gerar changelog (usar `@changelog`)
- Para configurar CI/CD (usar `@ci-cd`)
- Para resolver problemas de merge que são bugs de código

## Exemplos

### Exemplo 1: Branching strategy

**Entrada:**
```
Projeto com releases mensais e hotfixes
```

**Saída Esperada:**
```
Branching Strategy (Git Flow):
- main: código estável em produção
- develop: código em desenvolvimento
- feature/*: novas funcionalidades
- release/*: preparação de release
- hotfix/*: correções urgentes

Fluxo:
1. Criar feature/* a partir de develop
2. Merge em develop via PR
3. Criar release/* quando pronto
4. Merge em main e develop
5. Criar hotfix/* a partir de main
6. Merge em main e develop
```

### Exemplo 2: Merge vs Rebase

**Entrada:**
```
Feature branch com 5 commits, develop avançou
```

**Saída Esperada:**
```
Recomendação: Rebase

Motivo:
- Feature branch é local
- Quer histórico limpo
- Não alterou código compartilhado

Comando:
git checkout feature/my-feature
git rebase develop
git checkout develop
git merge --no-ff feature/my-feature

Exceção: Usar merge quando:
- Branch é compartilhada
- Quer preservar contexto de merge
```
