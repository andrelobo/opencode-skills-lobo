# Catálogo Geral — Biblioteca de Skills

Este catálogo lista todas as skills recomendadas para a biblioteca global.
Cada skill é classificada por prioridade e documentada com escopo completo.

> **Regra**: Antes de criar uma skill nova, SEMPRE consultar este catálogo
> para verificar se já existe ou se há sobreposição.

---

## Legenda de Prioridade

| Classificação | Significado | Ação |
|---------------|-------------|------|
| **Essencial** | Fundamental. Sem ela a biblioteca não funciona. | Implementar primeiro |
| **Importante** | Muito útil. Maioria dos projetos se beneficia. | Implementar segundo |
| **Especializada** | Útil em contextos específicos. | Implementar terceiro |
| **Opcional** | Nice-to-have. Pode ser adiada. | Implementar quando necessário |

---

## Resumo Geral

| # | Skill | Categoria | Prioridade | Status |
|---|-------|-----------|------------|--------|
| 1 | `skill-creator` | foundation | Essencial | Implementada |
| 2 | `skill-validator` | foundation | Importante | Implementada |
| 3 | `skill-auditor` | foundation | Essencial | Implementada |
| 4 | `code-review` | code-quality | Essencial | Implementada |
| 4 | `refactor` | code-quality | Importante | Implementada |
| 5 | `dead-code` | code-quality | Especializada | Planejada |
| 6 | `api-design` | architecture | Importante | Implementada |
| 7 | `database-design` | architecture | Especializada | Planejada |
| 8 | `test-generation` | testing | Essencial | Implementada |
| 9 | `test-strategy` | testing | Importante | Implementada |
| 10 | `doc-writer` | documentation | Importante | Implementada |
| 11 | `changelog` | documentation | Especializada | Planejada |
| 12 | `docker` | devops | Especializada | Implementada |
| 13 | `ci-cd` | devops | Especializada | Implementada |
| 14 | `security-audit` | security | Importante | Implementada |
| 15 | `dependency-audit` | security | Especializada | Planejada |
| 16 | `git-workflow` | productivity | Importante | Implementada |
| 17 | `commit-convention` | productivity | Especializada | Planejada |
| 18 | `performance` | architecture | Especializada | Implementada |
| 19 | `migration-helper` | devops | Opcional | Planejada |
| 20 | `env-setup` | devops | Opcional | Planejada |
| 21 | `typescript` | backend | Importante | Implementada |
| 22 | `javascript` | backend | Importante | Implementada |
| 23 | `linux` | devops | Importante | Implementada |
| 24 | `mcp` | ai | Importante | Implementada |
| 25 | `prompt-engineering` | ai | Importante | Implementada |
| 26 | `llms` | ai | Importante | Implementada |
| 27 | `agentes` | ai | Importante | Implementada |
| 28 | `observabilidade` | devops | Importante | Implementada |
| 29 | `logs` | devops | Importante | Implementada |
| 30 | `devops` | devops | Essencial | Implementada |
| 31 | `planejamento` | education | Importante | Implementada |
| 32 | `cursos` | education | Importante | Implementada |
| 33 | `treinamentos` | education | Importante | Implementada |
| 34 | `oficinas` | education | Importante | Implementada |
| 35 | `palestras` | education | Importante | Implementada |
| 36 | `apostilas` | education | Importante | Implementada |
| 37 | `materiais-didaticos` | education | Importante | Implementada |
| 38 | `aprendizagem-ativa` | education | Importante | Implementada |
| 39 | `ead` | education | Importante | Implementada |
| 40 | `avaliacoes` | education | Importante | Implementada |
| 41 | `rubricas` | education | Importante | Implementada |
| 42 | `relatorios` | education | Importante | Implementada |
| 43 | `certificados` | education | Importante | Implementada |
| 44 | `questionarios` | education | Importante | Implementada |
| 45 | `libras` | inclusion | Importante | Implementada |
| 46 | `inclusao-digital` | inclusion | Importante | Implementada |
| 47 | `acessibilidade` | inclusion | Essencial | Implementada |
| 48 | `wcag` | inclusion | Essencial | Implementada |
| 49 | `comunicacao-inclusiva` | inclusion | Importante | Implementada |
| 50 | `linguagem-simples` | inclusion | Importante | Implementada |
| 51 | `tecnologias-assistivas` | inclusion | Importante | Implementada |
| 52 | `treinamentos-corporativos` | inclusion | Importante | Implementada |
| 53 | `projetos-sociais` | inclusion | Importante | Implementada |
| 54 | `consultorias` | inclusion | Importante | Implementada |
| 55 | `diagnosticos` | inclusion | Importante | Implementada |
| 56 | `indicadores` | inclusion | Importante | Implementada |
| 57 | `pesquisas` | inclusion | Importante | Implementada |
| 58 | `questionarios-inclusao` | inclusion | Importante | Implementada |
| 59 | `relatorios-tecnicos` | inclusion | Importante | Implementada |
| 60 | `acessibilidade-web` | inclusion | Essencial | Implementada |
| 61 | `acessibilidade-aplicacoes` | inclusion | Essencial | Implementada |
| 62 | `acessibilidade-documentos` | inclusion | Importante | Implementada |
| 63 | `acessibilidade-conteudo` | inclusion | Importante | Implementada |
| 64 | `rag` | ai | Importante | Implementada |
| 65 | `memoria` | ai | Importante | Implementada |
| 66 | `workflows` | ai | Importante | Implementada |
| 67 | `automacao` | ai | Importante | Implementada |
| 68 | `ferramentas` | ai | Importante | Implementada |
| 69 | `code-generation` | ai | Importante | Implementada |
| 70 | `analise-arquitetural` | ai | Importante | Implementada |
| 71 | `debug` | ai | Importante | Implementada |
| 72 | `planejamento-ai` | ai | Importante | Implementada |

---

## foundation — Skills Fundacionais

> Meta-skills: criam e mantêm outras skills da biblioteca.

---

### 1. skill-creator

| Campo | Valor |
|-------|-------|
| **Prioridade** | Essencial |
| **Pasta** | `foundation/skill-creator/` |
| **Dependências** | Nenhuma |

**Objetivo**
Guiar a criação de novas skills seguindo rigorosamente as convenções
da biblioteca e a documentação oficial do OpenCode.

**Responsabilidade**
- Gerar frontmatter válido (name, description, metadata)
- Gerar corpo com todas as seções obrigatórias
- Validar convenções de naming
- Validar limites de tamanho
- Gerar exemplos padrão

**Quando utilizar**
- Ao criar uma skill nova do zero
- Ao recriar uma skill que foi removida
- Ao ensinar alguém a criar skills

**Quando NÃO utilizar**
- Ao editar uma skill existente (usar edição direta)
- Ao validar uma skill já criada (usar `@skill-validator`)
- Ao apenas consultar o catálogo

---

### 2. skill-validator

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `foundation/skill-validator/` |
| **Dependências** | Nenhuma |

**Objetivo**
Validar que uma skill existente está em conformidade com todas as
convenções e padrões da biblioteca.

**Responsabilidade**
- Validar frontmatter obrigatório
- Validar naming conventions
- Validar estrutura de seções
- Validar limites de tamanho
- Validar exemplos (entrada + saída)
- Gerar relatório de conformidade

**Quando utilizar**
- Após criar ou editar uma skill
- Antes de publicar uma skill
- Durante auditoria periódica da biblioteca
- Ao revisar PR que modifica skills

**Quando NÃO utilizar**
- Ao criar uma skill do zero (usar `@skill-creator`)
- Ao navegar o catálogo
- Para validação de config do OpenCode

---

### 3. skill-auditor

| Campo | Valor |
|-------|-------|
| **Prioridade** | Essencial |
| **Pasta** | `foundation/skill-auditor/` |
| **Dependências** | Nenhuma |

**Objetivo**
Auditor completo da biblioteca de skills. Revisa, valida, detecta
conflitos, duplicações, ambiguidades e gera Score de Qualidade.

**Responsabilidade**
- Validar frontmatter e naming de todas as skills
- Verificar seções obrigatórias
- Medir tamanho e complexidade
- Detectar conflitos entre skills
- Detectar duplicações de escopo
- Detectar ambiguidades em descrições
- Sugerir modularização
- Gerar Score de Qualidade (0-100)
- Gerar relatório consolidado
- Recomendar ações corretivas

**Quando utilizar**
- Auditoria periódica da biblioteca
- Antes de releases da biblioteca
- Ao revisar PR que modifica skills
- Ao detectar problemas de qualidade
- Ao planejar refatoração da biblioteca

**Quando NÃO utilizar**
- Para criar skill (usar `@skill-creator`)
- Para validar skill individual (usar `@skill-validator`)
- Para editar skill (edição direta)
- Para navegar catálogo (ler `CATALOG.md`)

---

## code-quality — Qualidade de Código

> Skills que melhoram a qualidade, legibilidade e manutenibilidade do código.

---

### 3. code-review

| Campo | Valor |
|-------|-------|
| **Prioridade** | Essencial |
| **Pasta** | `code-quality/code-review/` |
| **Dependências** | Nenhuma |

