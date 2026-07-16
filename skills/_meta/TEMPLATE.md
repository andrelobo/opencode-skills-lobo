# Template Mestre — Skills OpenCode

Este arquivo é o **template oficial** que toda skill da biblioteca deve seguir.
Copie, preencha os campos `<...>`, e remova os comentários explicativos.

---

## TEMPLATE

```markdown
---
name: <lowercase-hyphenated-name>
description: "Use when <contexto>. <Gatilho principal>. Use ONLY when <limiteestrito>."
---

# <Skill Name>

<Parágrafo único: o quê esta skill faz, porquê existe, e quando ativá-la. Máx 3 linhas.>

## Objetivo

<Objetivo claro, mensurável, em uma ou duas frases.>

## Fluxo de Trabalho

1. <Passo 1>
2. <Passo 2>
3. <Passo N>

## Critérios de Qualidade

- [ ] <Critério 1>
- [ ] <Critério 2>
- [ ] <Critério N>

## Limitações

- <O que esta skill NÃO faz>
- <Boundary explícito>

## Casos de Uso

- <Cenário 1 onde esta skill é ativada>
- <Cenário 2>

## Casos onde NÃO utilizar

- <Cenário oposto ao caso de uso>
- <Anti-pattern>

## Exemplos

### Exemplo 1: <Nome do Cenário>

**Entrada:**
```
<descrição ou código de entrada>
```

**Saída Esperada:**
```
<resultado esperado>
```
```

---

## REFERÊNCIA: Campos do Frontmatter

### `name` (OBRIGATÓRIO)

```yaml
name: code-review
```

| Regra | Detalhe |
|-------|---------|
| Formato | lowercase, hyphen-separated |
| Max caracteres | 64 |
| Deve igualar | Nome da pasta que contém o SKILL.md |
| Exemplos válidos | `code-review`, `api-design`, `skill-creator` |
| Exemplos inválidos | `Code-Review`, `api_design`, `codeReview` |

**Por quê**: O OpenCode usa o `name` para indexar eคารregamento de skills.
O nome deve ser previsível e consistente.

---

### `description` (OBRIGATÓRIO — sem ele a skill é filtrada)

```yaml
description: "Use when reviewing code for quality issues. Checks style, complexity, and maintainability. Use ONLY when the task is about code review, not test generation or documentation."
```

| Regra | Detalhe |
|-------|---------|
| Formato | Frase única, terceira pessoa |
| Deve conter | O quê + Quando + Limite |
| Início recomendado | "Use when..." |
| Limite recomendado | "Use ONLY when..." |
| Max caracteres | ~300 (recomendado) |

**Estrutura ideal da description:**

```
Use when <ação>. <O que faz>. Use ONLY when <limiteestrito>.
```

**Por quê**: A description é o que o OpenCode usa para decidir quando
carregar a skill. Uma description vaga = ativação desnecessária = consumo
de contexto desperdiçado.

**Exemplos:**

```yaml
# ✅ Boa — ativação precisa
description: "Use when creating or editing opencode skills, SKILL.md files, or skill frontmatter. Use ONLY when the task is about opencode skill architecture."

# ❌ Ruim — ativação ampla
description: "Helps with coding tasks"

# ❌ Ruim — sem limite
description: "Use when working with code"
```

---

### `license` (OPCIONAL)

```yaml
license: "MIT"
```

Usar para indicar a licença da skill. Para biblioteca interna,
usar `"MIT"` ou `"UNLICENSED"`.

---

### `compatibility` (OPCIONAL)

```yaml
compatibility: "opencode>=1.0.0"
```

Indicar versão mínima do OpenCode compatível. Usar quando a skill
depende de funcionalidades específicas.

---

### `metadata` (OPCIONAL)

```yaml
metadata:
  version: "1.0.0"
  stable: "true"
  category: "code-quality"
  author: "team-name"
```

Mapa string-string. Usar para campos adicionais. Valores são sempre strings.

**Campos recomendados para metadata:**

| Campo | Obrigatório | Descrição |
|-------|-------------|-----------|
| `version` | Sim | Versão SemVer da skill |
| `stable` | Não | `"true"` ou `"false"` |
| `category` | Não | Categoria da taxonomia |
| `author` | Não | Autor ou time responsável |

**Campos que NÃO devem ser inventados no frontmatter:**

- `tags` (não suportado pelo schema)
- `models` (não suportado pelo schema)
- `activation-rules` (não suportado pelo schema)
- `priority` (não suportado pelo schema)

---

## REFERÊNCIA: Estrutura do Corpo

### Regra Geral

O corpo é **markdown livre**. O OpenCode não valida o conteúdo — apenas
injeta no contexto do modelo. Portanto:

- Manter format padrão (H1, H2, listas, código)
- Ser claro e direto
- Evitar formatação exótica

---

### Seção: Título (H1)

```markdown
# Code Review
```

