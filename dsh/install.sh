#!/usr/bin/env bash
# Instala esta biblioteca no DeepSeek Harness: skills (projeto + usuário) e os
# agent presets no perfil do harness.
#
# Uso:
#   ./dsh/install.sh [--scope project|user|both] [--profile <nome>]
#                    [--dry-run] [--uninstall] [--no-agents]
set -euo pipefail

cd "$(dirname "$0")/.."

SCOPE=both
PROFILE="${DSH_PROFILE:-web}"
DRY=()
AGENTS=1
UNINSTALL=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --scope) SCOPE="${2:?--scope requer project|user|both}"; shift 2 ;;
    --profile) PROFILE="${2:?--profile requer um nome}"; shift 2 ;;
    --dry-run) DRY=(--dry-run); shift ;;
    --uninstall) UNINSTALL=1; DRY=(--uninstall); shift ;;
    --no-agents) AGENTS=0; shift ;;
    -h|--help) sed -n '2,7p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "opção desconhecida: $1" >&2; exit 1 ;;
  esac
done

if [[ $UNINSTALL -eq 0 ]]; then
  echo "==> Skills (escopo: $SCOPE)"
  node dsh/sync-skills.mjs --scope "$SCOPE" ${DRY[@]+"${DRY[@]}"}
fi

if [[ $AGENTS -eq 1 ]]; then
  echo "==> Agent presets ($PROFILE)"
  if [[ $UNINSTALL -eq 0 && ${#DRY[@]} -eq 0 ]]; then
    node dsh/agents/build-presets.mjs
  fi
  node dsh/agents/install.mjs --profile "$PROFILE" ${DRY[@]+"${DRY[@]}"}
fi

if [[ $UNINSTALL -eq 0 && ${#DRY[@]} -eq 0 ]]; then
  echo
  echo "Pronto. Reinicie o harness (dsh $PROFILE) e escolha o agente no seletor de presets."
  echo "Skills disponíveis: $(find ~/.dsh/skills -maxdepth 1 -mindepth 1 2>/dev/null | wc -l) no escopo usuário."
fi