**Objetivo**
Revisar código fonte para identificar problemas de qualidade, estilo,
complexidade e manutenibilidade, gerando relatório com sugestões
concretas e acionáveis.

**Responsabilidade**
- Analisar estilo e convenções do código
- Identificar funções/métodos complexos demais
- Verificar nomes descritivos
- Detectar código duplicado
- Identificar magic numbers
- Verificar tratamento de erros
- Sugerir melhorias específicas

**Quando utilizar**
- Antes de commit ou merge
- Ao revisar PR de outros desenvolvedores
- Ao auditar código legado
- Após refatoração significativa
- Ao onboarding em projeto novo

**Quando NÃO utilizar**
- Para gerar testes (usar `@test-generation`)
- Para escrever documentação (usar `@doc-writer`)
- Para auditoria de segurança (usar `@security-audit`)
- Para análise de performance (usar `@performance`)

---

### 4. refactor

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `code-quality/refactor/` |
| **Dependências** | Nenhuma |

**Objetivo**
Identificar e aplicar oportunidades de refatoração, melhorando a
estrutura do código sem alterar seu comportamento externo.

**Responsabilidade**
- Identificar code smells
- Sugerir padrões de design aplicáveis
- Extrair funções/métodos quando apropriado
- Simplificar condicionais complexos
- Eliminar duplicação
- Melhorar nomes de variáveis e funções

**Quando utilizar**
- Após code-review que identifica problemas estruturais
- Ao modernizar código legado
- Ao preparar código para novas features
- Quando complexidade ciclomática está alta

**Quando NÃO utilizar**
- Para revisão superficial (usar `@code-review`)
- Para alterar comportamento do código
- Para escrever testes (usar `@test-generation`)
- Para紧急 bug fixes (refatoração requer calma)

---

### 5. dead-code

| Campo | Valor |
|-------|-------|
| **Prioridade** | Especializada |
| **Pasta** | `code-quality/dead-code/` |
| **Dependências** | Nenhuma |

**Objetivo**
Identificar e reportar código morto, variáveis não utilizadas, funções
não chamadas e imports obsoletos.

**Responsabilidade**
- Detectar funções não chamadas
- Detectar variáveis não utilizadas
- Detectar imports obsoletos
- Detectar branches de código inalcançáveis
- Detectar dependências não utilizadas
- Gerar relatório com localização exata

**Quando utilizar**
- Ao limpar código após remoção de features
- Ao preparar projeto para release
- Ao auditar manutenibilidade do código
- Após fusão de branches grandes

**Quando NÃO utilizar**
- Para code review geral (usar `@code-review`)
- Para remover dependências (usar `@dependency-audit`)
- Em projetos com muita refatoração em andamento

---

## architecture — Arquitetura e Design

> Skills que guiaram decisões de design e estrutura de sistemas.

---

### 6. api-design

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `architecture/api-design/` |
| **Dependências** | Nenhuma |

**Objetivo**
Guiar o design de APIs RESTful, GraphQL ou gRPC, seguindo boas
práticas de nomenclatura, versionamento, autenticação e documentação.

**Responsabilidade**
- Definir estrutura de endpoints
- Definir contratos de request/response
- Sugerir versionamento adequado
- Definir padrões de autenticação
- Sugerir paginação e filtros
- Definir padrões de error handling
- Documentar com OpenAPI/Swagger quando aplicável

**Quando utilizar**
- Ao criar uma nova API
- Ao adicionar endpoints significativos
- Ao revisar design de API existente
- Ao migrar de uma versão de API para outra

**Quando NÃO utilizar**
- Para implementar a API (código é responsabilidade do dev)
- Para testes de API (usar `@test-generation`)
- Para documentar API existente (usar `@doc-writer`)
- Em projetos sem API (CLIs, bibliotecas, etc.)

---

### 7. database-design

| Campo | Valor |
|-------|-------|
| **Prioridade** | Especializada |
| **Pasta** | `architecture/database-design/` |
| **Dependências** | Nenhuma |

**Objetivo**
Guiar o design de esquemas de banco de dados, incluindo modelagem
de entidades, relações, indexes e normalização.

**Responsabilidade**
- Modelar entidades e relacionamentos
- Sugerir indexes adequados
- Definir estratégias de normalização
- Sugerir estratégias de-partitioning quando aplicável
- Definir constraints e validações
- Documentar decisões de design

**Quando utilizar**
- Ao criar novo banco de dados
- Ao adicionar entidades significativas
- Ao revisar performance de queries
- Ao migrar de SQL para NoSQL ou vice-versa

**Quando NÃO utilizar**
- Para escrever queries específicas
- Para configurar conexões de banco
- Para migrations (usar `@migration-helper`)
- Em projetos sem banco de dados

---

## testing — Testes

> Skills que auxiliam criação e estratégia de testes.

---

### 8. test-generation

| Campo | Valor |
|-------|-------|
| **Prioridade** | Essencial |
| **Pasta** | `testing/test-generation/` |
| **Dependências** | Nenhuma |

**Objetivo**
Gerar testes unitários, de integração e E2E para código existente,
seguindo padrões do projeto e maximizando cobertura.

**Responsabilidade**
- Analisar código para identificar casos de teste
- Gerar testes unitários com断言 claras
- Gerar testes de integração quando aplicável
- Sugerir edge cases e cenários negativos
- Seguir framework de testes do projeto
- Criar mocks e stubs quando necessário

**Quando utilizar**
- Ao adicionar nova funcionalidade
- Ao corrigir bugs (criar teste que reproduz o bug)
- Ao aumentar cobertura de testes
- Ao preparar refatoração (testes como rede de segurança)

**Quando NÃO utilizar**
- Para revisar código existente (usar `@code-review`)
- Para definir estratégia de testes (usar `@test-strategy`)
- Para testes de performance (usar `@performance`)
- Para testes manuais ou exploratórios

---

### 9. test-strategy

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `testing/test-strategy/` |
| **Dependências** | Nenhuma |

**Objetivo**
Definir a estratégia de testes para um projeto, incluindo pirâmide
de testes, ferramentas, métricas e processos.

**Responsabilidade**
- Definir pirâmide de testes adequada
- Selecionar framework e ferramentas
- Definir métricas de cobertura
- Definir processos de CI para testes
- Definir padrões de naming de testes
- Definir estratégia de testes para dados

**Quando utilizar**
- Ao iniciar um novo projeto
- Ao reavaliar processos de qualidade
- Ao integrar testes no pipeline de CI
- Quando testes estão lentos ou frágeis

**Quando NÃO utilizar**
- Para gerar testes específicos (usar `@test-generation`)
- Para revisar testes existentes
- Para configurar ferramentas de teste
- Em projetos com estratégia já definida

---

## documentation — Documentação

> Skills que auxiliam criação e manutenção de documentação.

---

### 10. doc-writer

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `documentation/doc-writer/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar e manter documentação técnica clara, completa e reutilizável
para código, APIs e sistemas.

**Responsabilidade**
- Documentar funções e módulos
- Criar READMEs estruturados
- Documentar APIs (guia de uso)
- Criar guias de setup e configuração
- Documentar decisões de design (ADRs)
- Manter documentação sincronizada com código

**Quando utilizar**
- Ao criar novo módulo ou componente
- Ao adicionar API pública
- Ao fazer onboarding de novo desenvolvedor
- Quando documentação está desatualizada

**Quando NÃO utilizar**
- Para gerar changelog (usar `@changelog`)
- Para documentar skills da biblioteca
- Para escrever testes (usar `@test-generation`)
- Para documentar commits (usar `@commit-convention`)

---

### 11. changelog

| Campo | Valor |
|-------|-------|
| **Prioridade** | Especializada |
| **Pasta** | `documentation/changelog/` |
| **Dependências** | Nenhuma |

**Objetivo**
Gerar e manter changelogs a partir de commits, seguindo o padrão
Keep a Changelog ou formato similar.

**Responsabilidade**
- Analisar commits desde última versão
- Classificar mudanças (Added, Changed, Deprecated, Removed, Fixed, Security)
- Gerar entrada de changelog formatada
- Sugerir bump de versão baseado em mudanças
- Manter links entre versões

**Quando utilizar**
- Antes de release de nova versão
- Ao preparar publicação de pacote
- Ao gerar notas de release para GitHub/GitLab
- Periodicamente para manter changelog atualizado

**Quando NÃO utilizar**
- Para escrever documentação geral (usar `@doc-writer`)
- Para gerar commits (usar `@commit-convention`)
- Para definir versão de skill (usar versionamento SemVer)

---

## devops — Infraestrutura e Deploy

> Skills que auxiliam configuração de infraestrutura e pipelines.

---

### 12. docker

| Campo | Valor |
|-------|-------|
| **Prioridade** | Especializada |
| **Pasta** | `devops/docker/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar, otimizar e revisar Dockerfiles e docker-compose.yml seguindo
melhores práticas de segurança e performance.

**Responsabilidade**
- Criar Dockerfiles multi-stage
- Otimizar camadas de build
- Definir health checks
- Configurar variáveis de ambiente
- Revisar docker-compose.yml
- Aplicar boas práticas de segurança (non-root, minimal images)

