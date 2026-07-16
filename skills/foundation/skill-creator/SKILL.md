---
name: skill-creator
description: "Use when creating new opencode skills or SKILL.md files. Use ONLY when the task is about skill creation, not editing or validating."
---

# Skill Creator

Guiar a criação de novas skills para a biblioteca global do OpenCode,
seguindo rigorosamente as convenções e o template oficial.

## Objetivo

Gerar uma skill válida, completa e pronta para publicação, com
frontmatter correto e corpo estruturado conforme o template mestre.

## Fluxo de Trabalho

1. Consultar `_meta/CATALOG.md` para verificar duplicatas
2. Definir nome (lowercase-hyphenated) e categoria
3. Criar diretório `<category>/<skill-name>/`
4. Criar `SKILL.md` com frontmatter (`name` + `description`)
5. Escrever corpo: parágrafo + objetivo + fluxo + critérios
6. Adicionar limitações, casos de uso e exemplos
7. Validar ≤ 200 linhas e todas as seções obrigatórias
8. Atualizar `_meta/CATALOG.md`

## Critérios de Qualidade

- [ ] `name` = nome da pasta, lowercase-hyphenated, ≤ 64 chars
- [ ] `description` inicia com "Use when..." e contém "Use ONLY when..."
- [ ] H1 único, parágrafo intro ≤ 3 linhas
- [ ] Seções obrigatórias: Objetivo, Fluxo, Critérios, Limitações, Casos de Uso
- [ ] Fluxo com passos numerados (≤ 10)
- [ ] Critérios de qualidade como checklist (≤ 10)
- [ ] Exemplos com Entrada + Saída Esperada (1-3)
- [ ] Total ≤ 200 linhas
- [ ] YAML e Markdown válidos
- [ ] Sem emojis, sem HTML, sem campos de frontmatter inventados

## Limitações

- Não valida skills existentes (usar `@skill-validator`)
- Não edita skills já publicadas
- Não gerencia versões ou changelog
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar primeira skill da biblioteca
- Criar skill nova para nova categoria
- Ensinar novo membro do time a criar skills
- Recriar skill que foi removida

## Casos onde NÃO utilizar

- Para editar skill existente (edição direta é mais eficiente)
- Para validar skill criada (usar `@skill-validator`)
- Para navegar o catálogo (ler `_meta/CATALOG.md`)

## Exemplos

### Exemplo 1: Criar skill a partir do zero

**Entrada:**
```
Criar skill chamada "api-design" na categoria "architecture"
```

**Saída Esperada:**
```
Diretório: architecture/api-design/
Arquivo: SKILL.md
Frontmatter:
  name: api-design
  description: "Use when designing REST, GraphQL, or gRPC APIs..."
Corpo: parágrafo + objetivo + fluxo + critérios + limitações + exemplos
```

### Exemplo 2: Frontmatter válido

**Entrada:**
```
Gerar frontmatter para skill "code-review"
```

**Saída Esperada:**
```yaml
---
name: code-review
description: "Use when reviewing code for quality issues. Checks style, complexity, and maintainability. Use ONLY when the task is about code review, not test generation or documentation."
metadata:
  version: "1.0.0"
  stable: "true"
  category: "code-quality"
---
```
