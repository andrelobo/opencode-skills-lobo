---
name: oficinas
description: "Use when planning hands-on workshops with active learning and group dynamics. Use ONLY when the task is about workshops, not training design."
---

# Oficinas

Planeja e estrutura oficinas práticas com metodologias ativas,
dinâmicas de grupo e avaliação experiencial para aprendizagem
efetiva em ambientes presenciais ou híbridos.

## Objetivo

Promover aprendizado prático por meio de atividades experenciais,
facilitação colaborativa e materiais bem estruturados que permitam
aos participantes aplicar conhecimentos em situações reais.

## Fluxo de Trabalho

1. Definir tema, objetivos práticos e perfil dos participantes
2. Selecionar metodologias ativas adequadas (ABP, Estudo de Caso, Role-play, Gamificação)
3. Planejar dinâmicas de grupo com regras claras e tempos definidos
4. Listar materiais necessários (físicos e digitais)
5. Estruturar roteiro com tempos por atividade
6. Projetar critérios de avaliação prática
7. Preparar plano de facilitação e roteiro do facilitador
8. Definir mecanismos de feedback em tempo real
9. Documentar plano da oficina completo

## Critérios de Qualidade

- [ ] Objetivos práticos são claros e mensuráveis
- [ ] Metodologia ativa está alinhada ao tema e público
- [ ] Dinâmicas têm regras, tempo e materiais definidos
- [ ] Lista de materiais está completa e verificada
- [ ] Roteiro permite flexibilidade para ajustes em tempo real
- [ ] Avaliação prática é integrada às atividades
- [ ] Plano de facilitação inclui perguntas-gatilho e intervenções
- [ ] Espaço e logística foram considerados

## Limitações

- Não substitui treinamento estruturado de longo prazo (usar `@treinamentos`)
- Não produz materiais de documentação extensos (usar `@doc-writer`)
- Não gerencia plataformas virtuais de workshop
- Não avalia impacto de longo prazo (usar KPIs de `@treinamentos`)
- Não conduz sessões de coaching individual

## Casos de Uso

- Oficina de prototipagem rápida com design thinking
- Workshop de resolução de problemas em equipe
- Sessão prática de code review colaborativo
- Treinamento prático de novas ferramentas
- Dinâmica de integração para novas equipes

## Casos onde NÃO utilizar

- Para projetar programa de treinamento completo (usar `@treinamentos`)
- Para criar documentação técnica (usar `@doc-writer`)
- Para automatizar processos (usar `@n8n`)

## Exemplos

### Exemplo 1: Oficina de design thinking

**Entrada:**
```
Oficina de 4 horas para equipe de produto
Tema: Redesenhar a experiência de checkout
Participantes: 12 pessoas (devs, design, negócio)
```

**Saída Esperada:**
```markdown
## Oficina: Redesign do Checkout

### Objetivos Práticos
- Mapear dores atuais do checkout em 15 minutos
- Gerar ao menos 30 ideias em brainstorming
- Prototipar 2 soluções com papel e caneta
- Testar com 3 usuários simulados

### Metodologias
- Mapa de Empatia (20 min)
- Brainwriting 6-3-5 (25 min)
- Crazy 8s (15 min)
- Prototipagem low-fi (40 min)
- Teste com usuário simulado (30 min)

### Materiais
- Post-its (3 cores), flipchart, canetas marcatexto
- Timer visível, folhas A3, fita adesiva
- Celular para registro fotográfico

### Avaliação Prática
- Cada equipe apresenta protótipo (3 min)
- Feedback estruturado com método +-
- Satisfação do participante (NPS ao final)
```

### Exemplo 2: Roteiro de facilitação

**Entrada:**
```
Criar roteiro do facilitador para oficina de 2 horas
Tema: Comunicação eficiva em squads remotos
```

**Saída Esperada:**
```markdown
## Roteiro do Facilitador

### Preparação (antes)
- Verificar links de videochamada e permissões
- Preparar murais digitais (Miro ou Mural)
- Testar compartilhamento de tela
- Ter backup de atividade offline

### Momento 1 - Abertura (10 min)
- Boas-vindas e apresentação do objetivo
- Regras de convivência (1 min silêncio para escrever)
- Pergunta-gatilho: "Qual é o maior obstáculo na comunicação remota?"

### Momento 2 - Diagnóstico (20 min)
- Dinâmica: "Post-it da Dor" (5 min individual, 10 min agrupamento)
- Intervenção: sintetizar padrões encontrados

### Momento 3 - Construção (40 min)
- Estudo de caso: cenário real da empresa
- Trabalho em trios: solução em 30 min
- Intervenção: circular e fazer perguntas provocativas

### Momento 4 - Prototipagem (30 min)
- Cada trio cria um "protocolo de comunicação"
- Teste com scenario walkthrough

### Momento 5 - Encerramento (20 min)
- Apresentação dos protocolos
- Votação para priorizar 1 para implementar
- Compromissos individuais (1 frase cada)
```
