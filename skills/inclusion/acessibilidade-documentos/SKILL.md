---
name: acessibilidade-documentos
description: "Use when creating accessible documents with structure, alt text, and tagging. Use ONLY when the task is about document accessibility, not apps."
---

# Acessibilidade em Documentos

Garante que documentos digitais sejam acessíveis a todos os usuários,
incluindo aqueles que utilizam tecnologias assistivas.

## Objetivo

Criar e remediar documentos (PDF, Word, apresentações) seguindo padrões
de acessibilidade como PDF/UA e WCAG para documentos.

## Fluxo de Trabalho

1. Analisar tipo e formato do documento
2. Avaliar estrutura atual de cabeçalhos e navegação
3. Definir hierarquia lógica de títulos e subtítulos
4. Adicionar textos alternativos para imagens e figuras
5. Configurar ordem de leitura e tagging semântico
6. Verificar contraste de cores e fontes legíveis
7. Incluir metadados descritivos e título do documento
8. Testar navegação por marcadores e tabelas
9. Validar com ferramentas de verificação de acessibilidade
10. Exportar formato acessível e testar com leitor de tela

## Critérios de Qualidade

- [ ] Hierarquia de cabeçalhos segue ordem lógica (H1 > H2 > H3)
- [ ] Todas as imagens possuem texto alternativo descritivo
- [ ] Tabelas possuem cabeçalhos marcados corretamente
- [ ] Ordem de leitura é lógica e linear
- [ ] Documento possui título definido nos metadados
- [ ] Contraste de cores atende mínimo 4.5:1
- [ ] Links possuem texto descritivo (não "clique aqui")
- [ ] Listas utilizam marcadores semânticos corretos

## Limitações

- Não converte documentos digitalizados (OCR) automaticamente
- Não recria conteúdo visual complexo
- Não garante acessibilidade de documentos protegidos
- Não valida contra todos os padrões PDF/UA

## Casos de Uso

- Criar relatório corporativo acessível em PDF
- Remediar documento Word para conformidade
- Preparar apresentação para audiência diversa
- Converter documento legado para formato acessível

## Casos onde NÃO utilizar

- Para adicionar legendas em vídeos (usar `@acessibilidade-conteudo`)
- Para implementar acessibilidade em apps (usar `@acessibilidade-aplicacoes`)
- Para criar documentação técnica de código (usar `@doc-writer`)
- Para testar aplicações web (usar `@acessibilidade-aplicacoes`)

## Exemplos

### Exemplo 1: Estrutura de cabeçalhos em Word

**Entrada:**
```markdown
# Relatório Anual
Informações gerais sobre a empresa.
## Resultados Financeiros
Lucros e despesas do ano.
### Primeiro Trimestre
Detalhes do Q1.
```

**Saída Esperada:**
```xml
<w:p>
  <w:pStyle w:val="Heading1"/>
  <w:r><w:t>Relatório Anual</w:t></w:r>
</w:p>
<w:p>
  <w:r><w:t>Informações gerais sobre a empresa.</w:t></w:r>
</w:p>
<w:p>
  <w:pStyle w:val="Heading2"/>
  <w:r><w:t>Resultados Financeiros</w:t></w:r>
</w:p>
<w:p>
  <w:r><w:t>Lucros e despesas do ano.</w:t></w:r>
</w:p>
<w:p>
  <w:pStyle w:val="Heading3"/>
  <w:r><w:t>Primeiro Trimestre</w:t></w:r>
</w:p>
```

### Exemplo 2: Texto alternativo para imagem

**Entrada:**
```html
<figure>
  <img src="grafico-vendas.png">
  <figcaption>Vendas 2024</figcaption>
</figure>
```

**Saída Esperada:**
```html
<figure role="group" aria-labelledby="fig-caption-1">
  <img
    src="grafico-vendas.png"
    alt="Gráfico de barras mostrando crescimento de vendas de 15% no Q1, 22% no Q2, 18% no Q3 e 31% no Q4 de 2024"
  >
  <figcaption id="fig-caption-1">Vendas 2024</figcaption>
</figure>
```
