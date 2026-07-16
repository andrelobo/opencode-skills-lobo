---
name: tecnologias-assistivas
description: "Use when selecting or developing assistive technology like screen readers. Use ONLY when the task is about assistive technology, not WCAG."
---

# Tecnologias Assistivas

Orienta sobre dispositivos, softwares e recursos de assistencia
para promover autonomia de pessoas com deficiencia.

## Objetivo

Recomendar e implementar solucoes de tecnologia assistiva adequadas
as necessidades especificas de cada usuario, considerando dispositivos,
software e adaptacoes disponiveis.

## Fluxo de Trabalho

1. Identificar as limitacoes funcionais do usuario
2. Levantar necessidades especificas de interacao
3. Pesquisar dispositivos e software assistivos disponiveis
4. Avaliar compatibilidade com sistemas e plataformas existentes
5. Selecionar equipamentos com base em custo-beneficio e adequacao
6. Configurar e personalizar recursos para o perfil do usuario
7. Treinar o usuario e acompanhantes no uso do equipamento
8. Testar interacao em cenarios reais de uso
9. Documentar configuracao e procedimentos de manutencao
10. Coletar retorno e ajustar solucao conforme necessario

## Criterios de Qualidade

- [ ] Solucao atende as necessidades funcionais identificadas
- [ ] Dispositivo e compativel com software e hardware existentes
- [ ] Leitor de tela foi testado com as principais paginas e funcoes
- [ ] Recurso de comunicacao aumentativa e alternativa (CAA) testado
- [ ] Adaptacoes fisicas foram validadas com o usuario
- [ ] Custo-beneficio foi considerado na selecao
- [ ] Usuario recebeu treinamento basico para operacao
- [ ] Procedimentos de manutencao estao documentados
- [ ] Solucao e escalavel ou ajustavel a mudancas futuras
- [ ] Privacidade e seguranca dos dados do usuario foram garantidas

## Limitacoes

- Nao substitui avaliacao de terapeuta ocupacional ou fonoaudiologo
- Nao cobre diagnostico medico de deficiencia
- Nao audita conformidade com WCAG (usar `@wcag`)
- Nao desenvolve hardware personalizado sob medida
- Nao garante financiamento ou aprovacao de orgaos publicos

## Casos de Uso

- Recomendar leitores de tela e ampliadores de tela
- Configurar softwares de reconhecimento de voz
- Selecionar dispositivos de comunicacao aumentativa
- Adaptar estacao de trabalho para pessoa com mobilidade reduzida
- Avaliar alternativas de entrada (mouse adaptado, teclado virtual)

## Casos onde Nao Utilizar

- Para auditar acessibilidade web (usar `@wcag`)
- Para criar documentacao de componentes acessiveis (usar `@acessibilidade`)
- Para diagnosticar condicoes medicas ou deficiencias
- Para desenvolver hardware eletronico do zero
- Para treinar IA em reconhecimento de gestos ou voz

## Exemplos

### Exemplo 1: Recomendar leitor de telas

**Entrada:**
"Usuario com deficiencia visual total precisa navegar em sistema
web corporativo."

**Saida Esperada:**
"Recomendar NVDA (Windows, gratuito) ou VoiceOver (Mac). Testar
compatibilidade com os principais formularios e tabelas do sistema.
Verificar se todos os elementos possuem descricoes alternativas."

### Exemplo 2: Comunicacao aumentativa

**Entrada:**
"Usuario nao verbal precisa comunicar-se em ambiente escolar."

**Saida Esperada:**
"Avaliar prancha de comunicacao com pictogramas (ex: Livro de
Comunicacao Pictografico) ou software CAA como Boardmaker ou
Proloquo2Go. Configurar vocabulario basico para rotina escolar."

### Exemplo 3: Adaptacao de entrada

**Entrada:**
"Usuario com mobilidade reduzida nos membros superiores precisa
usar computador."

**Saida Esperada:**
"Recomendar mouse adaptado (trackball ou joystick) e teclado
virtual com predicao de texto. Avaliar software de reconhecimento
vocal como Dragon NaturallySpeaking ou ferramentas nativas do SO."
