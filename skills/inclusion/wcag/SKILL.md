---
name: wcag
description: "Use when working with WCAG including POUR principles and testing. Use ONLY when the task is about WCAG standards, not general accessibility."
---

# WCAG

Suporte para implementacao, avaliacao e documentacao de conformidade
com as Web Content Accessibility Guidelines (WCAG), incluindo
principios POUR, niveis A, AA e AAA, e testes tecnicos.

## Objetivo

Garantir que conteudos web atendam aos padroes internacionais de
acessibilidade, facilitando o acesso por pessoas com deficiencia
por meio de tecnicas validadas e documentacao de conformidade.

## Fluxo de Trabalho

1. Definir nivel de conformidade desejado (A, AA ou AAA)
2. Mapear criterios tecnicos aplicaveis ao conteudo
3. Avaliar percebivel (Perceivable) - alternativas de midia
4. Avaliar operavel (Operable) - navegacao por teclado e tempo
5. Avaliar compreensivel (Understandable) - linguagem clara
6. Avaliar robusto (Robust) - compatibilidade com AT
7. Testar com ferramentas automatizadas e manuais
8. Documentar resultados e plano de correcao

## Critérios de Qualidade

- [ ] Todas as imagens possuem texto alternativo adequado
- [ ] Conteudo e navegavel inteiramente por teclado
- [ ] Contraste atende ao nivel minimo (4.5:1 para texto normal)
- [ ] Legendas e transcricoes estao disponiveis para midia
- [ ] Estrutura utiliza headings hierarquicos corretamente
- [ ] Formularios possuem labels associados e mensagens de erro
- [ ] Foco visual e visivel e segue ordem logica
- [ ] Compatibilidade com leitores de tela e AT validada

## Limitacoes

- Nao substitui avaliacao humana especializada
- Nao cobre todos os criterios sem auditoria completa
- Nao garante acessibilidade total em todos os dispositivos
- Nao resolve problemas de acessibilidade nao-web (usar `@acessibilidade`)
- Nao e norma legal brasileira (a LBI e o Decreto 5296 sao)

## Casos de Uso

- Auditar pagina web para conformidade WCAG 2.1
- Corrigir violacoes de acessibilidade em formulários
- Documentar nivel de conformidade de sistema web
- Implementar alternativas de midia para conteudo audio/video
- Revisar codigo HTML/ARIA para criterios tecnicos
- Criar relatorio de conformidade para certificacao

## Casos onde NAO utilizar

- Para acessibilidade urbana ou arquitetonica (usar `@acessibilidade`)
- Para inclusao digital ou alfabetizacao (usar `@inclusao-digital`)
- Para Libras ou comunicacao com surdos (usar `@libras`)
- Para testes de performance ou seguranca web (usar `@test-generation`)

## Exemplos

### Exemplo 1: Avaliar imagem sem alternativa

**Entrada:**
```html
<img src="grafico-vendas.png">
```

**Saida Esperada:**
```html
<img src="grafico-vendas.png"
     alt="Grafico de barras mostrando crescimento de vendas de 15% no Q1 2024.
          Janeiro: R$ 50k, Fevereiro: R$ 55k, Marco: R$ 58k">
```
Criterio WCAG: 1.1.1 Conteudo nao-textual (Nivel A)

### Exemplo 2: Testar contraste de cores

**Entrada:**
```
Texto: #999999 sobre fundo #FFFFFF
Tamanho: 14px regular
```

**Saida Esperada:**
```
Contraste atual: 2.85:1 (FALHA)
Nivel AA exige: 4.5:1 para texto normal
Correcao sugerida: Alterar texto para #767676 (contraste 4.54:1)
ou #595959 (contraste 7.0:1 para nivel AAA)
Criterio WCAG: 1.4.3 Contraste (Minimo) (Nivel AA)
```
