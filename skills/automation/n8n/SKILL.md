---
name: n8n
description: "Use when creating workflows with n8n to integrate services and APIs. Use ONLY when the task is about n8n, not other tools."
---

# n8n

Criar workflows de automação com n8n para integrar serviços e
APIs diferentes de forma visual e code-friendly.

## Objetivo

Automatizar tarefas e integrações entre múltiplos serviços
usando workflows visuais.

## Fluxo de Trabalho

1. Identificar serviços a integrar
2. Criar workflow no n8n
3. Configurar triggers
4. Adicionar nodes de processamento
5. Configurar error handling
6. Testar e deployar

## Critérios de Qualidade

- [ ] Workflows são modulares
- [ ] Error handling está implementado
- [ ] Credentials estão em variáveis
- [ ] Workflows são documentados
- [ ] Execuções são logadas
- [ ] Workflows são testados

## Limitações

- Não faz deploy de app (usar `@deploy`)
- Não faz CI/CD (usar `@ci-cd`)
- Não faz código custom (usar `@nodejs`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Sincronizar dados entre sistemas
- Enviar notificações automáticas
- Processar webhooks
- Automatizar relatórios

## Casos onde NÃO utilizar

- Para código customizado (usar `@nodejs`)
- Para CI/CD (usar `@ci-cd`)
- Para deploy (usar `@deploy`)

## Exemplos

### Exemplo 1: Workflow de notificação

**Entrada:**
```
Criar workflow para notificar Slack quando chegar email
```

**Saída Esperada:**
```
Trigger: Email IMAP
  → Filter: Assunto contém "urgente"
  → Slack: Enviar mensagem
    → Canal: #alerts
    → Mensagem: "Novo email urgente de {{from}}"
```

### Exemplo 2: Sincronização de dados

**Entrada:**
```
Sincronizar clientes entre CRM e planilha
```

**Saída Esperada:**
```
Trigger: Cron (diário)
  → CRM: Buscar clientes novos
  → Filter: Apenas novos
  → Google Sheets: Adicionar linha
    → Planilha: Clientes
    → Colunas: Nome, Email, Telefone
```
