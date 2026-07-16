---
name: rag
description: "Use when implementing RAG: indexing, embeddings, chunking and retrieval from knowledge bases. Use ONLY for RAG pipelines, not general LLM usage."
---

# Retrieval-Augmented Generation (RAG)

Implementar sistemas RAG para indexar documentos, gerar embeddings,
recuperar contexto relevante e gerar respostas fundamentadas em fontes
de conhecimento externas.

## Objetivo

Permitir que modelos de linguagem acessem e utilizem conhecimento
específico de domínio para gerar respostas precisas e verificáveis,
reduzindo alucinações e aumentando a confiabilidade.

## Fluxo de Trabalho

1. Identificar as fontes de conhecimento e formatos de documentos
2. Projetar a estratégia de chunking (tamanho, overlap, semântico)
3. Selecionar e configurar o modelo de embeddings
4. Implementar o pipeline de indexação e armazenamento vetorial
5. Configurar o mecanismo de recuperação (similidade, híbrido, reranking)
6. Projetar o prompt de contexto com fontes e citações
7. Implementar validação de respostas contra as fontes recuperadas
8. Configurar metadados, filtros e permissões por fonte
9. Testar com perguntas reais e medir relevância dos resultados
10. Monitorar qualidade, atualizar índices e refinar chunking

## Critérios de Qualidade

- [ ] Chunking preserva semântica e contexto do documento original
- [ ] Embeddings utilizam modelo adequado ao idioma e domínio
- [ ] Recuperação retorna documentos relevantes nas top-k respostas
- [ ] Metadados permitem filtrar por fonte, data e permissão
- [ ] Prompt de contexto inclui instruções claras de citação
- [ ] Respostas são validadas contra as fontes recuperadas
- [ ] Índice é atualizado quando documentos são alterados
- [ ] Latência de recuperação é aceitável para o caso de uso

## Limitações

- Não faz deploy de aplicações (usar `@deploy`)
- Não substitui fine-tuning quando o conhecimento é altamente específico
- Não garante 100% de precisão sem validação humana
- Não resolve problemas de documentos mal estruturados sem tratamento prévio

## Casos de Uso

- Chatbots corporativos que respondem com base em documentação interna
- Sistemas de busca semântica em repositórios de conhecimento
- Assistentes jurídicos ou médicos fundamentados em normativas
- FAQ dinâmica atualizada automaticamente com novos documentos
- Análise de contratos com referência a cláusulas específicas

## Casos onde NÃO utilizar

- Para tarefas que não dependem de conhecimento externo
- Para consultas diretas sem necessidade de fundamentação
- Para dados em tempo real de alta frequência (usar streaming)
- Para bases de dados estruturadas simples (usar consultas SQL diretas)

## Exemplos

### Exemplo 1: Pipeline de Chunking

**Entrada:**
```
Indexar documentos PDF com chunking semântico
```

**Saída Esperada:**
```python
chunk_config = {
    "method": "semantic",
    "max_tokens": 512,
    "overlap_tokens": 64,
    "separators": ["\n\n", "\n", ". ", " "],
    "metadata_fields": ["source", "page", "section"]
}
```

### Exemplo 2: Query com Reranking

**Entrada:**
```
Recuperar contexto relevante para pergunta do usuário
```

**Saída Esperada:**
```python
results = vector_store.similarity_search(
    query=user_question,
    k=20,
    filter={"department": "engineering"}
)
reranked = reranker.rank(query=user_question, documents=results, top_k=5)
context = "\n\n".join([doc.content for doc in reranked])
sources = [{"file": doc.metadata["source"], "page": doc.metadata["page"]} for doc in reranked]
```
