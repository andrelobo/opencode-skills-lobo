---
name: ferramentas
description: "Use when selecting or configuring tools for LLMs: function calling, APIs, code execution. Use ONLY for tool orchestration, not general LLM prompting."
---

# Ferramentas para LLMs

Selecionar, configurar e orquestrar ferramentas que permitem
LLMs interagirem com sistemas externos de forma segura e estruturada.

## Objetivo

Fornecer ao LLM capacidades de ação além do texto, incluindo chamadas
a APIs, acesso a dados, execução de código e interação com serviços externos.

## Fluxo de Trabalho

1. Identificar a necessidade de ação externa do LLM
2. Definir se a integração é via function calling, MCP ou wrapper direto
3. Projetar o schema da ferramenta com JSON Schema claro e descritivo
4. Implementar a lógica de execução com tratamento de erros
5. Adicionar validação de inputs e sanitização de outputs
6. Configurar sandboxing ou restrições de execução quando aplicável
7. Integrar a ferramenta no cliente LLM ou framework
8. Testar com cenários de sucesso e falha
9. Documentar limitações, permissões e efeitos colaterais
10. Monitorar uso e ajustar rate limits conforme necessário

## Critérios de Qualidade

- [ ] Schema JSON Schema completo com tipos, enums e valores padrão
- [ ] Validação de inputs antes da execução
- [ ] Tratamento de erros com mensagens claras ao LLM
- [ ] Outputs sanitizados para evitar injeção de dados
- [ ] Rate limiting configurado para APIs externas
- [ ] Permissões documentadas e minimizadas
- [ ] Logging de chamadas para auditoria
- [ ] Timeouts configurados para operações de longa duração

## Limitações

- Não substitui autenticação direta quando o LLM não precisa de ação
- Não é adequado para operações de alto risco sem supervisão humana
- Não faz deploy de ferramentas (usar `@deploy`)
- Não gerencia ciclo de vida de APIs externas (usar `@api-design`)

## Casos de Uso

- Function calling para consulta a bancos de dados
- Web scraping controlado via ferramentas configuradas
- Execução de código em sandbox para validação
- Integração com APIs REST ou GraphQL como tools
- Orquestração de múltiplas ferramentas em pipeline
- Acesso a filesystem restrito para leitura de documentos

## Casos onde NÃO utilizar

- Para chamadas simples sem necessidade de LLM (usar scripts diretos)
- Para operações de write em produção sem aprovação humana
- Para acesso irrestrito a rede sem sandbox

## Exemplos

### Exemplo 1: Function Calling para Busca

**Entrada:**
```
Criar tool de busca em banco de dados para o LLM consultar clientes
```

**Saída Esperada:**
```json
{
  "name": "search_clients",
  "description": "Busca clientes por nome, email ou CPF",
  "inputSchema": {
    "type": "object",
    "properties": {
      "query": { "type": "string", "description": "Termo de busca" },
      "field": { "type": "string", "enum": ["name", "email", "cpf"] },
      "limit": { "type": "integer", "default": 10, "maximum": 50 }
    },
    "required": ["query", "field"]
  }
}
```

### Exemplo 2: Wrapper de API Externa

**Entrada:**
```
Criar tool que consulta previsão do tempo via API externa
```

**Saída Esperada:**
```typescript
const weatherTool = {
  name: "get_weather",
  description: "Consulta previsão do tempo para uma cidade",
  inputSchema: {
    type: "object",
    properties: {
      city: { type: "string", description: "Nome da cidade" },
      days: { type: "integer", default: 1, maximum: 5 }
    },
    required: ["city"]
  },
  execute: async ({ city, days }) => {
    const response = await fetch(
      `https://api.weather.com/v1/forecast?q=${city}&days=${days}`,
      { headers: { "Authorization": `Bearer ${API_KEY}` } }
    );
    if (!response.ok) throw new Error("Falha ao consultar previsão");
    return response.json();
  }
};
```
