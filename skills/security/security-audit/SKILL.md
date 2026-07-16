---
name: security-audit
description: "Use when auditing code for vulnerabilities: injection, XSS, CSRF, auth. Use ONLY when the task is about security audit, not code review."
---

# Security Audit

Audita código para vulnerabilidades de segurança, incluindo injection
flaws, XSS, CSRF, autenticação inadequada e exposta de dados sensíveis.

## Objetivo

Identificar e reportar vulnerabilidades de segurança no código,
sugerindo remediações específicas.

## Fluxo de Trabalho

1. Identificar vulnerabilidades OWASP Top 10
2. Verificar tratamento de dados sensíveis
3. Verificar autenticação e autorização
4. Verificar input validation
5. Verificar configurações inseguras
6. Gerar relatório com severidade e remediações

## Critérios de Qualidade

- [ ] Vulnerabilidades OWASP Top 10 são verificadas
- [ ] Dados sensíveis são tratados adequadamente
- [ ] Autenticação é robusta
- [ ] Input validation é implementada
- [ ] Configurações são seguras
- [ ] Remediações são específicas
- [ ] Severidade é classificada
- [ ] Relatório é claro e acionável

## Limitações

- Não audita dependências (usar `@dependency-audit`)
- Não faz code review geral (usar `@code-review`)
- Não faz pentesting (requer ferramentas especializadas)
- Não depende de plugins ou MCP servers
- Não testa infraestrutura externa

## Casos de Uso

- Antes de releases significativos
- Ao adicionar autenticação/autorização
- Ao integrar com sistemas externos
- Após relatório de vulnerabilidade

## Casos onde NÃO utilizar

- Para auditoria de dependências (usar `@dependency-audit`)
- Para code review geral (usar `@code-review`)
- Para pentesting (requer ferramentas especializadas)
- Para compliance específico (SOC2, PCI, etc.)

## Exemplos

### Exemplo 1: SQL Injection

**Entrada:**
```python
def get_user(username):
    query = f"SELECT * FROM users WHERE username = '{username}'"
    return db.execute(query)
```

**Saída Esperada:**
```
[CRÍTICO] SQL Injection
- Vulnerabilidade: Injeção SQL via parâmetro username
- Severidade: CRÍTICA
- Remediação: Usar prepared statements

def get_user(username):
    query = "SELECT * FROM users WHERE username = %s"
    return db.execute(query, (username,))
```

### Exemplo 2: XSS

**Entrada:**
```html
<div id="output"></div>
<script>
  document.getElementById('output').innerHTML = userInput;
</script>
```

**Saída Esperada:**
```
[ALTO] Cross-Site Scripting (XSS)
- Vulnerabilidade: Injeção de script via userInput
- Severidade: ALTA
- Remediação: Usar textContent ou sanitizar input

<div id="output"></div>
<script>
  document.getElementById('output').textContent = userInput;
</script>
```
