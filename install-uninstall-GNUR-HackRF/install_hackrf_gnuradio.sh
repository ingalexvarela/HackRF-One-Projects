#!/bin/bash

# https://github.com/ingalexvarela/HackRF-One-Projects

# Solicitar la contraseña de sudo
read -s -p "Por favor, ingresa tu contraseña de sudo: " sudo_password

# Instalar toilet de manera silenciosa
echo $sudo_password | sudo -S apt-get install -qq -y toilet > /dev/null 2>&1

# Mensaje inicial personalizado
echo ""
echo "------------------------------------------------"
echo -e "\e[1;34mBienvenido al instalador del \e[1;36mHackRF One\e[0m"
echo -e "\e[1;35mby Alex Varela\e[0m"
echo "------------------------------------------------"
# Esperar 5 segundos
sleep 3

# Figura ASCII
echo "
  ✨
  ✨
 ●/
/▌ Lumos Máxima
/ \\
"
# Esperar 5 segundos
sleep 5

# Mensaje inicial
echo "Configurando entorno para HackRF One"

# Actualizar la lista de paquetes
echo "Ejecutando: sudo apt-get update"
sudo apt-get update

# Instalar paquetes
echo "Ejecutando: sudo apt-get install -y git build-essential cmake libusb-1.0-0-dev libboost-dev liblog4cpp5-dev libboost-system-dev libboost-thread-dev libboost-program-options-dev swig"
sudo apt-get install -y git build-essential cmake libusb-1.0-0-dev libboost-dev liblog4cpp5-dev libboost-system-dev libboost-thread-dev libboost-program-options-dev swig

# Clonar el repositorio de hackrf
echo "Ejecutando: git clone https://github.com/mossmann/hackrf.git"
git clone https://github.com/mossmann/hackrf.git

# Compilar e instalar hackrf
echo "Ejecutando: Compilando e instalando HackRF..."
cd hackrf/host
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
hackrf_info

# Regresar al directorio de inicio del usuario
echo "Regresando al directorio de inicio del usuario"
cd ~

# Instalar GNU Radio y paquetes relacionados
echo "Ejecutando: sudo apt-get install -y gnuradio gnuradio-dev gr-iqbal"
sudo apt-get install -y gnuradio gnuradio-dev gr-iqbal

# Clonar el repositorio gr-osmosdr y compilarlo
echo "Ejecutando: Clonando gr-osmosdr y compilando..."
git clone git://git.osmocom.org/gr-osmosdr
cd gr-osmosdr/
mkdir build
cd build/
cmake ../
make
sudo make install
sudo ldconfig

sudo apt-get install libportaudio2

sudo apt-get install git-core 

sudo apt-get install gnuradio gr-osmosdr

# Mensaje final personalizado
echo ""
echo "------------------------------------------------"
echo -e "\e[1;34mAHORA estás listo para experimentar con el \e[1;36mHackRF One\e[0m"
echo "
╔═══╗ ♪
║███║ ♫
║(● ) ♫
╚═══╝♪♪
"
echo -e "\e[1;35m¡Buena Suerte!\e[0m"
echo "------------------------------------------------"