**Quando utilizar**
- Ao containerizar nova aplicação
- Ao otimizar imagem existente (tamanho, tempo de build)
- Ao revisar Dockerfile de outro dev
- Ao configurar docker-compose para dev local

**Quando NÃO utilizar**
- Para orquestração Kubernetes (muito específico)
- Para deploy em cloud (usar `@ci-cd`)
- Para gerenciar registries
- Em projetos sem containerização

---

### 13. ci-cd

| Campo | Valor |
|-------|-------|
| **Prioridade** | Especializada |
| **Pasta** | `devops/ci-cd/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar e configurar pipelines de integração contínua e deploy contínuo
para diferentes plataformas (GitHub Actions, GitLab CI, etc.).

**Responsabilidade**
- Criar pipelines de CI (lint, test, build)
- Criar pipelines de CD (deploy)
- Configurar cache de dependências
- Configurar secrets e variáveis
- Definir branches de deploy
- Configurar notificações

**Quando utilizar**
- Ao configurar CI/CD para novo projeto
- Ao adicionar novos estágios ao pipeline
- Ao migrar de uma plataforma para outra
- Quando pipeline está lento ou instável

**Quando NÃO utilizar**
- Para escrever código de aplicação
- Para configurar Docker (usar `@docker`)
- Para gerenciar infraestrutura como código
- Para configuração de monitoring

---

## security — Segurança

> Skills que auxiliam identificação e prevenção de vulnerabilidades.

---

### 14. security-audit

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `security/security-audit/` |
| **Dependências** | Nenhuma |

**Objetivo**
Auditar código para vulnerabilidades de segurança, incluindo injection
flaws, XSS, CSRF, autenticação inadequada e exposta de dados sensíveis.

**Responsabilidade**
- Identificar vulnerabilidades OWASP Top 10
- Verificar tratamento de dados sensíveis
- Verificar autenticação e autorização
- Verificar input validation
- Verificar configurações inseguras
- Sugerir remediações específicas

**Quando utilizar**
- Antes de releases significativos
- Ao adicionar autenticação/autorização
- Ao integrar com sistemas externos
- Após relatório de vulnerabilidade
- Periodicamente em projetos críticos

**Quando NÃO utilizar**
- Para auditoria de dependências (usar `@dependency-audit`)
- Para code review geral (usar `@code-review`)
- Para pentesting (requer ferramentas especializadas)
- Para compliance específico (SOC2, PCI, etc.)

---

### 15. dependency-audit

| Campo | Valor |
|-------|-------|
| **Prioridade** | Especializada |
| **Pasta** | `security/dependency-audit/` |
| **Dependências** | Nenhuma |

**Objetivo**
Auditar dependências do projeto para CVEs conhecados, versões
desatualizadas e licenças problemáticas.

**Responsabilidade**
- Verificar CVEs em dependências
- Identificar versões desatualizadas
- Verificar licenças de dependências
- Sugerir atualizações seguras
- Identificar dependências não utilizadas
- Gerar relatório consolidado

**Quando utilizar**
- Antes de releases
- Periodicamente (rotina de segurança)
- Ao adicionar nova dependência
- Após relatório de vulnerabilidade em dependência

**Quando NÃO utilizar**
- Para auditoria de código (usar `@security-audit`)
- Para remover código morto (usar `@dead-code`)
- Para gerenciar lock files
- Para configurar registries

---

## productivity — Produtividade

> Skills que auxiliam workflows de desenvolvimento dia a dia.

---

### 16. git-workflow

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `productivity/git-workflow/` |
| **Dependências** | Nenhuma |

**Objetivo**
Gerenciar workflows de git, incluindo branching strategies, merge
vs rebase, resolução de conflitos e boas práticas de versionamento.

**Responsabilidade**
- Sugerir branching strategy adequada
- Guiar resolução de conflitos
- Recomendar merge vs rebase
- Gerenciar stashes e worktrees
- Guiar bisect para encontrar bugs
- Configurar hooks úteis

**Quando utilizar**
- Ao iniciar projeto novo (definir estratégia)
- Ao resolver conflito de merge complexo
- Ao fazer release (tags, branches)
- Ao revisar histórico de commits
- Quando git está "bagunçado"

**Quando NÃO utilizar**
- Para escrever commits (usar `@commit-convention`)
- Para gerar changelog (usar `@changelog`)
- Para configurar CI/CD (usar `@ci-cd`)
- Para resolver problemas de merge que são bugs de código

---

### 17. commit-convention

| Campo | Valor |
|-------|-------|
| **Prioridade** | Especializada |
| **Pasta** | `productivity/commit-convention/` |
| **Dependências** | Nenhuma |

**Objetivo**
Gerar e validar mensagens de commit seguindo convenções padronizadas
(Conventional Commits, Angular, etc.).

**Responsabilidade**
- Gerar mensagens de commit padronizadas
- Validar formato de commit messages
- Sugerir escopo adequado
- Validar tipo de commit (feat, fix, docs, etc.)
- Integrar com conventional-changelog

**Quando utilizar**
- Ao escrever commits que seguem convenção
- Ao validar commits existentes
- Ao configurar commit hooks
- Ao preparar releases semânticos

**Quando NÃO utilizar**
- Para escrever código
- Para gerenciar branches (usar `@git-workflow`)
- Para gerar changelog (usar `@changelog`)
- Em projetos sem convenção de commits

---

## code-quality (extra) — Performance

> Skills que auxiliam identificação de gargalos de performance.

---

### 18. performance

| Campo | Valor |
|-------|-------|
| **Prioridade** | Especializada |
| **Pasta** | `code-quality/performance/` |
| **Dependências** | Nenhuma |

**Objetivo**
Identificar problemas de performance em código, incluindo complexidade
algorítmica, uso excessivo de memória, I/O desnecessário e gargalos
de concorrência.

**Responsabilidade**
- Analisar complexidade algorítmica (Big O)
- Identificar alocações desnecessárias
- Identificar I/O em loop
- Identificar queries N+1
- Sugerir lazy loading quando aplicável
- Sugerir caching quando aplicável

**Quando utilizar**
- Quando código está lento
- Ao processar grandes volumes de dados
- Ao otimizar APIs com alta latência
- Ao preparar para escala

**Quando NÃO utilizar**
- Para code review geral (usar `@code-review`)
- Para refatoração estrutural (usar `@refactor`)
- Para testes de performance/benchmarking
- Para configuração de infraestrutura

---

## devops (extra) — Setup e Migração

> Skills que auxiliam setup inicial e migrações.

---

### 19. migration-helper

| Campo | Valor |
|-------|-------|
| **Prioridade** | Opcional |
| **Pasta** | `devops/migration-helper/` |
| **Dependências** | Nenhuma |

**Objetivo**
Auxiliar criação e execução de migrations de banco de dados, esquemas
e dados, seguindo boas práticas de segurança e rollback.

**Responsabilidade**
- Gerar migrations de schema
- Gerar migrations de dados
- Validar rollback seguro
- Sugerir ordem de execução
- Detectar conflitos entre migrations
- Documentar mudanças

**Quando utilizar**
- Ao criar novas tabelas ou colunas
- Ao migrar dados entre esquemas
- Ao preparar release com mudanças de schema
- Ao reverter migration problemática

**Quando NÃO utilizar**
- Para design de banco (usar `@database-design`)
- Para queries pontuais
- Para configuração de conexão
- Para backup/restore de banco

---

### 20. env-setup

| Campo | Valor |
|-------|-------|
| **Prioridade** | Opcional |
| **Pasta** | `devops/env-setup/` |
| **Dependências** | Nenhuma |

**Objetivo**
Configurar ambiente de desenvolvimento local, incluindo dependências,
variáveis de ambiente, ferramentas e configurações do projeto.

**Responsabilidade**
- Identificar dependências do sistema
- Configurar variáveis de ambiente
- Configurar ferramentas de dev (linters, formatters)
- Configurar git hooks
- Criar scripts de setup
- Documentar prerequisitos

**Quando utilizar**
- Ao fazer onboarding de novo desenvolvedor
- Ao configurar ambiente em máquina nova
- Ao adicionar nova dependência de sistema
- Quando setup manual é demorado

**Quando NÃO utilizar**
- Para configurar CI/CD (usar `@ci-cd`)
- Para configurar Docker (usar `@docker`)
- Para configurar produção
- Quando setup já está documentado no README

---

## backend — Backend

> Skills para desenvolvimento server-side com diferentes linguagens e frameworks.

---

### 21. typescript

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `backend/typescript/` |
| **Dependências** | Nenhuma |

**Objetivo**
Desenvolver código TypeScript tipado, seguro e eficiente, seguindo
boas práticas de tipagem, configuração e design de tipos.

**Responsabilidade**
- Definir types e interfaces adequadas
- Usar generics quando apropriado
- Aplicar type guards e assertions
- Configurar tsconfig.json corretamente
- Usar utility types do TypeScript
- Criar type-safe APIs

**Quando utilizar**
- Ao desenvolver em TypeScript
- Ao configurar projeto TypeScript
- Ao migrar de JavaScript para TypeScript
- Ao revisar código TypeScript

**Quando NÃO utilizar**
- Para JavaScript puro (usar `@javascript`)
- Para configuração de build (usar `@ci-cd`)
- Para testes TypeScript (usar `@test-generation`)

---

### 22. javascript

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `backend/javascript/` |
| **Dependências** | Nenhuma |

**Objetivo**
Desenvolver JavaScript moderno (ES6+), seguindo boas práticas de
modules, async/await, closures e event loop.

**Responsabilidade**
- Usar ES6+ (arrow functions, destructuring, spread)
- Trabalhar com modules (import/export)
- Dominar async/await e Promises
- Entender closures e prototypes
- Configurar package.json corretamente
- Gerenciar dependências com npm/yarn

**Quando utilizar**
- Ao desenvolver em JavaScript
- Ao configurar projeto JavaScript
- Ao revisar código JavaScript legado
- Ao migrar código para ES6+

**Quando NÃO utilizar**
- Para TypeScript (usar `@typescript`)
- Para configuração de build (usar `@ci-cd`)
- Para testes JavaScript (usar `@test-generation`)

---

## ai — Inteligência Artificial

> Skills para trabalhar com LLMs, agentes e ferramentas de IA.

---

### 24. mcp

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/mcp/` |
| **Dependências** | Nenhuma |

