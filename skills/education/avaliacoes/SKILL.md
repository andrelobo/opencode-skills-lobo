---
name: avaliacoes
description: "Use when designing or reviewing learning assessments, formative or summative. Use ONLY when the task is about assessment, not course design."
---

# Avaliacoes de Aprendizagem

Planeja, cria e aplica instrumentos de avaliacao formativa, somativa
e diagnostica com feedback constructivo e justo.

## Objetivo

Desenvolver avaliacoes que mecam aprendizagem de forma objetiva,
transparente e alinhada a objetivos pedagogicos.

## Fluxo de Trabalho

1. Identificar tipo de avaliacao necessaria (formativa, somativa, diagnostica)
2. Definir objetivos e criterios de avaliacao
3. Selecionar instrumento adequado (prova, rubrica, portfolio, etc.)
4. Criar questoes ou criterios com gabarito/referencia
5. Garantir validade, confiabilidade e equidade
6. Definir criterios de correcao e pontuacao
7. Projetar feedback estruturado e temporal
8. Revisar para vieses e acessibilidade
9. Aplicar e coletar resultados
10. Analisar metricas e refinar instrumento

## Critérios de Qualidade

- [ ] Avaliacao esta alinhada com objetivos de aprendizagem
- [ ] Criterios sao objetivos e mensuraveis
- [ ] Questoes cobrem diferentes niveis cognitivos (Bloom)
- [ ] Gabarito e consistente e justo
- [ ] Feedback e especifico, orientado a melhoria
- [ ] Instrucoes sao claras e completas
- [ ] Instrumento e acessivel a todos os estudantes
- [ ] Pontuacao reflete peso dos objetivos avaliados
- [ ] Ha diversidade de formatos (nao so prova escrita)
- [ ] Resultados sao analisados estatisticamente

## Limitacoes

- Nao corrige provas ou atividades automaticamente
- Nao substitui avaliacao docente para trabalhos subjetivos
- Nao gerencia notas ou boletins em sistemas LMS
- Nao elabora jurados ou bancas de avaliacao
- Depende de contexto pedagogico para ser eficaz

## Casos de Uso

- Criar provas ou simulados para curso
- Desenvolver rubricas de avaliacao para projetos
- Projetar portfolios com criterios de analise
- Planejar avaliacoes diagnosticas para diagnóstico de turma
- Criar feedback estruturado para atividades
- Revisar instrumentos existentes para equidade

## Casos onde NAO utilizar

- Para design de curso completo (usar `@ead`)
- Para criar conteudo educacional (usar `@cursos`)
- Para avaliacoes de desempenho profissional (usar `@treinamentos`)
- Para corrigir atividades presenciais (usar `@oficinas`)

## Exemplos

### Exemplo 1: Rubrica de avaliacao

**Entrada:**
```
Criar rubrica para avaliar trabalho escrito de 500 palavras
```

**Saida Esperada:**
```
Rubrica: Trabalho Escrito (0-10 pontos)

| Criterio          | Excelente (3)     | Bom (2)           | Regular (1)       | Insuficiente (0)  |
|-------------------|-------------------|--------------------|--------------------|-------------------|
| Tese/Argumento    | Clara e original  | Clara mas comum    | Vaga ou derivada   | Ausente           |
| Evidencias        | 3+ fontes validas | 2 fontes validas   | 1 fonte ou fraca  | Sem evidencias    |
| Estrutura         | Logica e fluida   | Logica mas rigida  | Confusa em partes | Sem estrutura     |
| Norma culta       | Sem erros         | 1-2 erros leves    | 3-5 erros         | Muitos erros      |
| Conclusao         | Sintese forte     | Adequada           | Superficial       | Ausente           |
```

### Exemplo 2: Feedback estruturado

**Entrada:**
```
Criar modelo de feedback para atividade com nota 6/10
```

**Saida Esperada:**
```
Feedback para o estudante:

O que voce fez bem:
- Identificou corretamente os conceitos principais
- Manteve formato adequado ao longo do texto

O que pode melhorar:
- Adicione mais exemplos praticos para sustentar argumentos
- Revise a gramatica em 3-4 trechos especificos (linhas 12, 25, 31)
- Aprofunde a analise critica em vez de apenas descrever

Proximos passos:
- Releia a secao 3 do material sobre argumentacao
- Refaca o paragrafo 2 aplicando o modelo visto em aula
- Compare sua versao com a rubrica disponivel no classroom

Prazo para nova entrega: [data]
Nota atualizada apos revisao: sim
```
