---
name: relatorios-tecnicos
description: "Use when creating accessibility reports or compliance documentation. Use ONLY when the task is about technical reports, not questionnaires."
---

# Relatorios Tecnicos de Inclusao

Produz documentacao tecnica padronizada sobre acessibilidade,
laudos, pareceres e recomendacoes para projetos de inclusao.

## Objetivo

Elaborar relatorios tecnicos claros, fundamentados e seguindo
padroes profissionais que atestem conformidade ou identifiquem
necessidades de melhoria em acessibilidade e inclusao.

## Fluxo de Trabalho

1. Coletar informacoes e dados relevantes
2. Identificar normas e referencias aplicaveis
3. Estruturar relatorio seguindo padrao tecnico
4. Descrever metodologia utilizada
5. Apresentar achados de forma objetiva
6. Elaborar recomendacoes tecnicas
7. Revisar coerencia e fundamentacao
8. Formatar documento conforme padrao estabelecido
9. Incluir referencias bibliograficas

## Critérios de Qualidade

- [ ] Relatorio segue padrao tecnico estabelecido
- [ ] Achados sao descritos de forma objetiva
- [ ] Recomendacoes sao especificas e viaveis
- [ ] Normas e referencias sao citadas corretamente
- [ ] Linguagem tecnica e acessivel ao destinatario
- [ ] Dados sao apresentados de forma clara
- [ ] Conclusoes sao coerentes com evidencias
- [ ] Documento esta completo e sem inconsistencias

## Limitacoes

- Nao substitui laudo medico ou juridico
- Nao executa testes empiricos (usar `acessibilidade-web`)
- Nao elabora questionarios (usar `questionarios-inclusao`)
- Nao garante conformidade legal absoluta
- Nao substitui consultoria especializada presencial

## Casos de Uso

- Laudo de acessibilidade para edificacoes
- Parecer tecnico sobre adaptacoes necessarias
- Relatorio de conformidade com normas WCAG
- Documentacao para processos licitatorios
- Relatorio de auditoria de inclusao

## Casos onde NAO utilizar

- Para criar questionarios (usar `questionarios-inclusao`)
- Para testar sites (usar `acessibilidade-web`)
- Para emitir documentos com valor juridico
- Para diagnosticos de saude

## Exemplos

### Exemplo 1: Estrutura de laudo

**Entrada:**
Solicitacao de laudo para espaco fisico

**Saida Esperada:**
Estrutura padrao:
1. Identificacao (responsavel, local, data)
2. Objeto do laudo
3. Metodologia de avaliacao
4. Normas de referencia (NBR 9050, etc)
5. Achados por area avaliada
6. Conformidade por item
7. Nao conformidades identificadas
8. Recomendacoes prioritarias
9. Conclusao geral
10. Anexos e registros fotograficos

### Exemplo 2: Parecer tecnico

**Entrada:**
Solicitacao de parecer sobre software acessivel

**Saida Esperada:**
Parecer contendo:
- Descricao do software avaliados
- Criterios de avaliacao utilizados
- Resultado por criterio (conforme/nao conforme)
- Resumo executivo
- Recomendacoes de adequacao
- Prazo sugerido para implementacao
- Assinatura e registro do profissional
