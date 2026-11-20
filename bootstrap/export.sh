#!/usr/bin/env bash
# Exporta configs, skills, código local-only e segredos CRIPTOGRAFADOS
# para um bundle portátil (desktop -> notebook).
#
# Uso:
#   ./bootstrap/export.sh [--out DIR] [--force] [--passphrase-file ARQ]
#
# A origem NÃO é modificada. O bundle gerado contém apenas `secrets.gpg`
# para dados sensíveis; nunca grava .env/keys em texto puro.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="$(cd "$SCRIPT_DIR/.." && pwd)"
KODE_DIR="$(cd "$REPO/.." && pwd)"
OTICA_DIR="$KODE_DIR/otica26"

# shellcheck source=lib.sh
source "$SCRIPT_DIR/lib.sh"

OUT_ROOT="${KODE_EXPORT_DIR:-$KODE_DIR}"
FORCE=0
PASSPHRASE_FILE="${KODE_PASSPHRASE_FILE:-}"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --out) OUT_ROOT="${2:?--out requer um diretório}"; shift 2 ;;
    --force) FORCE=1; shift ;;
    --passphrase-file) PASSPHRASE_FILE="${2:?--passphrase-file requer um arquivo}"; shift 2 ;;
    -h|--help) sed -n '2,9p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) die "opção desconhecida: $1" ;;
  esac
done

need_cmd gpg
need_cmd tar
need_cmd opencode
[[ -d "$OTICA_DIR" ]] || die "não encontrei o projeto em $OTICA_DIR"

TS="$(date +%Y%m%d-%H%M%S)"
NAME="kode-migration-$TS"
BUNDLE_DIR="$OUT_ROOT/$NAME"
ARCHIVE="$OUT_ROOT/$NAME.tar.gz"

if [[ -e "$BUNDLE_DIR" || -e "$ARCHIVE" ]] && (( ! FORCE )); then
  die "já existe $NAME (use --force para recriar)"
fi

TMP="$(mktemp -d "${TMPDIR:-/tmp}/kode-export.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT
umask 077

log "origem: $KODE_DIR"
mkdir -p "$BUNDLE_DIR"/{bootstrap,config/opencode,config/dsh,skills,otica-local,secrets}

# --- 1. os próprios scripts viajam no bundle ---
copy_tree "$SCRIPT_DIR" "$BUNDLE_DIR/bootstrap"

# --- 2. configs públicas do OpenCode/dsh (whitelist; sem segredos) ---
for f in opencode.json opencode.jsonc tui.json cli.json package.json package-lock.json; do
  if [[ -f "$HOME/.config/opencode/$f" ]]; then
    cp -p "$HOME/.config/opencode/$f" "$BUNDLE_DIR/config/opencode/$f"
  else
    warn "config ausente (pulada): ~/.config/opencode/$f"
  fi
done
for f in cordis.yml cordis.patch.yml package.json pnpm-workspace.yaml; do
  if [[ -f "$HOME/.dsh/profiles/web/$f" ]]; then
    cp -p "$HOME/.dsh/profiles/web/$f" "$BUNDLE_DIR/config/dsh/$f"
  else
    warn "config dsh ausente (pulada): ~/.dsh/profiles/web/$f"
  fi
done

# --- 3. biblioteca de skills (working tree; inclui alterações não commitadas) ---
copy_tree "$REPO" "$BUNDLE_DIR/skills" \
  --exclude=.git --exclude=node_modules --exclude=.dsh --exclude=.tmp

