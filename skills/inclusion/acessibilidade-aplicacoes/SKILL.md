---
name: acessibilidade-aplicacoes
description: "Use when implementing accessibility in mobile and desktop apps with WCAG. Use ONLY when the task is about app accessibility, not documents."
---

# Acessibilidade em Aplicações

Garante que aplicações mobile e desktop sejam utilizáveis por pessoas
com diversas habilidades e necessidades.

## Objetivo

Implementar e validar acessibilidade em aplicações seguindo diretrizes
WCAG, utilizando frameworks e testes automatizados e manuais.

## Fluxo de Trabalho

1. Identificar plataforma e stack tecnológica da aplicação
2. Mapear componentes de interface que requerem acessibilidade
3. Aplicar padrões WCAG 2.1 AA para elementos interativos
4. Implementar suporte a leitores de tela (TalkBack, VoiceOver)
5. Configurar navegação por teclado e alternância de foco
6. Adicionar rótulos, descrições e estados para elementos
7. Implementar contraste de cores e tamanhos de toque
8. Executar testes automatizados de acessibilidade
9. Realizar testes manuais com assistivas
10. Documentar achados e corrigir violações

## Critérios de Qualidade

- [ ] Todos os elementos interativos possuem rótulos acessíveis
- [ ] Navegação por teclado funciona completamente
- [ ] Contraste de cores atende WCAG 2.1 AA (4.5:1 texto, 3:1 UI)
- [ ] Leitores de tela anunciam estados corretamente
- [ ] Tamanhos de toque mínimos de 44x44 pontos
- [ ] Foco visível e claro em todos os elementos
- [ ] Alternativas textuais existem para conteúdo não textual
- [ ] Mensagens de erro são descritivas e acessíveis

## Limitações

- Não audita conformidade completa com relatórios oficiais
- Não substitui avaliação por usuários com deficiência
- Não implementa funcionalidades de hardware específico
- Não cobre testes de performance ou segurança

## Casos de Uso

- Implementar acessibilidade em aplicativo mobile novo
- Auditar aplicação desktop existente
- Corrigir violações WCAG identificadas em testes
- Integrar testes automatizados de acessibilidade no CI/CD

## Casos onde NÃO utilizar

- Para documentar acessibilidade de PDFs (usar `@acessibilidade-documentos`)
- Para adicionar legendas em vídeos (usar `@acessibilidade-conteudo`)
- Para testar performance da aplicação
- Para implementar internacionalização

## Exemplos

### Exemplo 1: Rótulo acessível em componente React Native

**Entrada:**
```jsx
<TouchableOpacity>
  <Image source={icon} />
</TouchableOpacity>
```

**Saída Esperada:**
```jsx
<TouchableOpacity
  accessible={true}
  accessibilityLabel="Adicionar item ao carrinho"
  accessibilityRole="button"
>
  <Image
    source={icon}
    accessibilityElementsHidden={true}
  />
</TouchableOpacity>
```

### Exemplo 2: Teste automatizado com Axe

**Entrada:**
```javascript
describe("Formulário de Login", () => {
  it("deve ter campos acessíveis", () => {
    cy.visit("/login");
    cy.injectAxe();
    cy.checkA11y();
  });
});
```

**Saída Esperada:**
```javascript
describe("Formulário de Login", () => {
  it("deve ter campos acessíveis", () => {
    cy.visit("/login");
    cy.injectAxe();
    cy.checkA11y("form", {
      rules: {
        "color-contrast": { enabled: true },
        "label": { enabled: true },
        "keyboard": { enabled: true },
      },
    });
  });
});
```
