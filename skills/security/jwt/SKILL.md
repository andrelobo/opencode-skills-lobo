---
name: jwt
description: "Use when implementing JWT auth for APIs and applications. Use ONLY when the task is about JWT tokens, not OAuth or other methods."
---

# JWT

Implementar autenticação e autorização com JSON Web Tokens,
incluindo geração, validação e refresh tokens.

## Objetivo

Implementar autenticação stateless segura usando JWT.

## Fluxo de Trabalho

1. Configurar secret key
2. Implementar geração de token
3. Criar middleware de validação
4. Implementar refresh token
5. Configurar expiração
6. Implementar logout

## Critérios de Qualidade

- [ ] Secret é seguro e longo
- [ ] Tokens têm expiração curta
- [ ] Refresh tokens estão implementados
- [ ] Claims são mínimas
- [ ] Tokens são invalidados no logout
- [ ] Erros são tratados adequadamente

## Limitações

- Não faz OAuth (usar `@oauth`)
- Não faz sessões (usar Redis)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Autenticar API REST
- Gerenciar sessões de usuário
- Integrar com SPA
- Microserviços

## Casos onde NÃO utilizar

- Para OAuth/Social login (usar `@oauth`)
- Para sessões server-side (usar `@redis`)
- Para SSO (usar OAuth)

## Exemplos

### Exemplo 1: Gerar token

**Entrada:**
```
Implementar geração de JWT
```

**Saída Esperada:**
```javascript
const jwt = require('jsonwebtoken');

function generateTokens(user) {
  const accessToken = jwt.sign(
    { id: user.id, email: user.email },
    process.env.JWT_SECRET,
    { expiresIn: '15m' }
  );
  
  const refreshToken = jwt.sign(
    { id: user.id },
    process.env.JWT_REFRESH_SECRET,
    { expiresIn: '7d' }
  );
  
  return { accessToken, refreshToken };
}
```

### Exemplo 2: Middleware de validação

**Entrada:**
```
Criar middleware para verificar JWT
```

**Saída Esperada:**
```javascript
function authMiddleware(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1];
  
  if (!token) {
    return res.status(401).json({ error: 'Token required' });
  }
  
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (err) {
    if (err.name === 'TokenExpiredError') {
      return res.status(401).json({ error: 'Token expired' });
    }
    return res.status(401).json({ error: 'Invalid token' });
  }
}
```
