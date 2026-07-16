---
name: treinamentos
description: "Use when designing corporate training with instructional design, ADDIE, and KPIs. Use ONLY when the task is about training programs, not workshops."
---

# Treinamentos

Planeja, estrutura e avalia programas de treinamento corporativo
com base em metodologias consolidadas de design instrucional.

## Objetivo

Desenvolver treinamentos eficazes que atendam necessidades
organizacionais, utilizem o modelo ADDIE e possam ser avaliados
por meio de KPIs e análise de ROI.

## Fluxo de Trabalho

1. Identificar necessidades de treinamento por meio de diagnóstico organizacional
2. Definir público-alvo e perfis de aprendizagem
3. Estabelecer objetivos de aprendizagem mensuráveis
4. Aplicar as 5 fases do modelo ADDIE (Análise, Desenvolvimento, Implementação, Design, Avaliação)
5. Estruturar conteúdos e sequência didática
6. Selecionar métodos e mídias adequados
7. Definir indicadores de desempenho (KPIs) do treinamento
8. Projetar instrumentos de avaliação (antes, durante e depois)
9. Calcular custos e estimar retorno sobre investimento (ROI)
10. Documentar plano de treinamento completo

## Critérios de Qualidade

- [ ] Necessidades de treinamento foram mapeadas com dados
- [ ] Objetivos de aprendizagem são claros e mensuráveis
- [ ] Modelo ADDIE foi aplicado em todas as fases
- [ ] Conteúdo está alinhado aos objetivos e ao público
- [ ] KPIs foram definidos antes da implementação
- [ ] Instrumentos de avaliação cobrem os 4 níveis de Kirkpatrick
- [ ] Estimativa de ROI apresenta premissas claras
- [ ] Plano considera restrições de tempo e orçamento

## Limitações

- Não executa treinamentos presenciais (usar `@oficinas`)
- Não produz materiais didáticos finos (usar `@doc-writer`)
- Não realiza pesquisa de campo para levantamento de necessidades
- Não gerencia LMS ou plataformas de e-learning
- Não substitui consultoria especializada em People Analytics

## Casos de Uso

- Criar programa de treinamento para nova tecnologia
- Reestruturar programa de onboarding de colaboradores
- Projetar trilha de desenvolvimento para lideranças
- Justificar investimento em treinamento com análise de ROI
- Planejar ciclo anual de capacitação corporativa

## Casos onde NÃO utilizar

- Para conduzir oficinas ou workshops práticos (usar `@oficinas`)
- Para criar documentação técnica (usar `@doc-writer`)
- Para automatizar processos de RH (usar `@n8n`)

## Exemplos

### Exemplo 1: Estrutura de treinamento

**Entrada:**
```
Treinamento de Python para analistas de dados
Público: 20 analistas com conhecimento básico de Excel
Duração: 40 horas em 4 semanas
```

**Saída Esperada:**
```markdown
## Programa de Treinamento: Python para Análise de Dados

### Diagnóstico
- 80% dos analistas utilizam apenas Excel para relatórios
- Necessidade de automatizar processos de consolidação
- Demanda por dashboards interativos

### Objetivos
1. Utilizar Python e Pandas para manipulação de dados
2. Criar visualizações com Matplotlib e Seaborn
3. Automatizar relatórios mensais

### Fases ADDIE
- Análise: Levantamento de necessidades concluído
- Design: Currículo estruturado em 4 módulos
- Desenvolvimento: Conteúdo e exercícios práticos
- Implementação: 4 turmas de 5 alunos
- Avaliação: Pré-teste, pós-teste, pesquisa de satisfação

### KPIs
- Taxa de conclusão > 90%
- Nota média pós-teste > 7/10
- Aplicação prática em até 30 dias

### ROI Estimado
- Investimento: R$ 40.000 (instrutor, material, infra)
- Economia projetada: R$ 120.000/ano em horas manuais
- Payback: 4 meses
```

### Exemplo 2: Análise de Kirkpatrick

**Entrada:**
```
Avaliar eficácia do treinamento de vendas realizado no Q1
```

**Saída Esperada:**
```markdown
## Avaliação de Kirkpatrick - Treinamento de Vendas Q1

### Nível 1 - Reação
- Pesquisa de satisfação: 4.6/5.0
- 95% recomendariam para colegas

### Nível 2 - Aprendizagem
- Pré-teste médio: 5.2 | Pós-teste médio: 8.1
- Melhoria de 55.8%

### Nível 3 - Comportamento
- Observação em campo (30 dias): 70% aplicaram técnicas
- Barreira: falta de reforço imediato no workflow

### Nível 4 - Resultados
- Conversões aumentaram 12% no trimestre seguinte
- Ticket médio subiu 8%
```
