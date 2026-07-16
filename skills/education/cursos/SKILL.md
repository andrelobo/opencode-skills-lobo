---
name: cursos
description: "Use when creating courses with modules, syllabus, and methodologies. Use ONLY when the task is about course creation, not planning."
---

# Cursos

Cria e estrutura cursos educacionais com modulos, ementa,
carga horaria e criterios de certificacao.

## Objetivo

Desenvolver cursos completos e bem organizados que atendam
a necessidades de aprendizagem de publicos definidos,
com estrutura clara e metodologia adequada.

## Fluxo de Trabalho

1. Definir publico-alvo e pre-requisitos
2. Estabelecer objetivos gerais e especificos do curso
3. Estruturar modulos e aulas sequenciadas
4. Elaborar ementa detalhada por modulo
5. Definir carga horaria total e por modulo
6. Selecionar metodologias de ensino
7. Listar materiais e recursos necessarios
8. Estabelecer criterios de avaliacao e certificacao
9. Revisar coerencia e completude do curso

## Critérios de Qualidade

- [ ] Publico-alvo esta claramente definido
- [ ] Objetivos sao attehiveis e mensuraveis
- [ ] Modulos estao sequenciados logicamente
- [ ] Ementa detalha conteudo de cada aula
- [ ] Carga horaria e realista e suficiente
- [ ] Metodologias sao adequadas ao conteudo e publico
- [ ] Materiais sao acessaveis e atualizados
- [ ] Criterios de certificacao sao transparentes

## Limitacoes

- Nao produz materiais didaticos completos (slides, videos)
- Nao gerencia matriculas ou logistica de turmas
- Nao valida compatibilidade com normativas regulatórias
- Depende de informacoes claras sobre publico e objetivos

## Casos de Uso

- Criar curso online do zero
- Reestruturar curso existente com novos modulos
- Elaborar ementa para programa de ensino
- Definir carga horaria e cronograma de curso
- Planejar certificacao profissional
- Adaptar curso para novo publico-alvo

## Casos onde NAO utilizar

- Para planejar aulas isoladas (usar `@planejamento`)
- Para produzir conteudo visual de slides (usar ferramentas de design)
- Para gerenciar plataforma LMS (usar ferramentas especificas)
- Para criar evaluacoes com gabarito (usar ferramentas de avaliacao)

## Exemplos

### Exemplo 1: Curso Online

**Entrada:** Tema: Python para Iniciantes | Publico: Profissionais de outras areas | 20h

**Saida:**
```markdown
# Curso: Python para Iniciantes
## Publico-alvo
Profissionais de areas nao-ti que desejam aprender programacao.
## Objetivo Geral
Desenvolver scripts basicos em Python para automacao de tarefas.
## Modulos
### Modulo 1 - Introducao (4h)
- O que e Python, instalacao do ambiente
- Primeiro programa, variaveis e tipos de dados
### Modulo 2 - Estruturas de Controle (4h)
- Condicionais (if/else), lacos (for, while), funcoes basicas
### Modulo 3 - Dados e Arquivos (6h)
- Listas, dicionarios, leitura/escrita de CSV
### Modulo 4 - Projeto Pratico (6h)
- Definicao do problema, desenvolvimento passo a passo
## Metodologia
Aulas praticas com exercicios progressivos.
## Certificacao
Certificado de conclusao com nota minima 7/10.
```

### Exemplo 2: Curso Presencial

**Entrada:** Tema: Marketing Digital | Publico: Empreendedores locais | 30h presenciais

**Saida:**
```markdown
# Curso: Marketing Digital para Empreendedores
## Modulos
### Modulo 1 - Fundamentos (6h)
- Conceitos basicos, customer journey e buyer persona
### Modulo 2 - Presenca Online (8h)
- Criacao de site/blog, SEO, redes sociais estrategicas
### Modulo 3 - Conteudo e Inbound (8h)
- Planejamento de conteudo, email marketing, automacao basica
### Modulo 4 - Metricas e Analise (8h)
- Google Analytics, KPIs essenciais, tomada de decisao
## Materiais
- Apostila impressa, acesso a plataforma de exercicios
## Certificacao
Certificado com carga horaria validada.
Avaliacao: projeto final aplicado ao proprio negocio.
```
