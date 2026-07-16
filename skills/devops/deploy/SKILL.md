---
name: deploy
description: "Use when deploying apps to production (Vercel, AWS, etc). Use ONLY when the task is about deployment, not CI/CD pipelines."
---

# Deploy

Realizar deploy de aplicações em ambientes de produção, incluindo
configuração de plataformas e variáveis de ambiente.

## Objetivo

Deployer aplicações de forma segura e confiável em produção.

## Fluxo de Trabalho

1. Selecionar plataforma de deploy
2. Configurar variáveis de ambiente
3. Configurar domínio e SSL
4. Implementar health checks
5. Configurar monitoring
6. Implementar rollback

## Critérios de Qualidade

- [ ] Variáveis sensíveis estão em secrets
- [ ] SSL está configurado
- [ ] Health check está funcionando
- [ ] Logs estão acessíveis
- [ ] Rollback está testado
- [ ] Monitoring está ativo

## Limitações

- Não faz CI/CD (usar `@ci-cd`)
- Não faz containerização (usar `@docker`)
- Não faz monitoramento (usar `@observabilidade`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Deploy de aplicação Node.js
- Deploy de site estático
- Configurar ambiente de staging
- Implementar blue-green deploy

## Casos onde NÃO utilizar

- Para CI/CD pipeline (usar `@ci-cd`)
- Para containerização (usar `@docker`)
- Para monitoramento (usar `@observabilidade`)

## Exemplos

### Exemplo 1: Deploy Vercel

**Entrada:**
```
Configurar deploy de Next.js na Vercel
```

**Saída Esperada:**
```json
{
  "version": 2,
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/next"
    }
  ],
  "routes": [
    {
      "src": "/api/(.*)",
      "dest": "/api/$1"
    },
    {
      "src": "/(.*)",
      "dest": "/$1"
    }
  ]
}
```

### Exemplo 2: Deploy Docker

**Entrada:**
```
Criar script de deploy com Docker
```

**Saída Esperada:**
```bash
#!/bin/bash
set -e

echo "Building image..."
docker build -t myapp:latest .

echo "Stopping old container..."
docker stop myapp || true
docker rm myapp || true

echo "Starting new container..."
docker run -d \
  --name myapp \
  -p 3000:3000 \
  --env-file .env \
  --restart unless-stopped \
  myapp:latest

echo "Deploy complete!"
```
