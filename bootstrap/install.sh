#!/usr/bin/env bash
# Instala o bundle KODE no notebook.
# Padrão: DRY-RUN (nada é gravado). Use --apply para executar.
#
# Uso:
#   ./install.sh --bundle /caminho/kode-migration-XXXX.tar.gz
#   ./install.sh --bundle /caminho/kode-migration-XXXX.tar.gz --apply
#   ./install.sh --bundle ... --apply --deps
#
# Segurança: faz backup de tudo que sobrescreve, nunca apaga diretórios,
# descripsiona segredos em dir 700 e instala .env/keys com modo 600.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BUNDLE=""
TARGET="${KODE_TARGET:-$HOME/KODE}"
APPLY=0
DEPS=0
SKIP_SECRETS=0
PASSPHRASE_FILE="${KODE_PASSPHRASE_FILE:-}"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --bundle) BUNDLE="${2:?--bundle requer arquivo .tar.gz ou diretório}"; shift 2 ;;
    --target) TARGET="${2:?--target requer um diretório}"; shift 2 ;;
    --apply) APPLY=1; shift ;;
    --deps) DEPS=1; shift ;;
    --skip-secrets) SKIP_SECRETS=1; shift ;;
    --passphrase-file) PASSPHRASE_FILE="${2:?--passphrase-file requer um arquivo}"; shift 2 ;;
    -h|--help) sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) printf '[kode] ERRO: opção desconhecida: %s\n' "$1" >&2; exit 1 ;;
  esac
done

[[ -n "$BUNDLE" ]] || { printf '[kode] ERRO: --bundle é obrigatório\n' >&2; exit 1; }
DRY_RUN=$(( 1 - APPLY ))
export DRY_RUN

# shellcheck source=lib.sh
source "$SCRIPT_DIR/lib.sh"
need_cmd tar
need_cmd sha256sum

TMP="$(mktemp -d "${TMPDIR:-/tmp}/kode-install.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT
umask 077

BACKUP_ROOT="$HOME/.kode-bootstrap-backups/$(date +%Y%m%d-%H%M%S)"

