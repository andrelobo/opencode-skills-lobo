# OpenCode Skills Library

## Visão Geral

Esta é uma biblioteca de **90+ skills** para o OpenCode, organizadas em 16 categorias. As skills são instruções reutilizáveis que o agente pode carregar sob demanda usando a ferramenta `skill`.

## Estrutura do Projeto

```
opencode-skills-lobo/
├── skills/                    # Skills organizadas por categoria
│   ├── ai/                    # 13 skills de IA
│   ├── api/                   # 6 skills de APIs
│   ├── architecture/          # 5 skills de arquitetura
│   ├── automation/            # 3 skills de automação
│   ├── backend/               # 7 skills de backend
│   ├── code-quality/          # 5 skills de qualidade
│   ├── database/              # 4 skills de banco de dados
│   ├── devops/                # 10 skills de DevOps
│   ├── documentation/         # 2 skills de documentação
│   ├── education/             # 14 skills de educação
│   ├── foundation/            # 3 skills fundamentais
│   ├── frontend/              # 4 skills de frontend
│   ├── inclusion/             # 19 skills de inclusão
│   ├── productivity/          # 3 skills de produtividade
│   ├── security/              # 4 skills de segurança
│   ├── testing/               # 4 skills de testes
│   └── _meta/                 # Catálogo e templates
├── README.md                  # Documentação principal
├── CONTRIBUTING.md            # Guia de contribuição
├── CHANGELOG.md               # Histórico de versões
└── install.sh                 # Script de instalação
```

## Como Usar as Skills

### Carregar uma Skill

```
Use a skill chamada "docker" para me ajudar com containers
```

Ou mencione diretamente:

```
@skill docker
```

### Listar Skills Disponíveis

As skills são listadas automaticamente na descrição da ferramenta `skill`. O agente vê todas as skills disponíveis e pode carregar a mais adequada.

## Categorias

| Categoria | Qtd | Descrição |
|-----------|-----|-----------|
| AI | 13 | Ferramentas de IA e LLMs |
| API | 6 | Design e implementação de APIs |
| Architecture | 5 | Padrões de arquitetura |
| Automation | 3 | Automação com n8n |
| Backend | 7 | Desenvolvimento backend |
| Code Quality | 5 | Qualidade de código |
| Database | 4 | Bancos de dados |
| DevOps | 10 | DevOps e infraestrutura |
| Documentation | 2 | Documentação |
| Education | 14 | Educação e ensino |
| Foundation | 3 | Fundamentos do OpenCode |
| Frontend | 4 | Desenvolvimento frontend |
| Inclusion | 19 | Acessibilidade e inclusão |
| Productivity | 3 | Produtividade |
| Security | 4 | Segurança |
| Testing | 4 | Testes |

## Formato de uma Skill

Cada skill é um arquivo `SKILL.md` com:

```markdown
---
name: nome-da-skill
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

## Limitações
- O que NÃO faz

## Casos de Uso
- Quando usar

## Exemplos
### Exemplo 1
...
```

## Convenções

### Naming

- Skills usam **lowercase com hífens**: `docker-compose`, `code-review`
- Diretórios seguem o mesmo padrão
- Nomes devem ter 1-64 caracteres

### Descriptions

- Devem começar com "Use when..."
- Devem conter "Use ONLY when..."
- Máximo 150 caracteres

### Tamanho

- Máximo 200 linhas por skill
- Média ideal: ~112 linhas

## Sincronização

### Push (Enviar mudanças)

```bash
cd ~/.config/opencode/skills
git add .
git commit -m "Update: descrição"
git push
```

### Pull (Baixar mudanças)

```bash
cd ~/.config/opencode/skills
git pull
```

## Comandos Úteis

```bash
# Listar todas as skills
ls ~/.config/opencode/skills/*/

# Contar skills
find ~/.config/opencode/skills/ -name "SKILL.md" | wc -l

# Buscar skill por conteúdo
grep -r "docker" ~/.config/opencode/skills/

# Verificar tamanho das skills
find ~/.config/opencode/skills/ -name "SKILL.md" -exec wc -l {} \; | sort -rn
```

## Troubleshooting

### Skill não aparece

1. Verifique se o arquivo se chama `SKILL.md` (maiúsculo)
2. Verifique se o frontmatter tem `name` e `description`
3. Reinicie o OpenCode

### Erro de permissão

```bash
# Verificar permissões
ls -la ~/.config/opencode/skills/

# Corrigir
chmod -R 755 ~/.config/opencode/skills/
```

## Links Úteis

- [Repositório](https://github.com/andrelobo/opencode-skills-lobo)
- [OpenCode Docs](https://opencode.ai/docs)
- [Skills Docs](https://opencode.ai/docs/skills)
