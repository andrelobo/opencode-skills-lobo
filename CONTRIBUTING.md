# Contribuindo para o OpenCode Skills Library

Obrigado por contribuir! 🎉

## Como Adicionar uma Skill

### 1. Estrutura Necessária

```
skills/
└── category/
    └── skill-name/
        └── SKILL.md
```

### 2. Formato do SKILL.md

```markdown
---
name: skill-name
description: "Use when... Use ONLY when..."
---

# Nome da Skill

## Objetivo
O que esta skill faz.

## Fluxo de Trabalho
1. Passo 1
2. Passo 2

## Critérios de Qualidade
- [ ] Critério 1
- [ ] Critério 2

## Limitações
- Limitação 1

## Casos de Uso
- Caso 1

## Exemplos
### Exemplo 1
...
```

### 3. Regras de Naming

| Regra | Correto | Incorreto |
|-------|---------|-----------|
| Minúsculas | `docker-compose` | `Docker-Compose` |
| Hífens | `code-review` | `code_review` |
| Sem espaços | `git-workflow` | `git workflow` |
| 1-64 chars | `react` | `a`.repeat(65) |

### 4. Checklist

- [ ] Arquivo `SKILL.md` existe
- [ ] Frontmatter tem `name` e `description`
- [ ] `name` coincide com o nome do diretório
- [ ] `description` tem 1-1024 caracteres
- [ ] `description` começa com "Use when..."
- [ ] `description` contém "Use ONLY when..."
- [ ] Skills com ≤200 linhas
- [ ] Todas as seções obrigatórias presentes
- [ ] Pelo menos 1 exemplo incluído

### 5. Seções Obrigatórias

| Seção | Obrigatória | Descrição |
|-------|-------------|-----------|
| `## Objetivo` | Sim | O que a skill faz |
| `## Fluxo de Trabalho` | Sim | Passos para usar |
| `## Critérios de Qualidade` | Sim | Checklist de qualidade |
| `## Limitações` | Sim | O que NÃO faz |
| `## Casos de Uso` | Sim | Quando usar |
| `## Exemplos` | Sim | Pelo menos 1 exemplo |

### 6. Teste Localmente

```bash
# Copie sua skill para o OpenCode
cp -r skills/ ~/.config/opencode/skills/

# Reinicie o OpenCode
opencode

# Teste a skill
# Use o nome da skill no chat
```

### 7. Crie um PR

```bash
# Crie uma branch
git checkout -b skill/nova-skill

# Adicione seus arquivos
git add skills/categoria/nova-skill/

# Commit
git commit -m "Add nova-skill skill"

# Push
git push origin skill/nova-skill

# Crie o PR no GitHub
```

## Padrões de Código

### Inglês vs Português

| Tipo | Idioma |
|------|--------|
| Nome da skill | Inglês (`docker-compose`) |
| Seções do SKILL.md | Português (`## Objetivo`) |
| Conteúdo | Português |

### Tamanho

| Métrica | Limite |
|---------|--------|
| Linhas totais | ≤200 |
| Média | ~112 |
| Descrição | ≤150 chars |

## Perguntas Frequentes

**Q: Posso adicionar skills em outras línguas?**
A: Sim! Crie um diretório com o código do idioma: `skills/pt/`, `skills/es/`, etc.

**Q: Posso modificar skills existentes?**
A: Sim, mas certifique-se de que o QA continua passando.

**Q: Como testar se minha skill funciona?**
A: Use o `skill-auditor` para verificar a estrutura.

## Contato

- Issues: https://github.com/SEU-USER/opencode-skills-library/issues
- Discussions: https://github.com/SEU-USER/opencode-skills-library/discussions
