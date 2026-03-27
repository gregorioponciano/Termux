# =============================================================
# PASSO A PASSO COMPLETO: INSTALAÇÃO E USO DO SHERLOCK (DO ZERO)
# =============================================================

# --- 1. LIMPEZA (OPCIONAL MAS RECOMENDADA) ---
# Remove a pasta antiga para evitar conflitos de nomes (como o 'sherlock_project')
cd ~/Documentos/GitHub/Termux/
rm -rf sherlock

# --- 2. CLONAR O REPOSITÓRIO OFICIAL ---
# Baixa a versão mais recente e correta do GitHub
git clone https://github.com

# --- 3. ENTRAR NA PASTA DO PROJETO ---
cd sherlock

# --- 4. CRIAR E ATIVAR AMBIENTE VIRTUAL ---
# Isso resolve o erro de 'externally-managed-environment' que você teve
python3 -m venv venv
source venv/bin/activate

# --- 5. ATUALIZAR O PIP E INSTALAR DEPENDÊNCIAS ---
# Instala todas as bibliotecas necessárias listadas no requirements.txt
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

# --- 6. COMANDO PARA USAR O SHERLOCK ---
# Agora o comando padrão deve funcionar perfeitamente:
python3 sherlock gpwebsolution

# --- 7. DICAS EXTRAS DE COMANDOS ---
# Para salvar em arquivo CSV:
# python3 sherlock gpwebsolution --csv

# Para buscar apenas em sites específicos (ex: Instagram):
# python3 sherlock gpwebsolution --site instagram


# Para sair do ambiente virtual

deactivate