**Regra**: Exatamente um H1. Deve ser o nome legível da skill (title case).

---

### Seção: Parágrafo Intro

```markdown
Revisa código para problemas de qualidade, estilo, complexidade e
manutenção. Deve ser ativada antes de commits e PRs.
```

**Regra**: Máx 3 linhas. Responder: O quê? Por quê? Quando?

---

### Seção: Objetivo

```markdown
## Objetivo

Identificar e reportar problemas de qualidade em código, sugerindo
melhorias concretas e acionáveis.
```

**Regra**: Uma ou duas frases. Mensurável quando possível.

---

### Seção: Fluxo de Trabalho

```markdown
## Fluxo de Trabalho

1. Ler o código fornecido
2. Verificar estilo e convenções
3. Identificar complexidade desnecessária
4. Verificar padrões de segurança
5. Gerar relatório com sugestões
```

**Regra**: Lista numerada. Cada passo = uma ação concreta.
Máx 10 passos. Se mais, decompor em sub-skills.

---

### Seção: Critérios de Qualidade

```markdown
## Critérios de Qualidade

- [ ] Código segue convenções do projeto
- [ ] Funções têm responsabilidade única
- [ ] Não há código morto ou não utilizado
- [ ] Variáveis e funções têm nomes descritivos
- [ ] Não há magic numbers
```

**Regra**: Checklist com `- [ ]`. Cada critério = teste mental.
Máx 10 critérios.

---

### Seção: Limitações

```markdown
## Limitações

- Não executa código — apenas analisa
- Não acessa sistemas externos
- Não depende de plugins ou MCP servers
```

**Regra**: Lista explícita do que a skill NÃO faz.
Evita expectativas incorretas.

---

### Seção: Casos de Uso

```markdown
## Casos de Uso

- Revisar PR antes de merge
- Validar código após refatoração
- Auditar código legado para modernização
```

**Regra**: Lista com `-`. Cenários concretos e específicos.

---

### Seção: Casos onde NÃO utilizar

```markdown
## Casos onde NÃO utilizar

- Quando o objetivo é gerar testes (usar `@test-generation`)
- Quando o objetivo é documentar código (usar `@doc-writer`)
```

**Regra**: Lista com `-`. Incluir referências a skills alternativas
quando aplicável.

---

### Seção: Exemplos

```markdown
## Exemplos

### Exemplo 1: Revisão de Função

**Entrada:**
```python
def calc(x, y, z):
    return x * y * z / 100
```

**Saída Esperada:**
- Função `calc` não tem nome descritivo
- Parâmetros `x`, `y`, `z` são genéricos
- Magic number `100`
- Sugestão: `calculate_percentage(quantity, price, tax_rate)`
```

**Regra**: Máx 3 exemplos. Cada exemplo: Entrada → Saída Esperada.
Exemplos curtos (5-10 linhas de código).

---

## BOAS PRÁTICAS

### Descrição

1. **Inicie com "Use when"** — padrão reconhecível
2. **Adicione "Use ONLY when"** — limita ativação
3. **Use palavras-chave concretas** — filenames, termos técnicos
4. **Seja específico** — "code review" não "code tasks"

### Corpo

1. **Mantenha curto** — máx 200 linhas total
2. **Seja direto** — sem rodeio, sem preâmbulo
3. **Use listas** — mais escaneável que parágrafos
4. **Um objetivo por skill** — não misture responsabilidades
5. **Exemplos curtos** — 5-10 linhas, não boilerplate

### Organização

1. **Seções obrigatórias primeiro** — Objetivo, Fluxo, Critérios
2. **Seções opcionais depois** — Limitações, Casos de Uso, Exemplos
3. **Hierarquia clara** — H1 > H2 > H3, sem pular níveis

---

## ERROS COMUNS

### Erro 1: Description Vaga

```yaml
# ❌ ERRADO
description: "Helps with software engineering"

# ✅ CERTO
description: "Use when creating or editing opencode SKILL.md files or skill frontmatter. Use ONLY when the task is about opencode skill architecture."
```

**Impacto**: Ativação em contextos irrelevantes. Consumo de contexto
desperdiçado. Modelo confundido com instruções não relacionadas.

---

### Erro 2: Skill Gigante

```markdown
# ❌ ERRADO: Uma skill que faz tudo
## Code Review
## Test Generation
## Documentation
## Refactoring
## Deployment
```

**Impacto**: Muitos tokens. Difícil manter. Difícil ativar seletivamente.

**Correção**: Decompor em skills menores, uma por responsabilidade.

---

### Erro 3: Sem Limitações

```markdown
# ❌ ERRADO
## Limitações
(não há)
```

**Impacto**: Modelo tenta usar a skill para tarefas fora do escopo.

**Correção**: Sempre listar explicitamente o que NÃO faz.

---

### Erro 4: Frontmatter Inventado

