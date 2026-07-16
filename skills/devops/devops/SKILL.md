---
name: devops
description: "Use when working with DevOps practices, IaC, and automation. Use ONLY when the task is about DevOps practices, not specific tools."
---

# DevOps

Implementar cultura DevOps, automacao de infraestrutura,
gerenciamento de releases e monitoramento continuo.

## Objetivo

Estabelecer praticas de integracao e entrega continuas com
infraestrutura como codigo e automacao de ponta a ponta.

## Fluxo de Trabalho

1. Definir pipeline de CI/CD
2. Provisionar infraestrutura com Terraform
3. Configurar gerenciamento de configuracao com Ansible
4. Implementar testes de infraestrutura
5. Configurar monitoramento e alertas
6. Estabelecer estrategia de release e rollback
7. Automatizar compliance e security scanning
8. Documentar runbooks e procedimentos

## Criterios de Qualidade

- [ ] Infraestrutura esta versionada como codigo
- [ ] Pipeline CI/CD cobre build, test, deploy
- [ ] Rollback esta automatizado
- [ ] Secrets sao gerenciados externamente (vault)
- [ ] Monitoramento cobre aplicacao e infraestrutura
- [ ] Alertas tem acao definida e responsavel
- [ ] Provisionamento e reprodutivel e idempotente
- [ ] Releases seguem versionamento semantico

## Limitacoes

- Nao substitui ferramentas especificas (usar `@docker`, `@kubernetes`)
- Nao faz observabilidade avancada (usar `@logs`, `@prometheus`)
- Nao cobre seguranca de aplicacao (usar `@security-audit`)
- Nao depende de plugins ou MCP servers

## Casos de Uso

- Automatizar deploy de microservicos
- Provisionar ambiente de staging
- Padronizar pipelines entre equipes
- Reduzir tempo de entrega de features

## Casos onde NAO utilizar

- Para containerizacao (usar `@docker`)
- Para orquestracao (usar `@kubernetes`)
- Para logging detalhado (usar `@logs`)

## Exemplos

### Exemplo 1: Pipeline CI/CD basico

**Entrada:**
```
Criar pipeline CI/CD com build, teste e deploy
```

**Saida Esperada:**
```yaml
name: CI/CD Pipeline
on:
  push:
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm test
      - run: npm run build
  deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - run: terraform apply -auto-approve
```

### Exemplo 2: Provisionamento Terraform

**Entrada:**
```
Provisionar instancia EC2 com Terraform
```

**Saida Esperada:**
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"

  tags = {
    Name = "app-production"
  }

  lifecycle {
    create_before_destroy = true
  }
}
```
