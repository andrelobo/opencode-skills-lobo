---
name: planejamento
description: "Use when creating pedagogical plans, lesson plans, and teaching strategies. Use ONLY when the task is about educational planning, not course creation."
---

# Planejamento Pedagogico

Desenvolve e estrutura planejamentos educacionais completos,
alinhados a diretrizes curriculares e metodologias eficazes.

## Objetivo

Produzir planejamentos pedagogicos que definam objetivos claros,
estrategias de ensino adequadas e instrumentos de avaliacao
coerentes com o contexto educacional pretendido.

## Fluxo de Trabalho

1. Identificar nivel educacional e disciplina
2. Definir objetivos de aprendizagem (Bloom ou similar)
3. Mapear competencias e habilidades da BNCC quando aplicavel
4. Selecionar estrategias de ensino adequadas
5. Elaborar cronograma com sequencia logica
6. Estruturar atividades e recursos didaticos
7. Definir criterios e instrumentos de avaliacao
8. Revisar coerencia entre objetivos, atividades e avaliacao

## Critérios de Qualidade

- [ ] Objetivos sao claros, mensuraveis e attehiveis
- [ ] Estrategias sao adequadas ao publico e conteudo
- [ ] Cronograma respeita carga horaria disponivel
- [ ] Avaliacao esta alinhada aos objetivos de aprendizagem
- [ ] Atividades promovem engagemento ativo
- [ ] Recursos sao acessiveis e pertinentes
- [ ] Conteudo esta sequenciado logicamente
- [ ] BNCC e contemplada quando exigido

## Limitacoes

- Nao executa planejamento para ensino superior sem contexto especifico
- Nao substitui avaliacao diagnostica do educador
- Nao gera materiais didaticos completos (usar ferramentas auxiliares)
- Nao valida compatibilidade com sistemas de ensino especificos
- Depende de informacoes claras sobre publico e disciplina

## Casos de Uso

- Criar plano de aula para disciplina especifica
- Elaborar sequencia didatica para tema complexo
- Alinhar conteudo a competencias da BNCC
- Estruturar atividades de Aprendizagem Baseada em Problemas
- Revisar cronograma semestral ou anual
- Planejar transicao entre niveis de ensino

## Casos onde NAO utilizar

- Para criar curso completo (usar `@cursos`)
- Para escrever conteudo de aula (usar ferramentas de redacao)
- Para gerar avaliacoes com gabarito (usar ferramentas especificas)
- Para planejar treinamento corporativo sem contexto pedagogico

## Exemplos

### Exemplo 1: Plano de Aula

**Entrada:**
Disciplina: Matematica - Nivel Medio
Tema: Equacoes do 2 grau
Carga horaria: 2 aulas de 50 min

**Saida Esperada:**
```
# Plano de Aula: Equacoes do 2 Grau

## Objetivo
Resolver equacoes do 2 grau aplicando formula de Bhaskara.

## Competencias (BNCC)
- Utilizar processos algbricos para resolucao de problemas
- Interpretar resultados em contexto

## Estrategia
Aula expositiva dialogada com exercicios praticos.

## Atividades
1. Revisao de fatoracao (10 min)
2. Apresentacao da formula (15 min)
3. Exercicios guiados (20 min)
4. Resolucao de problema contextualizado (15 min)

## Avaliacao
Lista de exercicios com 5 problemas progressivos.
```

### Exemplo 2: Sequencia Didatica

**Entrada:**
Tema: Revolucao Francesa - Historia
Publico: Ensino Fundamental II
Duracao: 4 aulas

**Saida Esperada:**
```
# Sequencia Didatica: Revolucao Francesa

## Aula 1 - Causas e Contexto
- Mapa conceitual colaborativo
- Leitura de trechos historicos

## Aula 2 - Fases da Revolucao
- Linha do tempo interativa
- Debate sobre direitos humanos

## Aula 3 - Consequencias
- Analise de documentos epoca
- Simulacao de assembleia

## Aula 4 - Legado e Avaliacao
- producao de texto argumentativo
- Avaliacao formativa
```
