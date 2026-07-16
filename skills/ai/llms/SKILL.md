---
name: llms
description: "Use when working with LLMs: tokens, context, parameters, fine-tuning, RAG, embeddings. Use ONLY for LLM config and model selection, not agents."
---

# LLMs

Trabalhar com modelos de linguagem de grande escala,
incluindo configuração, otimização e integração.

## Objetivo

Projetar, configurar e integrar soluções com LLMs
de forma eficiente e adequada ao caso de uso.

## Fluxo de Trabalho

1. Definir o caso de uso e requisitos
2. Selecionar o modelo adequado
3. Configurar parâmetros (temperature, top-p, max tokens)
4. Projetar prompts e templates
5. Implementar tratamento de contexto
6. Integrar com embeddings e RAG quando necessário
7. Testar e iterar resultados
8. Otimizar custo e performance
9. Implementar guardrails e validação
10. Monitorar e ajustar continuamente

## Critérios de Qualidade

- [ ] Modelo selecionado é adequado ao caso de uso
- [ ] Temperature e top-p estão calibrados
- [ ] Context window é gerenciada eficientemente
- [ ] Tokens são contabilizados e otimizados
- [ ] Prompts são testados com cenários variados
- [ ] Embeddings são consistentes com o modelo
- [ ] RAG pipeline está validado
- [ ] Custos estão dentro do orçamento
- [ ] Guardrails prevenem respostas indesejadas
- [ ] Fallbacks estão implementados para falhas

## Limitações

- Não faz agentes autônomos (usar `@agentes`)
- Não faz multi-agentes (usar `@agentes`)
- Não faz planejamento autônomo (usar `@agentes`)
- Não faz deploy de infraestrutura (usar `@cloud`)

## Casos de Uso

- Classificação de texto e sentimentos
- Geração de conteúdo e sumarização
- Sistemas de QA e Retrieval-Augmented Generation
- Tradução e processamento multilíngue
- Extração de entidades e relações

## Casos onde NÃO utilizar

- Para agentes com tool use (usar `@agentes`)
- Para sistemas multi-agentes (usar `@agentes`)
- Para funções com memória de longo prazo (usar `@agentes`)

## Exemplos

### Exemplo 1: Configuração de modelo para chat

**Entrada:**
```
Configurar LLM para assistente de suporte técnico
```

**Saída Esperada:**
```
Modelo: claude-sonnet-4-20250514
Temperature: 0.3 (respostas consistentes)
Top-p: 0.9
Max tokens: 2048
System prompt: "Você é um assistente de suporte técnico..."
Context: histórico de 10 mensagens
Guardrails: validar código antes de executar
```

### Exemplo 2: Pipeline RAG

**Entrada:**
```
Criar sistema de perguntas e respostas sobre documentação interna
```

**Saída Esperada:**
```
Embeddings: text-embedding-3-small
Chunk size: 512 tokens
Overlap: 50 tokens
Top-k: 5 resultados
Retrieval: hybrid (vector + BM25)
LLM: claude-sonnet-4-20250514
Prompt: "Baseado no contexto: {docs}\nResponda: {query}"
Re-ranking: cross-encoder
```
