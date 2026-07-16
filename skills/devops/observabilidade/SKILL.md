---
name: observabilidade
description: "Use when implementing observability: metrics, traces, dashboards, alerting. Use ONLY when the task is about observability, not performance."
---

# Observabilidade

Implementar soluções de observabilidade: métricas, traces, dashboards,
alerting e instrumentação.

## Objetivo

Garantir visibilidade completa sobre sistemas em produção para
detectar, diagnosticar e resolver incidentes.

## Fluxo de Trabalho

1. Definir métricas RED (Rate, Errors, Duration) e USE
2. Instrumentar código com bibliotecas apropriadas
3. Configurar coleta (Prometheus) e logs estruturados
4. Criar dashboards (Grafana) e distributed tracing
5. Definir alertas com thresholds, runbooks e SLIs/SLOs

## Critérios de Qualidade

- [ ] Métricas RED/USE implementadas em endpoints críticos
- [ ] Dashboards mostram estado do sistema em tempo real
- [ ] Alertas têm thresholds, runbooks e SLIs/SLOs documentados
- [ ] Traces propagam contexto entre serviços
- [ ] Logs são estruturados, correlacionados e auditados

## Limitações

Não otimiza performance (`@performance`), não faz deploy (`@deploy`),
não configura containers (`@docker`), não substitui diagnóstico manual
de bugs. Não utilize para revisão de código (`@code-review`).

## Casos de Uso

- Setup de monitoramento, alerting SLA/SLO e dashboards
- Distributed tracing em microsserviços
- Métricas de negócio personalizadas e diagnóstico de latência

## Exemplos

### Exemplo 1: Métricas Prometheus com Express

**Entrada:**
```
Adicionar métricas Prometheus em aplicação Express
```

**Saída Esperada:**
```javascript
const promClient = require('prom-client');
promClient.collectDefaultMetrics({ prefix: 'myapp_' });

const httpRequestDuration = new promClient.Histogram({
  name: 'http_request_duration_seconds',
  help: 'Duration of HTTP requests in seconds',
  labelNames: ['method', 'route', 'status_code'],
  buckets: [0.01, 0.05, 0.1, 0.5, 1, 5]
});

const httpRequestTotal = new promClient.Counter({
  name: 'http_requests_total',
  help: 'Total number of HTTP requests',
  labelNames: ['method', 'route', 'status_code']
});

function metricsMiddleware(req, res, next) {
  const end = httpRequestDuration.startTimer();
  res.on('finish', () => {
    const labels = { method: req.method, route: req.route?.path || 'unknown', status_code: res.statusCode };
    end(labels);
    httpRequestTotal.inc(labels);
  });
  next();
}

app.get('/metrics', async (req, res) => {
  res.set('Content-Type', promClient.register.contentType);
  res.end(await promClient.register.metrics());
});
```

### Exemplo 2: Dashboard Grafana JSON (painel de latency)

**Entrada:**
```
Criar painel Grafana para monitorar latência de API
```

**Saída Esperada:**
```json
{
  "title": "API Latency",
  "type": "timeseries",
  "targets": [
    {
      "expr": "histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))",
      "legendFormat": "p95 Latency",
      "refId": "A"
    },
    {
      "expr": "histogram_quantile(0.50, rate(http_request_duration_seconds_bucket[5m]))",
      "legendFormat": "p50 Latency",
      "refId": "B"
    }
  ],
  "thresholds": {
    "steps": [
      { "color": "green", "value": null },
      { "color": "yellow", "value": 0.5 },
      { "color": "red", "value": 1.0 }
    ]
  }
}
```
