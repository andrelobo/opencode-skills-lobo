---
name: skill-auditor
description: "Use when auditing skills for conflicts, duplications, and quality scores. Use ONLY when the task is about skill audit, not creation or editing."
---

# Skill Auditor

Auditor de skills da biblioteca. Revisa, valida e gera relatórios de qualidade.

## Objetivo

Realizar auditoria completa da biblioteca de skills, garantindo qualidade, consistência e conformidade com convenções estabelecidas.

## Fluxo de Trabalho

1. Mapear todas as skills (`find skills/ -name SKILL.md`)
2. Validar frontmatter (name, description) e naming conventions
3. Verificar seções obrigatórias e tamanho (≤200 linhas)
4. Avaliar complexidade (passos, itens, exemplos)
5. Detectar conflitos, duplicações e ambiguidades entre skills
6. Verificar compatibilidade com a biblioteca
7. Gerar Score de Qualidade (0-100)

## Critérios de Qualidade

- [ ] Frontmatter válido com description no formato "Use when... Use ONLY when..."
- [ ] Naming lowercase-hyphenated, ≤64 caracteres
- [ ] Seções obrigatórias presentes (Objetivo, Fluxo, Critérios, Limitações, Casos de Uso)
- [ ] Fluxo ≤10 passos, critérios ≤10 itens
- [ ] Total ≤200 linhas
- [ ] Sem conflitos nem duplicações com outras skills
- [ ] Descrições sem ambiguidades

## Fórmula de Score

```
Score = (Frontmatter × 20) + (Seções × 20) + (Tamanho × 15) +
        (Complexidade × 15) + (Sem Conflitos × 15) +
        (Sem Duplicações × 10) + (Compatibilidade × 5)

Classificação: 90-100 Excelente | 70-89 Boa | 50-69 Razoável | 30-49 Melhorias | 0-29 Crítica
```

## Limitações

- Não valida conteúdo semântico (apenas estrutura)
- Não edita skills (usar `@skill-creator` ou `@skill-validator`)
- Não gera novas skills

## Casos de Uso

**Utilizar quando:**
- Auditoria periódica da biblioteca
- Antes de release ou ao revisar PR que modifica skills
- Ao detectar problemas de qualidade ou planejar refatoração

**NÃO utilizar quando:**
- Criar skill (usar `@skill-creator`)
- Validar skill individual (usar `@skill-validator`)
- Editar skill (edição direta)
- Navegar catálogo (ler `CATALOG.md`)

## Exemplos

### Exemplo 1: Auditoria completa da biblioteca

**Entrada:**
```
Audite todas as skills da biblioteca
```

**Saída:**
```
Relatório de Auditoria - [data]
Skills auditadas: 89 | Score Médio: 82/100 | Problemas: 3

Problemas:
1. ai/mcp - Tamanho excedido (215 linhas)
2. education/treinamentos - Conflito com inclusion/treinamentos-corporativos
3. api/rest - Description ambígua

Recomendações:
- Modularizar ai/mcp em sub-skills
- Renomear education/treinamentos para education/treinamentos-educacionais
- Reescrever description de api/rest
```

### Exemplo 2: Auditoria de skill específica

**Entrada:**
```
Audite a skill backend/nodejs
```

**Saída:**
```
Auditoria: backend/nodejs | Score: 95/100

✅ Frontmatter válido | Seções completas (6/6)
✅ Tamanho adequado (142 linhas) | Complexidade OK
✅ Sem conflitos | Sem duplicações | Compatível

Recomendações: Nenhuma
```
