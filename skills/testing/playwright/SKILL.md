---
name: playwright
description: "Use when writing E2E tests with Playwright for web apps. Use ONLY when the task is about Playwright, not Puppeteer."
---

# Playwright

Escrever testes end-to-end com Playwright para aplicações web,
incluindo automação de browser e assertions.

## Objetivo

Criar testes E2E confiáveis e rápidos que simulam comportamento
real do usuário.

## Fluxo de Trabalho

1. Configurar Playwright
2. Criar testes de fluxo
3. Implementar page objects
4. Configurar fixtures
5. Gerar relatórios
6. Integrar com CI/CD

## Critérios de Qualidade

- [ ] Testes são independentes
- [ ] Selectors são estáveis
- [ ] Screenshots em erros
- [ ] Timeouts são configurados
- [ ] Fixtures são reutilizáveis
- [ ] CI/CD está integrado

## Limitações

- Não faz testes unitários (usar `@test-generation`)
- Não faz testes de API (usar `@test-generation`)
- Não faz Puppeteer (usar `@puppeteer`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Testar fluxo de checkout
- Testar login/logout
- Testar formulários complexos
- Testar responsividade

## Casos onde NÃO utilizar

- Para testes unitários (usar `@test-generation`)
- Para testes de API
- Para testes de performance

## Exemplos

### Exemplo 1: Teste básico

**Entrada:**
```
Testar login de usuário
```

**Saída Esperada:**
```javascript
import { test, expect } from '@playwright/test';

test('user can login', async ({ page }) => {
  await page.goto('/login');
  
  await page.fill('[data-testid="email"]', 'user@example.com');
  await page.fill('[data-testid="password"]', 'password123');
  await page.click('[data-testid="submit"]');
  
  await expect(page).toHaveURL('/dashboard');
  await expect(page.locator('h1')).toContainText('Welcome');
});
```

### Exemplo 2: Page Object

**Entrada:**
```
Criar page object para login
```

**Saída Esperada:**
```javascript
export class LoginPage {
  constructor(page) {
    this.page = page;
    this.emailInput = page.locator('[data-testid="email"]');
    this.passwordInput = page.locator('[data-testid="password"]');
    this.submitButton = page.locator('[data-testid="submit"]');
  }
  
  async goto() {
    await this.page.goto('/login');
  }
  
  async login(email, password) {
    await this.emailInput.fill(email);
    await this.passwordInput.fill(password);
    await this.submitButton.click();
  }
}
```
