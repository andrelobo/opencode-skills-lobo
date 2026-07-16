---
name: questionarios
description: "Use when creating questionnaires or quizzes with various question types. Use ONLY when the task is about questionnaires, not exams or rubrics."
---

# Questionarios

Cria, aplica e analisa questionarios e formularios com diversos
tipos de perguntas e feedback automatizado.

## Objetivo

Produzir instrumentos de coleta de dados e avaliacao que sejam
claros, objetivos e analisaveis estatisticamente.

## Fluxo de Trabalho

1. Definir objetivo do questionario (diagnostico, avaliativo, pesquisa)
2. Selecionar tipos de perguntas adequados ao objetivo
3. Escrever enunciados claros e sem ambiguidade
4. Definir opcoes de resposta e escalas
5. Estruturar secao e ordenacao logica
6. Configurar regras (obrigatoriedade, ramificacao, limite de tempo)
7. Aplicar questionario ou disponibilizar formulario
8. Coletar e armazenar respostas
9. Analisar resultados (estatisticas, graficos)
10. Gerar feedback automatico ou relatorio

## Criterios de Qualidade

- [ ] Perguntas sao claras, sem dupla interpretacao
- [ ] Escalas Likert sao balanceadas (ex: 5 ou 7 pontos)
- [ ] Opcoes de multipla escolha sao exaustivas e mutuamente exclusivas
- [ ] Ramificacoes condicionais funcionam corretamente
- [ ] Formulario e responsivo e acessivel
- [ ] Respostas sao armazenadas com timestamp
- [ ] Analise inclui media, mediana, desvio padrao
- [ ] Feedback e coerente com o desempenho do respondente
- [ ] Nao ha perguntas tendenciosas ou direcionadas
- [ ] Anexos sao opcionais e identificados

## Limitacoes

- Nao substitui avaliacao presencial ou banca examinadora
- Nao realiza analise qualitativa avancada (entrevistas, grupos focais)
- Nao gera questoes para provas de vestibular ou concursos
- Depende de boa formulacao das perguntas pelo solicitante
- Nao integra com LMS especificos sem API

## Casos de Uso

- Criar questionario de satisfacao ao final de curso
- Elaborar quiz de revisao para alunos
- Aplicar pesquisa de clima organizacional
- Coletar feedback de evento ou palestra
- Realizar avaliacao diagnostica inicial
- Analisar resultados de pesquisa de mercado

## Casos onde NAO utilizar

- Para criar provas de concurso ou vestibular
- Para avaliacao subjetiva que exige banca
- Para gerar rubricar de avaliacao (usar `@rubricas`)
- Para conduzir entrevistas qualitativas

## Exemplos

### Exemplo 1: Questionario de Satisfacao

**Entrada:**
Objetivo: Avaliar satisfacao com treinamento de vendas
Publico: 30 participantes
Formato: Online

**Saida Esperada:**
```
# Pesquisa de Satisfacao - Treinamento de Vendas

## Secao 1 - Dados Gerais
1. Nome (dissertativa)
2. Equipe (multipla escolha): [Norte|Sul|Leste|Oeste]

## Secao 2 - Conteudo
3. O conteudo foi relevante?
   (Likert 1-5: 1=Nada 5=Muito)
4. Qual tema foi mais util? (dissertativa)

## Secao 3 - Instrutor
5. O instrutor dominava o assunto?
   (Likert 1-5)
6. A didatica foi adequada? (Sim/Nao)

## Secao 4 - Geral
7. Recomendaria o treinamento? (Sim/Nao/Talvez)
8. Sugestoes de melhoria (dissertativa)
```

### Exemplo 2: Quiz de Revisao

**Entrada:**
Tema: Logica de Programacao
Nivel: Iniciante
Quantidade: 5 questoes

**Saida Esperada:**
```
# Quiz - Logica de Programacao

1. O que e uma variavel?
   a) Um valor que nunca muda
   b) Um espaco na memoria que armazena dados
   c) Um tipo de funcao
   d) Um operador logico

2. Qual estrutura repete um bloco de codigo?
   a) if/else
   b) for/while
   c) switch/case
   d) try/catch

3. Assinale a saida de: print(2 + 3 * 4)
   a) 20
   b) 14
   c) 9
   d) 24

4. O que significa DRY?
   (dissertativa)

5. Em uma escala de 1 a 5, qual sua confianca
   em resolver problemas com laco de repeticao?
   (Likert 1-5)

Gabarito: 1-b, 2-b, 3-b
Feedback: Acertos 3/5 - Bom desempenho! Revisar operadores.
```
