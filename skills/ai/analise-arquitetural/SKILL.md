---
name: analise-arquitetural
description: "Use for AI-assisted codebase analysis: code smells, patterns, dependencies, complexity. Use ONLY for architecture review, not debugging."
---

# Analise Arquitetural com IA

Realizar analises estruturais de codebases usando IA para detectar
code smells, sugerir padrões, avaliar dependências e medir complexidade.

## Objetivo

Fornecer analises arquiteturais automatizadas que identifiquem
problemas estruturais e sugiram melhorias baseadas em boas praticas.

## Fluxo de Trabalho

1. Mapear a estrutura do projeto (diretórios, módulos, camadas)
2. Identificar o padrão arquitetural utilizado (MVC, Clean, Hexagonal, etc.)
3. Analisar dependências entre módulos e camadas
4. Detectar code smells (funções longas, acoplamento alto, responsabilidades misturadas)
5. Avaliar métricas de complexidade (ciclomática, cognitiva)
6. Verificar violações de arquitetura (dependências circulares, camadas inadequadas)
7. Sugerir padrões de projeto aplicáveis
8. Priorizar refactorings por impacto e esforço
9. Gerar relatório com achados e recomendacoes
10. Validar melhorias com testes existentes

## Critérios de Qualidade

- [ ] Analise cobre estrutura, dependências e complexidade
- [ ] Code smells identificados com localizacao exata (arquivo:linha)
- [ ] Sugestoes de padros sao contextualizadas para o projeto
- [ ] Métricas de complexidade sao apresentadas numericamente
- [ ] Relatório prioriza itens por impacto
- [ ] Recomendacoes incluem esforço estimado
- [ ] Analise respeita o contexto e dominio do projeto

## Limitações

- Não executa refactorings automaticamente (usar `@refactor`)
- Não substitui revisao humana de arquitetura
- Não analisa performance em runtime (usar `@debug` com profiling)
- Não faz migracao de arquitetura completa

## Casos de Uso

- Avaliar maturidade arquitetural de um projeto legado
- Identificar code smells antes de sprints de refatoracao
- Sugerir padroes para novos modulos
- Detectar dependências circulares e violações de camadas
- Medir complexidade de funcoes criticas
- Preparar codebase para escalabilidade

## Casos onde NAO utilizar

- Para bugs especificos ou erros em runtime (usar `@debug`)
- Para revisao de estilo ou formatacao (usar linter)
- Para analise de seguranca (usar `@security-audit`)
- Para testes de performance (usar profiling direto)

## Exemplos

### Exemplo 1: Detecção de Code Smell

**Entrada:**
```
Analizar src/services/ para code smells
```

**Saida Esperada:**
```
Encontrados 3 code smells em src/services/:

1. userService.ts:45 - Funcao processarPedido (47 linhas)
   Tipo: Funcao Longa
   Impacto: Alto
   Recomendacao: Extrair logica em funcoes menores

2. orderService.ts:23 - Dependencia circular com paymentService
   Tipo: Acoplamento Circular
   Impacto: Critico
   Recomendacao: Criar interface ou usar injecao de dependencia

3. notifyService.ts:12 - 5 responsabilidades na mesma classe
   Tipo: Responsabilidades Multiplas
   Impacto: Medio
   Recomendacao: Separar em servicos especializados
```

### Exemplo 2: Analise de Arquitetura

**Entrada:**
```
Avaliar se o projeto segue Clean Architecture
```

**Saida Esperada:**
```
Avaliacao Clean Architecture:

Camadas identificadas:
  domain/      OK - Entidades e casos de uso independentes
  application/ OK - Servicos de orchestracao
  infrastructure/ VIOLACAO - Acesso direto a banco na camada de dominio

Violacoes encontradas:
  - domain/user.ts:15 importa prisma (infraestrutura)
  - domain/order.ts:30 depende de axios (framework)

Score: 6/10 - Necessita ajustes nas dependencias
```
