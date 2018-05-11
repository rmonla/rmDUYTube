# rmDUYTube
Descarga un archivo de video y lo sube a YouTube.


## Introducción:
	Este script descarga desde una dirección URL 
	un archivo de video el cual luego lo sube mediante las APIs de google a YouTube. 


## Contenido
* [rmDUYTube.sh](#rmDUYTube.sh)
* [Espaciado](#espaciado)


## rmDUYTube.sh:
'''
Uso:  rmDUYTube.sh -u URL -a ARCHIVO [-t TITULO]

  Requeridos:
    -u, --url=URL           Url del archivo de video a descargar
    -a, --archivo=ARCHIVO   Nombre del archivo descargado

  Opcionales:
    -t, --titulo=TITULO     Título para el video en YouTube
    -h, --help              Esta ayuda por pantalla

  Ejemplo:
    rmDUYTube.sh -u http://190.114.222.202/tcs/download/0D88714D-0490-4D75-BF4A-3126CD5E1A90 -a TSAyGIES_Gestión_C10_24Abr18 -t Clase_10
'''