**Objetivo**
Implementar e configurar servidores MCP (Model Context Protocol)
para integrar LLMs com ferramentas, resources e prompts externos.

**Responsabilidade**
- Criar e configurar MCP servers
- Definir tools e resources
- Integrar com LLMs
- Gerenciar autenticação e permissões
- Configurar prompts de sistema
- Debugar comunicação MCP

**Quando utilizar**
- Ao integrar LLMs com ferramentas externas
- Ao criar MCP server personalizado
- Ao configurar OpenCode com MCP
- Ao revisar integrações MCP

**Quando NÃO utilizar**
- Para usar LLMs sem tools (usar `@llms`)
- Para criar agentes (usar `@agentes`)
- Para prompt engineering (usar `@prompt-engineering`)

---

### 25. prompt-engineering

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/prompt-engineering/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar e otimizar prompts eficazes para LLMs, usando técnicas
comprovadas como few-shot, chain-of-thought e role prompting.

**Responsabilidade**
- Aplicar técnicas de prompting (few-shot, CoT, ToT)
- Definir system prompts eficazes
- Otimizar prompts para tarefas específicas
- Usar role prompting quando apropriado
- Iterar e refinar prompts
- Avaliar qualidade das respostas

**Quando utilizar**
- Ao criar system prompts
- Ao otimizar respostas de LLMs
- Ao desenvolver features com IA
- Ao treinar prompts para automações

**Quando NÃO utilizar**
- Para criar agentes (usar `@agentes`)
- Para integrar com LLMs (usar `@llms`)
- Para configurar MCP (usar `@mcp`)

---

### 26. llms

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/llms/` |
| **Dependências** | Nenhuma |

**Objetivo**
Trabalhar eficazmente com Large Language Models, incluindo seleção
de modelos, gestão de contexto, embeddings e RAG.

**Responsabilidade**
- Selecionar modelo adequado para a tarefa
- Gerenciar context window e tokens
- Configurar temperature e top-p
- Implementar RAG quando necessário
- Trabalhar com embeddings
- Otimizar custo vs qualidade

**Quando utilizar**
- Ao escolher LLM para uma tarefa
- Ao implementar RAG
- Ao trabalhar com embeddings
- Ao otimizar uso de tokens

**Quando NÃO utilizar**
- Para criar prompts (usar `@prompt-engineering`)
- Para criar agentes (usar `@agentes`)
- Para configurar MCP (usar `@mcp`)

---

### 27. agentes

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/agentes/` |
| **Dependências** | Nenhuma |

**Objetivo**
Projetar e implementar agentes autônomos com capacidade de
planejamento, tool use, memória e loops de raciocínio.

**Responsabilidade**
- Projetar arquitetura de agentes
- Implementar tool use e function calling
- Gerenciar memória (curta e longa prazo)
- Criar loops de planejamento e execução
- Implementar multi-agentes quando necessário
- Debugar e observar comportamento

**Quando utilizar**
- Ao criar agente autônomo
- Ao implementar tool use em LLMs
- Ao projetar sistema multi-agente
- Ao adicionar memória a agentes

**Quando NÃO utilizar**
- Para LLMs sem agência (usar `@llms`)
- Para prompts simples (usar `@prompt-engineering`)
- Para integrações MCP (usar `@mcp`)

---

### 28. observabilidade

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `devops/observabilidade/` |
| **Dependências** | Nenhuma |

**Objetivo**
Implementar observabilidade em sistemas, incluindo métricas,
traces, dashboards, alerting e instrumentação.

**Responsabilidade**
- Definir métricas relevantes (RED/USE)
- Implementar distributed tracing
- Criar dashboards informativos
- Configurar alertas acionáveis
- Instrumentar código para observabilidade
- Integrar com ferramentas (Prometheus, Grafana)

**Quando utilizar**
- Ao criar novo sistema
- Ao adicionar monitoramento
- Ao investigar problemas em produção
- Ao preparar sistema para escala

**Quando NÃO utilizar**
- Para logs (usar `@logs`)
- Para debugging (usar ferramentas específicas)
- Para deploy (usar `@deploy`)

---

### 29. logs

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `devops/logs/` |
| **Dependências** | Nenhuma |

**Objetivo**
Implementar gestão de logs eficaz, incluindo structured logging,
agregação, análise e audit logs.

**Responsabilidade**
- Implementar structured logging
- Definir log levels adequados
- Configurar agregação de logs
- Integrar com ELK/Loki
- Implementar audit logs
- Definir retenção de logs

**Quando utilizar**
- Ao criar sistema de logs
- Ao investigar problemas
- Ao implementar audit trail
- Ao configurar análise de logs

**Quando NÃO utilizar**
- Para métricas (usar `@observabilidade`)
- Para debugging (usar ferramentas específicas)
- Para monitoramento (usar `@observabilidade`)

---

### 30. devops

| Campo | Valor |
|-------|-------|
| **Prioridade** | Essencial |
| **Pasta** | `devops/devops/` |
| **Dependências** | Nenhuma |

**Objetivo**
Implementar práticas DevOps, incluindo IaC, automação, infraestrutura
como código, monitoramento e release management.

**Responsabilidade**
- Implementar Infrastructure as Code
- Configurar Terraform/Ansible
- Automatizar processos repetitivos
- Gerenciar infraestrutura
- Configurar monitoramento
- Gerenciar releases e versionamento

**Quando utilizar**
- Ao criar infraestrutura
- Ao automatizar processos
- Ao implementar IaC
- Ao gerenciar releases

**Quando NÃO utilizar**
- Para CI/CD específico (usar `@cicd`)
- Para Docker (usar `@docker`)
- Para logs (usar `@logs`)

---

### 64. rag

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/rag/` |
| **Dependências** | Nenhuma |

**Objetivo**
Implementar sistemas RAG (Retrieval-Augmented Generation) para
enriquecer respostas de LLMs com contexto recuperado de fontes externas.

**Responsabilidade**
- Indexar documentos para recuperação
- Trabalhar com embeddings e vetores
- Definir estratégias de chunking
- Recuperar contexto relevante
- Validar qualidade das respostas
- Gerenciar fontes de conhecimento

**Quando utilizar**
- Ao criar sistema RAG
- Ao indexar documentos
- Ao melhorar respostas com contexto
- Ao trabalhar com bases de conhecimento

**Quando NÃO utilizar**
- Para LLMs sem recuperação (usar `@llms`)
- Para memória de agentes (usar `@memoria`)
- Para prompt engineering (usar `@prompt-engineering`)

---

### 65. memoria

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/memoria/` |
| **Dependências** | Nenhuma |

**Objetivo**
Implementar sistemas de memória para agentes de IA, incluindo
armazenamento de contexto, persistência e gerenciamento de estado.

**Responsabilidade**
- Implementar memória de curto prazo
- Implementar memória de longo prazo
- Armazenar e recuperar conversas
- Extrair e indexar fatos
- Gerenciar janelas de contexto
- Persistir estado entre sessões

**Quando utilizar**
- Ao criar agente com memória
- Ao persistir conversas
- Ao gerenciar contexto de longo prazo
- Ao extrair informações de conversas

**Quando NÃO utilizar**
- Para RAG (usar `@rag`)
- Para agentes sem memória (usar `@agentes`)
- Para LLMs stateless (usar `@llms`)

---

### 66. workflows

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/workflows/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar e orquestrar workflows com IA, encadeando LLMs, ferramentas
e processos em pipelines de processamento.

**Responsabilidade**
- Projetar fluxos de processamento
- Encadear chamadas de LLM
- Integrar ferramentas externas
- Tratar erros e retries
- Implementar logging
- Validar resultados intermediários

**Quando utilizar**
- Ao criar pipeline com IA
- Ao encadear múltiplas LLM calls
- Ao integrar ferramentas em fluxo
- Ao orquestrar processos complexos

