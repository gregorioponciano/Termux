#Dá permissão ao armazenamento e instala o gerenciador de distros
termux-setup-storage
pkg update -y && pkg upgrade -y
pkg install proot-distro -y

Instala o Ubuntu e faz o login automático
proot-distro install ubuntu
proot-distro login ubuntu

# ---------------------------------------------------------
# ATUALIZAÇÃO E DEPENDÊNCIAS DE SISTEMA
# ---------------------------------------------------------
apt update && apt upgrade -y
apt install -y software-properties-common curl wget git build-essential

# ---------------------------------------------------------
# ARSENAL DE PROGRAMAÇÃO (COMPLETO)
# ---------------------------------------------------------
# Python 3, Pip, C/C++ (Clang/GCC), Go, Node.js e Ruby
apt install -y python3 python3-pip python3-dev \
clang gcc g++ make perl golang nodejs npm ruby-full \
libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev

# ---------------------------------------------------------
# WIRESHARK & ANÁLISE DE TRÁFEGO
# ---------------------------------------------------------
# Instalando o Tshark (Wireshark CLI) e utilitários de rede
DEBIAN_FRONTEND=noninteractive apt install -y tshark wireshark-common \
tcpdump termshark net-tools iproute2 dnsutils iputils-ping

# Configura permissões para capturar pacotes sem erro
groupadd -g 3044 wireshark
usermod -a -G wireshark root

# ---------------------------------------------------------
# ARSENAL DE PENTEST (WEB, REDE E EXPLOIT)
# ---------------------------------------------------------
apt install -y \
nmap \
sqlmap \
metasploit-framework \
hydra \
john \
hashcat \
nikto \
gobuster \
dirb \
feroxbuster \
proxychains4 \
socat \
netcat-traditional \
beef-xss \
recon-ng \
whois \
crunch

# ---------------------------------------------------------
# FERRAMENTAS PYTHON (VIA PIP)
# ---------------------------------------------------------
pip3 install --upgrade pip
pip3 install scapy requests pocketshole shodan censys wfuzz brute-force

# ---------------------------------------------------------
# FINALIZAÇÃO E LIMPEZA
# ---------------------------------------------------------
apt autoremove -y
clear
echo -e "\033[1;32m"
echo "===================================================="
echo "         ARSENAL UBUNTU PENTEST INSTALADO           "
echo "===================================================="
echo " - Wireshark/Tshark: Pronto para uso (tshark)"
echo " - Metasploit: Use 'msfconsole'"
echo " - Programação: Python, C, Go, Node instalados"
echo "===================================================="
echo -e "\033[0m"