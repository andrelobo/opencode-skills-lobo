---
name: debug
description: "Use for AI-assisted debugging: error analysis, fix suggestions, tracing, profiling. Use ONLY for debugging, not code review or architecture analysis."
---

# Debug com IA

Auxiliar no diagnostico e resolucao de problemas usando IA para
analisar erros, sugerir correcoes, realizar tracing e profiling.

## Objetivo

Acelerar o processo de debug fornecendo analises inteligentes de erros,
sugestoes de correcao e diagnostico profundo de problemas.

## Fluxo de Trabalho

1. Coletar informacoes do erro (mensagem, stack trace, contexto)
2. Identificar o tipo de problema (runtime, logico, performance, integracao)
3. Localizar o ponto de origem do erro no codigo
4. Analisar variaveis de estado e fluxo de execucao
5. Formular hipoteses sobre a causa raiz
6. Sugerir correcoes com evidencias
7. Verificar se a correcao nao introduce regressoes
8. Propor testes para prevenir recorrencia
9. Documentar o diagnostico e solucao
10. Validar em ambiente controlado

## Critérios de Qualidade

- [ ] Erro e analisado com contexto completo (stack trace + codigo)
- [ ] Causa raiz e identificada com clareza
- [ ] Sugestoes de correcao sao seguras e validadas
- [ ] Solucao considera impacto em outras partes do sistema
- [ ] Diagnostico inclui passos reproduziveis
- [ ] Correcao nao compromete seguranca ou performance
- [ ] Testes sao sugeridos para validacao

## Limitações

- Não executa codigo em tempo real (ambiente controlado)
- Não substitui profiling de producao com ferramentas especializadas
- Não resolve problemas de infraestrutura complexos (usar `@cloud`)
- Não faz rollback automatico de mudancas

## Casos de Uso

- Diagnosticar erros de compilacao ou runtime
- Investigar memory leaks e problemas de performance
- Analisar falhas em integracoes com APIs externas
- Diagnosticar problemas concorrentes (race conditions)
- Resolver erros de tipos e null safety
- Investigar comportamento inesperado em testes

## Casos onde NAO utilizar

- Para analise estrutural do codigo (usar `@analise-arquitetural`)
- Para revisao de codigo em geral (usar `@code-review`)
- Para problemas de deploy ou infraestrutura (usar `@deploy`)
- Para configuracao de MCP servers (usar `@mcp`)

## Exemplos

### Exemplo 1: Diagnostico de Erro Runtime

**Entrada:**
```
TypeError: Cannot read properties of undefined (reading 'map')
em src/components/UserList.tsx:23
```

**Saida Esperada:**
```
Diagnostico:

Causa raiz: A prop 'users' pode ser undefined quando o componente
renderiza antes da busca completar.

Linha 23: users.map(user => ...) falha quando users e undefined

Correcao sugerida:
  const users = data?.users ?? []

Ou adicionar verificacao condicional:
  {users && users.map(user => ...)}

Teste sugerido:
  Verificar comportamento com dados vazios e loading state
```

### Exemplo 2: Diagnostico de Performance

**Entrada:**
```
Requisicao HTTP esta lenta, tempo de resposta > 5s
```

**Saida Esperada:**
```
Analise de Performance:

Possiveis causas identificadas:
  1.查询 N+1 detectada em src/services/orderService.ts:67
     - 1 query para orders + 100 queries para items
     - Correcao: Usar eager loading ou JOIN

  2. Falta de cache em chamadas repetidas
     - src/api/products.ts:34 - mesma query executada 15x
     - Correcao: Adicionar cache com TTL

  3. Serializacao desnecessaria
     - src/utils/formatter.ts:12 - JSON.parse/stringify em loop
     - Correcao: Processar dados diretamente

Prioridade: Query N+1 (maior impacto estimado)
```
