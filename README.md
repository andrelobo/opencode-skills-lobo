# OpenCode Skills Library

Biblioteca completa de **90+ skills** para o OpenCode, organizadas em 16 categorias.

[![GitHub stars](https://img.shields.io/github/stars/andrelobo/opencode-skills-lobo?style=social)](https://github.com/andrelobo/opencode-skills-lobo)

---

## Visão Geral

| Métrica | Valor |
|---------|-------|
| Total de Skills | **90** |
| Categorias | **16** |
| Média de Linhas | **112** |
| Score QA | **100/100** |

---

## Instalação

### Opção 1: Clone Rápido

```bash
cd ~/.config/opencode/
git clone https://github.com/andrelobo/opencode-skills-lobo.git skills
```

### Opção 2: Copiar Manual

```bash
cd ~/.config/opencode/
git clone https://github.com/andrelobo/opencode-skills-lobo.git
cd opencode-skills-lobo
mv skills/* ../skills/
cd ..
rm -rf opencode-skills-lobo
```

---

## Sincronização

### Push (Computer → GitHub)

```bash
cd ~/.config/opencode/skills
git add .
git commit -m "Update: $(date +%Y-%m-%d)"
git push
```

### Pull (GitHub → Computer)

```bash
cd ~/.config/opencode/skills
git pull
```

---

## Categorias

| # | Categoria | Skills | Descrição |
|---|-----------|--------|-----------|
| 1 | AI | 13 | Ferramentas de IA e LLMs |
| 2 | API | 5 | Design e implementação de APIs |
| 3 | Architecture | 2 | Padrões de arquitetura |
| 4 | Automation | 1 | Automação com n8n |
| 5 | Backend | 7 | Desenvolvimento backend |
| 6 | Code Quality | 2 | Qualidade de código |
| 7 | Database | 3 | Bancos de dados |
| 8 | DevOps | 10 | DevOps e infraestrutura |
| 9 | Documentation | 1 | Documentação |
| 10 | Education | 14 | Educação e ensino |
| 11 | Foundation | 3 | Fundamentos do OpenCode |
| 12 | Frontend | 2 | Desenvolvimento frontend |
| 13 | Inclusion | 19 | Acessibilidade e inclusão |
| 14 | Productivity | 1 | Produtividade |
| 15 | Security | 3 | Segurança |
| 16 | Testing | 4 | Testes |

---

## Instalação no DeepSeek Harness (dsh)

As skills também rodam no [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness).
Como o dsh varre diretórios **planos** (`<nome>/SKILL.md`), o diretório `dsh/`
cria uma árvore de symlinks a partir de `skills/<categoria>/<skill>`:

```bash
./dsh/install.sh            # skills (projeto + usuário) e 5 agent presets
./dsh/install.sh --dry-run  # só mostra o que seria feito
```

O que isso registra:

- **90 skills** em `.dsh/skills` (escopo projeto) e `~/.dsh/skills` (escopo
  usuário, válido em qualquer projeto);
- **5 agent presets** no perfil do harness: `backend`, `frontend`, `devops`,
  `qualidade` (somente leitura) e `docs-educacao`.

Detalhes, validação e como desinstalar: [`dsh/README.md`](dsh/README.md).

---

## Como Usar

### Carregar uma Skill

```
Use a skill chamada "docker" para me ajudar com containers
```

Ou mencione diretamente:

```
@skill docker
```

---

## Estrutura do Projeto

```
opencode-skills-lobo/
├── AGENTS.md          # Documento de contexto
├── README.md          # Documentação principal
├── CONTRIBUTING.md    # Guia de contribuição
├── CHANGELOG.md       # Histórico de versões
├── LICENSE            # MIT License
├── install.sh         # Script de instalação (OpenCode)
├── sync.sh            # Script de sincronização
├── dsh/               # Integração com o DeepSeek Harness
│   ├── install.sh             # skills + agent presets
│   ├── sync-skills.mjs        # valida e cria a árvore plana de symlinks
│   ├── skills.manifest.json   # manifesto gerado (nome, categoria, descrição)
│   └── agents/
│       ├── build-presets.mjs  # gera os presets a partir do preset standard
│       ├── install.mjs        # instala/remove o bloco no perfil do harness
│       └── presets.patch.yml  # 5 agent presets gerados
└── skills/            # 90 skills em 16 categorias
    ├── ai/
    ├── api/
    ├── architecture/
    ├── automation/
    ├── backend/
    ├── code-quality/
    ├── database/
    ├── devops/
    ├── documentation/
    ├── education/
    ├── foundation/
    ├── frontend/
    ├── inclusion/
    ├── productivity/
    ├── security/
    ├── testing/
    └── _meta/
```

---

## Compatibilidade

| Plataforma | Suporte |
|------------|---------|
| OpenCode (Terminal) | ✅ |
| OpenCode (Desktop) | ✅ |
| OpenCode (IDE) | ✅ |
| Claude Code | ✅ |
| DeepSeek Harness (`dsh`) | ✅ (via `dsh/install.sh`, inclui agent presets) |

---

## Contato

- **Repositório**: https://github.com/andrelobo/opencode-skills-lobo
- **Issues**: https://github.com/andrelobo/opencode-skills-lobo/issues

---

## Licença

MIT License
