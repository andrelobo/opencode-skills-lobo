---
name: acessibilidade-web
description: "Use when testing website accessibility with WAVE, Axe, or keyboard nav. Use ONLY when the task is about web accessibility, not reports."
---

# Acessibilidade Web

Auxilia na avaliacao e implementacao de acessibilidade em sites
e aplicacoes web, incluindo testes automatizados e manuais.

## Objetivo

Garantir que sites e aplicacoes web atendam aos padroes de
acessibilidade WCAG 2.1/2.2, oferecendo experiencia inclusiva
para todos os usuarios.

## Fluxo de Trabalho

1. Identificar ferramentas de teste adequadas (WAVE, Axe, Lighthouse)
2. Executar testes automatizados na pagina
3. Realizar testes manuais de navegacao por teclado
4. Verificar imagens alternativas e descricoes
5. Avaliar formularios e campos de entrada
6. Testar contraste e legibilidade do texto
7. Documentar problemas encontrados
8. Classificar severidade dos problemas
9. Propor solucoes de correcao
10. Revalidar correcoes implementadas

## Critérios de Qualidade

- [ ] Testes incluem ferramentas automatizadas e manuais
- [ ] Navegacao por teclado funciona completamente
- [ ] Todas as imagens possuem alt text descritivo
- [ ] Formularios possuem labels e mensagens de erro
- [ ] Contraste atende minimo WCAG (4.5:1 normal, 3:1 grande)
- [ ] Conteudo e acessivel via leitor de tela
- [ ] Problemas sao documentados com localizacao exata
- [ ] Recomendacoes sao implementaveis

## Limitacoes

- Nao substitui testes com usuarios com deficiencia
- Nao avalia acessibilidade mobile nativa
- Nao testa compatibilidade com todos os navegadores
- Nao resolve problemas de conteudo dinamico complexo
- Nao garante conformidade total sem validacao humana

## Casos de Uso

- Auditoria de acessibilidade de sites existentes
- Teste de conformidade WCAG antes de lancamento
- Correcao de problemas de acessibilidade identificados
- Implementacao de formularios acessiveis
- Adicionado alt text a imagens

## Casos onde NAO utilizar

- Para criar questionarios (usar `questionarios-inclusao`)
- Para gerar relatorios formais (usar `relatorios-tecnicos`)
- Para avaliar acessibilidade de espacos fisicos
- Para testar aplicacoes mobile nativas

## Exemplos

### Exemplo 1: Imagem sem alt text

**Entrada:**
```html
<img src="grafico-vendas.png">
```

**Saida Esperada:**
```html
<img src="grafico-vendas.png" alt="Grafico de vendas mensais mostrando crescimento de 15% entre janeiro e junho de 2024">
```

### Exemplo 2: Formulario inacessivel

**Entrada:**
```html
<input type="email" placeholder="Email">
```

**Saida Esperada:**
```html
<label for="email">Email</label>
<input type="email" id="email" name="email" aria-required="true"
       aria-describedby="email-help">
<span id="email-help">Informe seu endereco de email corporativo</span>
```
