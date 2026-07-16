---
name: automacao
description: "Use when automating tasks with AI: code, tests, deploy and integrations. Use ONLY for repetitive process automation, not workflow orchestration."
---

# Automacao com IA

Automatizar tarefas usando IA, incluindo automação de código, testes,
deploy e integração com ferramentas existentes.

## Objetivo

Reduzir trabalho manual criando automações inteligentes que utilizam
LLMs para processar dados, gerar código, executar testes e integrar
sistemas existentes.

## Fluxo de Trabalho

1. Identificar a tarefa manual a ser automatizada
2. Mapear as ferramentas e sistemas envolvidos
3. Definir gatilhos de execução (cron, evento, manual)
4. Projetar a lógica de automação com etapas claras
5. Integrar chamadas LLM onde há necessidade de interpretação
6. Adicionar validação de resultados antes de prosseguir
7. Implementar logging e alertas de falha
8. Configurar permissões e segurança (credenciais, segredos)
9. Testar com dados reais em ambiente controlado
10. Documentar a automação e seus gatilhos

## Critérios de Qualidade

- [ ] A automação pode ser re-executada sem efeitos colaterais (idempotência)
- [ ] Credenciais e segredos não estão hardcoded (usar variáveis de ambiente ou vault)
- [ ] Logs registram cada execução com timestamp e resultado
- [ ] Falhas acionam alertas e não ficam silenciosas
- [ ] A automação tem timeout configurado
- [ ] Resultados são validados antes de ações destrutivas (commit, deploy, delete)
- [ ] Existe dry-run ou simulação antes da execução real
- [ ] A automação pode ser desativada sem impactar outros sistemas

## Limitações

- Não substitui revisão humana para decisões críticas (approvals de deploy em produção)
- Não faz orquestração de workflows complexos com múltiplos agentes (usar `@workflows`)
- Não gerencia infraestrutura cloud (usar `@cloud`)
- Não implementa pipelines de CI/CD do zero (usar `@github` ou ferramentas dedicadas)

## Casos de Uso

- Automação de geração de código repetitivo (boilerplate, CRUDs, migrations)
- Automação de testes (geração de casos de teste, execução e relatórios)
- Automação de deploy com validação automática de pré-requisitos
- Automação de code review e detecção de code smell
- Automação de documentação a partir do código fonte
- Integração entre sistemas (webhooks, polling, file watchers)
- Automação de processamento de dados (CSV, JSON, APIs)

## Casos onde NÃO utilizar

- Para workflows multi-etapa com LLMs encadeados (usar `@workflows`)
- Para integração com LLM via protocolo MCP (usar `@mcp`)
- Para configuração de infraestrutura cloud (usar `@cloud`)
- Para deploy contínuo em produção sem approval (usar CI/CD manual)

## Exemplos

### Exemplo 1: Automação de Geração de Testes

**Entrada:**
```
Automatizar geração de testes unitários para funções Python
```

**Saída Esperada:**
```
1. Ler funções do módulo
2. Para cada função, gerar testes via LLM
3. Validar que os testes rodam sem erro
4. Commit automático dos testes gerados
5. Gerar relatório de cobertura
```

### Exemplo 2: Automação de Deploy com Validação

**Entrada:**
```
Automatizar deploy com validações pré-deploy
```

**Saída Esperada:**
```
1. Verificar branch e status do repositório
2. Rodar lint e typecheck
3. Executar suite de testes
4. Validar que não há dependências desatualizadas críticas
5. Se tudo ok -> deploy automatico
6. Se falhar -> notificar time e abortar
```
