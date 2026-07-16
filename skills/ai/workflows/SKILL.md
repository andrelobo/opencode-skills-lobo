---
name: workflows
description: "Use when creating AI workflows: chaining LLM calls, pipelines, multi-step orchestration. Use ONLY for workflow design, not MCP or prompt engineering."
---

# AI Workflows

Projetar e implementar workflows com IA, incluindo encadeamento de
LLMs, pipelines de processamento e orquestração de etapas.

## Objetivo

Criar fluxos de trabalho orquestrados que conectam múltiplas chamadas
de LLM, transformações de dados e lógica de negócio em pipelines
coerentes e rastreáveis.

## Fluxo de Trabalho

1. Mapear as etapas do workflow e seus inputs/outputs
2. Definir o padrão de orquestração (sequencial, paralelo, condicional)
3. Projetar o schema de dados entre etapas (contratos de entrada/saída)
4. Implementar a orquestração com controle de fluxo
5. Adicionar logging em cada etapa (input, output, latência, tokens)
6. Implementar tratamento de erros com retry, fallback e dead-letter
7. Configurar timeouts e limites por etapa
8. Adicionar observabilidade (métricas, traces, alertas)
9. Validar o workflow com cenários reais
10. Documentar o contrato do workflow e dependências externas

## Critérios de Qualidade

- [ ] Cada etapa tem contrato de entrada/saída definido (JSON Schema ou equivalente)
- [ ] Logging registra input, output, latência e custo por etapa
- [ ] Erros acionam retry com backoff exponencial antes de falhar
- [ ] Timeouts estão configurados para cada chamada LLM
- [ ] O workflow é idempotente quando re-executado
- [ ] Dados sensíveis não ficam em logs em texto claro
- [ ] Existe circuit breaker para dependências externas
- [ ] O fluxo é observável via traces ou métricas

## Limitações

- Não substitui frameworks de workflow como Temporal ou Airflow para orquestração de longa duração
- Não faz gerenciamento de modelos LLM (usar configuração do provider)
- Não implementa interfaces de usuário (usar frameworks frontend)
- Não garante consistência transacional entre etapas distribuídas

## Casos de Uso

- Pipeline de processamento de documentos com LLM (extração, resumo, classificação)
- Encadeamento de prompts para raciocínio em cadeia (chain-of-thought)
- Workflow de aprovação humana com intervenção de LLM
- RAG pipeline com etapas de busca, reranking e geração
- Pipeline de avaliação de qualidade de respostas LLM
- Orquestração de múltiplos agentes com papéis distintos

## Casos onde NÃO utilizar

- Para chamadas LLM únicas e diretas (usar integração simples)
- Para workflows de longa duração com dias/semanas (usar Temporal, Airflow)
- Para automação de tarefas de sistema (usar `@automacao`)
- Para integração com ferramentas via MCP (usar `@mcp`)

## Exemplos

### Exemplo 1: Pipeline de Resumo de Documentos

**Entrada:**
```
Criar pipeline que lê documentos, resume e classifica o tema
```

**Saída Esperada:**
```
Etapa 1: Extrair texto do documento
Etapa 2: Gerar resumo via LLM (max 200 palavras)
Etapa 3: Classificar tema do resumo via LLM
Etapa 4: Salvar resultado com metadados
```

### Exemplo 2: Orquestração com Fallback

**Entrada:**
```
Workflow que usa dois provedores LLM com fallback
```

**Saída Esperada:**
```
Tentar Provider A (timeout: 30s)
Se falhar -> Retry 2x com backoff
Se falhar -> Fallback para Provider B (timeout: 30s)
Se falhar -> Retornar erro com contexto completo
```
