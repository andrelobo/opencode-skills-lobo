# DeepSeek Harness (dsh)

Integração desta biblioteca de skills com o **DeepSeek Harness** (`dsh`) — o
agente que roda nesta máquina em `~/.dsh` e abre a GUI em `http://127.0.0.1:3080`.

O `dsh` descobre skills em diretórios **planos**, então este diretório contém a
"ponte" entre a estrutura por categorias do repositório e os roots que o harness
varre.

## Como o dsh descobre skills

`@deepseek-ai/dsh-skill-filesystem` varre estes roots (um nível de profundidade,
`<nome>/SKILL.md` ou `<nome>.md`):

| Escopo | Caminho | Rank (menor vence) |
|--------|---------|--------------------|
| Projeto | `<projeto>/.dsh/skills` | 100 |
| Projeto | `<projeto>/.agents/skills` | 200 |
| Custom | `customSkillDirs` no perfil | 300 |
| Usuário | `$DSH_HOME/skills` (padrão `~/.dsh/skills`) | 400 |
| Usuário | `~/.agents/skills` | 500 |
| Bundled | skills empacotadas com o dsh | 600 |

Como `skills/<categoria>/<skill>/SKILL.md` tem dois níveis, ela **não** seria
encontrada diretamente. A solução é uma árvore plana de symlinks que aponta de
volta para o repositório: um `git pull` aqui atualiza todas as skills sem cópia.

## Scripts

| Script | O que faz |
|--------|-----------|
| `sync-skills.mjs` | Valida as 90 skills e recria a árvore plana em `.dsh/skills` (projeto) e `~/.dsh/skills` (usuário); grava `skills.manifest.json` |
| `install.sh` | Atalho: sync das skills + geração e instalação dos agentes |
| `agents/build-presets.mjs` | Gera `agents/presets.patch.yml` a partir do preset `standard` do dsh instalado |
| `agents/install.mjs` | Anexa/remove o bloco de presets no `cordis.patch.yml` do perfil (idempotente) |

### Skills

```bash
# projeto + usuário (padrão)
node dsh/sync-skills.mjs

# apenas um escopo
node dsh/sync-skills.mjs --scope project
node dsh/sync-skills.mjs --scope user

# pré-visualizar sem escrever
node dsh/sync-skills.mjs --scope both --dry-run
```

O script:

- recusa nome fora de kebab-case, nome duplicado ou divergente do diretório;
- avisa sobre descrição fora da convenção do repo (começar com `Use when...`,
  até 150 caracteres);
- remove apenas symlinks obsoletos que ele mesmo criou (nunca diretórios reais);
- respeita `DSH_HOME`, se definido.

Depois disso as skills aparecem no catálogo da sessão (inclusive em sessões já
abertas, pois o provider observa os roots com watcher).

### Agentes (agent presets)

O repositório não tinha agentes; `dsh/agents/` cria **5 presets** derivados do
preset `standard` do harness, cada um com persona, skills prioritárias e um
subconjunto de ferramentas:

| Preset | Foco | Ferramentas |
|--------|------|-------------|
| `backend` | APIs, banco, serviços | standard menos orquestração |
| `frontend` | React/Next/a11y/performance | standard menos orquestração |
| `devops` | CI/CD, containers, cloud, observabilidade | standard menos orquestração |
| `qualidade` | revisão, testes, auditoria de segurança | **filesystem somente leitura** (`write: false`, `edit: false`) |
| `docs-educacao` | docs técnicas, conteúdo educacional inclusivo | standard menos orquestração |

Em todos eles são removidos `tool-schedule`, `command-goal`/`tool-goal`,
`workflow-ptc`/`tool-workflow` e o gerenciador de plugins — agentes focados não
precisam de agendamento, goals nem orquestração multi-agente.

```bash
# gera presets.patch.yml (idempotente)
node dsh/agents/build-presets.mjs

# instala no perfil web (padrão), com backup
node dsh/agents/install.mjs --profile web --backup

# pré-visualizar / remover
node dsh/agents/install.mjs --dry-run
node dsh/agents/install.mjs --uninstall
```

O instalador mexe **somente** no bloco marcado:

```
# >>> opencode-skills-lobo: agent presets ... >>>
...
# <<< opencode-skills-lobo: agent presets <<<
```

Depois de instalar, reinicie o harness (`dsh web`) e escolha o agente em
**Settings → General → Agent preset** (ou na criação da sessão). O padrão
continua sendo `standard`.

## Instalação completa

```bash
./dsh/install.sh                 # perfil web, escopo global + projeto
./dsh/install.sh --dry-run
./dsh/install.sh --profile web --uninstall
```

## Verificação

```bash
# 90 links em cada root, nenhum quebrado
ls ~/.dsh/skills | wc -l
find -L ~/.dsh/skills -name SKILL.md | wc -l

# composição do perfil válida e contendo os 5 presets
dsh --profile web --dump-config | grep "id: preset-"

# manifesto com nomes, categorias e descrições
node -e "const m=require('./dsh/skills.manifest.json'); console.log(m.total, m.categories)"
```

Resultado esperado: `90` skills, `5` presets novos (`preset-backend`,
`preset-frontend`, `preset-devops`, `preset-qualidade`, `preset-docs-educacao`).

## Limitações e cuidados

- **Upgrade do dsh**: os presets são copiados do preset `standard` da versão
  instalada; após atualizar o `dsh`, rode `build-presets.mjs` + `install.mjs`
  de novo para pegar ferramentas novas.
- **Symlinks**: use `git pull` no repositório para atualizar as skills. Se o
  repositório mudar de caminho, rode o sync de novo (links do escopo usuário são
  absolutos; os do projeto são relativos).
- **Windows/clones**: `.dsh/` é gerado e ignorado pelo git; quem clona precisa
  rodar `node dsh/sync-skills.mjs` (o caminho global usa symlinks).
- **Nomes globais**: as skills valem para qualquer projeto. Para desativar,
  apague os links em `~/.dsh/skills` ou rode o sync com outro `DSH_HOME`.
- **Perfis diferentes de `web`**: use `--profile <nome>` no `install.mjs`.
- Skills com `@outra-skill` no corpo continuam sendo referências textuais; o
  harness carrega skills pelo nome via ferramenta `skill`.
