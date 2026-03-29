==========================================================
--- CONFIGURAÇÃO OH MY ZSH (ZSHRC) ---
==========================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

PLUGINS
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker npm node composer extract sudo web-search history copyfile copypath)

Carrega o Oh My Zsh (Silenciosamente)
source $ZSH/oh-my-zsh.sh

==========================================================
--- VISUAL GPWEB (DEGRADÊ PROFISSIONAL) ---
==========================================================
clear
touch ~/.hushlogin

Banner com Degradê (Verde -> Amarelo -> Vermelho)
if command -v figlet > /dev/null; then
    BANNER_TEXT=$(figlet "GPWeb")
    i=0
    while IFS= read -r line; do
        i=$((i + 1))
        # Lógica de cores ANSI compatível com ZSH
        if [ $i -le 2 ]; then
            COLOR="\e[1;32m" # Verde
        elif [ $i -le 4 ]; then
            COLOR="\e[1;33m" # Amarelo (GPWeb central)
        else
            COLOR="\e[1;31m" # Vermelho
        fi
        echo -e "${COLOR}${line}\e[0m"
    done <<< "$BANNER_TEXT"
else
    echo -e "\e[1;32mGP\e[1;33mWeb\e[0m"
fi

PROMPT LIMPO E PROFISSIONAL
%~ = Diretório atual | %f = Reset cor
PROMPT='%F{green}[GP]%F{yellow}Web%f %F{242}%~%f $ '

==========================================================
--- ATALHOS & AMBIENTE ---
==========================================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

alias cls='clear && source ~/.zshrc'
alias att='pkg update && pkg upgrade -y'
alias config='nano ~/.zshrc'
alias ..='cd ..'