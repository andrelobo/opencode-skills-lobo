---
name: questionarios-inclusao
description: "Use when creating questionnaires about special needs or inclusion surveys. Use ONLY when the task is about inclusion questionnaires, not testing."
---

# Questionarios de Inclusao

Cria, revisa e analisa questionarios voltados a inclusao social,
levantamento de percepcoes e coleta de dados acessiveis.

## Objetivo

Produzir instrumentos de coleta de dados que sejam acessiveis,
validos e que capturem informacoes relevantes sobre necessidades
especiais e percepcao de inclusao.

## Fluxo de Trabalho

1. Definir objetivo e escopo do questionario
2. Identificar publico-alvo e suas caracteristicas
3. Selecionar tipos de perguntas adequados
4. Estruturar perguntas de forma clara e acessivel
5. Garantir alternativas de respostas inclusivas
6. Revisar acessibilidade do formulario
7. Validar com publico-alvo quando possivel
8. Documentar metodos de analise dos dados
9. Criar relatorio de resultados com indicadores

## Critérios de Qualidade

- [ ] Perguntas sao claras e sem ambiguidade
- [ ] Alternativas de resposta cobrem diversidade
- [ ] Formulario e acessivel (leitores de tela, contraste, etc)
- [ ] Linguagem e inclusiva e nao discriminadora
- [ ] Estrutura e logica e sequencial
- [ ] Dados coletados sao analisaveis
- [ ] Privacidade dos respondentes e respeitada
- [ ] Tamanho e adequado ao proposito

## Limitacoes

- Nao substitui avaliacao clinica ou diagnostico
- Nao coleta dados sensiveis sem consentimento
- Nao garante representatividade sem amostragem adequada
- Nao executa analise estatistica complexa
- Nao substitui entrevistas qualitativas aprofundadas

## Casos de Uso

- Mapear necessidades em ambientes corporativos
- Avaliar percepcao de inclusao em instituicoes
- Coletar dados sobre acessibilidade em eventos
- Pesquisar barreiras de comunicacao
- Diagnosticar necessidades de adaptacoes

## Casos onde NAO utilizar

- Para testar acessibilidade web (usar `acessibilidade-web`)
- Para gerar laudos tecnicos (usar `relatorios-tecnicos`)
- Para avaliar funcionalidade de tecnologias assistivas
- Para diagnosticos medicos ou psicologicos

## Exemplos

### Exemplo 1: Pergunta sobre barreiras

**Entrada:**
Pergunta vaga: "Voce tem algum problema?"

**Saida Esperada:**
Pergunta acessivel: "Quais barreiras voce identifica no ambiente de trabalho?
(Selecione todas que se aplicam)"
- Barreiras de mobilidade
- Barreiras de comunicacao
- Barreiras atitudinais
- Barreiras de acessibilidade digital
- Nenhuma barreira identificada
- Outra (especificar)

### Exemplo 2: Formulario acessivel

**Entrada:**
Formulario com campos nao rotulados

**Saida Esperada:**
Formulario com:
- Labels associados a cada campo
- Instrucoes claras antes de cada secao
- Contraste minimo de 4.5:1
- Suporte a navegacao por teclado
- Descricao de erros com orientacao
- Opcao de resposta "Prefiro nao responder"
