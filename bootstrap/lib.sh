#!/usr/bin/env bash
# Funções compartilhadas pelos scripts de migração KODE.
# Nunca imprime valores de segredos — apenas caminhos e status.

DRY_RUN="${DRY_RUN:-1}"
BACKUP_ROOT="${BACKUP_ROOT:-}"

log()  { printf '[kode] %s\n' "$*"; }
warn() { printf '[kode] AVISO: %s\n' "$*" >&2; }
die()  { printf '[kode] ERRO: %s\n' "$*" >&2; exit 1; }

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || die "comando obrigatório ausente: $1"
}

backup_path() {
  local path="$1"
  [[ -e "$path" || -L "$path" ]] || return 0
  [[ -n "$BACKUP_ROOT" ]] || return 0
  local dest="$BACKUP_ROOT${path}"
  mkdir -p "$(dirname "$dest")"
  cp -a "$path" "$dest"
  log "backup: $path -> $dest"
}

install_file() {
  local src="$1" dest="$2" mode="${3:-0644}"
  [[ -f "$src" ]] || die "arquivo de origem ausente: $src"
  if [[ -e "$dest" || -L "$dest" ]]; then
    if cmp -s "$src" "$dest"; then
      log "igual (sem alteração): $dest"
      return 0
    fi
    if (( DRY_RUN )); then
      log "dry-run: instalaria $src -> $dest (modo $mode; backup de $dest)"
      return 0
    fi
    backup_path "$dest"
  fi
  if (( DRY_RUN )); then
    log "dry-run: instalaria $src -> $dest (modo $mode)"
    return 0
  fi
  mkdir -p "$(dirname "$dest")"
  install -m "$mode" "$src" "$dest"
  log "instalado: $dest"
}

install_tree() {
  local src="$1" dst="$2" path rel target
  [[ -d "$src" ]] || die "diretório de origem ausente: $src"
  while IFS= read -r -d '' path; do
    rel="${path#"$src"/}"
    target="$dst/$rel"
    if [[ -e "$target" || -L "$target" ]]; then
      if cmp -s "$path" "$target"; then continue; fi
      if (( DRY_RUN )); then
        log "dry-run: instalaria $rel -> $target (backup de $target)"
        continue
      fi
      backup_path "$target"
    fi
    if (( DRY_RUN )); then
      log "dry-run: instalaria $rel -> $target"
      continue
    fi
    mkdir -p "$(dirname "$target")"
    cp -a "$path" "$target"
  done < <(find "$src" -type f -print0)
}

copy_tree() {
  local src="$1" dst="$2"
  shift 2
  mkdir -p "$dst"
  tar -C "$src" "$@" -cf - . | tar -C "$dst" -xf -
}

verify_file() {
  local src="$1" dest="$2"
  if [[ -f "$dest" ]] && cmp -s "$src" "$dest"; then
    log "verificado: $dest"
  else
    warn "divergente ou ausente: $dest"
    return 1
  fi
}

read_passphrase() {
  local out="$1" label="${2:-segredos}" pass=""
  if [[ -n "${KODE_PASSPHRASE_FILE:-}" ]]; then
    cp -p "$KODE_PASSPHRASE_FILE" "$out"
    chmod 600 "$out"
    return 0
  fi
  if [[ -t 0 ]]; then
    read -rsp "Senha para $label: " pass
    printf '\n'
  else
    die "sem TTY: defina KODE_PASSPHRASE_FILE com um arquivo de senha temporário"
  fi
  printf '%s\n' "$pass" > "$out"
  chmod 600 "$out"
  unset pass
}

gpg_encrypt() {
  local input="$1" output="$2" passfile="$3"
  gpg --batch --yes --pinentry-mode loopback \
    --passphrase-file "$passfile" \
    --symmetric --cipher-algo AES256 \
    --output "$output" "$input"
}

gpg_decrypt() {
  local input="$1" output="$2" passfile="$3"
  gpg --batch --yes --pinentry-mode loopback \
    --passphrase-file "$passfile" \
    --decrypt "$input" > "$output"
}
