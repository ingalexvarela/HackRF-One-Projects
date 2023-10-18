#!/bin/bash

# https://github.com/ingalexvarela/HackRF-One-Projects

# Mensaje inicial personalizado
echo ""
echo "------------------------------------------------"
echo -e "\e[1;34mBienvenido al actualizador del firmware del: \e[1;36mHackRF One\e[0m"
echo -e "\e[1;35mby Alex Varela\e[0m"
echo "------------------------------------------------"


# Figura ASCII
echo "
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█
█░██░██░██░██░██░██░██░██░██░░░░░░░░░░█
█░██░██░██░██░██░██░██░██░██░░░░░░░░░░█
█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░█░░░░█▀▀▀█░█▀▀█░█▀▀▄░▀█▀░█▄░░█░█▀▀█░░
░░█░░░░█░░░█░█▄▄█░█░░█░░█░░█░█░█░█░▄▄░░
░░█▄▄█░█▄▄▄█░█░░█░█▄▄▀░▄█▄░█░░▀█░█▄▄█░
"

echo "
░░░░░▄▄▄█████▄▄▄░░░░░░
░░░░░░░▄▌▄░▄▐▄░░░░░░░░
░░░░░░▐░░░▄░░░▌░░░░░░░
░░░░░░▐░▀▄▄▄▀░▌░░░░░░░
░░░░░░░▀▄▄▄▄▄▀░░░░░░░░
"
# Mensaje inicial
echo "Configurando entorno para flashear"
# Esperar 5 segundos
sleep 5

# Obtener la ruta de la carpeta actual
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Comprobar si unzip está instalado
if ! command -v unzip &>/dev/null; then
  echo "El programa 'unzip' no está instalado. Instalándolo..."
  sudo apt-get update
  sudo apt-get install unzip
fi

#-----------------------------------------------
# Definir el nombre del archivo ZIP (cambiar nombre por 
# el zip descargado de la última versión)
# para descargar consultar el link
firmware_zip="hackrf-2023.01.1.zip"
# -------------------------------------------------

link = "https://github.com/greatscottgadgets/hackrf/releases"

# Versión actual del firmware del HackRF ONe
echo -e "\e[1;35m---------------------------------------------------\e[0m"
echo -e "\e[1;35mVersión actual del firmware del HackRF ONe:\e[0m"
echo "hackrf_info"
hackrf_info
sleep 5
echo -e "\e[1;34mVersión del firmware a flashear en HackRF One: \e[1;36m$firmware_zip\e[0m"
echo -e "\e[1;35m---------------------------------------------------\e[0m"
# Esperar 5 segundos
sleep 5
# Verificar si el archivo ZIP existe
if [ -e "$firmware_zip" ]; then
  # Descomprimir el archivo ZIP en la carpeta actual
  unzip -o "$firmware_zip" -d "$script_dir"
  echo "Archivo $firmware_zip descomprimido exitosamente y reemplazado en la carpeta actual."
  
  # Ingresar a la carpeta descomprimida
  cd "$script_dir/hackrf-2023.01.1"
  echo "Ingresado a la carpeta hackrf-2023.01.1"
  echo "cd $script_dir/hackrf-2023.01.1"

  # Ingresar a la carpeta descomprimida
  echo "Ingresado a la carpeta firmware"
  echo "cd firmware"
  cd firmware-bin

  # Ejecutando 
  echo "Ejecutando= hackrf_spiflash -w hackrf_one_usb.bin"
  hackrf_spiflash -w hackrf_one_usb.bin
  # volviendo a 
  echo "regresando a la carpeta hackrf-2023.01.1"
  echo "cd .."
  cd ..
  # Ejecutando 
  echo "Ejecutando= hackrf_cpldjtag -x firmware/cpld/sgpio_if/default.xsvf"
  hackrf_cpldjtag -x firmware/cpld/sgpio_if/default.xsvf
  # información general, importa observar version de firmware
  
  # Mensaje final personalizado
  echo ""
  echo "------------------------------------------------"
  echo -e "\e[1;34mflasheo completado sobre el \e[1;36mHackRF One\e[0m"
  echo "
  ░░░░░░░░░░█
  ░░░░░░░░▄▄█▄▄
  ░░░░▀▀▀██▀▀▀██▀▀▀
  ▄▄▄▄▄▄▄███████▄▄▄▄▄▄▄
  ░░█▄█░░▀██▄██▀░░█▄█
  "
  echo -e "\e[1;35m¡Nadie me llama gallina!- Marty McFly.\e[0m"
  echo "------------------------------------------------"
else
  echo "El archivo $firmware_zip no se encuentra en este directorio."
fi


