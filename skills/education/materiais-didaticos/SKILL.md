---
name: materiais-didaticos
description: "Use when creating educational materials like texts, videos, and infographics. Use ONLY when the task is about materials, not curriculum."
---

# Materiais Didáticos

Produz materiais educacionais acessíveis, reutilizáveis e multimídia
para diferentes contextos de ensino e aprendizagem.

## Objetivo

Criar e adaptar materiais didáticos que sejam claros, acessíveis
e adequados ao público-alvo, considerando diversidade de formatos,
licenciamento e reutilização.

## Fluxo de Trabalho

1. Identificar público-alvo e objetivos de aprendizagem
2. Selecionar tipo de material adequado (texto, vídeo, infográfico)
3. Definir estrutura e sequência lógica do conteúdo
4. Produzir conteúdo em formato escolhido
5. Aplicar princípios de acessibilidade (contraste, legendas, alt text)
6. Adicionar elementos visuais e multimídia quando pertinente
7. Revisar clareza, precisão e adequação ao público
8. Definir licença de uso e metadados de reutilização

## Critérios de Qualidade

- [ ] Conteúdo é preciso e está atualizado
- [ ] Estrutura é lógica e facilita a navegação
- [ ] Linguagem é acessível ao nível do público
- [ ] Material é acessível (legendas, contraste, alt text)
- [ ] Elementos visuais complementam o texto
- [ ] Licença de uso está claramente indicada
- [ ] Formato permite reutilização e adaptação
- [ ] Metadados educacionais estão documentados

## Limitações

- Não produz avaliações ou provas (usar `@test-generation`)
- Não planeja currículos inteiros (usar `@planejamento`)
- Não substitui consultoria pedagógica profissional
- Não garante aprovação em processos de certificação
- Não depende de plataformas específicas de EAD

## Casos de Uso

- Criar apostila ou material de apoio para disciplina
- Produzir vídeo educativo explicativo
- Desenvolver infográfico com conceitos-chave
- Adaptar material existente para novo público
- Criar guia de estudo ou roteiro de leitura

## Casos onde NÃO utilizar

- Para planejar currículo completo (usar `@planejamento`)
- Para criar avaliações ou exercícios (usar `@test-generation`)
- Para projetar cursos inteiros (usar `@cursos`)
- Para conduzir oficinas práticas (usar `@oficinas`)

## Exemplos

### Exemplo 1: Roteiro de vídeo educativo

**Entrada:**
```
Tema: Conceitos básicos de Python para iniciantes
Duração: 10 minutos
Público: Estudantes do ensino médio
```

**Saída Esperada:**
```markdown
## Roteiro: Introdução a Python

### Introdução (0:00 - 1:30)
- Apresentação do tema e objetivos
- Mostrar exemplos reais de uso de Python

### Conceito 1: Variáveis (1:30 - 4:00)
- Definição simples com analogia do cotidiano
- Demonstração no terminal
- Exercício guiado

### Conceito 2: Condicionais (4:00 - 7:00)
- Estrutura if/else com fluxograma visual
- Exemplo prático: classificador de notas

### Encerramento (7:00 - 10:00)
- Resumo dos conceitos
- Próximos passos e recursos complementares

### Produção
- Legendas: Obrigatórias (acessibilidade)
- Resolução: 1080p mínimo
- Formato: MP4 (H.264)
```

### Exemplo 2: Adaptar material para acessibilidade

**Entrada:**
```
Material existente: PDF com tabelas e gráficos complexos
Público: Estudantes com deficiência visual
```

**Saída Esperada:**
```markdown
## Plano de Adaptação

### Transformações necessárias
1. Tabelas convertidas para listas estruturadas
2. Gráficos descritos em texto alternativo
3. Imagens com alt text descritivo
4. Ordem de leitura lógica definida
5. Contraste de cores verificado (mínimo 4.5:1)

### Formatos de saída
- Documento estruturado (heading levels corretos)
- Versão em texto puro (.txt)
- Áudio narrado (se disponível)

### Verificação
- Testar com leitor de tela (NVDA/VoiceOver)
- Validar contraste com ferramenta de acessibilidade
- Revisar alternância de texto
```