**Quando NÃO utilizar**
- Para automação simples (usar `@automacao`)
- Para agentes (usar `@agentes`)
- Para MCP servers (usar `@mcp`)

---

### 67. automacao

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/automacao/` |
| **Dependências** | Nenhuma |

**Objetivo**
Automatizar tarefas usando IA, desde geração de código até
testes e deploy, integrando com ferramentas existentes.

**Responsabilidade**
- Identificar tarefas automatizáveis
- Selecionar ferramentas de automação
- Implementar scripts de automação
- Integrar com CI/CD
- Monitorar automações
- Documentar processos automatizados

**Quando utilizar**
- Ao automatizar tarefas repetitivas
- Ao criar scripts de automação
- Ao integrar IA em pipelines
- Ao otimizar processos manuais

**Quando NÃO utilizar**
- Para workflows complexos (usar `@workflows`)
- Para code generation (usar `@code-generation`)
- Para ferramentas de IA (usar `@ferramentas`)

---

### 68. ferramentas

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/ferramentas/` |
| **Dependências** | Nenhuma |

**Objetivo**
Selecionar e utilizar ferramentas para LLMs, incluindo function
calling, APIs, web scraping e execução de código.

**Responsabilidade**
- Definir schemas de ferramentas
- Implementar function calling
- Integrar com APIs externas
- Gerenciar rate limiting e segurança
- Implementar sandboxing
- Validar respostas de ferramentas

**Quando utilizar**
- Ao integrar LLM com ferramentas
- Ao implementar function calling
- Ao usar APIs externas com IA
- Ao executar código via LLM

**Quando NÃO utilizar**
- Para MCP (usar `@mcp`)
- Para workflows (usar `@workflows`)
- Para automação (usar `@automacao`)

---

### 69. code-generation

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/code-generation/` |
| **Dependências** | Nenhuma |

**Objetivo**
Gerar código com assistência de IA, incluindo scaffolding,
boilerplate, refatoração e code completion.

**Responsabilidade**
- Gerar código a partir de especificações
- Criar scaffolding de projetos
- Refatorar código existente
- Completar código parcial
- Validar código gerado
- Adaptar ao padrão do projeto

**Quando utilizar**
- Ao gerar código novo
- Ao criar boilerplate
- Ao refatorar com IA
- Ao completar código

**Quando NÃO utilizar**
- Para debug (usar `@debug`)
- Para análise arquitetural (usar `@analise-arquitetural`)
- Para code review (usar `@code-review`)

---

### 70. analise-arquitetural

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/analise-arquitetural/` |
| **Dependências** | Nenhuma |

**Objetivo**
Analisar código e arquitetura com IA, detectando code smells,
sugerindo padrões e avaliando complexidade.

**Responsabilidade**
- Detectar code smells automaticamente
- Sugerir padrões de design
- Analisar dependências entre módulos
- Avaliar complexidade ciclomática
- Verificar violações de arquitetura
- Recomendar melhorias estruturais

**Quando utilizar**
- Ao auditar código existente
- Ao planejar refatoração
- Ao revisar PR grandes
- Ao avaliar qualidade do código

**Quando NÃO utilizar**
- Para code review (usar `@code-review`)
- Para code generation (usar `@code-generation`)
- Para debug (usar `@debug`)

---

### 71. debug

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/debug/` |
| **Dependências** | Nenhuma |

**Objetivo**
Auxiliar no debug de código usando IA, analisando erros,
sugerindo correções e diagnosticando problemas.

**Responsabilidade**
- Analisar mensagens de erro
- Sugerir correções específicas
- Implementar tracing de execução
- Diagnosticar problemas de performance
- Identificar causas raiz
- Documentar soluções encontradas

**Quando utilizar**
- Ao depurar código
- Ao analisar erros complexos
- Ao investigar bugs
- Ao otimizar código lento

**Quando NÃO utilizar**
- Para code review (usar `@code-review`)
- Para análise arquitetural (usar `@analise-arquitetural`)
- Para code generation (usar `@code-generation`)

---

### 72. planejamento-ai

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `ai/planejamento-ai/` |
| **Dependências** | Nenhuma |

**Objetivo**
Planejar tarefas e resolver problemas usando técnicas de IA como
Chain-of-Thought, Tree-of-Thought e decomição.

**Responsabilidade**
- Decompor problemas complexos
- Gerar planos de execução passo a passo
- Aplicar Chain-of-Thought (CoT)
- Aplicar Tree-of-Thought (ToT)
- Validar planos antes de executar
- Adaptar planos durante execução

**Quando utilizar**
- Ao planejar tarefa complexa
- Ao resolver problema difícil
- Ao decompor projeto
- Ao tomar decisões de design

**Quando NÃO utilizar**
- Para planejamento educacional (usar `@planejamento`)
- Para workflows (usar `@workflows`)
- Para debug (usar `@debug`)

---

## education — Educação

> Skills para criação e gestão de conteúdos educacionais, treinamentos e metodologias de ensino.

---

### 31. planejamento

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/planejamento/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar planos pedagógicos eficazes, incluindo planejamento de aulas,
objetivos de aprendizagem, estratégias de ensino e alinhamento curricular.

**Responsabilidade**
- Definir objetivos de aprendizagem (taxonomia de Bloom)
- Planejar aulas e sequências didáticas
- Alinhar com BNCC ou currículo
- Definir estratégias de ensino
- Criar cronogramas
- Planejar avaliações

**Quando utilizar**
- Ao planejar curso ou disciplina
- Ao criar plano de aula
- Ao revisar currículo
- Ao preparar sequência didática

**Quando NÃO utilizar**
- Para criar materiais (usar `@materiais-didaticos`)
- Para avaliar (usar `@avaliacoes`)
- Para ministrar aula

---

### 32. cursos

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/cursos/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar e estruturar cursos completos, incluindo módulos, ementa,
carga horária, metodologia e sistema de certificação.

**Responsabilidade**
- Estruturar módulos e aulas
- Definir ementa e objetivos
- Calcular carga horária
- Selecionar metodologias
- Definir pré-requisitos
- Planejar certificação

**Quando utilizar**
- Ao criar novo curso
- Ao revisar curso existente
- Ao migrar curso para EAD
- Ao estruturar programa de formação

**Quando NÃO utilizar**
- Para treinamentos curtos (usar `@treinamentos`)
- Para planejamento de aulas (usar `@planejamento`)
- Para materiais didáticos (usar `@materiais-didaticos`)

---

### 33. treinamentos

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/treinamentos/` |
| **Dependências** | Nenhuma |

**Objetivo**
Projetar e conduzir treinamentos corporativos eficazes, desde a
diagnóstico de necessidades até a avaliação de resultados.

**Responsabilidade**
- Diagnosticar necessidades de treinamento
- Aplicar modelo ADDIE
- Definir KPIs e ROI
- Criar materiais de treinamento
- Avaliar resultados (Kirkpatrick)
- Documentar aprendizados

**Quando utilizar**
- Ao criar treinamento corporativo
- Ao avaliar eficácia de treinamento
- Ao mapear necessidades de capacitação
- Ao planejar programa de desenvolvimento

**Quando NÃO utilizar**
- Para cursos acadêmicos (usar `@cursos`)
- Para oficinas práticas (usar `@oficinas`)
- Para planejamento pedagógico geral (usar `@planejamento`)

---

### 34. oficinas

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/oficinas/` |
| **Dependências** | Nenhuma |

**Objetivo**
Planejar e conduzir oficinas práticas com metodologias ativas,
dinâmicas de grupo e avaliaçãohands-on.

**Responsabilidade**
- Planejar atividades práticas
- Preparar materiais e recursos
- Facilitar dinâmicas de grupo
- Avaliar aprendizagem prática
- Adaptar ao público
- Documentar resultados

**Quando utilizar**
- Ao criar oficina prática
- Ao planejar atividade hands-on
- Ao conduzir workshop
- Ao trabalhar com grupos

**Quando NÃO utilizar**
- Para treinamentos teóricos (usar `@treinamentos`)
- Para palestras (usar `@palestras`)
- Para avaliação formal (usar `@avaliacoes`)

---

### 35. palestras

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/palestras/` |
| **Dependências** | Nenhuma |

**Objetivo**
Preparar e ministrar palestras engajadoras, com estrutura clara,
storytelling, slides eficazes e gestão de tempo.

**Responsabilidade**
- Estruturar conteúdo da palestra
- Criar slides eficazes
- Aplicar storytelling
- Gerenciar tempo
- Engajar público
- Conduzir sessão de perguntas

**Quando utilizar**
- Ao preparar palestra
- Ao criar apresentação
- Ao revisar estrutura de talk
- Ao treinar para apresentação

**Quando NÃO utilizar**
- Para treinamentos longos (usar `@treinamentos`)
- Para oficinas práticas (usar `@oficinas`)
- Para materiais didáticos (usar `@materiais-didaticos`)

---

### 36. apostilas

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/apostilas/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar apostilas completas com exercícios, resumos, diagramação
adequada e acessibilidade.

