#!/bin/bash
DATA=$(date '+%Y-%m-%d %H:%M:%S')
ARQUIVO="inventario_governanca.txt"

echo "=== INVENTÁRIO DE GOVERNANÇA DE SECRETS ===" > $ARQUIVO
echo "Data da Auditoria: $DATA" >> $ARQUIVO
echo "Repositório Alvo: $(gh repo view --json nameWithOwner -q .nameWithOwner)" >> $ARQUIVO
echo "Usuário Responsável (Actor): $(gh api user -q .login)" >> $ARQUIVO

echo -e "\n[ STATUS DOS SECRETS CADASTRADOS ]" >> $ARQUIVO
gh secret list >> $ARQUIVO

echo -e "\n[ REGISTRO DE IMAGENS DOCKER LOCAIS ]" >> $ARQUIVO
docker images devsecops-secrets-lab --format "table {{.Repository}}\t{{.Tag}}\t{{.CreatedAt}}" >> $ARQUIVO

echo -e "\n[ AUDITORIA CONCLUÍDA ]" >> $ARQUIVO

# Exibe o relatório gerado
cat $ARQUIVO
