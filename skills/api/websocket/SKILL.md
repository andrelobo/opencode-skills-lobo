---
name: websocket
description: "Use when implementing WebSocket for real-time communication, chat, and live updates. Use ONLY when the task is about WebSocket, not REST or GraphQL."
---

# WebSocket

Implementar comunicação em tempo real com WebSocket, incluindo
chat, notificações e live updates.

## Objetivo

Criar experiências em tempo real com comunicação bidirecional
eficiente e confiável.

## Fluxo de Trabalho

1. Configurar servidor WebSocket
2. Implementar conexão e autenticação
3. Criar salas e canais
4. Implementar broadcast
5. Configurar reconexão
6. Monitorar conexões

## Critérios de Qualidade

- [ ] Autenticação está implementada
- [ ] Salas são usadas para broadcast
- [ ] Reconexão está configurada
- [ ] Heartbeat está ativo
- [ ] Erros são tratados
- [ ] Conexões são limitadas

## Limitações

- Não faz REST (usar `@rest`)
- Não faz GraphQL subscriptions (usar `@graphql`)
- Não faz chat (usar framework específico)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Chat em tempo real
- Notificações push
- Dashboard ao vivo
- Jogos multiplayer

## Casos onde NÃO utilizar

- Para APIs tradicionais (usar `@rest`)
- Para queries flexíveis (usar `@graphql`)
- Para dados que não precisam de real-time

## Exemplos

### Exemplo 1: Servidor WebSocket básico

**Entrada:**
```
Criar servidor WebSocket com salas
```

**Saída Esperada:**
```javascript
const { WebSocketServer } = require('ws');
const wss = new WebSocketServer({ port: 8080 });

const rooms = new Map();

wss.on('connection', (ws) => {
  ws.on('message', (data) => {
    const { type, room, message } = JSON.parse(data);
    
    if (type === 'join') {
      ws.room = room;
      if (!rooms.has(room)) rooms.set(room, new Set());
      rooms.get(room).add(ws);
    }
    
    if (type === 'message' && ws.room) {
      const clients = rooms.get(ws.room);
      clients.forEach(client => {
        if (client !== ws) {
          client.send(JSON.stringify({ type: 'message', message }));
        }
      });
    }
  });
  
  ws.on('close', () => {
    if (ws.room && rooms.has(ws.room)) {
      rooms.get(ws.room).delete(ws);
    }
  });
});
```

### Exemplo 2: Cliente com reconexão

**Entrada:**
```
Implementar cliente com reconexão automática
```

**Saída Esperada:**
```javascript
class ReconnectingWebSocket {
  constructor(url) {
    this.url = url;
    this.connect();
  }
  
  connect() {
    this.ws = new WebSocket(this.url);
    
    this.ws.onclose = () => {
      setTimeout(() => this.connect(), 1000);
    };
    
    this.ws.onerror = (err) => {
      console.error('WebSocket error:', err);
    };
  }
  
  send(data) {
    if (this.ws.readyState === WebSocket.OPEN) {
      this.ws.send(JSON.stringify(data));
    }
  }
}
```
