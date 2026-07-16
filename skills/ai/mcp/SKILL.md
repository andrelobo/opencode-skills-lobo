---
name: mcp
description: "Use when working with MCP to connect LLMs to external data, tools and services via servers. Use ONLY for MCP protocol, not general LLM integration."
---

# Model Context Protocol (MCP)

Implementar e configurar servidores MCP para conectar LLMs a
ferramentas, recursos e dados externos de forma padronizada.

## Objetivo

Permitir que modelos de linguagem acessem ferramentas, dados e
serviços externos usando o protocolo MCP.

## Fluxo de Trabalho

1. Identificar necessidades de integração com LLM
2. Projetar a estrutura do servidor MCP (tools, resources, prompts)
3. Implementar o servidor com SDK adequado (Python ou TypeScript)
4. Definir tools com schemas JSON Schema claros
5. Definir resources com URIs e MIME types
6. Opcionalmente, definir prompt templates reutilizáveis
7. Configurar o servidor no cliente LLM (opencode.json ou equivalente)
8. Testar as ferramentas com o cliente conectado
9. Adicionar error handling e validação de inputs
10. Documentar e publicar o servidor

## Critérios de Qualidade

- [ ] Tools possuem schemas JSON Schema completos e descritivos
- [ ] Resources possuem URIs padronizados e MIME types corretos
- [ ] Prompts são parametrizados e reutilizáveis
- [ ] Error handling retorna mensagens claras ao LLM
- [ ] Inputs são validados antes da execução
- [ ] Servidor é stateless ou gerencia estado explicitamente
- [ ] Autenticação é configurada para servidores em produção

## Limitações

- Não faz deploy de aplicações (usar `@deploy`)
- Não substitui chamadas REST diretas quando MCP não é necessário
- Não é adequado para fluxos de alto throughput em tempo real
- Não faz gerenciamento de modelos LLM (usar configuração do provider)

## Casos de Uso

- Conectar LLM a bancos de dados para queries dinâmicas
- Fornecer acesso a APIs externas via tools
- Expor arquivos e documentos como resources
- Criar prompt templates para tarefas repetitivas
- Integrar LLMs com sistemas corporativos legados

## Casos onde NÃO utilizar

- Para chamadas REST simples (usar HTTP direto)
- Para streaming de dados em tempo real (usar WebSocket)
- Para processamento offline de dados (usar scripts)

## Exemplos

### Exemplo 1: Server com Tool

**Entrada:**
```
Criar server MCP que busca usuários em banco PostgreSQL
```

**Saída Esperada:**
```json
{
  "tools": [
    {
      "name": "search_users",
      "description": "Busca usuários por nome ou email",
      "inputSchema": {
        "type": "object",
        "properties": {
          "query": { "type": "string", "description": "Termo de busca" },
          "limit": { "type": "integer", "default": 10 }
        },
        "required": ["query"]
      }
    }
  ]
}
```

### Exemplo 2: Configuração no Cliente

**Entrada:**
```
Configurar MCP server no opencode.json
```

**Saída Esperada:**
```json
{
  "mcpServers": {
    "database": {
      "command": "node",
      "args": ["dist/server.js"],
      "env": {
        "DATABASE_URL": "${DATABASE_URL}"
      }
    }
  }
}
```
