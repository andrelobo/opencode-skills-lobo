---
name: linguagem-simples
description: "Use when applying plain language with clear vocabulary and short sentences. Use ONLY when the task is about plain language, not editing."
---

# Linguagem Simples

Aplica principios de plain language para tornar textos claros,
objetivos e acessiveis a qualquer pessoa.

## Objetivo

Produzir e revisar textos que qualquer pessoa possa entender na
primeira leitura, independentemente do nivel de escolaridade ou
familiaridade com o tema.

## Fluxo de Trabalho

1. Identificar publico-alvo e seu nivel de letramento
2. Definir proposito principal do texto
3. Estruturar conteudo em ordem logica (problema > solucao)
4. Usar vocabulario cotidiano e evitar jargoes
5. Escrever frases curtas com uma unica ideia cada
6. Preferir voz ativa e ordem direta (sujeito-verbo-objeto)
7. Usar listas, subtitulos e marcadores para organizacao visual
8. Revisar ambuiguidades e termos tecnicos desnecessarios
9. Aplicar linguagem neutra quando genero nao for relevante
10. Testar compreensao com leitores do publico-alvo

## Criterios de Qualidade

- [ ] Frases tem no maximo 20 palavras em media
- [ ] Vocabulario e compreensivel para leigo no assunto
- [ ] Jargoes e siglas foram explicados na primeira ocorrencia
- [ ] Estrutura segue ordem logica e progressiva
- [ ] Voz ativa foi priorizada sobre voz passiva
- [ ] Listas e subtitulos organizam visualmente o conteudo
- [ ] Nao ha ambiguidades ou duplo sentido
- [ ] Linguagem neutra foi aplicada consistentemente
- [ ] Texto foi testado com pessoa do publico-alvo
- [ ] Proposito do texto esta claro no inicio

## Limitacoes

- Nao substitui consulta juridica para documentos legais
- Nao traduz automaticamente para outras linguas (usar `@translation`)
- Nao cobre comunicacao nao verbal ou visual
- Nao valida precisao tecnica do conteudo
- Linguagem neutra pode exigir adaptacao a cada contexto

## Casos de Uso

- Simplificar comunicados internos e externos
- Revisar formularios e documentos oficiais
- Preparar instrucoes para usuarios finais
- Adaptar textos juridicos para o publico geral
- Criar FAQ, tutoriais e guias rapidos

## Casos onde Nao Utilizar

- Para traduzir documentos (usar `@translation`)
- Para validar precisao tecnica ou juridica
- Para criar documentacao tecnica avancada (usar `@doc-writer`)
- Para revisar codigo fonte

## Exemplos

### Exemplo 1: Simplificar comunicado

**Entrada:**
"Em conformidade com a legislacao vigente e as diretrizes
estabelecidas pela gestao corporativa, informamos que o
procedimento de solicitacao de ferias devera ser efetuado
mediante preenchimento do formulario padrao."

**Saida Esperada:**
"Para solicitar ferias, preencha o formulario padrao."

### Exemplo 2: Remover jargao

**Entrada:**
"A sinergia entre stakeholders e imprescindivel para alavancar
os KPIs do projeto."

**Saida Esperada:**
"A parceria entre todos os envolvidos e essencial para alcancar
as metas do projeto."

### Exemplo 3: Linguagem neutra e clara

**Entrada:**
"O usuario devera clicar no botao quando ele desejar confirmar
a operacao."

**Saida Esperada:**
"Clique no botao para confirmar a operacao."
