#!/bin/bash

# Script para instalar as skills em um novo computador
# Uso: ./install.sh SEU-USERNAME

set -e

USERNAME=$1
REPO_NAME="opencode-skills-library"
TARGET_DIR="$HOME/.config/opencode/skills"

if [ -z "$USERNAME" ]; then
    echo "❌ Uso: ./install.sh SEU-USERNAME"
    echo "   Exemplo: ./install.sh joao"
    exit 1
fi

echo "📦 Instalando skills do OpenCode..."
echo "   Repositório: https://github.com/$USERNAME/$REPO_NAME"
echo ""

# Verificar se o diretório alvo já existe
if [ -d "$TARGET_DIR" ]; then
    echo "⚠️  Diretório $TARGET_DIR já existe."
    read -p "   Deseja sobrescrever? (s/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        echo "🗑️  Removendo diretório antigo..."
        rm -rf "$TARGET_DIR"
    else
        echo "❌ Instalação cancelada."
        exit 1
    fi
fi

# Clonar repositório
echo "📥 Baixando skills..."
git clone "https://github.com/$USERNAME/$REPO_NAME.git" "$TARGET_DIR"

echo ""
echo "✅ Skills instaladas com sucesso!"
echo ""
echo "📊 Estatísticas:"
find "$TARGET_DIR" -name "SKILL.md" | wc -l | xargs echo "   Skills:"
find "$TARGET_DIR" -name "SKILL.md" | wc -l | xargs -I {} echo "   Arquivos SKILL.md: {}"
echo ""
echo "📌 Para atualizar:"
echo "   cd $TARGET_DIR && git pull"
echo ""
echo "📌 Para usar:"
echo "   opencode"
