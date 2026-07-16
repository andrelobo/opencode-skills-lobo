---
name: refactor
description: "Use when refactoring code to improve structure without changing behavior. Use ONLY when the task is about code restructuring, not review."
---

# Refactor

Identifica e aplica oportunidades de refatoração, melhorando a
estrutura do código sem alterar seu comportamento externo.

## Objetivo

Melhorar a estrutura do código eliminando code smells, aplicando
padrões de design e simplificando lógica complexa.

## Fluxo de Trabalho

1. Identificar code smells no código
2. Sugerir padrões de design aplicáveis
3. Extrair funções/métodos quando apropriado
4. Simplificar condicionais complexos
5. Eliminar duplicação
6. Melhorar nomes de variáveis e funções
7. Aplicar mudanças preservando comportamento

## Critérios de Qualidade

- [ ] Comportamento externo não muda
- [ ] Code smells são identificados
- [ ] Padrões de design são sugeridos quando aplicável
- [ ] Funções extraídas têm responsabilidade única
- [ ] Condicional são simplificados
- [ ] Duplicação é eliminada
- [ ] Nomes são descritivos
- [ ] Código resultante é mais legível

## Limitações

- Não altera comportamento do código
- Não revisa código superficialmente (usar `@code-review`)
- Não escreve testes (usar `@test-generation`)
- Não depende de plugins ou MCP servers
- Não deve ser aplicada em emergências (bug fixes)

## Casos de Uso

- Após code-review que identifica problemas estruturais
- Ao modernizar código legado
- Ao preparar código para novas features
- Quando complexidade ciclomática está alta

## Casos onde NÃO utilizar

- Para revisão superficial (usar `@code-review`)
- Para alterar comportamento do código
- Para escrever testes (usar `@test-generation`)
- Para bug fixes urgentes (refatoração requer calma)

## Exemplos

### Exemplo 1: Extrair função

**Entrada:**
```python
def process_order(order):
    total = 0
    for item in order['items']:
        total += item['price'] * item['quantity']
    if order['discount']:
        total *= (1 - order['discount'])
    tax = total * 0.1
    total += tax
    return total
```

**Saída Esperada:**
```python
def calculate_subtotal(items):
    return sum(item['price'] * item['quantity'] for item in items)

def apply_discount(total, discount):
    if discount:
        return total * (1 - discount)
    return total

def calculate_tax(total, tax_rate=0.1):
    return total * tax_rate

def process_order(order):
    subtotal = calculate_subtotal(order['items'])
    after_discount = apply_discount(subtotal, order['discount'])
    tax = calculate_tax(after_discount)
    return after_discount + tax
```

### Exemplo 2: Simplificar condicional

**Entrada:**
```python
def get_discount(user):
    if user['is_premium']:
        if user['years'] > 5:
            return 0.3
        elif user['years'] > 2:
            return 0.2
        else:
            return 0.1
    else:
        if user['years'] > 3:
            return 0.1
        else:
            return 0
```

**Saída Esperada:**
```python
def get_discount(user):
    if user['is_premium']:
        return 0.3 if user['years'] > 5 else 0.2 if user['years'] > 2 else 0.1
    return 0.1 if user['years'] > 3 else 0
```
