import os
import sys

# Captura as variáveis do espaço de ambiente do Sistema Operacional
# O segundo argumento é o fallback (valor padrão) caso a variável não exista
DATABASE_USER = os.getenv("DATABASE_USER")
DATABASE_PASSWORD = os.getenv("DATABASE_PASSWORD")
API_TOKEN = os.getenv("API_TOKEN")

print("--- SecureBank Analytics S.A. ---")
print("[+] Inicializando rotinas de conexão...")

# Validação defensiva: Se as credenciais não foram injetadas, a aplicação "quebra" de propósito.
if not all([DATABASE_USER, DATABASE_PASSWORD, API_TOKEN]):
    print("[-] ERRO CRÍTICO: Credenciais de ambiente ausentes.")
    print("[-] A aplicação não pode iniciar de forma insegura.")
    sys.exit(1) # Retorna Exit Code 1 para o SO (falha)

# Mascaramento no output (nunca printe o valor real no console/logs)
print(f"[+] Usuário do banco alocado: {DATABASE_USER}")
print(f"[+] Senha do banco (hash/mascarada): {'*' * len(DATABASE_PASSWORD)}")
print(f"[+] Token da API (mascarado): {API_TOKEN[:4]}********")
print("[+] Conexão estabelecida com sucesso.")
