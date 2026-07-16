---
name: prompt-engineering
description: "Use when designing or optimizing prompts for LLMs to improve output quality. Use ONLY for prompt design and techniques, not LLM app building."
---

# Prompt Engineering

Criar e otimizar prompts para modelos de linguagem, aplicando
técnicas comprovadas para obter respostas precisas e consistentes.

## Objetivo

Maximizar a qualidade das respostas de LLMs através do design
estruturado e iterativo de prompts.

## Fluxo de Trabalho

1. Definir o objetivo claro da tarefa
2. Identificar o modelo e suas características conhecidas
3. Escolher a técnica de prompting adequada
4. Estruturar o prompt com contexto, instruções e formato de saída
5. Adicionar exemplos quando necessário (few-shot)
6. Incluir instruções de fallback e limites
7. Testar com entradas variadas
8. Iterar com base nos resultados observados
9. Documentar a versão final do prompt
10. Avaliar consistência e robustez

## Critérios de Qualidade

- [ ] Instruções são claras e sem ambiguidade
- [ ] Formato de saída é explicitamente definido
- [ ] Exemplos são representativos e variados
- [ ] Prompt é resistente a instruções adversariais
- [ ] Limite de tokens é considerado
- [ ] Variáveis e placeholders estão documentados
- [ ] Resultados são consistentes entre execuções

## Limitações

- Não garante 100% de precisão (LLMs são estocásticos)
- Não substitui validação de saída em produção
- Não resolve problemas de conhecimento inexiste no modelo
- Não faz fine-tuning de modelos

## Casos de Uso

- Gerar código com estrutura e padrão específicos
- Extrair dados estruturados de texto livre
- Classificar e rotular conteúdo automaticamente
- Criar system prompts para agentes e assistentes
- Otimizar respostas para tarefas de raciocínio

## Casos onde NÃO utilizar

- Para treinar modelos (usar fine-tuning)
- Para integrar LLMs em apps (usar SDK/API)
- Para avaliar modelos (usar benchmarks)

## Exemplos

### Exemplo 1: Few-shot para Classificacao

**Entrada:**
```
Classificar sentimentos de reviews em positivo/negativo
```

**Saída Esperada:**
```
Classifique o sentimento do review. Responda apenas "positivo" ou "negativo".

Exemplos:
Review: "Produto excelente, chegou rápido!" -> positivo
Review: "Péssimo, veio com defeito." -> negativo
Review: "Bom custo-benefício." -> positivo

Review: "Demorou 30 dias para chegar, embalagem amassada."
```

### Exemplo 2: Chain-of-Thought para Raciocinio

**Entrada:**
```
Resolver problema de lógica com passos intermediários
```

**Saída Esperada:**
```
Resolva o problema passo a passo. Mostre seu raciocínio antes
da resposta final.

Problema: Se Maria tem o dobro da idade de João, e daqui a 6
anos a soma das idades será 58, qual a idade atual de cada um?

Raciocínio:
1. Se João tem X anos, Maria tem 2X
2. Daqui a 6 anos: João = X+6, Maria = 2X+6
3. Soma: (X+6) + (2X+6) = 58
4. 3X + 12 = 58
5. 3X = 46 → X = 15.33... (verificar se há erro no enunciado)
```
