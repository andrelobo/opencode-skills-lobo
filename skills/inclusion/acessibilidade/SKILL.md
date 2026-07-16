---
name: acessibilidade
description: "Use when addressing accessibility in urban environments or digital interfaces. Use ONLY when the task is about general accessibility, not WCAG."
---

# Acessibilidade

Suporte para implementacao de acessibilidade urbana, arquitetonica,
digital, sensorial e cognitiva, incluindo adaptacoes e conformidade
com a LBI e Decreto 5296.

## Objetivo

Garantir que ambientes, sistemas e servicos sejam utilizaveis por
todas as pessoas, independentemente de suas capacidades fisicas,
sensoriais ou cognitivas, em conformidade com a legislacao brasileira.

## Fluxo de Trabalho

1. Identificar o contexto (urbano, arquitetonico, digital, sensorial)
2. Mapear barreiras presentes no ambiente ou sistema
3. Consultar normas aplicaveis (LBI, Decreto 5296, ABNT NBR)
4. Definir prioridades de adaptacao
5. Projetar solucoes de remocao de barreiras
6. Implementar adaptacoes com materiais e tecnicas adequadas
7. Validar com usuarios com deficiencia
8. Documentar conformidade e manutencao necessaria

## Critérios de Qualidade

- [ ] Adaptacoes atendem a LBI (Lei 13146/2015)
- [ ] Conformidade com Decreto 5296 quando aplicavel
- [ ] Rampas respeitam inclinacao maxima de 8,33%
- [ ] Sinalizacao tatil e visual esta presente e correta
- [ ] Banheiros acessiveis atendem a norma tecnica
- [ ] Caminhos de deslocamento sao livres de obstaculos
- [ ] Contraste visual e adequado (minimo 4.5:1)
- [ ] Descricoes de imagens estao disponiveis em sistemas digitais

## Limitacoes

- Nao substitui projeto arquitetonico certificado
- Nao cobre todas as normas ABNT sem consulta especifica
- Nao garante acessibilidade total em edificacoes antigas
- Nao resolve problemas de acessibilidade sem validacao humana
- Nao deve ser used como parecer legal sem profissional habilitado

## Casos de Uso

- Auditar acessibilidade de edificacao existente
- Projetar adaptacoes para rampas e banheiros acessiveis
- Implementar sinalizacao tatil e sonora em espacos
- Adaptar interfaces digitais para leitores de tela
- Adequar mobiliario urbano a necessidades de mobilidade
- Criar planos de acessibilidade para empresas e orgaos publicos

## Casos onde NAO utilizar

- Para conformidade WCAG especifica (usar `@wcag`)
- Para inclusao digital ou alfabetizacao (usar `@inclusao-digital`)
- Para Libras ou comunicacao com surdos (usar `@libras`)
- Para auditoria de seguranca de sistemas (usar `@security-audit`)

## Exemplos

### Exemplo 1: Verificar rampa de acesso

**Entrada:**
```
Rampa existente: comprimento 3m, altura 0.5m
Superficie: concreto liso
```

**Saida Esperada:**
```
Inclinacao atual: 16,67% (IRREGULAR)
Inclinacao maxima permitida (LBI): 8,33%
Comprimento necessario: minimo 6m para essa altura
Correcao: Estender rampa para 6m ou mais
Superficie: Adicionar piso antiderrapante
Corrimao: Instalar em ambos os lados, alturas 0.70m e 0.92m
Patamar: Incluir patamar de descanso a cada 9m
```

### Exemplo 2: Avaliar acessibilidade digital basica

**Entrada:**
```
Sistema web: Formulario de contato
Elementos: Campos de texto, botao de envio, imagem de captcha
```

**Saida Esperada:**
```
Problemas identificados:
- Captcha sem alternativa acessivel (violacao LBI Art. 63)
- Labels nao associados programaticamente aos campos
- Contraste do botao insuficiente (2.8:1, minimo 4.5:1)

Correcoes:
1. Substituir captcha por honeypot ou alternativa acessivel
2. Associar labels via atributo for/id em cada campo
3. Ajustar cores para atingir contraste minimo 4.5:1
4. Adicionar navegacao por teclado completa
5. Incluir mensagens de erro descritivas e acessiveis
```