**Responsabilidade**
- Estruturar conteúdo em capítulos
- Criar exercícios progressivos
- Elaborar resumos e destaques
- Cuidar de diagramação
- Revisar ortografia e gramática
- Garantir acessibilidade

**Quando utilizar**
- Ao criar apostila
- Ao revisar material existente
- Ao adaptar conteúdo para impressão
- Ao criar material de apoio

**Quando NÃO utilizar**
- Para materiais digitais interativos (usar `@materiais-didaticos`)
- Para slides de apresentação (usar `@palestras`)
- Para questões de avaliação (usar `@questionarios`)

---

### 37. materiais-didaticos

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/materiais-didaticos/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar diversos tipos de materiais didáticos (textos, vídeos,
infográficos, multimídia) com acessibilidade e reutilização.

**Responsabilidade**
- Selecionar tipo de material adequado
- Criar conteúdo em diferentes formatos
- Garantir acessibilidade
- Planejar reutilização
- Definir licenças
- Integrar multimídia

**Quando utilizar**
- Ao criar material para aula
- Ao produzir vídeo educativo
- Ao criar infográfico
- Ao diversificar materiais

**Quando NÃO utilizar**
- Para apostilas (usar `@apostilas`)
- Para slides (usar `@palestras`)
- Para materiais de EAD (usar `@ead`)

---

### 38. aprendizagem-ativa

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/aprendizagem-ativa/` |
| **Dependências** | Nenhuma |

**Objetivo**
Aplicar metodologias de aprendizagem ativa como ABP, sala de aula
invertida, gamificação e colaboração.

**Responsabilidade**
- Planejar atividades de ABP
- Implementar sala de aula invertida
- Usar gamificação
- Promover colaboração
- Fornecer feedback
- Estimular autorregulação

**Quando utilizar**
- Ao planejar aula ativa
- Ao implementar ABP
- Ao usar sala de aula invertida
- Ao gamificar conteúdo

**Quando NÃO utilizar**
- Para aulas expositivas (usar `@palestras`)
- Para avaliação formal (usar `@avaliacoes`)
- Para materiais passivos (usar `@materiais-didaticos`)

---

### 39. ead

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/ead/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar e gerenciar cursos online, incluindo plataformas LMS, MOOCs,
design instrucional para EAD e engajamento.

**Responsabilidade**
- Selecionar plataforma LMS
- Projetar curso para EAD
- Equilibrar sincronia e assincronia
- Criar atividades online
- Monitorar engajamento
- Avaliar aprendizagem online

**Quando utilizar**
- Ao criar curso online
- Ao migrar para EAD
- Ao configurar LMS
- Ao projetar MOOC

**Quando NÃO utilizar**
- Para cursos presenciais (usar `@cursos`)
- Para materiais (usar `@materiais-didaticos`)
- Para avaliação (usar `@avaliacoes`)

---

### 40. avaliacoes

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/avaliacoes/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar e aplicar avaliações formativas, somativas e diagnósticas,
com instrumentos adequados e feedback construtivo.

**Responsabilidade**
- Criar instrumentos de avaliação
- Diferenciar formativa e somativa
- Aplicar avaliação diagnóstica
- Fornecer feedback
- Analisar resultados
- Usar dados para melhorar ensino

**Quando utilizar**
- Ao criar prova ou teste
- Ao avaliar aprendizagem
- Ao diagnosticar dificuldades
- Ao replanejar com base em dados

**Quando NÃO utilizar**
- Para rubricas (usar `@rubricas`)
- Para questionários (usar `@questionarios`)
- Para planejamento (usar `@planejamento`)

---

### 41. rubricas

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/rubricas/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar rubricas de avaliação com critérios claros, descritores e
escalas de nota para transparência e consistência.

**Responsabilidade**
- Definir critérios de avaliação
- Criar descritores para cada nível
- Escolher escala adequada
- Garantir transparência
- Validar com outros avaliadores
- Adaptar ao contexto

**Quando utilizar**
- Ao criar rubrica de avaliação
- Ao avaliar produções complexas
- Ao buscar consistência em avaliações
- Ao trabalhar com equipe de avaliação

**Quando NÃO utilizar**
- Para avaliação objetiva (usar `@avaliacoes`)
- Para correção simples (usar `@avaliacoes`)
- Para relatórios (usar `@relatorios`)

---

### 42. relatorios

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/relatorios/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar relatórios pedagógicos com indicadores, dados para tomada
de decisão e formatação clara.

**Responsabilidade**
- Definir indicadores relevantes
- Coletar e analisar dados
- Criar visualizações
- Apresentar conclusões
- Sugerir ações
- Formatar adequadamente

**Quando utilizar**
- Ao gerar relatório de desempenho
- Ao analisar resultados de turma
- Ao documentar evolução do aluno
- Ao prestar contas

**Quando NÃO utilizar**
- Para avaliação individual (usar `@avaliacoes`)
- Para rubricas (usar `@rubricas`)
- Para certificados (usar `@certificados`)

---

### 43. certificados

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/certificados/` |
| **Dependências** | Nenhuma |

**Objetivo**
Emitir e gerenciar certificados de conclusão com validade, formatos
adequados e segurança.

**Responsabilidade**
- Definir regras de emissão
- Criar modelos de certificado
- Gerar PDFs
- Implementar validação (QR code)
- Assinar digitalmente
- Manter registro

**Quando utilizar**
- Ao emitir certificado
- Ao criar modelo de certificado
- Ao validar certificado
- Ao gerenciar emissão em lote

**Quando NÃO utilizar**
- Para relatórios (usar `@relatorios`)
- Para avaliação (usar `@avaliacoes`)
- Para materiais didáticos (usar `@materiais-didaticos`)

---

### 44. questionarios

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `education/questionarios/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar questionários com diferentes tipos de perguntas, formulários
eficazes e análise de respostas.

**Responsabilidade**
- Criar diferentes tipos de perguntas
- Montar formulários equilibrados
- Aplicar escala Likert quando apropriado
- Analisar respostas
- Fornecer feedback
- Validar instrumento

**Quando utilizar**
- Ao criar questionário
- Ao pesquisar opinião
- Ao avaliar satisfação
- Ao coletar dados qualitativos

**Quando NÃO utilizar**
- Para avaliação formal (usar `@avaliacoes`)
- Para rubricas (usar `@rubricas`)
- Para materiais didáticos (usar `@materiais-didaticos`)

---

## inclusion — Inclusão e Acessibilidade

> Skills para promoção da inclusão, acessibilidade e direitos de pessoas com deficiência.

---

### 45. libras

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/libras/` |
| **Dependências** | Nenhuma |

**Objetivo**
Auxiliar no uso da Língua Brasileira de Sinais (Libras), incluindo
tradução, interpretação, alfabeto manual e comunicação com pessoas surdas.

**Responsabilidade**
- Traduzir e interpretar conteúdo em Libras
- Ensinar alfabeto manual e sinais básicos
- Adaptar materiais para comunicação com surdos
- Orientar sobre cultura surda
- Recomendar intérpretes de Libras
- Documentar glossário de sinais

**Quando utilizar**
- Ao traduzir conteúdo para Libras
- Ao comunicar com pessoas surdas
- Ao criar materiais inclusivos
- Ao buscar intérprete de Libras

**Quando NÃO utilizar**
- Para comunicação escrita (usar `@linguagem-simples`)
- Para acessibilidade web (usar `@acessibilidade-web`)
- Para treinamento de Libras (usar `@treinamentos-corporativos`)

---

### 46. inclusao-digital

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/inclusao-digital/` |
| **Dependências** | Nenhuma |

**Objetivo**
Promover inclusão tecnológica, garantindo acesso e uso adequado da
tecnologia por pessoas em situação de vulnerabilidade.

**Responsabilidade**
- Diagnosticar exclusão digital
- Planejar programas de inclusão
- Alfabetizar digitalmente
- Disponibilizar dispositivos e acesso
- Criar conteúdos acessíveis
- Monitorar impacto

**Quando utilizar**
- Ao criar programa de inclusão digital
- Ao trabalhar com comunidades vulneráveis
- Ao disponibilizar acesso à tecnologia
- Ao alfabetizar digitalmente

**Quando NÃO utilizar**
- Para acessibilidade web (usar `@acessibilidade-web`)
- Para projetos sociais gerais (usar `@projetos-sociais`)
- Para formação técnica (usar `@treinamentos-corporativos`)

---

### 47. acessibilidade

| Campo | Valor |
|-------|-------|
| **Prioridade** | Essencial |
| **Pasta** | `inclusion/acessibilidade/` |
| **Dependências** | Nenhuma |

**Objetivo**
Garantir acessibilidade em ambientes físicos e digitais, removendo
barreiras e promovendo autonomia de pessoas com deficiência.

**Responsabilidade**
- Diagnosticar barreiras
- Planejar remoção de barreiras
- Aplicar normas de acessibilidade
- Recomendar adaptações
- Conformidade com LBI e Decreto 5296
- Documentar soluções acessíveis

**Quando utilizar**
- Ao auditar acessibilidade
- Ao remover barreiras
- Ao projetar ambientes acessíveis
- Ao adaptar sistemas

**Quando NÃO utilizar**
- Para WCAG específica (usar `@wcag`)
- Para acessibilidade web (usar `@acessibilidade-web`)
- Para documentação técnica (usar `@relatorios-tecnicos`)

---

### 48. wcag

| Campo | Valor |
|-------|-------|
| **Prioridade** | Essencial |
| **Pasta** | `inclusion/wcag/` |
| **Dependências** | Nenhuma |

**Objetivo**
Aplicar e documentar conformidade com as Web Content Accessibility
Guidelines (WCAG), seguindo princípios POUR e níveis de conformidade.

**Responsabilidade**
- Verificar conformidade WCAG 2.1/2.2
- Aplicar princípios POUR (Perceptível, Operável, Compreensível, Robusto)
- Testar níveis A, AA, AAA
- Documentar não-conformidades
- Sugerir remediações
- Gerar relatórios de conformidade

**Quando utilizar**
- Ao auditar site quanto a WCAG
- Ao implementar acessibilidade web
- Ao documentar conformidade
- Ao remediarnão-conformidades

**Quando NÃO utilizar**
- Para acessibilidade geral (usar `@acessibilidade`)
- Para testes automatizados (usar `@acessibilidade-web`)
- Para desenvolvimento de apps (usar `@acessibilidade-aplicacoes`)

---

### 49. comunicacao-inclusiva

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/comunicacao-inclusiva/` |
| **Dependências** | Nenhuma |

