# KODE Bootstrap — desktop → notebook

Exporta e instala, de forma repetível e segura:

- configs do OpenCode (`opencode.json`, `opencode.jsonc`, `tui.json`, `cli.json`);
- modelo preferido (está no `opencode.jsonc`) **e as credenciais dos provedores**
  (via `opencode auth export/import` — DeepSeek e Nvidia);
- as 90 skills desta biblioteca (working tree atual, incluindo a integração `dsh/`);
- perfil do DeepSeek Harness (`cordis.yml` + presets de agentes) e links de skills;
- código local do Ótica: repos clonados do GitHub + `qa/`, `docs/`, `HANDOFF.md`, etc.;
- `.env`, `atlas-credentials.env`, `.env.local` da API, `.credentials.yaml` do dsh,
  `service.json`, `.codex/auth.json`, `.npmrc`, `.git-credentials` (quando existem).

## Segurança

- **Nada sensível vai em texto puro.** Tudo é empacotado em `secrets.gpg`
  (GPG simétrico AES-256) e o export falha se detectar `.env`/`auth.json` fora do
  criptografado.
- A senha é pedida com `read -s` (ou via `KODE_PASSPHRASE_FILE` em automação).
  Não vai para o histórico do shell.
- `umask 077` nos temporários; `.env` e chaves instalados com modo `600`.
- O install é **dry-run por padrão**; só grava com `--apply`.
- Antes de sobrescrever qualquer arquivo, faz backup em
  `~/.kode-bootstrap-backups/<timestamp>/`.
- Nunca apaga diretórios nem mexe em repos que já existem no notebook.
- Não commite o `.tar.gz` nem o `.gpg`. Use USB ou canal privado.

## 1. No desktop (origem)

```bash
cd "/home/lobo/Área de trabalho/KODE/opencode-skills-lobo"
chmod +x bootstrap/*.sh
./bootstrap/export.sh --out /tmp/opencode
# pede a senha do bundle; gera:
#   /tmp/opencode/kode-migration-YYYYMMDD-HHMMSS.tar.gz
```

Dica para automação sem digitar a senha (arquivo temporário, apague depois):

```bash
printf '%s' 'senha-forte-aqui' > /tmp/opencode/.kode-pass
chmod 600 /tmp/opencode/.kode-pass
./bootstrap/export.sh --out /tmp/opencode --passphrase-file /tmp/opencode/.kode-pass
shred -u /tmp/opencode/.kode-pass
```

A origem não é modificada. O bundle contém os próprios scripts em `bootstrap/`.

## 2. Transporte

Copie apenas o `.tar.gz` para o notebook (USB, disco, scp). **Não** use GitHub
com o bundle, mesmo criptografado, se quiser defesa em profundidade.

## 3. No notebook (destino)

Precisa de: `bash`, `tar`, `sha256sum`, `gpg`, `git`, `node`, `opencode` e `npm`
(só com `--deps`).

```bash
# 1) simulação — não grava nada
./bootstrap/install.sh --bundle /caminho/kode-migration-XXXX.tar.gz

# 2) aplicação
./bootstrap/install.sh --bundle /caminho/kode-migration-XXXX.tar.gz --apply

# 3) opcional: instalar dependências npm
./bootstrap/install.sh --bundle /caminho/kode-migration-XXXX.tar.gz --apply --deps
```

Se o destino não for `~/KODE`: `--target /outro/lugar/KODE`.
Se não quiser importar chaves: `--skip-secrets`.

Depois: reinicie o OpenCode e o dsh (perfil `web`). O `opencode.jsonc` restaura
o modelo `nvidia/nvidia/nemotron-3.5-lightning-30b-a3b`; se o provedor mudar de
nome, edite esse arquivo no notebook.

## 4. Verificação pós-instalação

```bash
opencode --version
opencode auth list                 # mostra DeepSeek / Nvidia (sem segredos)
find ~/.dsh/skills -mindepth 1 -maxdepth 1 | wc -l   # ~90
git -C ~/KODE/otica26/OTICA26-frontend status --short --branch
git -C ~/KODE/otica26/OTICA26-BACKEND/otica-amazonia-api status --short --branch
```

## Sem regressão — o que o script NÃO faz

- não apaga nem substitui repositórios existentes;
- não roda `git reset`, `git pull` ou `npm install` sem `--deps`;
- não remove arquivos não listados no bundle;
- não altera a arquitetura do projeto nem o modelo configurado;
- não conserta nem esconde o **problema pré-existente** do frontend:
  `npm run typecheck`/`test:ci` falham porque `cliente.service.spec.ts` não
  informa `dataVenda` e `loja` (ver `HANDOFF.md`). Isso é independente da mudança
  de máquina e deve ser tratado à parte.
