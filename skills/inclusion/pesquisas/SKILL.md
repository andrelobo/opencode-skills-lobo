---
name: pesquisas
description: "Use when conducting research with data collection, analysis, and reporting. Use ONLY when the task is about research methods, not diagnostics."
---

# Pesquisas de Inclusão

Conduz pesquisas qualitativas e quantitativas sobre inclusão,
levantando dados, definindo amostragem, analisando resultados
e gerando relatórios com foco em ética e rigor metodológico.

## Objetivo

Produzir conhecimento baseado em evidências sobre necessidades,
experiências e barreiras enfrentadas por pessoas de diferentes
perfis de diversidade e acessibilidade.

## Fluxo de Trabalho

1. Definir problema de pesquisa e objetivos
2. Selecionar abordagem metodológica (qualitativa, quantitativa, mista)
3. Projetar instrumentos de coleta de dados
4. Definir estratégia de amostragem
5. Coletar dados com rigor e ética
6. Analisar dados utilizando métodos apropriados
7. Interpretar resultados e extrair insights
8. Elaborar relatório de pesquisa completo

## Critérios de Qualidade

- [ ] Problema de pesquisa é claro e delimitado
- [ ] Abordagem metodológica é adequada aos objetivos
- [ ] Instrumentos são validados ou revisados
- [ ] Amostragem é representativa e justificada
- [ ] Coleta respeita princípios éticos
- [ ] Análise é rigorosa e transparente
- [ ] Resultados são interpretados com cautela
- [ ] Relatório inclui limitações e recomendações

## Limitações

- Não substitui diagnósticos técnicos (usar `@diagnosticos`)
- Não gera indicadores de acompanhamento (usar `@indicadores`)
- Não coleta dados automaticamente
- Não acessa bases de dados proprietárias
- Não realiza coleta em larga escala sem infraestrutura

## Casos de Uso

- Pesquisa qualitativa sobre experiências de usuários com deficiência
- Levantamento quantitativo de necessidades de acessibilidade
- Estudo de amostragem sobre percepção de diversidade
- Análise de dados de uso por diferentes perfis
- Relatório de pesquisa para tomada de decisão

## Casos onde NÃO utilizar

- Para diagnosticar barreiras em produto específico (usar `@diagnosticos`)
- Para definir métricas e KPIs (usar `@indicadores`)
- Para auditar segurança (usar `@security-audit`)
- Para revisar código (usar `@code-review`)

## Exemplos

### Exemplo 1: Pesquisa qualitativa

**Entrada:**
Conduza uma pesquisa qualitativa sobre barreiras de navegação
para usuários de leitor de tela em um site de notícias.

**Saída Esperada:**
```markdown
## Pesquisa Qualitativa - Barreiras de Navegação

### Método
- Abordagem: Entrevistas semiestruturadas
- Amostra: 8 usuários de leitor de tela
- Duração: 45 minutos por entrevista
- Análise: Análise temática

### Questões-Guia
1. Descreva como navega nas principais seções do site
2. Quais barreiras encontrou ao buscar conteúdo específico?
3. Que mudanças facilitariam sua navegação?

### Aspectos Éticos
- Termo de consentimento assinado por todos
- Anonimato garantido nos relatos
- Participantes podem desistir a qualquer momento
```

### Exemplo 2: Pesquisa quantitativa

**Entrada:**
Projete um questionário para medir satisfação de
usuários com deficiência motora.

**Saída Esperada:**
```markdown
## Questionário de Satisfação - Deficiência Motora

### Bloco 1: Perfil
- Tipo de dispositivo de acesso utilizado
- Frequência de uso do produto
- Tempo usando o produto

### Bloco 2: Experiência
- Facilidade de uso (escala 1-5)
- Tempo para completar tarefas principais (escala 1-5)
- Clareza das instruções (escala 1-5)

### Bloco 3: Barreiras
- Quais barreiras mais impactam sua experiência? (múltipla escolha)
- Há funcionalidades que não consegue utilizar? (aberto)

### Validação
- Teste piloto com 5 usuários antes da aplicação
- Cálculo de alpha de Cronbach para consistência interna
```