**Objetivo**
Utilizar comunicação respeitosa, acessível e não-violenta,
promovendo representatividade e diversidade.

**Responsabilidade**
- Usar linguagem respeitosa e não-discriminatória
- Promover representatividade
- Garantir acessibilidade na comunicação
- Mediar conflitos de forma não-violenta
- Incluir diferentes perspectivas
- Evitar estereótipos

**Quando utilizar**
- Ao escrever conteúdo inclusivo
- Ao comunicar com públicos diversos
- Ao mediar conflitos
- Ao promover diversidade

**Quando NÃO utilizar**
- Para linguagem simples (usar `@linguagem-simples`)
- Para acessibilidade web (usar `@acessibilidade-web`)
- Para tradução (usar `@libras`)

---

### 50. linguagem-simples

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/linguagem-simples/` |
| **Dependências** | Nenhuma |

**Objetivo**
Escrever textos claros, objetivos e fáceis de entender, seguindo
princípios de plain language.

**Responsabilidade**
- Usar vocabulário acessível
- Escrever frases curtas e diretas
- Estruturar conteúdo de forma lógica
- Revisar para clareza
- Usar voz ativa
- Evitar jargões desnecessários

**Quando utilizar**
- Ao escrever para público amplo
- Ao criar textos acessíveis
- Ao revisar documentos
- Ao comunicar informações importantes

**Quando NÃO utilizar**
- Para comunicação inclusiva ampla (usar `@comunicacao-inclusiva`)
- Para documentação técnica (usar `@doc-writer`)
- Para tradução (usar `@libras`)

---

### 51. tecnologias-assistivas

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/tecnologias-assistivas/` |
| **Dependências** | Nenhuma |

**Objetivo**
Recomendar e configurar dispositivos e software de tecnologia
assistiva para pessoas com deficiência.

**Responsabilidade**
- Diagnosticar necessidades assistivas
- Recomendar dispositivos adequados
- Configurar leitores de tela
- Implementar recursos de comunicação alternativa
- Treinar usuários em tecnologias assistivas
- Documentar soluções

**Quando utilizar**
- Ao selecionar tecnologia assistiva
- Ao configurar leitor de tela
- Ao implementar comunicação alternativa
- Ao treinar usuários

**Quando NÃO utilizar**
- Para acessibilidade web (usar `@acessibilidade-web`)
- Para inclusão digital (usar `@inclusao-digital`)
- Para diagnósticos amplos (usar `@diagnosticos`)

---

### 52. treinamentos-corporativos

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/treinamentos-corporativos/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar e conduzir treinamentos de diversidade, equidade e inclusão
(DEI) no ambiente corporativo.

**Responsabilidade**
- Diagnosticar necessidades de formação
- Criar conteúdo sobre diversidade e inclusão
- Ministrar treinamentos de sensibilização
- Combater discriminação e assédio
- Promover pertencimento
- Avaliar impacto dos treinamentos

**Quando utilizar**
- Ao criar treinamento de DEI
- Ao sensibilizar colaboradores
- Ao implementar política de diversidade
- Ao combater assédio

**Quando NÃO utilizar**
- Para treinamentos técnicos (usar `@treinamentos` da educação)
- Para consultoria (usar `@consultorias`)
- Para projetos sociais (usar `@projetos-sociais`)

---

### 53. projetos-sociais

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/projetos-sociais/` |
| **Dependências** | Nenhuma |

**Objetivo**
Planejar, executar e avaliar projetos de inclusão social, com
captação de recursos e mensuração de impacto.

**Responsabilidade**
- Planejar projeto com lógica de intervenção
- Definir indicadores de impacto
- Captação de recursos
- Executar e monitorar atividades
- Avaliar resultados e impacto
- Documentar aprendizados

**Quando utilizar**
- Ao criar projeto social
- Ao buscar financiamento
- Ao monitorar impacto
- Ao avaliar projeto existente

**Quando NÃO utilizar**
- Para consultoria (usar `@consultorias`)
- Para diagnósticos (usar `@diagnosticos`)
- Para pesquisa (usar `@pesquisas`)

---

### 54. consultorias

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/consultorias/` |
| **Dependências** | Nenhuma |

**Objetivo**
Prestar consultoria em inclusão e acessibilidade, com diagnóstico,
plano de ação e acompanhamento.

**Responsabilidade**
- Diagnosticar situação atual
- Elaborar plano de ação
- Implementar soluções
- Acompanhar execução
- Gerar relatórios
- Recomendar melhorias

**Quando utilizar**
- Ao prestar consultoria
- Ao diagnosticar organização
- Ao criar plano de inclusão
- Ao acompanhar implementação

**Quando NÃO utilizar**
- Para treinamentos (usar `@treinamentos-corporativos`)
- Para diagnósticos isolados (usar `@diagnosticos`)
- Para pesquisa (usar `@pesquisas`)

---

### 55. diagnosticos

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/diagnosticos/` |
| **Dependências** | Nenhuma |

**Objetivo**
Realizar diagnósticos de acessibilidade e inclusão, mapeando
barreiras e necessidades.

**Responsabilidade**
- Mapear barreiras físicas e digitais
- Levantar necessidades específicas
- Analisar conformidade legal
- Documentar achados
- Priorizar intervenções
- Gerar relatório de diagnóstico

**Quando utilizar**
- Ao auditar acessibilidade
- Ao mapear barreiras
- Ao levantar necessidades
- Ao preparar plano de ação

**Quando NÃO utilizar**
- Para consultoria ampla (usar `@consultorias`)
- Para pesquisa acadêmica (usar `@pesquisas`)
- Para indicadores (usar `@indicadores`)

---

### 56. indicadores

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/indicadores/` |
| **Dependências** | Nenhuma |

**Objetivo**
Definir e monitorar indicadores de inclusão, acessibilidade e
diversidade, gerando dados para tomada de decisão.

**Responsabilidade**
- Definir indicadores relevantes
- Coletar e consolidar dados
- Criar dashboards
- Analisar tendências
- Gerar relatórios gerenciais
- Recomendar ações

**Quando utilizar**
- Ao criar painel de indicadores
- Ao monitorar metas de inclusão
- Ao gerar relatórios gerenciais
- Ao avaliar desempenho

**Quando NÃO utilizar**
- Para diagnósticos (usar `@diagnosticos`)
- Para pesquisa (usar `@pesquisas`)
- Para relatórios técnicos (usar `@relatorios-tecnicos`)

---

### 57. pesquisas

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/pesquisas/` |
| **Dependências** | Nenhuma |

**Objetivo**
Realizar pesquisas sobre inclusão e acessibilidade, usando métodos
qualitativos e quantitativos.

**Responsabilidade**
- Definir questões de pesquisa
- Selecionar métodos adequados
- Coletar dados
- Analisar resultados
- Documentar achados
- Respeitar ética em pesquisa

**Quando utilizar**
- Ao pesquisar sobre inclusão
- Ao levantar dados sobre acessibilidade
- Ao validar soluções
- Ao produzir conhecimento

**Quando NÃO utilizar**
- Para diagnósticos (usar `@diagnosticos`)
- Para indicadores (usar `@indicadores`)
- Para consultoria (usar `@consultorias`)

---

### 58. questionarios-inclusao

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/questionarios-inclusao/` |
| **Dependências** | Nenhuma |

**Objetivo**
Criar questionários acessíveis para levantamento de necessidades e
percepções sobre inclusão.

**Responsabilidade**
- Criar formulários acessíveis
- Usar linguagem clara e simples
- Oferecer múltiplos formatos de resposta
- Garantir acessibilidade digital
- Analisar respostas
- Documentar resultados

