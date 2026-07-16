---
name: skill-validator
description: "Use when validating skills for conventions, frontmatter, and structure. Use ONLY when the task is about skill validation, not creation."
---

# Skill Validator

Validar skills existentes contra as convenções da biblioteca e a
documentação oficial do OpenCode. Gera relatório de conformidade
com erros, avisos e sugestões.

## Objetivo

Verificar que uma skill está em conformidade com todas as regras
da biblioteca e gerar relatório de auditoria acionável.

## Fluxo de Trabalho

1. Ler o arquivo `SKILL.md` da skill alvo
2. Validar frontmatter: `name`, `description`, campos opcionais
3. Validar naming: lowercase-hyphenated, ≤ 64 chars, iguala pasta
4. Validar `description`: "Use when...", "Use ONLY when...", palavras-chave
5. Validar seções obrigatórias: Objetivo, Fluxo, Critérios, Limitações, Casos de Uso
6. Validar métricas: linhas ≤ 200, passos ≤ 10, critérios ≤ 10
7. Validar estilo: sem emojis, sem HTML, listas sem ponto, referências `@`
8. Gerar relatório com erros (bloqueia), avisos (recomendado) e ok

## Critérios de Qualidade

- [ ] Frontmatter tem `name` e `description` obrigatórios
- [ ] `name` é lowercase-hyphenated e ≤ 64 caracteres
- [ ] `name` iguala o nome da pasta
- [ ] `description` inicia com "Use when..."
- [ ] `description` contém "Use ONLY when..."
- [ ] H1 existe e é único
- [ ] Todas as seções obrigatórias estão presentes
- [ ] Métricas dentro dos limites (200 linhas, 10 passos, 10 critérios)
- [ ] Sem emojis, sem HTML, YAML e Markdown válidos
- [ ] Referências a skills usam formato `@skill-name`

## Limitações

- Não corrige problemas encontrados — apenas reporta
- Não cria skills (usar `@skill-creator`)
- Não edita skills (edição direta é mais eficiente)
- Não valida dependências externas ou plugins

## Casos de Uso

- Antes de publicar skill nova na biblioteca
- Após editar skill existente
- Durante auditoria periódica da biblioteca
- Ao revisar PR que adiciona ou modifica skills

## Casos onde NÃO utilizar

- Para criar skill nova (usar `@skill-creator`)
- Para editar skill (edição direta)
- Para navegar o catálogo (ler `_meta/CATALOG.md`)
- Para validar config do OpenCode

## Exemplos

### Exemplo 1: Skill válida

**Entrada:**
```
Validar ~/.config/opencode/skills/code-quality/code-review/SKILL.md
```

**Saída Esperada:**
```
RELATÓRIO DE VALIDAÇÃO — code-review

[OK]   name: "code-review" = pasta "code-review"
[OK]   name: 11 chars ≤ 64
[OK]   description: inicia com "Use when..."
[OK]   description: contém "Use ONLY when..."
[OK]   H1: "# Code Review" único
[OK]   Seções: Objetivo, Fluxo, Critérios, Limitações, Casos de Uso
[OK]   Métricas: 85 linhas, 7 passos, 8 critérios
[OK]   Estilo: sem emojis, sem HTML
[WARN] Exemplos: apenas 1 (recomendado 1-3)

Resultado: 9 OK, 1 WARN, 0 ERROS — APTO PARA PUBLICAÇÃO
```

### Exemplo 2: Skill com erros

**Entrada:**
```
Validar skill com name "CodeReview"
```

**Saída Esperada:**
```
RELATÓRIO DE VALIDAÇÃO — CodeReview

[ERRO] name: "CodeReview" não é lowercase-hyphenated
[ERRO] name: pasta é "CodeReview", deveria ser "code-review"
[ERRO] description: não inicia com "Use when..."
[WARN] description: não contém "Use ONLY when..."
[OK]   H1: "# Code Review" único
[ERRO] Seções: faltam "Limitações" e "Casos onde NÃO utilizar"
[ERRO] Métricas: 250 linhas > 200
[OK]   Estilo: sem emojis

Resultado: 5 ERROS, 1 WARN — NÃO APTO PARA PUBLICAÇÃO
Corrija os erros antes de publicar.
```
