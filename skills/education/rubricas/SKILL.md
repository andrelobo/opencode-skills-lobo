---
name: rubricas
description: "Use when creating educational rubrics with criteria, scales, and descriptors. Use ONLY when the task is about rubric design, not documentation."
---

# Rubricas

Cria e avalia rubricas educacionais para assessing desempenho
de alunos em atividades acadêmicas.

## Objetivo

Desenvolver rubricas claras, justas e transparentes que orientem
avaliações educacionais e forneçam feedback consistente.

## Fluxo de Trabalho

1. Analisar atividade ou competência a ser avaliada
2. Identificar critérios essenciais de avaliação
3. Definir escalas de nota adequadas
4. Criar descritores para cada nível de desempenho
5. Escolher tipo de rubrica (analítica ou holística)
6. Validar rubricas com exemplos práticos
7. Documentar justificativa para cada critério
8. Garantir transparência nos critérios de avaliação

## Critérios de Qualidade

- [ ] Critérios são claros e mensuráveis
- [ ] Escalas de nota são consistentes
- [ ] Descritores descrevem comportamentos observáveis
- [ ] Rubricas são justas e imparciais
- [ ] Documentação inclui justificativas
- [ ] Exemplos ilustram cada nível de desempenho
- [ ] Rubricas são aplicáveis a diferentes contextos
- [ ] Critérios estão alinhados com objetivos de aprendizagem

## Limitações

- Não avalia desempenho individual de alunos
- Não substitui julgamento profissional do educador
- Não cobre todos os tipos de avaliação possíveis
- Não gera relatórios de desempenho (usar `@relatorios`)
- Não depende de ferramentas externas ou plugins

## Casos de Uso

- Criar rubrica para redação acadêmica
- Avaliar projetos práticos em disciplinas
- Standardizar critérios para apresentações orais
- Definir critérios para trabalhos em grupo
- Quando é necessário feedback estruturado para alunos

## Casos onde NÃO utilizar

- Para gerar relatórios de desempenho (usar `@relatorios`)
- Para documentar código ou APIs (usar `@doc-writer`)
- Para criar testes educacionais (usar `@test-generation`)
- Para planejar currículos (usar outras ferramentas)

## Exemplos

### Exemplo 1: Rubrica para Redação

**Entrada:**
Avaliar redação dissertativo-argumentativa com foco em:
estrutura, argumentação, coesão e linguagem.

**Saída Esperada:**
```markdown
# Rubrica para Redação Dissertativo-Argumentativa

## Critérios

### 1. Estrutura
- **Nível 5:** Introdução, desenvolvimento e conclusão bem definidos
- **Nível 4:** Estrutura clara com pequenas inconsistências
- **Nível 3:** Estrutura básica com problemas de organização
- **Nível 2:** Estrutura confusa com partes faltantes
- **Nível 1:** Sem estrutura reconhecível

### 2. Argumentação
- **Nível 5:** Argumentos consistentes, relevantes e bem desenvolvidos
- **Nível 4:** Argumentos adequados com pontos fracos
- **Nível 3:** Argumentos superficiais ou irrelevantes
- **Nível 2:** Argumentos contraditórios ou incompletos
- **Nível 1:** Sem argumentação

### 3. Coesão
- **Nível 5:** Conectivos variados e uso adequado de referenciação
- **Nível 4:** Boa coesão com poucas falhas
- **Nível 3:** Coesão básica com repetições
- **Nível 2:** Pouca coesão com saltos lógicos
- **Nível 1:** Sem coesão

### 4. Linguagem
- **Nível 5:** Linguagem culta, clara e adequada ao gênero
- **Nível 4:** Linguagem adequada com pequenos desvios
- **Nível 3:** Linguagem informal ou com erros frequentes
- **Nível 2:** Linguagem inadequada com erros graves
- **Nível 1:** Linguagem incomprensível
```

### Exemplo 2: Rubrica Analítica vs Holística

**Entrada:**
Comparar abordagens para avaliar apresentação oral.

**Saída Esperada:**
```markdown
## Rubrica Analítica
Avalia cada componente separadamente:
- Conteúdo (30%)
- Expressão oral (25%)
- Domínio do tema (20%)
- Visual aids (15%)
- Tempo (10%)

**Vantagem:** Feedback granular e específico
**Desvantagem:** Mais trabalhosa de aplicar

## Rubrica Holística
Avalia desempenho global:
- Nível 5: Excelente em todos os aspectos
- Nível 4: Muito bom com pequenas falhas
- Nível 3: Adequado com pontos de melhoria
- Nível 2: Insatisfatório na maioria dos aspectos
- Nível 1: Muito insatisfatório

**Vantagem:** Rápida de aplicar
**Desvantagem:** Feedback menos específico
```