if [[ -f "$BUNDLE" ]]; then
  mkdir -p "$TMP/bundle"
  tar -xzf "$BUNDLE" -C "$TMP/bundle"
  mapfile -t roots < <(find "$TMP/bundle" -mindepth 1 -maxdepth 1 -type d)
  (( ${#roots[@]} == 1 )) || die "bundle inválido: esperado 1 diretório, achado ${#roots[@]}"
  SRC="${roots[0]}"
elif [[ -d "$BUNDLE" ]]; then
  SRC="$BUNDLE"
else
  die "bundle não encontrado: $BUNDLE"
fi

[[ -f "$SRC/MANIFEST.sha256" ]] || die "MANIFEST.sha256 ausente no bundle"
( cd "$SRC" && sha256sum -c MANIFEST.sha256 >/dev/null )
log "integridade do bundle: OK"

if (( DRY_RUN )); then
  log "===== DRY-RUN (nenhuma alteração será feita) ====="
else
  log "===== APLICAÇÃO (backups em $BACKUP_ROOT) ====="
fi
log "destino: $TARGET"

# --- 1. configs do OpenCode ---
for f in opencode.json opencode.jsonc tui.json cli.json package.json package-lock.json; do
  [[ -f "$SRC/config/opencode/$f" ]] || continue
  install_file "$SRC/config/opencode/$f" "$HOME/.config/opencode/$f" 0644
done

# --- 2. perfil do dsh ---
for f in cordis.yml cordis.patch.yml package.json pnpm-workspace.yaml; do
  [[ -f "$SRC/config/dsh/$f" ]] || continue
  install_file "$SRC/config/dsh/$f" "$HOME/.dsh/profiles/web/$f" 0644
done

# --- 3. biblioteca de skills (fonte da verdade) + cópia usada pelo OpenCode ---
install_tree "$SRC/skills" "$TARGET/opencode-skills-lobo"
install_tree "$SRC/skills" "$HOME/.config/opencode/skills"

# --- 4. links planos do dsh: remover apenas links quebrados/antigos ---
shopt -s nullglob
for link in "$HOME/.dsh/skills"/*; do
  [[ -L "$link" ]] || continue
  if [[ ! -e "$link" ]] || [[ "$(readlink "$link")" == *"/opencode-skills-lobo/"* ]]; then
    if (( DRY_RUN )); then
      log "dry-run: reescreveria link dsh: $(basename "$link")"
      continue
    fi
    backup_path "$link"
    rm -f "$link"
    log "link dsh reescrito: $(basename "$link")"
  fi
done
shopt -u nullglob

if (( DRY_RUN )); then
  log "dry-run: node dsh/sync-skills.mjs --scope both --dry-run"
elif command -v node >/dev/null 2>&1; then
  ( cd "$TARGET/opencode-skills-lobo" && node dsh/sync-skills.mjs --scope both )
else
  warn "node ausente; rode 'node dsh/sync-skills.mjs' manualmente"
fi

# --- 5. repositórios: clonar se faltam; se existem, NÃO mexer ---
while IFS='|' read -r name url rel; do
  [[ -n "${name:-}" ]] || continue
  dest="${rel//'$KODE_TARGET'/$TARGET}"
  if [[ -d "$dest/.git" ]]; then
    log "repo já existe (intacto): $name -> $dest"
    git -C "$dest" status --short | head -5
  elif (( DRY_RUN )); then
    log "dry-run: git clone $url -> $dest"
  else
    mkdir -p "$(dirname "$dest")"
    git clone "$url" "$dest"
    log "clonado: $name -> $dest"
  fi
done < "$SRC/repos.tsv"

# --- 6. arquivos locais do otica26 (qa, docs, HANDOFF etc.) ---
install_tree "$SRC/otica-local" "$TARGET/otica26"

# --- 7. segredos ---
if (( SKIP_SECRETS )); then
  log "segredos ignorados (--skip-secrets)"
elif [[ -f "$SRC/secrets.gpg" ]]; then
  need_cmd gpg
  need_cmd opencode
  if [[ -n "$PASSPHRASE_FILE" ]]; then export KODE_PASSPHRASE_FILE="$PASSPHRASE_FILE"; fi
  PASSFILE="$TMP/passphrase"
  read_passphrase "$PASSFILE" "descriptografar o bundle"
  mkdir -p "$TMP/secrets"
  gpg_decrypt "$SRC/secrets.gpg" "$TMP/secrets.tar" "$PASSFILE"
  tar -C "$TMP/secrets" -xf "$TMP/secrets.tar"
  rm -f "$TMP/secrets.tar"

  while IFS=$'\t' read -r rel dest mode; do
    [[ -n "${rel:-}" ]] || continue
    src="$TMP/secrets/$rel"
    [[ -f "$src" ]] || { warn "arquivo de segredo ausente no bundle: $rel"; continue; }
    if [[ "$dest" == "-" ]]; then
      if (( DRY_RUN )); then
        log "dry-run: opencode auth import $rel"
      else
        opencode auth import "$src"
        log "credenciais OpenCode importadas"
      fi
      continue
    fi
    dest="${dest//'$HOME'/$HOME}"
    dest="${dest//'$KODE_TARGET'/$TARGET}"
    install_file "$src" "$dest" "${mode:-600}"
  done < "$TMP/secrets/MAP.tsv"
else
  warn "secrets.gpg ausente no bundle (segredos não instalados)"
fi

# --- 8. dependências (opcional) ---
if (( DEPS && ! DRY_RUN )); then
  for pkg in \
    "$TARGET/otica26/OTICA26-frontend" \
    "$TARGET/otica26/OTICA26-frontend/apps/api" \
    "$TARGET/otica26/OTICA26-BACKEND/otica-amazonia-api" \
    "$TARGET/otica26/qa"; do
    if [[ -f "$pkg/package-lock.json" ]]; then
      log "npm ci: $pkg"
      npm ci --prefix "$pkg"
    fi
  done
elif (( DEPS )); then
  log "dry-run: npm ci nos 4 pacotes"
fi

# --- 9. verificação final ---
if (( ! DRY_RUN )); then
  failed=0
  for f in opencode.json opencode.jsonc tui.json cli.json; do
    [[ -f "$SRC/config/opencode/$f" ]] || continue
    verify_file "$SRC/config/opencode/$f" "$HOME/.config/opencode/$f" || failed=1
  done
  log "skills no escopo usuário: $(find "$HOME/.dsh/skills" -mindepth 1 -maxdepth 1 2>/dev/null | wc -l)"
  if command -v opencode >/dev/null 2>&1; then
    log "provedores OpenCode:"
    opencode auth list 2>/dev/null || warn "falha ao listar credenciais"
  fi
  (( failed == 0 )) || warn "algumas verificações divergiram — veja backups em $BACKUP_ROOT"
fi

if (( DRY_RUN )); then
  log "dry-run concluído. Para aplicar: $0 --bundle '$BUNDLE' --apply"
else
  log "instalação concluída. Backups: $BACKUP_ROOT"
  log "reinicie o OpenCode e o dsh (perfil web) para carregar configs/skills."
fi
