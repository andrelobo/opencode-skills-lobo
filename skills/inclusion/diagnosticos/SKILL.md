---
name: diagnosticos
description: "Use when performing accessibility diagnostics or compliance analysis. Use ONLY when the task is about inclusion diagnostics, not indicators."
---

# Diagnósticos de Inclusão

Realiza diagnósticos completos de acessibilidade e inclusão,
identificando barreiras, mapeando necessidades e gerando
relatórios de conformidade.

## Objetivo

Produzir diagnósticos que revelem barreiras de acessibilidade e
inclusão, orientando decisões de projeto e desenvolvimento.

## Fluxo de Trabalho

1. Definir escopo e objeto do diagnóstico
2. Identificar normas e padrões aplicáveis (WCAG, EN 301 549, etc.)
3. Realizar levantamento de barreiras existentes
4. Mapear necessidades dos usuários-alvo
5. Analisar conformidade com critérios de acessibilidade
6. Classificar achados por severidade e impacto
7. Gerar relatório de diagnóstico com achados
8. Priorizar recomendações de remoção de barreiras

## Critérios de Qualidade

- [ ] Escopo do diagnóstico está claro e delimitado
- [ ] Normas aplicáveis são identificadas corretamente
- [ ] Barreiras são classificadas por severidade
- [ ] Necessidades dos usuários são mapeadas
- [ ] Conformidade é avaliada contra critérios objetivos
- [ ] Relatório é estruturado e compreensível
- [ ] Recomendações são acionáveis e priorizadas
- [ ] Dados são coletados de forma sistemática

## Limitações

- Não substitui teste com usuários reais
- Não gera indicadores de acompanhamento (usar `@indicadores`)
- Não conduz pesquisas primárias (usar `@pesquisas`)
- Não implementa correções automaticamente
- Não avalia conformidade jurídica ou regulatória

## Casos de Uso

- Diagnóstico de acessibilidade de site ou aplicativo
- Levantamento de barreiras em espaço físico ou digital
- Mapeamento de necessidades de grupo específico
- Análise de conformidade antes de lançamento
- Relatório de diagnóstico para stakeholders

## Casos onde NÃO utilizar

- Para criar métricas ou KPIs (usar `@indicadores`)
- Para conduzir pesquisas com usuários (usar `@pesquisas`)
- Para auditar segurança (usar `@security-audit`)
- Para revisar código (usar `@code-review`)

## Exemplos

### Exemplo 1: Diagnóstico de acessibilidade web

**Entrada:**
Analise a acessibilidade da página de login.

**Saída Esperada:**
```markdown
## Diagnóstico de Acessibilidade - Página de Login

### Barreiras Identificadas
1. **Crítica**: Input de senha sem label associado (WCAG 1.3.1)
2. **Alta**: Contraste insuficiente no texto de erro (WCAG 1.4.3)
3. **Média**: Botão de mostrar senha sem estado acessível

### Conformidade
- Nível A: 3 de 5 critérios atendidos
- Nível AA: 2 de 4 critérios atendidos

### Recomendações Priorizadas
1. Adicionar label aria-label ao input de senha
2. Aumentar contraste do texto de erro para 4.5:1
3. Implementar aria-pressed no botão de mostrar senha
```

### Exemplo 2: Mapeamento de necessidades

**Entrada:**
Mapeie necessidades de acessibilidade para usuários de leitor de tela.

**Saída Esperada:**
```markdown
## Mapeamento de Necessidades - Leitores de Tela

### Necessidades Críticas
- Todas as imagens devem ter texto alternativo
- Navegação deve ser possível apenas por teclado
- Campos de formulário devém ter labels associados
- Feedback de erros deve ser anunciado por aria-live

### Necessidades Importantes
- Estrutura semântica com headings hierárquicos
- Links com texto descritivo ou aria-label
- Modais com foco gerenciado adequadamente
```
