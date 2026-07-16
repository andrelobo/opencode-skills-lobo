---
name: apostilas
description: "Use when creating course materials, handouts, and study guides. Use ONLY when the task is about educational content, not documentation."
---

# Apostilas

Cria apostilas, materiais de curso e guias de estudo com estrutura
didática, exercícios, resumos e acessibilidade.

## Objetivo

Produzir materiais educacionais completos, organizados e acessíveis
que facilitem o aprendizado autônomo ou guiado.

## Fluxo de Trabalho

1. Definir tema, objetivo de aprendizagem e público-alvo
2. Mapear pré-requisitos e conhecimentos necessários
3. Estruturar conteúdo em módulos ou capítulos lógicos
4. Criar resumo executivo de cada seção
5. Desenvolver conteúdo explicativo com exemplos
6. Incluir exercícios práticos com gabarito
7. Adicionar diagramas, tabelas ou ilustrações quando necessário
8. Revisar ortografia, gramática e coerência
9. Verificar formatação e acessibilidade
10. Validar com revisão final e ajustes

## Critérios de Qualidade

- [ ] Objetivo de aprendizagem claro em cada módulo
- [ ] Progressão lógica do simples ao complexo
- [ ] Resumos concisos ao final de cada seção
- [ ] Exercícios com enunciado claro e gabarito disponível
- [ ] Linguagem acessível ao nível do público
- [ ] Formatação consistente (títulos, fontes, espaçamento)
- [ ] Referências e fontes citadas quando aplicável
- [ ] Acessibilidade verificada (contraste, estrutura, alternativas)

## Limitações

- Não produz vídeos ou conteúdos multimídia
- Não gerencia plataformas LMS (Moodle, Canvas, etc.)
- Não cria layouts visuais profissionais (sugere LaTeX, Canva ou InDesign)
- Não realiza revisão por pares ou avaliação pedagógica
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar apostila para curso técnico ou faculdade
- Montar material de treinamento corporativo
- Desenvolver guia de estudo para certificação
- Produzir material didático para workshop ou bootcamp

## Casos onde NÃO utilizar

- Para preparar palestra ou apresentação (usar `@palestras`)
- Para escrever documentação técnica de código (usar `@doc-writer`)
- Para criar testes ou avaliações (usar `@test-generation`)

## Exemplos

### Exemplo 1: Estrutura de módulo

**Entrada:**
```
Tema: "Introdução a Python para Iniciantes"
Público: Estudantes de graduação sem experiência em programação
```

**Saída Esperada:**
```
Módulo 1: Primeiros Passos com Python

Objetivo: Escrever e executar o primeiro programa em Python

1.1 O que é Python e por que aprender
    - Resumo: Python é uma linguagem interpretada, versátil
      e com sintaxe simples, ideal para iniciantes

1.2 Instalação e configuração
    - Passo a passo para Windows, Linux e macOS
    - Verificação da instalação

1.3 Estrutura básica de um programa
    - Exemplo: print("Olá, mundo!")
    - Explicação linha por linha

1.4 Variáveis e tipos de dados
    - Exemplo prático: calculadora simples
    - Tabela de tipos básicos (str, int, float, bool)

Exercícios:
1. Instale o Python e execute print("Meu primeiro programa")
2. Crie variáveis para nome, idade e altura e imprima
3. Calcule a média de 3 notas do usuário

Gabarito disponível no Apêndice A
```

### Exemplo 2: Formatação e acessibilidade

**Entrada:**
```
Apostila: "Fundamentos de Redes"
Formato: PDF/A4
```

**Saída Esperada:**
```
Diretrizes de formatação e acessibilidade:

Estrutura do documento:
- Capa com título, subtítulo e versão
- Sumário com numeração de páginas
- Introdução com objetivos e público-alvo
- Capítulos numerados (1, 1.1, 1.1.1)
- Apêndices (gabarito, glossário)
- Referências bibliográficas

Formatação:
- Fonte: sans-serif (Arial, Helvetica ou equivalente)
- Tamanho: corpo 12pt, títulos 16-24pt
- Espaçamento entre linhas: 1.5
- Margens: 2.5cm todas as laterais
- Parágrafos justificados com recuo na primeira linha

Acessibilidade:
- Títulos com níveis hierárquicos (H1 > H2 > H3)
- Imagens com texto alternativo descritivo
- Tabelas com cabeçalhos definidos
- Contraste mínimo de 4.5:1 para texto
- Links com texto descritivo (não "clique aqui")

Elementos visuais:
- Diagramas com legenda e fonte legível
- Tabelas simplificadas com dados essenciais
- Boxes para dicas, avisos e exemplos práticos
```
