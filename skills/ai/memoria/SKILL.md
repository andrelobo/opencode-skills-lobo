---
name: memoria
description: "Use when implementing agent memory: short/long-term, conversation persistence, context. Use ONLY for agent memory, not general data storage."
---

# Memória para Agentes de IA

Implementar sistemas de memória de curto e longo prazo para agentes
de IA, permitindo persistência de conversas, armazenamento de contexto
e gerenciamento de estado entre interações.

## Objetivo

Permitir que agentes de IA mantenham continuidade em interações,
aprendam com interações anteriores e acessem contexto histórico
de forma eficiente e estruturada.

## Fluxo de Trabalho

1. Definir os tipos de memória necessários (curto prazo, longo prazo, semântica)
2. Projetar o esquema de armazenamento (tokens, embeddings, metadados)
3. Implementar a memória de curto prazo (janela de conversa, resumo)
4. Implementar a memória de longo prazo (armazenamento persistente)
5. Configurar extração de fatos e preferências do usuário
6. Implementar busca semântica sobre memória armazenada
7. Definir políticas de expiração, compactação e limpeza
8. Integrar memória com o prompt do agente
9. Testar continuidade entre sessões e recuperação de contexto
10. Monitorar uso de tokens e otimizar retenção

## Critérios de Qualidade

- [ ] Memória de curto prazo mantém janela de conversa adequada
- [ ] Memória de longo prazo persiste entre sessões com sucesso
- [ ] Fatos e preferências são extraídos e armazenados corretamente
- [ ] Busca semântica retorna memórias relevantes para o contexto
- [ ] Políticas de expiração evitam acúmulo desnecessário de dados
- [ ] Uso de tokens é otimizado com resumos e compressão
- [ ] Privacidade do usuário é respeitada com controle de acesso
- [ ] Memória não introduz alucinações ou contexto irrelevante

## Limitações

- Não faz deploy de aplicações (usar `@deploy`)
- Não substitui banco de dados relacional para dados estruturados
- Não garante retenção infinita de contexto sem limites de armazenamento
- Não resolve conflitos de memória contraditória sem lógica de resolução

## Casos de Uso

- Assistentes pessoais que lembram preferências do usuário
- Chatbots de suporte que mantêm histórico de tickets
- Agentes de vendas que acompanham progresso de negociações
- Sistemas de tutoring que adaptam conteúdo ao progresso do aluno
- Copilotos de código que lembram padrões e decisões do projeto

## Casos onde NÃO utilizar

- Para dados transacionais que exigem ACID (usar banco relacional)
- Para cache de alta performance sem necessidade de semântica (usar Redis)
- Para armazenamento de blobs grandes (usar object storage)
- Para dados que não precisam persistir entre sessões

## Exemplos

### Exemplo 1: Estrutura de Memória

**Entrada:**
```
Definir schema de memória para agente conversacional
```

**Saída Esperada:**
```json
{
  "short_term": {
    "type": "window",
    "max_messages": 50,
    "summarize_after": 30
  },
  "long_term": {
    "type": "vector_store",
    "extract_facts": true,
    "extract_preferences": true,
    "ttl_days": 90
  }
}
```

### Exemplo 2: Extração de Fatos

**Entrada:**
```
Extrair e armazenar preferências do usuário da conversa
```

**Saída Esperada:**
```python
facts = memory.extract_facts(conversation)
# [
#   {"type": "preference", "key": "language", "value": "pt-BR", "confidence": 0.95},
#   {"type": "preference", "key": "framework", "value": "Next.js", "confidence": 0.88},
#   {"type": "context", "key": "project", "value": "e-commerce", "confidence": 0.92}
# ]
memory.store(facts, user_id="user_123")
```
