---
name: libras
description: "Use when working with Libras translation, interpretation, or deaf content. Use ONLY when the task is about Libras or deaf inclusion, not WCAG."
---

# Libras

Suporte para traducao, interpretacao e conteudo em Libras
(Lingua Brasileira de Sinais) voltado a inclusao de pessoas surdas.

## Objetivo

Facilitar a criacao, revisao e adaptacao de conteudos, sistemas e
servicos que atendam a comunicacao em Libras e a inclusao da
comunidade surda.

## Fluxo de Trabalho

1. Identificar o tipo de conteudo ou sistema a ser adaptado
2. Definir o publico-alvo (surdos, ouvintes, intérpretes)
3. Verificar a necessidade de traducao para Libras
4. Aplicar regras gramaticais de sinais quando relevante
5. Validar o alfabeto manual e vocabulario utilizado
6. Incluir legendas ou interpretacao conforme o meio
7. Revisar com profissional de Libras ou surdo Consultor
8. Documentar decisoes de traducao e adaptacao

## Critérios de Qualidade

- [ ] Traducao preserva o sentido do conteudo original
- [ ] Gramatica de Libras e respeitada (ordem topical, aspecto verbal)
- [ ] Alfabeto manual esta correto quando utilizado
- [ ] Conteudo e compreensivel por surdos e ouvintes
- [ ] Legendas estao sincronizadas com audio/video
- [ ] Intérprete possui certificacao quando exigida
- [ ] Terminologia tecnica e padronizada em Libras
- [ ] Formatacao facilita a leitura em tela

## Limitacoes

- Nao substitui intérprete certificado em contextos formais
- Nao traduz automaticamente conteudo de audio sem transcricao
- Nao garante comprehension sem validacao humana
- Nao cobre todas as variantes regionais de sinais
- Nao deve ser used para decisoes legais ou medicas sem profissional

## Casos de Uso

- Traduzir interface de software para Libras
- Criar legendas em videos educativos
- Adaptar documentacao tecnica para pessoas surdas
- Desenvolver funcionalidades de comunicacao visual
- Capacitar equipes sobre inclusao de pessoas surdas
- Revisar materiais de capacitacao em Libras

## Casos onde NAO utilizar

- Para traducao entre idiomas orais (usar `@translator`)
- Para acessibilidade web generica (usar `@acessibilidade`)
- Para conformidade WCAG (usar `@wcag`)
- Para inclusao digital sem foco em Libras (usar `@inclusao-digital`)

## Exemplos

### Exemplo 1: Adaptar interface para Libras

**Entrada:**
```
Botao: "Salvar alteracoes"
Mensagem: "Operacao realizada com sucesso"
```

**Saida Esperada:**
```
Botao: [SALVAR] [ALTERACAO] (sinais correspondentes)
Mensagem: "SUCESSO" + indicador aspectual de conclusao
Nota: Incluir icone de Libras para acesso ao video-sinal
```

### Exemplo 2: Validar gramatica de sinais

**Entrada:**
```
Frase em portugues: "O aluno entregou o trabalho para o professor ontem"
```

**Saida Esperada:**
```
Ordem topical em Libras: ALUNO TRABALHO ENTREGAR PROFESSOR ONTEM
Marcacao temporal: ONTEM (antes do verbo ou no inicio da frase)
Aspecto verbal: acao concluida (movimento unico e definido)
```
