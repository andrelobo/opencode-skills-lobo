---
name: planejamento-ai
description: "Use when planning tasks with AI: decomposition, CoT/ToT reasoning, plan generation. Use ONLY for structured AI planning, not simple prompts."
---

# Planejamento AI

Estruturar o raciocinio e a execucao de tarefas complexas usando
tecnicas de planejamento com inteligencia artificial.

## Objetivo

 decompor problemas complexos em etapas menores, gerar planos de
execucao, aplicar Chain-of-Thought e Tree-of-Thought, e validar
planos antes da execucao.

## Fluxo de Trabalho

1. Definir o problema ou objetivo final de forma clara e mensuravel
2. Decompor o problema em subproblemas menores e independentes
3. Identificar dependencias e ordem logica entre as etapas
4. Gerar multiplas estrategias de resolucao (Tree-of-Thought)
5. Avaliar cada estrategia quanto a viabilidade, custo e risco
6. Selecionar a melhor estrategia e detalhar o plano de execucao
7. Aplicar Chain-of-Thought para refinar o raciocinio passo a passo
8. Validar o plano contra restricoes, recursos e requisitos
9. Aprovar o plano ou iterar com ajustes
10. Executar o plano e revisar os resultados

## Criterios de Qualidade

- [ ] Problema esta definido com criterios de sucesso claros
- [ ] Decomposicao cobre todos os aspectos do problema
- [ ] Dependencias entre etapas estao mapeadas
- [ ] Ao menos duas estrategias alternativas foram consideradas
- [ ] Plano inclui estimativas de esforco ou complexidade
- [ ] Raciocinio Chain-of-Thought e explicito e auditavel
- [ ] Restricoes (tempo, recursos, tecnologia) estao documentadas
- [ ] Plano possui pontos de verificacao para validacao intermediaria
- [ ] Riscos identificados possuem planos de mitigacao

## Limitacoes

- Nao executa tarefas automaticamente (usar ferramentas do agente)
- Nao substitui conhecimento especifico de dominio
- Nao e adequado para tarefas triviais ou ja bem definidas
- Nao faz gerenciamento de projeto de longo prazo

## Casos de Uso

- Desenvolvimento de features complexas com multiplas etapas
- Depuracao de bugs intermitentes que exigem investigacao estruturada
- Refatoracao de codigo legado com analise de impacto
- Migracao de sistemas com dependencias conhecidas
- Otimizacao de performance com analise de causas

## Casos onde NAO utilizar

- Para tarefas simples de uma unica etapa (usar prompt direto)
- Para decisoes que exigem julgamento humano exclusivo
- Para problemas ja resolvidos com solucao conhecida
- Para requisitos ambiguos que precisam de clarification humana

## Exemplos

### Exemplo 1: Decomposicao com Chain-of-Thought

**Entrada:**
```
Implementar autenticacao com JWT em API REST
```

**Saida Esperada:**
```
Problema: Adicionar autenticacao JWT a API REST existente

Decomposicao:
1. Escolher biblioteca JWT (jsonwebtoken)
2. Criar modelo de usuario se nao existir
3. Implementar endpoint POST /auth/login
4. Implementar middleware de verificacao de token
5. Proteger rotas privadas com o middleware
6. Implementar renovacao de token (refresh)
7. Testar fluxo completo

Chain-of-Thought:
- Usuario enha credenciais -> login valida -> gera JWT
- JWT expira em 1h -> refresh token em 7d
- Middleware decodifica token -> extrai user_id -> anexa a request

Dependencias: (3) depende de (2), (5) depende de (4)
Riscos: Secrets expostos no codigo -> usar environment variables
```

### Exemplo 2: Tree-of-Thought com Multiplas Estrategias

**Entrada:**
```
Otimizar consulta SQL que esta lenta em tabela de 10M linhas
```

**Saida Esperada:**
```
Estrategia A (Indice):
- Criar indice composto nas colunas do WHERE
- Baixo esforco, alto impacto, sem risco de regression
- Estimativa: reduz de 5s para 50ms

Estrategia B (Cache):
- Adicionar Redis para queries frequentes
- Medio esforco, consistencia eventual, custo operacional
- Estimativa: reduz para <10ms em cache hit

Estrategia C (Particionamento):
- Particionar tabela por data
- Alto esforco, altera schema, impacto em queries existentes
- Estimativa: melhoria moderada (2s -> 200ms)

Recomendacao: Estrategia A (indice) primeiro, depois B se necessario.
```
