#!/bin/bash
echo "[+] Iniciando política de rotação automática de credenciais..."

# Gera uma senha aleatória de 24 caracteres via OpenSSL
NOVA_SENHA=$(openssl rand -base64 24)

# Atualiza o segredo diretamente no provedor da nuvem via CLI
gh secret set DATABASE_PASSWORD -b"$NOVA_SENHA"

echo "[+] SUCESSO: DATABASE_PASSWORD rotacionado com segurança no GitHub Secrets."
echo "[+] Auditoria do Cofre atualizada:"
gh secret list | grep DATABASE_PASSWORD
