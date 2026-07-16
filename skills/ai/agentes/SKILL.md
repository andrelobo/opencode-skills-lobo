---
name: agentes
description: "Use when building AI agents with tools, memory, planning and multi-agent systems. Use ONLY for agent architecture, not LLM config or prompts."
---

# Agentes AI

Projetar e implementar agentes autônomos com capacidade
de ferramentas, memória, planejamento e coordenação.

## Objetivo

Criar sistemas agenticos que executam tarefas de forma
autônoma, utilizam ferramentas e coordenam com outros agentes.

## Fluxo de Trabalho

1. Definir o objetivo e escopo do agente
2. Selecionar ferramentas disponíveis
3. Projetar sistema de memória (curto e longo prazo)
4. Implementar loop de raciocínio (ReAct, CoT, ToT)
5. Configurar function calling e tool use
6. Projetar sistema de planejamento
7. Implementar guardrails e segurança
8. Configurar observabilidade e logging
9. Testar com cenários reais
10. Implementar coordenação multi-agente quando necessário

## Critérios de Qualidade

- [ ] Agente executa tarefas de forma autônoma
- [ ] Ferramentas são invocadas corretamente
- [ ] Memória persiste entre interações
- [ ] Planejamento é transparente e rastreável
- [ ] Loop de raciocínio converge para solução
- [ ] Guardrails prevenem ações perigosas
- [ ] Erros são tratados com fallbacks
- [ ] Observabilidade permite debug eficiente
- [ ] Multi-agente coordena sem conflitos
- [ ] Custos de execução são controlados

## Limitações

- Não configura parâmetros de LLM (usar `@llms`)
- Não faz fine-tuning de modelos (usar `@llms`)
- Não faz pipeline de embeddings (usar `@llms`)
- Não faz deploy de infraestrutura (usar `@cloud`)

## Casos de Uso

- Assistentes autônomos com acesso a APIs
- Agents de código que editam e testam
- Sistemas de customer support avançados
- Research agents que buscam e sintetizam
- Orquestração de workflows complexos

## Casos onde NÃO utilizar

- Para configuração pura de LLM (usar `@llms`)
- Para RAG simples sem agência (usar `@llms`)
- Para prompt engineering isolado (usar `@prompt-engineering`)

## Exemplos

### Exemplo 1: Agent com tool use

**Entrada:**
```
Criar agente que consulta APIs e gera relatórios
```

**Saída Esperada:**
```
Agent: report-generator
Tools:
  - search_api(query) -> results
  - read_database(sql) -> data
  - write_report(content) -> file
Memory: conversational (últimas 20 msgs)
Loop: ReAct (Thought → Action → Observation)
Guardrails: somente leitura em produção
```

### Exemplo 2: Sistema multi-agente

**Entrada:**
```
Criar sistema de revisão de código com múltiplos agentes
```

**Saída Esperada:**
```
Orchestrator: coordena fluxo
Agents:
  - reviewer: analisa código, sugere melhorias
  - tester: executa testes, valida cobertura
  - security: verifica vulnerabilidades
Protocol: round-robin com votação
Memory: compartilhada via Redis
Fallback: retry 3x, depois escala para humano
```