# --- 4. arquivos locais do otica26 que não estão no GitHub ---
shopt -s nullglob
for f in "$OTICA_DIR"/*.md "$OTICA_DIR"/*.txt; do
  cp -p "$f" "$BUNDLE_DIR/otica-local/"
done
shopt -u nullglob
for d in qa docs de trabalho; do
  if [[ -d "$OTICA_DIR/$d" ]]; then
    copy_tree "$OTICA_DIR/$d" "$BUNDLE_DIR/otica-local/$d" \
      --exclude=node_modules --exclude=.git --exclude=dist
  fi
done

cat > "$BUNDLE_DIR/repos.tsv" <<EOF
frontend|https://github.com/andrelobo/otica-amazonia-frontend.git|\$KODE_TARGET/otica26/OTICA26-frontend
backend|https://github.com/andrelobo/otica-amazonia-api.git|\$KODE_TARGET/otica26/OTICA26-BACKEND/otica-amazonia-api
EOF

# --- 5. segredos -> tar -> gpg AES256 ---
if [[ -n "$PASSPHRASE_FILE" ]]; then export KODE_PASSPHRASE_FILE="$PASSPHRASE_FILE"; fi
PASSFILE="$TMP/passphrase"
read_passphrase "$PASSFILE" "criptografar o bundle"
SECRETS="$TMP/secrets"
mkdir -p "$SECRETS"/{opencode,dsh,otica/backend,otica/api,extras}

opencode auth export > "$SECRETS/opencode/auth.json"
chmod 600 "$SECRETS/opencode/auth.json"
log "credenciais OpenCode exportadas para o bundle criptografado"

add_secret() {
  local src="$1" rel="$2" dest="$3" mode="$4"
  [[ -f "$src" ]] || { warn "segredo ausente (pulado): $src"; return 0; }
  cp -p "$src" "$SECRETS/$rel"
  chmod 600 "$SECRETS/$rel"
  printf '%s\t%s\t%s\n' "$rel" "$dest" "$mode" >> "$SECRETS/MAP.tsv"
}

: > "$SECRETS/MAP.tsv"
printf '%s\t%s\t%s\n' \
  'opencode/auth.json' '-' '-' >> "$SECRETS/MAP.tsv"

add_secret "$HOME/.config/opencode/service.json" \
  'opencode/service.json' '$HOME/.config/opencode/service.json' 600
add_secret "$HOME/.dsh/.credentials.yaml" \
  'dsh/.credentials.yaml' '$HOME/.dsh/.credentials.yaml' 600
add_secret "$OTICA_DIR/OTICA26-BACKEND/otica-amazonia-api/.env" \
  'otica/backend/.env' \
  '$KODE_TARGET/otica26/OTICA26-BACKEND/otica-amazonia-api/.env' 600
add_secret "$OTICA_DIR/OTICA26-BACKEND/otica-amazonia-api/atlas-credentials.env" \
  'otica/backend/atlas-credentials.env' \
  '$KODE_TARGET/otica26/OTICA26-BACKEND/otica-amazonia-api/atlas-credentials.env' 600
add_secret "$OTICA_DIR/OTICA26-frontend/apps/api/.env.local" \
  'otica/api/.env.local' \
  '$KODE_TARGET/otica26/OTICA26-frontend/apps/api/.env.local' 600

if [[ -f "$HOME/.codex/auth.json" ]]; then
  add_secret "$HOME/.codex/auth.json" \
    'extras/codex-auth.json' '$HOME/.codex/auth.json' 600
fi
if [[ -f "$HOME/.npmrc" ]]; then
  add_secret "$HOME/.npmrc" 'extras/npmrc' '$HOME/.npmrc' 600
fi
if [[ -f "$HOME/.git-credentials" ]]; then
  add_secret "$HOME/.git-credentials" \
    'extras/git-credentials' '$HOME/.git-credentials' 600
fi

tar -C "$SECRETS" -cf "$TMP/secrets.tar" .
gpg_encrypt "$TMP/secrets.tar" "$BUNDLE_DIR/secrets.gpg" "$PASSFILE"
rm -f "$TMP/secrets.tar"
log "segredos criptografados: secrets.gpg"

# --- 6. integridade e checagem de que nada sensível ficou plano ---
(
  cd "$BUNDLE_DIR"
  find . -type f ! -name MANIFEST.sha256 -print0 \
    | sort -z | xargs -0 sha256sum > MANIFEST.sha256
)

if find "$BUNDLE_DIR" -type f \
    \( -name '*.env' -o -name '.env*' -o -name 'auth.json' \
       -o -name '.credentials.yaml' -o -name 'service.json' \
       -o -name '.npmrc' -o -name '.git-credentials' \) \
    | grep -q .; then
  die "vazamento detectado: arquivo sensível em texto puro no bundle"
fi

tar -C "$OUT_ROOT" -czf "$ARCHIVE" "$NAME"
log "bundle criado: $ARCHIVE"
log "transporte: USB ou canal seguro; NUNCA commite o .tar.gz"
log "instalação no notebook: ./bootstrap/install.sh --bundle <arquivo> (dry-run) e depois --apply"
