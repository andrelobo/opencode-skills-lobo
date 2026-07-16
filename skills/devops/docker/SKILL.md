---
name: docker
description: "Use when working with Docker for containerization and Dockerfiles. Use ONLY when the task is about Docker, not Docker Compose."
---

# Docker

Criar e gerenciar containers com Docker, incluindo Dockerfiles,
otimização de imagens e comandos essenciais.

## Objetivo

Containerizar aplicações de forma eficiente e segura seguindo
melhores práticas.

## Fluxo de Trabalho

1. Criar Dockerfile multi-stage
2. Otimizar camadas de build
3. Configurar health checks
4. Gerenciar variáveis de ambiente
5. Configurar redes e volumes
6. Publicar imagens

## Critérios de Qualidade

- [ ] Dockerfile usa multi-stage build
- [ ] Imagem base é mínima (Alpine)
- [ ] Health check está configurado
- [ ] Variáveis sensíveis não estão na imagem
- [ ] .dockerignore está configurado
- [ ] Camadas são otimizadas

## Limitações

- Não faz compose (usar `@docker-compose`)
- Não faz orquestração (usar Kubernetes)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Containerizar aplicação Node.js
- Criar imagem para CI/CD
- Setup de desenvolvimento local
- Deploy em produção

## Casos onde NÃO utilizar

- Para múltiplos serviços (usar `@docker-compose`)
- Para orquestração (usar Kubernetes)
- Para deploy simplificado (usar `@deploy`)

## Exemplos

### Exemplo 1: Dockerfile Node.js

**Entrada:**
```
Criar Dockerfile para aplicação Node.js
```

**Saída Esperada:**
```dockerfile
# Build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build

# Production stage
FROM node:20-alpine
WORKDIR /app
RUN addgroup -g 1001 -S nodejs && adduser -S nodejs -u 1001
COPY --from=builder --chown=nodejs:nodejs /app/dist ./dist
COPY --from=builder --chown=nodejs:nodejs /app/node_modules ./node_modules
USER nodejs
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1
CMD ["node", "dist/main.js"]
```

### Exemplo 2: .dockerignore

**Entrada:**
```
Criar .dockerignore para projeto Node.js
```

**Saída Esperada:**
```
node_modules
npm-debug.log
dist
.git
.env
.env.local
README.md
Dockerfile
docker-compose.yml
.dockerignore
```
