---
name: test-generation
description: "Use when generating unit, integration, or E2E tests for code. Use ONLY when the task is about test creation, not review."
---

# Test Generation

Gera testes unitários, de integração e E2E para código existente,
seguindo padrões do projeto e maximizando cobertura de testes.

## Objetivo

Criar testes que validem o comportamento do código, incluindo casos
normais, edge cases e cenários negativos.

## Fluxo de Trabalho

1. Analisar código para identificar casos de teste
2. Identificar edge cases e cenários negativos
3. Selecionar framework de testes do projeto
4. Criar testes unitários com断言 claras
5. Criar mocks e stubs quando necessário
6. Criar testes de integração quando aplicável
7. Validar que testes passam

## Critérios de Qualidade

- [ ] Testes cobrem casos normais
- [ ] Testes cobrem edge cases
- [ ] Testes cobrem cenários negativos
- [ ]断言 são claras e específicas
- [ ] Testes são independentes entre si
- [ ] Testes são rápidos para executar
- [ ] Mocks são usados apenas quando necessário
- [ ] Nomes de testes descrevem o cenário

## Limitações

- Não revisa código existente (usar `@code-review`)
- Não define estratégia de testes (usar `@test-strategy`)
- Não testa performance (usar `@performance`)
- Não testa manualmente — apenas testes automatizados
- Não depende de plugins ou MCP servers

## Casos de Uso

- Adicionar testes para nova funcionalidade
- Criar teste que reproduz bug encontrado
- Aumentar cobertura de testes
- Preparar código para refatoração

## Casos onde NÃO utilizar

- Quando o objetivo é revisar código (usar `@code-review`)
- Quando o objetivo é definir estratégia (usar `@test-strategy`)
- Quando o objetivo é testar performance (usar `@performance`)
- Quando o objetivo é testar manualmente

## Exemplos

### Exemplo 1: Teste unitário para função

**Entrada:**
```python
def calculate_discount(price: float, discount_percent: float) -> float:
    if discount_percent < 0 or discount_percent > 100:
        raise ValueError("Discount must be between 0 and 100")
    return price * (1 - discount_percent / 100)
```

**Saída Esperada:**
```python
def test_calculate_discount():
    # Caso normal
    assert calculate_discount(100, 10) == 90.0
    assert calculate_discount(200, 50) == 100.0
    
    # Edge cases
    assert calculate_discount(100, 0) == 100.0
    assert calculate_discount(100, 100) == 0.0
    
    # Cenário negativo
    with pytest.raises(ValueError):
        calculate_discount(100, -10)
    with pytest.raises(ValueError):
        calculate_discount(100, 110)
```

### Exemplo 2: Teste para exceção

**Entrada:**
```python
def divide(a: float, b: float) -> float:
    if b == 0:
        raise ZeroDivisionError("Cannot divide by zero")
    return a / b
```

**Saída Esperada:**
```python
def test_divide():
    assert divide(10, 2) == 5.0
    assert divide(7, 2) == 3.5
    
    with pytest.raises(ZeroDivisionError):
        divide(10, 0)
```
