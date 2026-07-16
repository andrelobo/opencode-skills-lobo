---
name: acessibilidade-conteudo
description: "Use when making digital content accessible with captions and alt text. Use ONLY when the task is about content accessibility, not apps."
---

# Acessibilidade em Conteúdo

Garante que conteúdos digitais multimídia sejam acessíveis a pessoas
com diferentes necessidades sensoriais e cognitivas.

## Objetivo

Tornar conteúdo web (vídeos, áudio, imagens, textos) acessível através
de legendas, descrições de áudio, alternativas e formatos adaptáveis.

## Fluxo de Trabalho

1. Inventariar todo conteúdo multimídia existente
2. Classificar por tipo: vídeo, áudio, imagem, texto
3. Criar legendas sincronizadas para vídeos
4. Adicionar descrição de áudio para conteúdo visual
5. Fornecer transcrições completas para áudio
6. Criar alternativas textuais para imagens e gráficos
7. Garantir que conteúdo é acessível em diferentes formatos
8. Testar com diferentes configurações de acessibilidade
9. Documentar padrões de acessibilidade adotados
10. Revisar e atualizar periodicamente

## Critérios de Qualidade

- [ ] Todos os vídeos possuem legendas sincronizadas
- [ ] Áudio possui transcrição completa disponível
- [ ] Imagens decorativas são marcadas corretamente
- [ ] Contraste de legendas atende mínimo 4.5:1
- [ ] Conteúdo é funcional sem CSS ou JavaScript
- [ ] Texto alternativo descreve propósito da imagem
- [ ] Vídeos com conteúdo visualpossuem descrição de áudio
- [ ] Formatos de entrega suportam alternativas acessíveis

## Limitações

- Não gera legendas automaticamente com precisão perfeita
- Não cria descrição de áudio para conteúdo em tempo real
- Não traduz legendas para outros idiomas
- Não garante qualidade de transcrições geradas por IA

## Casos de Uso

- Adicionar legendas em vídeo corporativo de treinamento
- Criar transcrição para podcast ou áudio educacional
- Tornar galeria de imagens acessível em site institucional
- Adaptar conteúdo multimídia para diferentes necessidades

## Casos onde NÃO utilizar

- Para remediar documentos PDF (usar `@acessibilidade-documentos`)
- Para implementar acessibilidade em aplicativo (usar `@acessibilidade-aplicacoes`)
- Para criar documentação técnica (usar `@doc-writer`)
- Para testar usabilidade geral (não é escopo)

## Exemplos

### Exemplo 1: Legendas em vídeo WebVTT

**Entrada:**
```
[ vídeo sem legendas ]
Conteúdo: "Bem-vindos ao curso de acessibilidade digital.
Nesta aula, vamos aprender sobre WCAG 2.1."
```

**Saída Esperada:**
```vtt
WEBVTT

00:00:01.000 --> 00:00:04.500
Bem-vindos ao curso de acessibilidade digital.

00:00:04.700 --> 00:00:08.200
Nesta aula, vamos aprender sobre WCAG 2.1.
```

### Exemplo 2: Descrição de áudio em página web

**Entrada:**
```html
<video src="tutorial.mp4" controls>
  <track kind="captions" src="legendas.vtt" srclang="pt">
</video>
<p>Acesse a transcrição completa do vídeo.</p>
```

**Saída Esperada:**
```html
<video
  src="tutorial.mp4"
  controls
  aria-describedby="video-desc-1"
>
  <track kind="captions" src="legendas.vtt" srclang="pt" label="Português">
  <track kind="descriptions" src="descricoes.vtt" srclang="pt">
</video>
<div id="video-desc-1" class="sr-only">
  Vídeo tutorial mostrando código sendo editado em editor de texto.
  Duração: 12 minutos. Nível: intermediário.
</div>
<details>
  <summary>Transcrição completa do vídeo</summary>
  <p>Bem-vindos ao curso de acessibilidade digital. Nesta aula,
  vamos aprender sobre WCAG 2.1 e suas diretrizes principais...</p>
</details>
```
