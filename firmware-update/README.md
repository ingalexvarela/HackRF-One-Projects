# Script to update the HackRF One firmware in Ubuntu

## Descripción

Este script de Bash está diseñado para simplificar el proceso de actualización del firmware en un dispositivo HackRF One en un entorno Ubuntu. El dispositivo HackRF One es un transceptor de radio de software (SDR) de código abierto, y a veces es necesario actualizar su firmware para aprovechar nuevas características y correcciones de errores.

El script automatiza varias tareas, esta hecho para flashear la versión hackrf-2023.01.1,
al ejecutarlo hara la descompresión del archivo ZIP y la programación del dispositivo HackRF One con el nuevo firmware. Además, verifica si la herramienta unzip está instalada y, de lo contrario, intenta instalarla utilizando apt-get.

Es importante tener en cuenta que este script realiza cambios en el firmware de HackRF One y debe utilizarse con precaución. Asegúrate de que el firmware que deseas flashear sea el adecuado para tu dispositivo y de que tengas acceso a las herramientas requeridas, como hackrf_info, hackrf_spiflash y hackrf_cpldjtag.

## Uso
Para utilizar este script de actualización del firmware de HackRF One en Ubuntu, sigue estos pasos:

1. clona el repositorio de GitHub:
    git clone https://github.com/ingalexvarela/HackRF-One-Projects.git

2. Abre una terminal en tu sistema Ubuntu.

3. Navega al directorio donde se encuentra el repositorio clonado. Puedes utilizar el comando cd para cambiar al directorio correspondiente:
    cd HackRF-One-Projects/firmware-update/

4. Asegúrate de que el script tenga permisos de ejecución. Si no tiene permisos de ejecución, puedes otorgárselos con el siguiente comando: 
    chmod +x update_hackrf_firmware.sh

5. Ejecuta el script de actualización con el siguiente comando: 
    ./update_hackrf_firmware.sh

6. El script mostrará información relevante, incluyendo la versión actual del firmware de HackRF One y la versión que se va a flashear. 

7. Una vez que el proceso haya finalizado, el script mostrará un mensaje de finalización y tu dispositivo HackRF One debería estar actualizado con el nuevo firmware.


## Licencia
Este proyecto está bajo la [Licencia MIT](https://opensource.org/licenses/MIT). Consulta el [texto completo de la Licencia MIT](https://opensource.org/licenses/MIT) en el sitio web de OSI para obtener más detalles.


## Autor
- Alex Alberto Varela Quirós.
- Año: 2023.

## Contribuciones
Las contribuciones son bienvenidas. Si deseas mejorar este script, crea un fork del repositorio, realiza tus cambios y envía una solicitud de extracción.

## Agradecimientos
Agradecemos a la comunidad de HackRF por su contribución a la tecnología de radio definida por software.

## Notas
Este script fue diseña en el 2023 para flashear la versión hackrf-2023.01.1 si desea una nueva versión, haga la descarga de la última versión .zip del firmware desde GitHub en la dirección: https://github.com/greatscottgadgets/hackrf/releases, y en el script modifique la linea 53:

Ubique: 
-----------------------------------------------
firmware_zip="hackrf-2021.03.1.zip" 
-------------------------------------------------

y reemplace con el nombre del archivo zip descargado y guardado en la carpeta del script.
Finalmente ejecute el script.

Esperamos que este script simplifique la actualización de firmware del HackRF One desde el sistema Ubuntu. ¡Diviértete experimentando con tu HackRF One!

## Contacto

- Ing. Alex Alberto Varela Quirós
- correo: alex.varela@ucr.ac.cr
- tel: +50685525005
- GitHub: [Repositorio](https://github.com/ingalexvarela/HackRF-One-Projects)

[![iconopeque.jpg](https://i.postimg.cc/hvtdRL0p/iconopeque.jpg)](https://postimg.cc/k6L4xtzb)
