---
name: oauth
description: "Use when implementing OAuth 2.0 with providers like Google or GitHub. Use ONLY when the task is about OAuth, not JWT or basic auth."
---

# OAuth

Implementar autenticação com OAuth 2.0, incluindo integração com
providers como Google, GitHub e servidores de autorização custom.

## Objetivo

Implementar autenticação segura e delegada usando OAuth 2.0.

## Fluxo de Trabalho

1. Selecionar flow apropriado
2. Configurar client credentials
3. Implementar redirect flow
4. Trocar code por token
5. Refresh token
6. Revogar tokens

## Critérios de Qualidade

- [ ] Flow é adequado ao caso de uso
- [ ] State é usado para CSRF
- [ ] Tokens são armazenados com segurança
- [ ] Refresh tokens estão implementados
- [ ] Scopes são mínimos necessários
- [ ] Errors são tratados adequadamente

## Limitações

- Não faz JWT (usar `@jwt`)
- Não faz autenticação básica
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Login com Google/GitHub
- SSO corporativo
- APIs públicas
- Integrações third-party

## Casos onde NÃO utilizar

- Para auth simples (usar `@jwt`)
- Para sessões internas
- Para APIs sem UI

## Exemplos

### Exemplo 1: Authorization Code Flow

**Entrada:**
```
Implementar OAuth com Google
```

**Saída Esperada:**
```javascript
// Redirect to Google
const authUrl = `https://accounts.google.com/o/oauth2/v2/auth?` +
  `client_id=${CLIENT_ID}&` +
  `redirect_uri=${REDIRECT_URI}&` +
  `response_type=code&` +
  `scope=openid email profile&` +
  `state=${randomState}`;

// Exchange code for tokens
async function exchangeCode(code) {
  const response = await fetch('https://oauth2.googleapis.com/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      code,
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      redirect_uri: REDIRECT_URI,
      grant_type: 'authorization_code'
    })
  });
  
  return response.json();
}
```

### Exemplo 2: Validar token

**Entrada:**
```
Validar token de Google
```

**Saída Esperada:**
```javascript
async function validateGoogleToken(token) {
  const response = await fetch(
    `https://oauth2.googleapis.com/tokeninfo?access_token=${token}`
  );
  
  if (!response.ok) {
    throw new Error('Invalid token');
  }
  
  const payload = await response.json();
  
  if (payload.aud !== CLIENT_ID) {
    throw new Error('Invalid audience');
  }
  
  return payload;
}
```
