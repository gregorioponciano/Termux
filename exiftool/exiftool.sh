#!/bin/bash

# ==============================================================================
# GUIA MESTRE EXIFTOOL: DO ZERO AO AVANÇADO
# Focado em Ubuntu/Debian/WSL
# ==============================================================================

# --- 1. INSTALAÇÃO (O PRIMEIRO PASSO) ---
# No Ubuntu, o comando de instalação é:

sudo apt update && sudo apt install libimage-exiftool-perl -y

# ==============================================================================
# SEÇÃO 1: COMANDOS ESSENCIAIS (O BÁSICO)
# ==============================================================================

# VER TUDO: O comando mais simples. Mostra todos os dados que o arquivo possui.

exiftool imagem.jpg

# VER COM ORGANIZAÇÃO: Separa por grupos (Câmera, Arquivo, Localização).

exiftool -G imagem.jpg

# FORMATO DE LISTA CURTA: Ideal para ver apenas o nome da TAG e o Valor.

exiftool -s imagem.jpg

# ==============================================================================
# SEÇÃO 2: BUSCA DE GPS E LOCALIZAÇÃO
# ==============================================================================

# BUSCA DIRETA: Tenta encontrar qualquer menção a GPS.

exiftool -gps:all imagem.jpg

# FORMATO PARA GOOGLE MAPS: Mostra a latitude/longitude em números decimais.
# (Fica fácil copiar e colar no mapa: -23.5505, -46.6333)

exiftool -c "%.6f" -gpslatitude -gpslongitude imagem.jpg

# MAPA COMPLETO: Cria um link direto do Google Maps com a posição da foto.

exiftool -p 'https://www.google.com' imagem.jpg

# GARANTE QUE EXIFTOOL MOSTRE TUDO (MESMO QUE NAO RECONHEÇA O A TAG).
# -ee extrai informaçoes de arquivos incoporados
# -G mostra qual grupo cada tag pertence(ex:[GPS], [EXIF]).

exiftool -ee -G -a -u imagem.jpg

# VEJA APENAS ALTITUDE LATITUDE E LOGITUDE

exiftool -gpslatitude -gpslongitude -gpsaltituderef imagem.jpg

# ==============================================================================
# SEÇÃO 3: LIMPEZA E PRIVACIDADE (IMPORTANTE!)
# ==============================================================================

# DELETAR TUDO: Remove GPS, modelo do celular, data, TUDO. Deixa a foto "anônima".

exiftool -all= imagem.jpg

# REMOVER SÓ O GPS: Mantém a data e a câmera, mas apaga onde a foto foi tirada.

exiftool -gps:all= imagem.jpg

# REMOVER RASTROS DE REDE SOCIAL: Apaga aquelas tags "FBMD" do Facebook/Instagram.

exiftool -SpecialInstructions= -IPTC:all= imagem.jpg

# ==============================================================================
# SEÇÃO 4: COMANDOS EXTRAS PARA INICIANTES (DICAS DE OURO)
# ==============================================================================

echo "--- DICAS EXTRAS PARA QUEM ESTÁ COMEÇANDO ---"

# 1. VER A DATA QUE A FOTO FOI TIRADA (REAL)
# Às vezes o Windows mostra a data que você baixou a foto. Este comando mostra a data da CÂMERA.

exiftool -DateTimeOriginal imagem.jpg

# 2. ALTERAR A DATA DE UMA FOTO
# Se a sua câmera estava com a data errada, você pode consertar assim:

exiftool -DateTimeOriginal="2023:12:25 10:00:00" imagem.jpg

# 3. VER O MODELO DA CÂMERA/CELULAR
# Descubra se foi um iPhone, Samsung ou uma câmera profissional.

exiftool -model -make imagem.jpg

# 4. LIMPAR UMA PASTA INTEIRA DE UMA VEZ
# Use o asterisco (*) para aplicar o comando em todas as fotos da pasta atual.

exiftool -all= *.jpg

# 5. NÃO CRIAR BACKUP (CUIDADO!)
# Por padrão, o ExifTool cria uma cópia chamada 'imagem.jpg_original'. 
# Para salvar direto no arquivo original sem criar cópias, use:

exiftool -overwrite_original -all= imagem.jpg

# 6. EXTRAIR A MINIATURA (THUMBNAIL)
# Algumas fotos têm uma versão pequena escondida dentro delas. Você pode extraí-la:

exiftool -ThumbnailImage -b imagem.jpg > miniatura.jpg

# 7. FILTRAR POR TIPO DE ARQUIVO
# Se você quer ver o GPS de todas as fotos, mas ignorar os vídeos:

exiftool -ext jpg -gps:all .

# ==============================================================================
echo "Instrução final: Sempre use o nome do arquivo entre 'aspas' se ele tiver espaços!"
