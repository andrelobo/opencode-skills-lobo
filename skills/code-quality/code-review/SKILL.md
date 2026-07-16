---
name: code-review
description: "Use when reviewing code for quality, style, complexity, and maintainability. Use ONLY when the task is about code review, not tests."
---

# Code Review

Revisa código para problemas de qualidade, estilo, complexidade e
manutenibilidade. Deve ser ativada antes de commits e PRs para
garantir código limpo e consistente.

## Objetivo

Identificar e reportar problemas de qualidade em código, sugerindo
melhorias concretas e acionáveis que aumentem legibilidade e
manutenibilidade.

## Fluxo de Trabalho

1. Ler o código fornecido
2. Verificar estilo e convenções do projeto
3. Identificar funções complexas demais
4. Verificar nomes descritivos
5. Detectar código duplicado
6. Identificar magic numbers
7. Verificar tratamento de erros
8. Gerar relatório com sugestões específicas

## Critérios de Qualidade

- [ ] Código segue convenções do projeto
- [ ] Funções têm responsabilidade única
- [ ] Não há código morto ou não utilizado
- [ ] Variáveis e funções têm nomes descritivos
- [ ] Não há magic numbers
- [ ] Tratamento de erros é adequado
- [ ] Não há código duplicado significativo
- [ ] Complexidade ciclomática é razoável

## Limitações

- Não executa código — apenas analisa
- Não acessa sistemas externos
- Não depende de plugins ou MCP servers
- Não gera testes (usar `@test-generation`)
- Não escreve documentação (usar `@doc-writer`)

## Casos de Uso

- Revisar PR antes de merge
- Validar código após refatoração
- Auditar código legado para modernização
- Onboarding em projeto novo

## Casos onde NÃO utilizar

- Quando o objetivo é gerar testes (usar `@test-generation`)
- Quando o objetivo é documentar código (usar `@doc-writer`)
- Quando o objetivo é auditar segurança (usar `@security-audit`)
- Quando o objetivo é otimizar performance (usar `@performance`)

## Exemplos

### Exemplo 1: Função com problemas

**Entrada:**
```python
def calc(x, y, z):
    return x * y * z / 100
```

**Saída Esperada:**
- Função `calc` não tem nome descritivo
- Parâmetros `x`, `y`, `z` são genéricos
- Magic number `100`
- Sugestão: `calculate_percentage(quantity, price, tax_rate)`

### Exemplo 2: Função bem escrita

**Entrada:**
```python
def calculate_total_price(quantity: int, unit_price: float) -> float:
    tax_rate = 0.1
    subtotal = quantity * unit_price
    tax = subtotal * tax_rate
    return subtotal + tax
```

**Saída Esperada:**
- [OK] Nome descritivo
- [OK] Parâmetros tipados
- [OK] Lógica clara
- [OK] Sem magic numbers (tax_rate é uma constante nomeada)
