---
name: certificados
description: "Use when issuing or managing digital certificates with templates and QR codes. Use ONLY when the task is about certificates, not diplomas."
---

# Certificados

Emite, valida e gerencia certificados digitais e impressos com
modelos customizaveis, QR code e assinatura digital.

## Objetivo

Automatizar a emissao de certificados com integridade, validade
e rastreabilidade, garantindo conformidade com regras institucionais.

## Fluxo de Trabalho

1. Identificar tipo de certificado (curso, evento, palestra)
2. Definir regras de emissao (carga horaria, presenca, notas)
3. Selecionar ou criar modelo (layout, logos, campos)
4. Preencher dados do participante e do evento
5. Gerar QR code com hash de verificacao
6. Aplicar assinatura digital (certificado A1/A3)
7. Exportar em formato PDF ou digital (JSON/XML)
8. Disponibilizar para download ou envio automatico
9. Registrar emissao em log para auditoria
10. Validar certificado via QR code ou link

## Criterios de Qualidade

- [ ] Modelo possui campos obrigatorios (nome, curso, carga, data)
- [ ] QR code redireciona para pagina de validacao oficial
- [ ] Assinatura digital e valida e verificavel
- [ ] PDF e gerado em alta resolucao (minimo 300 DPI)
- [ ] Regras de emissao sao respeitadas (presenca minima, nota)
- [ ] Certificado possui numero unico de registro
- [ ] Log de emissao registra data, operador e hash
- [ ] Validacao online retorna dados corretos do certificado
- [ ] Nao ha duplicidade de numeros de registro

## Limitacoes

- Nao substitui certificado fisico com reconhecimento de firma
- Nao valida autenticidade de assinatura ICP-Brasil externa
- Nao emite diplomas de graduacao (usar sistema academico oficial)
- Depende de infraestrutura de PKI para assinatura digital
- Nao realiza integracao direta com sistemas externos sem API

## Casos de Uso

- Emitir certificados ao final de cursos e treinamentos
- Gerar certificados de palestras e eventos
- Validar certificados emitidos por terceiros
- Emitir certificados em lote para turmas
- Disponibilizar certificados digitais com QR code
- Auditar historico de emissoes

## Casos onde NAO utilizar

- Para emitir diplomas academicos (usar sistema academico)
- Para criar documentos sem validade institucional
- Para assinar documentos que exigem reconhecimento de firma
- Para gerar certificados sem regras de emissao definidas

## Exemplos

### Exemplo 1: Certificado de Curso

**Entrada:**
Curso: Python para Data Science - 40h
Participante: Maria Silva
Periodo: 01/06/2026 a 30/06/2026
Presenca: 92%

**Saida Esperada:**
```
# CERTIFICADO

Certifico que Maria Silva concluiu o curso "Python para Data Science"
com carga horaria de 40 horas, realizada no periodo de 01/06/2026
a 30/06/2026, com frequencia de 92%.

[QR Code]  [Assinatura Digital]

Registro: CERT-2026-001-0042
Data de Emissao: 01/07/2026
Responsavel: Instituto de Tecnologia
```

### Exemplo 2: Validacao por QR Code

**Entrada:**
QR code scaneado do certificado CERT-2026-001-0042

**Saida Esperada:**
```
Status: VALIDO
Registro: CERT-2026-001-0042
Participante: Maria Silva
Curso: Python para Data Science
Carga: 40h
Emissao: 01/07/2026
Hash: a1b2c3d4e5f6...
```
