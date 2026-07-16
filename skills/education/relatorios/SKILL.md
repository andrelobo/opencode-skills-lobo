---
name: relatorios
description: "Use when creating educational reports for performance analysis and decision-making. Use ONLY when the task is about reporting, not rubric design."
---

# Relatórios Pedagógicos

Cria relatórios educacionais para análise de desempenho,
indicação de indicadores e suporte à tomada de decisão.

## Objetivo

Gerar relatórios claros e úteis que forneçam dados para
melhorar práticas educacionais e acompanhar progresso.

## Fluxo de Trabalho

1. Definir objetivo e público do relatório
2. Coletar e organizar dados relevantes
3. Selecionar indicadores apropriados
4. Analisar dados e identificar padrões
5. Formatar relatório de forma clara
6. Criar visualizações quando necessário
7. Interpretar resultados e recomendar ações
8. Revisar para precisão e clareza

## Critérios de Qualidade

- [ ] Dados são precisos e atualizados
- [ ] Indicadores são relevantes para o objetivo
- [ ] Formatação é profissional e acessível
- [ ] Visualizações são claras e informativas
- [ ] Análise é objetiva e baseada em evidências
- [ ] Recomendações são práticas e específicas
- [ ] Relatório atende ao público-alvo
- [ ] Linguagem é técnica mas compreensível

## Limitações

- Não coleta dados automaticamente de sistemas externos
- Não substitui análise qualitativa do educador
- Não gera rubricas de avaliação (usar `@rubricas`)
- Não cria gráficos interativos complexos
- Não depende de ferramentas de visualização externas

## Casos de Uso

- Relatório de desempenho de turma por disciplina
- Análise de resultados de avaliações padronizadas
- Acompanhamento individual de progresso do aluno
- Relatório para reunião de pais e mestres
- Quando é necessário documentar dados para decisões pedagógicas

## Casos onde NÃO utilizar

- Para criar rubricas de avaliação (usar `@rubricas`)
- Para documentar código ou APIs (usar `@doc-writer`)
- Para gerar testes (usar `@test-generation`)
- Para criar dashboards interativos (usar ferramentas específicas)

## Exemplos

### Exemplo 1: Relatório de Desempenho por Disciplina

**Entrada:**
Dados de notas da disciplina de Matemática - 3º ano do Ensino Médio.

**Saída Esperada:**
```markdown
# Relatório de Desempenho - Matemática
## Turma: 3º Ano A - 2024

### Resumo Geral
- Total de alunos: 42
- Média da turma: 6.8
- Taxa de aprovação: 85.7%
- Alunos com nota > 8: 12 (28.6%)

### Distribuição de Notas
| Faixa | Quantidade | Percentual |
|-------|------------|------------|
| 0-4   | 6          | 14.3%      |
| 4-6   | 12         | 28.6%      |
| 6-8   | 12         | 28.6%      |
| 8-10  | 12         | 28.6%      |

### Indicadores de Aprendizagem
- Domínio de álgebra: 72% da turma
- Domínio de geometria: 65% da turma
- Resolução de problemas: 58% da turma

### Recomendações
1. Reforço em geometria para 35% da turma
2. Atividades práticas de resolução de problemas
3. Grupo de estudos para alunos com nota < 5
```

### Exemplo 2: Relatório Individual de Progresso

**Entrada:**
Acompanhamento do aluno ao longo do semestre.

**Saída Esperada:**
```markdown
# Relatório Individual de Progresso
## Aluno: Maria Silva - 8º ano B

### Evolução por Bimestre
| Bimestre | Nota | Conceito |
|----------|------|----------|
| 1º       | 6.5  | B        |
| 2º       | 7.2  | B+       |
| 3º       | 8.0  | A-       |
| 4º       | 8.5  | A        |

### Pontos Fortes
- Excelente participação em sala
- Melhoria consistente nas notas
- Ótimo trabalho em projetos

### Áreas de Melhoria
- Atenção a detalhes em exercícios
- Organização do material de estudo
- Participação em trabalhos em grupo

### Recomendações
1. Continuar com plano de estudos atual
2. Praticar exercícios com foco em atenção
3. Participar de atividades grupais
```