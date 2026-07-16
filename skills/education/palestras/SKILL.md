---
name: palestras
description: "Use when preparing presentations or talks with storytelling, slides, and Q&A. Use ONLY when the task is about talk preparation, not course material."
---

# Palestras

Prepara palestras, apresentações e talks com foco em estrutura,
storytelling, slides, engajamento e gestão do tempo.

## Objetivo

Produzir apresentações coerentes, envolventes e dentro do tempo
previsto, com storytelling eficaz e materiais de apoio adequados.

## Fluxo de Trabalho

1. Definir tema, objetivo e público-alvo da palestra
2. Pesquisar e coletar conteúdo relevante
3. Definir a mensagem central (takeaway principal)
4. Estruturar o roteiro com início, meio e fim
5. Criar storyline e narrativa com storytelling
6. Desenvolver slides de apoio (máximo 1 por minuto)
7. Incluir pontos de engajamento (perguntas, enquetes, exemplos)
8. Reservar tempo para Q&A e encerramento
9. Ensaiar com controle de tempo
10. Revisar e ajustar conforme feedback

## Critérios de Qualidade

- [ ] Mensagem central clara e memorável
- [ ] Estrutura lógica com início, meio e fim
- [ ] Storytelling envolvente com exemplo pessoal ou caso real
- [ ] Slides limpos com texto mínimo e imagens de apoio
- [ ] Tempo total respeitado (incluindo Q&A)
- [ ] Pelo menos 2 pontos de engajamento com o público
- [ ] Transições fluidas entre seções
- [ ] Encerramento com call-to-action ou mensagem final forte

## Limitações

- Não gera vídeos ou gravações de apresentação
- Não realiza ensaios ao vivo (apenas roteiros e estrutura)
- Não cria templates visuais (sugere ferramentas como Canva ou PowerPoint)
- Não gerencia logistics do evento (sala, equipamento, etc.)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Preparar palestra para conferência ou evento
- Criar apresentação para reunião de trabalho
- Montar talk técnico para comunidade de desenvolvedores
- Estruturar apresentação acadêmica ou educacional

## Casos onde NÃO utilizar

- Para criar material de curso ou apostila (usar `@apostilas`)
- Para escrever documentação técnica (usar `@doc-writer`)
- Para criar slides do zero sem roteiro (primeiro definir estrutura)

## Exemplos

### Exemplo 1: Estrutura de palestra

**Entrada:**
```
Tema: "Arquitetura de Microsserviços na Prática"
Duração: 30 minutos
Público: Desenvolvedores backend
```

**Saída Esperada:**
```
Estrutura (30 min):

1. Abertura (2 min)
   - Apresentação pessoal e crédito
   - Gancho: "Quem aqui já migrou um monolito para microsserviços?"

2. Problema (5 min)
   - Por que monolitos escalam mal
   - Caso real de empresa que enfrentou esse problema

3. Conceitos-chave (8 min)
   - Definição de microsserviços
   - Princípios: autonomia, bounded context, comunicação

4. Demonstração prática (10 min)
   - Arquitetura antes vs depois
   - Decisões de design e trade-offs

5. Lições aprendidas (3 min)
   - Erros comuns e como evitá-los
   - Quando NÃO usar microsserviços

6. Encerramento (2 min)
   - Resumo dos pontos principais
   - Call-to-action: "Comece com um único serviço"

7. Q&A (reservar 5 min antes do encerramento)
```

### Exemplo 2: Roteiro com storytelling

**Entrada:**
```
Tema: "Como automatizei meu deploy e economizei 20 horas por mês"
Duração: 20 minutos
```

**Saída Esperada:**
```
Storytelling - Roteiro narrativo:

Gancho inicial (1 min):
"Todo domingo à noite, eu conectava no servidor via SSH
e fazia deploy manual. Até que uma noite, às 2h da manhã,
eu sobrescrevi a produção inteira."

Conflito (3 min):
- Descrição do problema: deploy manual causando erros
- Impacto: downtime, estresse, perda de tempo

Virada (5 min):
- Decisão de automatizar com CI/CD
- Ferramentas escolhidas e por quê
- Primeira tentativa e falhas

Resolução (5 min):
- Pipeline final funcionando
- Resultado: deploy automatizado, zero downtime
- Economia: 20 horas/mês

Lição (3 min):
- O que aprendi sobre automação
- Dica prática para quem está começando

Encerramento (1 min):
- Mensagem: "Automatize o que causa dor, não o que é trivial"
- Abrir para Q&A
```
