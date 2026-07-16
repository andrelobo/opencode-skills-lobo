---
name: indicadores
description: "Use when defining inclusion indicators, accessibility metrics, and KPIs. Use ONLY when the task is about metrics, not diagnostics."
---

# Indicadores de Inclusão

Define e acompanha indicadores de inclusão, métricas de
acessibilidade, KPIs de diversidade, monitoramento contínuo
e avaliação de impacto.

## Objetivo

Estabelecer métricas objetivas que permitam medir, monitorar
e avaliar o progresso de iniciativas de inclusão e acessibilidade.

## Fluxo de Trabalho

1. Identificar objetivos de inclusão a serem medidos
2. Definir indicadores alinhados aos objetivos
3. Estabelecer métricas de acessibilidade aplicáveis
4. Criar KPIs de diversidade relevantes
5. Planejar método de coleta de dados
6. Definir frequência e responsáveis pelo monitoramento
7. Projetar dashboard ou relatório de acompanhamento
8. Estabelecer metas e limiares de alerta

## Critérios de Qualidade

- [ ] Indicadores são específicos e mensuráveis
- [ ] Métricas são alinhadas a padrões reconhecidos (WCAG, etc.)
- [ ] KPIs cobrem dimensões relevantes de diversidade
- [ ] Método de coleta é viável e sustentável
- [ ] Dashboard é claro e acessível
- [ ] Metas são realistas e desafiadoras
- [ ] Limiares de alerta são definidos
- [ ] Dados são coletados de forma ética

## Limitações

- Não substitui diagnósticos qualitativos (usar `@diagnosticos`)
- Não conduz pesquisas primárias (usar `@pesquisas`)
- Não gera dados sem base real
- Não automatiza coleta de dados
- Não substitui avaliação com usuários reais

## Casos de Uso

- Definir KPIs de acessibilidade para produto digital
- Criar dashboard de acompanhamento de inclusão
- Estabelecer métricas de diversidade para equipe
- Avaliar impacto de mudanças de acessibilidade
- Monitorar progresso de plano de inclusão

## Casos onde NÃO utilizar

- Para diagnosticar barreiras específicas (usar `@diagnosticos`)
- Para conduzir pesquisas com usuários (usar `@pesquisas`)
- Para auditar conformidade legal (usar `@security-audit`)
- Para revisar código (usar `@code-review`)

## Exemplos

### Exemplo 1: KPIs de acessibilidade

**Entrada:**
Defina KPIs para monitorar acessibilidade de um e-commerce.

**Saída Esperada:**
```markdown
## KPIs de Acessibilidade - E-commerce

### Indicadores de Conformidade
- % de páginas com nota AAA no Lighthouse A11y
- # de violações WCAG por página
- % de componentes com testes de acessibilidade

### Indicadores de Uso
- % de sessões via leitor de tela
- Taxa de conclusão de compra por assistivo
- # de chamados de acessibilidade por semana

### Metas Mensais
- Reduzir violações WCAG em 20% ao mês
- Manter nota Lighthouse A11y >= 95
- Resolver 100% dos chamados em 48h
```

### Exemplo 2: Dashboard de monitoramento

**Entrada:**
Proponha estrutura de dashboard de inclusão.

**Saída Esperada:**
```markdown
## Dashboard de Inclusão - Estrutura

### Painel 1: Conformidade
- Gráfico de barras: violações por severidade
- Semáforo: status por página (verde/amarelo/vermelho)
- Tendência: evolução mensal de conformidade

### Painel 2: Diversidade
- Composição da equipe por gênero, raça, deficiência
- % de contratações inclusivas
- Taxa de retenção por grupo

### Painel 3: Impacto
- NPS de acessibilidade
- Tempo médio de resolução de barreiras
- # de features acessíveis lançadas
```