**Quando utilizar**
- Ao levantar necessidades
- Ao pesquisar percepção
- Ao avaliar satisfação
- Ao coletar dados inclusivos

**Quando NÃO utilizar**
- Para questionários gerais (usar `@questionarios` da educação)
- Para pesquisa ampla (usar `@pesquisas`)
- Para diagnósticos (usar `@diagnosticos`)

---

### 59. relatorios-tecnicos

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/relatorios-tecnicos/` |
| **Dependências** | Nenhuma |

**Objetivo**
Produzir relatórios técnicos sobre inclusão e acessibilidade,
com laudos, pareceres e recomendações.

**Responsabilidade**
- Estruturar relatório técnico
- Documentar achados claramente
- Fornecer recomendações acionáveis
- Formatar conforme padrão
- Apresentar evidências
- Validar com especialistas

**Quando utilizar**
- Ao emitir laudo técnico
- Ao documentar não-conformidades
- Ao recomendar soluções
- Ao prestar contas

**Quando NÃO utilizar**
- Para diagnósticos (usar `@diagnosticos`)
- Para relatórios gerenciais (usar `@indicadores`)
- Para documentação de código (usar `@doc-writer`)

---

### 60. acessibilidade-web

| Campo | Valor |
|-------|-------|
| **Prioridade** | Essencial |
| **Pasta** | `inclusion/acessibilidade-web/` |
| **Dependências** | Nenhuma |

**Objetivo**
Tornar sites e aplicações web acessíveis, seguindo WCAG e boas
práticas de acessibilidade digital.

**Responsabilidade**
- Testar com ferramentas (WAVE, Axe, Lighthouse)
- Garantir navegação por teclado
- Adicionar texto alternativo a imagens
- Tornar formulários acessíveis
- Garantir contraste adequado
- Implementar skip links

**Quando utilizar**
- Ao tornar site acessível
- Ao testar conformidade web
- Ao corrigir problemas de acessibilidade
- Ao criar site novo acessível

**Quando NÃO utilizar**
- Para WCAG teórica (usar `@wcag`)
- Para apps (usar `@acessibilidade-aplicacoes`)
- Para conteúdo multimídia (usar `@acessibilidade-conteudo`)

---

### 61. acessibilidade-aplicacoes

| Campo | Valor |
|-------|-------|
| **Prioridade** | Essencial |
| **Pasta** | `inclusion/acessibilidade-aplicacoes/` |
| **Dependências** | Nenhuma |

**Objetivo**
Garantir acessibilidade em aplicações mobile e desktop, com testes
automatizados e manuais.

**Responsabilidade**
- Testar apps com VoiceOver/TalkBack
- Verificar acessibilidade de componentes
- Usar frameworks de acessibilidade
- Implementar roteiros de acessibilidade
- Documentar barreiras encontradas
- Priorizar correções

**Quando utilizar**
- Ao desenvolver app acessível
- Ao testar acessibilidade mobile
- Ao auditar app existente
- Ao implementar melhorias

**Quando NÃO utilizar**
- Para sites web (usar `@acessibilidade-web`)
- Para documentos (usar `@acessibilidade-documentos`)
- Para WCAG (usar `@wcag`)

---

### 62. acessibilidade-documentos

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/acessibilidade-documentos/` |
| **Dependências** | Nenhuma |

**Objetivo**
Tornar documentos (PDF, Word) acessíveis, com estrutura adequada
e alternativas textuais.

**Responsabilidade**
- Usar estilos de cabeçalho corretamente
- Adicionar texto alternativo
- Criar navegação por marcadores
- Usar tabelas simples e acessíveis
- Gerar PDFs tagging
- Verificar com ferramentas

**Quando utilizar**
- Ao criar documento acessível
- Ao revisar PDF existente
- Ao adaptar documentos
- Ao garantir conformidade

**Quando NÃO utilizar**
- Para web (usar `@acessibilidade-web`)
- Para apps (usar `@acessibilidade-aplicacoes`)
- Para conteúdo multimídia (usar `@acessibilidade-conteudo`)

---

### 63. acessibilidade-conteudo

| Campo | Valor |
|-------|-------|
| **Prioridade** | Importante |
| **Pasta** | `inclusion/acessibilidade-conteudo/` |
| **Dependências** | Nenhuma |

**Objetivo**
Tornar conteúdos multimídia acessíveis, incluindo vídeos, áudios,
imagens e conteúdo dinâmico.

**Responsabilidade**
- Criar legendas para vídeos
- Fornecer transcrições de áudio
- Descrever imagens (alt text adequado)
- Oferecer áudio descrição
- Garantir contraste em imagens
- Usar formatos acessíveis

**Quando utilizar**
- Ao produzir vídeo acessível
- Ao criar conteúdo com áudio
- Ao publicar imagens
- Ao tornar conteúdo dinâmico acessível

**Quando NÃO utilizar**
- Para web (usar `@acessibilidade-web`)
- Para documentos (usar `@acessibilidade-documentos`)
- Para apps (usar `@acessibilidade-aplicacoes`)

---

## Mapa de Dependências

```
Nenhuma skill depende de outra. Todas são independentes.

Referências Recomendadas (não obrigatórias):

skill-validator  ← referenciar ao publicar
code-review      ← referenciar antes de refactor
test-generation  ← referenciar após code-review
refactor         ← referenciar após code-review
changelog        ← referenciar antes de release
```

---

## Ordem de Implementação Recomendada

### Fase 1: Essenciais (implementar primeiro)

1. `skill-creator` — sem ela, não cria skills
2. `skill-auditor` — garante qualidade de todas as skills
3. `code-review` — universal, todo projeto revisa código
4. `test-generation` — universal, todo projeto testa
5. `devops` — práticas fundamentais de DevOps

### Fase 2: Importantes (implementar segundo)

6. `skill-validator` — garante qualidade da biblioteca
7. `refactor` — complementa code-review
7. `test-strategy` — complementa test-generation
8. `doc-writer` — universal, todo projeto documenta
9. `api-design` — maioria dos projetos tem APIs
10. `security-audit` — segurança é prioridade
11. `git-workflow` — todo projeto usa git
12. `typescript` — linguagem tipada moderna
13. `javascript` — linguagem universal
14. `mcp` — integração com LLMs
15. `prompt-engineering` — eficácia com LLMs
16. `llms` — gestão de modelos
17. `agentes` — sistemas autônomos
18. `observabilidade` — visibilidade dos sistemas
19. `logs` — gestão de logs
20. `linux` — base de servidores

### Fase 3: Especializadas (implementar terceiro)

21. `dead-code` — limpeza periódica
22. `database-design` — projetos com banco
23. `changelog` — releases periódicos
24. `docker` — containerização
25. `cicd` — automação de deploy
26. `dependency-audit` — segurança de deps
27. `commit-convention` — padronização
28. `performance` — otimização

### Fase 4: Educação (implementar quando necessário)

29. `planejamento` — planejamento pedagógico
30. `cursos` — criação de cursos
31. `treinamentos` — treinamentos corporativos
32. `oficinas` — oficinas práticas
33. `palestras` — preparação de palestras
34. `apostilas` — criação de apostilas
35. `materiais-didaticos` — materiais educacionais
36. `aprendizagem-ativa` — metodologias ativas
37. `ead` — educação a distância
38. `avaliacoes` — avaliação de aprendizagem
39. `rubricas` — rubricas de avaliação
40. `relatorios` — relatórios pedagógicos
41. `certificados` — emissão de certificados
42. `questionarios` — criação de questionários

### Fase 5: IA Avançada (implementar quando necessário)

64. `rag` — Retrieval-Augmented Generation
65. `memoria` — memória para agentes
66. `workflows` — workflows com IA
67. `automacao` — automação com IA
68. `ferramentas` — ferramentas para LLMs
69. `code-generation` — geração de código
70. `analise-arquitetural` — análise de código
71. `debug` — debug assistido por IA
72. `planejamento-ai` — planejamento com IA

### Fase 6: Inclusão (implementar quando necessário)

45. `acessibilidade` — acessibilidade geral
46. `wcag` — conformidade WCAG
47. `acessibilidade-web` — acessibilidade de sites
48. `acessibilidade-aplicacoes` — acessibilidade de apps
49. `libras` — Língua Brasileira de Sinais
50. `inclusao-digital` — inclusão tecnológica
51. `comunicacao-inclusiva` — comunicação respeitosa
52. `linguagem-simples` — plain language
53. `tecnologias-assistivas` — dispositivos de assistência
54. `treinamentos-corporativos` — formação em DEI
55. `projetos-sociais` — projetos de inclusão
56. `consultorias` — consultoria em acessibilidade
57. `diagnosticos` — diagnóstico de barreiras
58. `indicadores` — métricas de inclusão
59. `pesquisas` — pesquisa sobre acessibilidade
60. `questionarios-inclusao` — formulários acessíveis
61. `relatorios-tecnicos` — laudos e pareceres
62. `acessibilidade-documentos` — documentos acessíveis
63. `acessibilidade-conteudo` — conteúdo multimídia acessível

### Fase 7: Opcionais (implementar quando necessário)

64. `migration-helper` — migrações de banco
65. `env-setup` — onboarding
