---
name: linux
description: "Use when working with Linux systems, shell, permissions, and systemd. Use ONLY when the task is about Linux admin, not CI/CD."
---

# Linux

Gerenciar sistemas Linux, incluindo comandos essenciais, permissoes,
processos, shell scripting, systemd, logs e pacotes.

## Objetivo

Administrar servidores Linux de forma eficiente e segura seguindo
boas praticas de administracao de sistemas.

## Fluxo de Trabalho

1. Identificar a tarefa e comandos necessarios
2. Verificar permissoes e contexto de execucao
3. Executar comandos com dry-run quando possivel
4. Validar saida e logs
5. Automatizar com shell scripts quando repetitivo
6. Documentar alteracoes realizadas

## Criterios de Qualidade

- [ ] Comandos sao executados com o usuario correto
- [ ] Permissoes de arquivos estao adequadas
- [ ] Processos sao gerenciados via systemd
- [ ] Logs sao verificados apos alteracoes
- [ ] Scripts possuem error handling (set -e)
- [ ] Pacotes sao instalados de fontes oficiais

## Limitacoes

- Nao faz DevOps (usar `@devops`)
- Nao faz CI/CD (usar `@ci-cd`)
- Nao faz deploy (usar `@deploy`)
- Nao depende de plugins ou MCP servers
- Comandos especificos de distribuicao podem variar

## Casos de Uso

- Diagnosticar problemas de performance
- Configurar servicos com systemd
- Gerenciar usuarios e permissoes
- Automatizar tarefas com shell script
- Analisar logs do sistema

## Casos onde NAO utilizar

- Para containerizacao (usar `@docker`)
- Para CI/CD pipeline (usar `@ci-cd`)
- Para deploy em nuvem (usar `@deploy`)

## Exemplos

### Exemplo 1: Systemd service

**Entrada:**
```
Criar servico systemd para aplicacao Node.js
```

**Saida Esperada:**
```ini
[Unit]
Description=My Node.js Application
After=network.target

[Service]
Type=simple
User=nodeapp
WorkingDirectory=/opt/myapp
ExecStart=/usr/bin/node /opt/myapp/dist/main.js
Restart=always
RestartSec=5
Environment=NODE_ENV=production
EnvironmentFile=/opt/myapp/.env

[Install]
WantedBy=multi-user.target
```

### Exemplo 2: Shell script com error handling

**Entrada:**
```
Criar script de backup com logging
```

**Saida Esperada:**
```bash
#!/bin/bash
set -euo pipefail

BACKUP_DIR="/backup"
SOURCE_DIR="/data"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="/var/log/backup.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "Iniciando backup..."

if [ ! -d "$SOURCE_DIR" ]; then
    log "ERRO: Diretorio $SOURCE_DIR nao encontrado"
    exit 1
fi

tar -czf "${BACKUP_DIR}/backup_${TIMESTAMP}.tar.gz" \
    -C "$SOURCE_DIR" .

log "Backup concluido: backup_${TIMESTAMP}.tar.gz"
```
