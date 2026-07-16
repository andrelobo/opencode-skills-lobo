#!/bin/bash

# Script para configurar e fazer push do repositório para GitHub
# Uso: ./setup-github.sh SEU-USERNAME

set -e

USERNAME=$1
REPO_NAME="opencode-skills-library"

if [ -z "$USERNAME" ]; then
    echo "❌ Uso: ./setup-github.sh SEU-USERNAME"
    echo "   Exemplo: ./setup-github.sh joao"
    exit 1
fi

echo "📦 Configurando repositório: $REPO_NAME"
echo ""

# Verificar se gh está instalado
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) não está instalado."
    echo "   Instale: https://cli.github.com/"
    exit 1
fi

# Verificar se está autenticado
if ! gh auth status &> /dev/null; then
    echo "❌ Não está autenticado no GitHub."
    echo "   Execute: gh auth login"
    exit 1
fi

echo "✅ GitHub CLI encontrado e autenticado"
echo ""

# Criar repositório no GitHub
echo "🔧 Criando repositório no GitHub..."
gh repo create $REPO_NAME --public --description "Biblioteca de 90+ skills para OpenCode" --source=. --push

echo ""
echo "✅ Repositório criado com sucesso!"
echo ""
echo "📌 Próximos passos:"
echo "   1. Acesse: https://github.com/$USERNAME/$REPO_NAME"
echo "   2. Para atualizar: git push"
echo "   3. Para clonar em outro PC:"
echo "      git clone https://github.com/$USERNAME/$REPO_NAME.git ~/.config/opencode/skills"