```yaml
# ❌ ERRADO — campos não existem no schema
tags: ["python", "review"]
models: ["claude-sonnet"]
activation: "on-keyword"
priority: 1
```

**Impacto**: OpenCode pode rejeitar ou ignorar campos desconhecidos.

**Correção**: Usar apenas `name`, `description`, `license`,
`compatibility`, `metadata`.

---

### Erro 5: Exemplos Longos

```markdown
# ❌ ERRADO: 50 linhas de código
### Exemplo
```python
class User:
    def __init__(self, name, email, phone, address, city, state, zip):
        self.name = name
        # ... 45 linhas mais
```

**Correção**: Máx 10 linhas. Foco no ponto-chave.

---

### Erro 6: Repetição entre Skills

```markdown
# ❌ ERRADO: Mesmas instruções em 3 skills
## Skill A
"Sempre valide o schema antes de escrever"

## Skill B
"Sempre valide o schema antes de escrever"

## Skill C
"Sempre valide o schema antes de escrever"
```

**Correção**: Extrair para skill separada (`skill-validator`) e
referenciar com `@skill-validator`.

---

## CRITÉRIOS DE QUALIDADE

### Checklist de Validação

Antes de publicar uma skill, validar:

- [ ] `name` = nome da pasta (lowercase-hyphenated)
- [ ] `name` ≤ 64 caracteres
- [ ] `description` inicia com "Use when..."
- [ ] `description` contém "Use ONLY when..."
- [ ] `description` tem palavras-chave concretas
- [ ] H1 existe e é único
- [ ] Seção "Objetivo" existe e é clara
- [ ] Seção "Fluxo de Trabalho" tem passos numerados
- [ ] Seção "Critérios de Qualidade" tem checklist
- [ ] Seção "Limitações" lista o que NÃO faz
- [ ] Seção "Casos de Uso" tem ≥ 1 cenário
- [ ] Seção "Casos onde NÃO utilizar" existe
- [ ] Exemplos têm Entrada + Saída Esperada
- [ ] Total ≤ 200 linhas
- [ ] Sem emojis
- [ ] Sem comentários HTML
- [ ] YAML válido no frontmatter
- [ ] Markdown válido no corpo

### Métricas de Qualidade

| Métrica | Meta |
|---------|------|
| Linhas totais | ≤ 200 |
| Exemplos | 1-3 |
| Critérios de qualidade | ≤ 10 |
| Passos de fluxo | ≤ 10 |
| Casos de uso | 2-5 |
| Casos onde NÃO usar | 1-3 |

---

## PADRÕES DE DOCUMENTAÇÃO

### Padronização de Listas

```markdown
# ✅ CERTO
- Item com minúscula
- Item com minúscula

# ❌ ERRADO
- Item com maiúscula
- Item com Ponto final.
```

**Regra**: Listas sem ponto final. Início com minúscula.

### Padronização de Código

```markdown
# ✅ CERTO — sempre especificar linguagem
```python
def hello():
    pass
```

# ❌ ERRADO — sem linguagem
```
def hello():
    pass
```
```

### Padronização de Referências a Skills

```markdown
# ✅ CERTO — formato `@skill-name`
Consulte `@test-generation` para criar testes.

# ❌ ERRADO — formatos variados
Consulte a skill de testes.
Consulte [test-generation].
```

### Padronização de Cabeçalhos

```markdown
# ✅ CERTO — title case, sem pontuação
## Fluxo de Trabalho
## Critérios de Qualidade

# ❌ ERRADO — camelCase, com pontuação
## fluxoDeTrabalho
## Critérios de Qualidade:
```

### Padronização de Notas

```markdown
# ✅ CERTO — nota discreta
> **Nota**: Esta skill não executa código.

# ❌ ERRADO — nota chamativa
> ⚠️ IMPORTANTE!!! ATENÇÃO!!!
```

---

## CAMINHO DO ARQUIVO

```
~/.config/opencode/skills/<category>/<skill-name>/SKILL.md
```

Exemplo completo:

```
~/.config/opencode/skills/code-quality/code-review/SKILL.md
```

---

## CHECKLIST FINAL

Ao criar uma nova skill:

1. [ ] Consultar `_meta/CATALOG.md` para evitar duplicatas
2. [ ] Escolher categoria correta
3. [ ] Nomear com lowercase-hyphenated
4. [ ] Preencher frontmatter com name + description
5. [ ] Escrever parágrafo intro (3 linhas máx)
6. [ ] Definir objetivo claro
7. [ ] Listar passos do fluxo
8. [ ] Criar critérios de qualidade (checklist)
9. [ ] Listar limitações
10. [ ] Listar casos de uso
11. [ ] Listar casos onde NÃO usar
12. [ ] Adicionar 1-3 exemplos
13. [ ] Validar ≤ 200 linhas
14. [ ] Validar YAML válido
15. [ ] Validar Markdown válido
16. [ ] Atualizar `_meta/CATALOG.md`
