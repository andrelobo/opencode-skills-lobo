# Changelog

Todas as mudanças notáveis nesta biblioteca serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

## [Unreleased]

### Added

- Integração com o DeepSeek Harness em `dsh/`:
  - `sync-skills.mjs` valida as skills e cria a árvore plana de symlinks em
    `.dsh/skills` (projeto) e `~/.dsh/skills` (usuário)
  - 5 agent presets (`backend`, `frontend`, `devops`, `qualidade`,
    `docs-educacao`) gerados a partir do preset `standard` do harness
  - `agents/install.mjs` instala/remove os presets de forma idempotente no
    `cordis.patch.yml` do perfil
  - `skills.manifest.json` como fonte da verdade de nomes/categorias
  - `dsh/install.sh` como atalho para o setup completo
- Documentação da integração em `dsh/README.md`

### Fixed

- Contagens de skills por categoria no `README.md` e `AGENTS.md` (real: 90
  skills; API 5, Architecture 2, Automation 1, Code Quality 2, Database 3,
  Documentation 1, Frontend 2, Productivity 1, Security 3)

---

## [1.0.0] - 2026-07-16

### Added

- 90 skills em 16 categorias
- Skills de AI (13)
- Skills de API (6)
- Skills de Architecture (5)
- Skills de Automation (3)
- Skills de Backend (7)
- Skills de Code Quality (5)
- Skills de Database (4)
- Skills de DevOps (10)
- Skills de Documentation (2)
- Skills de Education (14)
- Skills de Foundation (3)
- Skills de Frontend (4)
- Skills de Inclusion (19)
- Skills de Productivity (3)
- Skills de Security (4)
- Skills de Testing (4)
- Catálogo completo (`_meta/CATALOG.md`)
- QA automático (score 100/100)
- Otimização de descriptions (≤150 chars)
- Otimização de tamanho (média 112 linhas)

### Changed

- Descriptions reduzidas de ~280 para ~135 caracteres
- Arquivos maiores otimizados (máximo 120 linhas)
- Seções mescladas para reduzir redundância

### Fixed

- Skills com seções faltando
- Descriptions muito longas
- Formatação inconsistente

---

## [0.9.0] - 2026-07-15

### Added

- Skills iniciais (90)
- Estrutura de categorias
- Frontmatter padrão

---

## [0.8.0] - 2026-07-14

### Added

- Primeira versão da biblioteca
- 30 skills técnicas
- 14 skills de educação
- 19 skills de inclusão
