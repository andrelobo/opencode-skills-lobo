#!/bin/bash

# Script para sincronizar skills entre computadores
# Uso: ./sync.sh [push|pull]

set -e

SKILLS_DIR="$HOME/.config/opencode/skills"
ACTION=${1:-status}

cd "$SKILLS_DIR" || { echo "❌ Diretório não encontrado: $SKILLS_DIR"; exit 1; }

case $ACTION in
    push)
        echo "📤 Enviando mudanças para o GitHub..."
        git add .
        git commit -m "Sync: $(date +%Y-%m-%d\ %H:%M)" || echo "⚠️  Nenhuma mudança para enviar"
        git push
        echo "✅ Sincronização concluída!"
        ;;
    pull)
        echo "📥 Baixando mudanças do GitHub..."
        git pull
        echo "✅ Sincronização concluída!"
        ;;
    status)
        echo "📊 Status das skills:"
        echo ""
        echo "📁 Diretório: $SKILLS_DIR"
        echo "🔢 Skills: $(find . -name 'SKILL.md' | wc -l)"
        echo "📝 Mudanças pendentes:"
        git status --short
        echo ""
        echo "📌 Uso:"
        echo "   ./sync.sh push   # Enviar mudanças"
        echo "   ./sync.sh pull   # Baixar mudanças"
        ;;
    *)
        echo "❌ Ação inválida: $ACTION"
        echo "   Uso: ./sync.sh [push|pull|status]"
        exit 1
        ;;
esac
