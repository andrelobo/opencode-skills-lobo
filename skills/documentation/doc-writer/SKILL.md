---
name: doc-writer
description: "Use when creating or updating technical docs for code, APIs, or systems. Use ONLY when the task is about documentation, not code review."
---

# Doc Writer

Cria e mantém documentação técnica clara, completa e reutilizável
para código, APIs e sistemas.

## Objetivo

Produzir documentação que facilite compreensão, uso e manutenção
do código por outros desenvolvedores.

## Fluxo de Trabalho

1. Analisar código ou sistema a ser documentado
2. Identificar público-alvo da documentação
3. Selecionar tipo de documentação adequada
4. Estruturar conteúdo de forma lógica
5. Escrever de forma clara e concisa
6. Adicionar exemplos práticos
7. Revisar e validar documentação

## Critérios de Qualidade

- [ ] Documentação é clara e concisa
- [ ] Exemplos são práticos e funcionais
- [ ] Estrutura é lógica e navegável
- [ ] Linguagem é acessível ao público
- [ ] Código é explicado quando necessário
- [ ] Referências são incluídas quando relevante
- [ ] Documentação está sincronizada com código
- [ ] Formatação é consistente

## Limitações

- Não gera changelog (usar `@changelog`)
- Não documenta skills da biblioteca
- Não escreve testes (usar `@test-generation`)
- Não documenta commits (usar `@commit-convention`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar novo módulo ou componente
- Adicionar API pública
- Fazer onboarding de novo desenvolvedor
- Quando documentação está desatualizada

## Casos onde NÃO utilizar

- Para gerar changelog (usar `@changelog`)
- Para documentar commits (usar `@commit-convention`)
- Para escrever testes (usar `@test-generation`)
- Para documentar skills (usar `@skill-creator`)

## Exemplos

### Exemplo 1: Documentar função

**Entrada:**
```python
def calculate_fibonacci(n: int) -> list[int]:
    if n <= 0:
        return []
    fib = [0, 1]
    for i in range(2, n):
        fib.append(fib[i-1] + fib[i-2])
    return fib[:n]
```

**Saída Esperada:**
```python
def calculate_fibonacci(n: int) -> list[int]:
    """Calculate first n Fibonacci numbers.
    
    Args:
        n: Number of Fibonacci numbers to generate (must be > 0)
        
    Returns:
        List of first n Fibonacci numbers
        
    Raises:
        ValueError: If n is negative
        
    Examples:
        >>> calculate_fibonacci(5)
        [0, 1, 1, 2, 3]
        >>> calculate_fibonacci(1)
        [0]
    """
    if n <= 0:
        return []
    fib = [0, 1]
    for i in range(2, n):
        fib.append(fib[i-1] + fib[i-2])
    return fib[:n]
```

### Exemplo 2: Documentar API

**Entrada:**
```
Endpoint POST /api/users
```

**Saída Esperada:**
```markdown
## POST /api/users

Create a new user.

### Request Body

```json
{
  "name": "string",
  "email": "string",
  "password": "string"
}
```

### Response

- 201: User created successfully
- 400: Invalid input
- 409: Email already exists

### Example

```bash
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{"name":"John","email":"john@example.com","password":"123456"}'
```
```
