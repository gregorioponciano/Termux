==========================================================
--- CONFIGURAÇÃO GLOBAL TERMUX (BASH.BASHRC) ---
==========================================================
Mantém as cores habilitadas
export TERM=xterm-256color

Comando padrão do Termux para lidar com o armazenamento
case "$1" in
    *.sh) ;;
    *) [ -x /usr/libexec/termux/command-not-found ] && [ -z "$ZSH_VERSION" ] && \
       command_not_found_handle() { /usr/libexec/termux/command-not-found "$1"; } ;;
esac

Limpa a tela e silencia o login
clear
touch ~/.hushlogin

--- BANNER GPWEB (DEGRADÊ PROFISSIONAL) ---
if command -v figlet > /dev/null; then
    BANNER_TEXT=$(figlet "GPWeb")
    i=0
    while IFS= read -r line; do
        i=$((i + 1))
        # Verde -> Amarelo -> Vermelho
        if [ $i -le 2 ]; then
            COLOR="\e[1;32m" 
        elif [ $i -le 4 ]; then
            COLOR="\e[1;33m" 
        else
            COLOR="\e[1;31m" 
        fi
        echo -e "${COLOR}${line}\e[0m"
    done <<< "$BANNER_TEXT"
else
    echo -e "\e[1;32mGP\e[1;33mWeb\e[0m"
fi

--- PROMPT PARA BASH (PS1) ---
[GP] em verde, Web em amarelo, caminho em cinza
PS1='[\e[1;32m][GP][\e[1;33m]Web [\e[1;30m]\w $ [\e[0m]'

--- ATALHOS GLOBAIS ---
alias cls='clear && source $PREFIX/etc/bash.bashrc'
alias att='pkg update && pkg upgrade -y'
alias config='nano $PREFIX/etc/bash.bashrc'
alias ..='cd ..'

--- INTEGRAÇÃO COM ZSH ---
Se o Zsh estiver instalado, ele assume o comando automaticamente sem erros
if [ -t 1 ] && [ -x "$(command -v zsh)" ] && [ -z "$ZSH_VERSION" ]; then
    exec zsh
fi