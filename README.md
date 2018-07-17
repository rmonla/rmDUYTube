# <®> rmDUYTube
Descarga un archivo de video y lo sube a YouTube.


## <®> Introducción:
	Este script descarga desde una dirección URL un archivo de video
	que luego sube mediante las APIs de google a YouTube. 

## <®> Requerido
	Este proyecto esta desarrollado para linux y para funcionar 
	nesecita tener instalado lo siguiente: 
	
	Módulos de linux:
	 	sudo apt-get install wget
	
	Módulos de python:
	 	pip para instalar paquetes python.
	    	--> sudo apt-get install python-pip
	 	google apis para la subida a youtube.
	    	--> sudo pip install --upgrade oauth2client
	    	--> sudo pip install --upgrade google-api-python-client

## <®> Uso:

	################################################################################
	#   <®>rmDUY        - Copyright (c) 2018 Ricardo MONLA <rmonla@gmail.com><®>   #
	################################################################################

	Uso:     rmDUY -u URL -a ARCHIVO [OPCIONES]

    Este script descarga desde una dirección URL un archivo de video
    que luego sube mediante las APIs de google a YouTube.

    -u, --url URL             Url del archivo de video a descargar.
    -a, --archivo ARCHIVO     Nombre del archivo descargado.

    -t, --titulo TITULO       Título para el video en YouTube.
    -d, --destino DIRECTORIO  Directorio donde se descarga el archivo [/tmp/].
    -v, --ver                 Muestra detalle de versión.
    -h, --help                Esta ayuda por pantalla.

	Ejemplo: rmDUY -u http://190.114.222.202/tcs/download/EA552BC8-CB22-4E08-9222-21DAAD0CAF3 -a NOMBREvideo -t TITULOvideo
	################################################################################
