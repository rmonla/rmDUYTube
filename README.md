# <®> rmDUYTube
Descarga un archivo de video y lo sube a YouTube.


###############################################################################
## <®> DESCRIPCION:
###############################################################################
     rmDUY 
           Este script descarga desde una dirección URL un archivo de video
           que luego sube mediante las APIs de google a YouTube.


###############################################################################
## <®> REQUERIDO
###############################################################################

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



###############################################################################
## <®> USO:
###############################################################################

	################################################################################
	# <®>rmDUY v1.190415 - Copyright (c) 2019 Ricardo MONLA <rmonla@gmail.com><®>  #
	################################################################################

	  Uso:     rmDUY -a ARCHIVO -u URL [OPCIONES]

	    Este script descarga desde una dirección URL un archivo de video
	    que luego sube mediante las APIs de google a YouTube.

	    -u, --url URL             Url del archivo de video a descargar.
	    -a, --archivo ARCHIVO     Nombre del archivo descargado.

	    -t, --titulo  TITULO      YouTube -> Título.
	    -D, --descrip DESCRIPCION YouTube -> Descripción.

	    -d, --destino DIRECTORIO  Directorio donde se descarga el archivo [/tmp/].
	    -v, --ver                 Muestra detalle de versión.
	    -h, --help                Esta ayuda por pantalla.

	  Ejemplo: 
	  rmDUY -a ARCHIVO -u URL \
	  -t 'Título del Video' -D 'Descripción del Video' -d DIRECTORIO
	################################################################################

