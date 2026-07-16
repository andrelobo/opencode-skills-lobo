---
name: ead
description: "Use when designing distance education (EAD) content, LMS, or MOOCs. Use ONLY when the task is about EAD, not classroom teaching."
---

# Educacao a Distancia (EAD)

Planeja, cria e evalua conteudos e estrategias para ensino a
distancia, incluindo plataformas LMS, MOOCs e design instrucional.

## Objetivo

Produzir materiais, atividades e estrategias eficazes para ambientes
de aprendizagem online, maximizando engajamento e retencao de
conhecimento.

## Fluxo de Trabalho

1. Analisar requisitos do curso ou conteudo EAD
2. Definir publico-alvo e perfil do estudante
3. Selecionar plataforma LMS ou formato adequado
4. Estruturar trilha de aprendizagem com objetivos claros
5. Criar conteudo em formatos adequados (video, texto, interativo)
6. Projetar atividades de sincronia e/ou assincronia
7. Implementar estrategias de engajamento e motivacao
8. Configurar avaliacoes e feedback no ambiente online
9. Revisar e validar experiencia do estudante
10. Monitorar metricas e iterar com base em dados

## Critérios de Qualidade

- [ ] Objetivos de aprendizagem estao claros e mensuraveis
- [ ] Conteudo esta organizado em modulos logicos
- [ ] Formatos sao acessiveis e responsivos
- [ ] Atividades promovem interacao e participacao
- [ ] Sincronia e assincronia estao balanceadas conforme necessidade
- [ ] Feedback e automatizado ou previsivel
- [ ] Navegacao na plataforma e intuitiva
- [ ] Metricas de engajamento sao monitoradas
- [ ] Recursos multimedia sao otimizados para bandwidth
- [ ] Acessibilidade (WCAG) e considerada

## Limitacoes

- Nao configura servidores ou infraestrutura de hosting
- Nao desenvolve codigo de plataformas LMS customizadas
- Nao gerencia licencas ou aspectos financeiros de cursos
- Nao substitui consultoria juridica sobre certificacao
- Depende de plataformas existentes para implementacao

## Casos de Uso

- Criar curso online do zero (MOOC ou fechado)
- Migrar conteudo presencial para formato EAD
- Melhorar engajamento em curso existente
- Projetar atividades assincronas de colaboracao
- Configurar trilhas de aprendizagem no LMS
- Avaliar eficacia de materiais educacionais online

## Casos onde NAO utilizar

- Para avaliacoes de aprendizagem (usar `@avaliacoes`)
- Para treinamento presencial corporativo (usar `@treinamentos`)
- Para oficinas praticas presenciais (usar `@oficinas`)
- Para palestras ou apresentacoes ao vivo (usar `@palestras`)

## Exemplos

### Exemplo 1: Estruturar modulo de curso EAD

**Entrada:**
```
Criar modulo introdutorio de Python para iniciantes em EAD
```

**Saida Esperada:**
```
Modulo 1: Introducao ao Python

Objetivo: Compreender fundamentos da linguagem Python

Aulas Sincronas (ao vivo):
- Aula 1.1: Variaveis e tipos (60min, ao vivo com exercicios)
- Aula 1.2: Controle de fluxo (60min, ao vivo com live coding)

Atividades Assincronas:
- Video aula 1.3: Funcoes e escopo (15min + quiz)
- Leitura 1.4: Documentacao oficial (30min)
- Exercicio pratico 1.5: 5 exercicios no Replit (autoavaliacao)
- Forum 1.6: Compartilhe seu primeiro projeto

Avaliacao:
- Quiz autoavaliado (10 questoes, nota minima 70%)
- Mini-projeto pratico (entregavel, correcao por pares)

Engajamento:
- Gamificacao: badges por conclusao
- Ranking semanal de participacao
- Mentoria em grupo no Discord
```

### Exemplo 2: Estrategia de engajamento EAD

**Entrada:**
```
Taxa de conclusao do curso e de apenas 25%. Propor melhorias.
```

**Saida Esperada:**
```
Estrategias para aumentar retencao:

1. Microlearning:
   - Dividir aulas longas em blocos de 10-15 minutos
   - Adicionar checkpoint a cada bloco

2. Social Learning:
   - Grupos de estudo semanais (sincrono)
   - Peer review de atividades

3. Feedback Imediato:
   - Quizzes com explicacao da resposta
   - Exercicios com testes automaticos

4. Notificacoes:
   - Lembretes por email a cada 3 dias de inatividade
   - Progresso visivel no dashboard

5. Flexibilidade:
   - Prazos extensivos com grace period
   - Multiplas tentativas em avaliacoes
   - Acesso mobile otimizado
```
