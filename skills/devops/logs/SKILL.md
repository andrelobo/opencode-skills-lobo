---
name: logs
description: "Use when working with structured logging and log aggregation. Use ONLY when the task is about logging, not general observability."
---

# Logs

Gerenciar logs estruturados, agregação, auditoria e boas praticas
de logging em aplicacoes e infraestrutura.

## Objetivo

Implementar estrategias de logging que garantam rastreabilidade,
diagnostico eficiente e conformidade com auditoria.

## Fluxo de Trabalho

1. Definir nivel de log por ambiente
2. Estruturar logs em formato JSON estruturado
3. Configurar shipping dos logs para agregador central
4. Indexar logs no ELK Stack ou Loki
5. Configurar retencao e rotacao de indices
6. Definir alertas baseados em padroes de log
7. Implementar audit trails para eventos criticos
8. Revisar e otimizar consultas frequentes

## Criterios de Qualidade

- [ ] Logs sao estruturados (JSON) e nao texto livre
- [ ] Niveis de log seguem padrao (debug, info, warn, error, fatal)
- [ ] Dados sensiveis nao aparecem em logs
- [ ] Correlation ID atravessa servicos
- [ ] Audit logs sao imutaveis e armazenados separadamente
- [ ] Retencao esta configurada conforme politica
- [ ] Alertas de erro existem para ambientes produtivos
- [ ] Logs de aplicacao e infraestrutura sao centralizados

## Limitacoes

- Nao faz tracing distribuido (usar OpenTelemetry)
- Nao faz monitoramento de metricas (usar Prometheus)
- Nao substitui ferramentas de APM
- Nao depende de plugins ou MCP servers

## Casos de Uso

- Diagnosticar falhas em producao
- Rastrear requisicoes entre servicos
- Auditoria de acesso e alteracoes
- Analise de desempenho de queries

## Casos onde NAO utilizar

- Para tracing distribuido (usar `@openTelemetry`)
- Para metricas e alertas de infra (usar `@prometheus`)
- Para monitoramento de tempo real (usar `@grafana`)

## Exemplos

### Exemplo 1: Logger JSON estruturado

**Entrada:**
```
Configurar logger JSON para aplicacao Node.js
```

**Saida Esperada:**
```json
{
  "level": "info",
  "message": "Usuario autenticado",
  "timestamp": "2026-07-16T10:30:00.000Z",
  "correlationId": "abc-123-def",
  "service": "auth-service",
  "userId": "usr_456",
  "duration_ms": 42
}
```

### Exemplo 2: Pipeline Filebeat para Elasticsearch

**Entrada:**
```
Configurar Filebeat para enviar logs ao Elasticsearch
```

**Saida Esperada:**
```yaml
filebeat.inputs:
  - type: container
    paths:
      - "/var/lib/docker/containers/*/*.log"
    json.keys_under_root: true
    json.add_error_key: true

output.elasticsearch:
  hosts: ["https://elasticsearch:9200"]
  index: "filebeat-%{[agent.version]}-%{+yyyy.MM.dd}"
  ssl.verification_mode: none
```
