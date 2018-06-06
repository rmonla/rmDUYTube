# rmDUYTube
Descarga un archivo de video y lo sube a YouTube.


## Introducción:
	Este script descarga desde una dirección URL un archivo de video
	que luego sube mediante las APIs de google a YouTube. 


## rmDUYTube.sh:

	<®> rmDUYTube.sh v1.0.3 : Copyright (c) 2018 Ricardo MONLA <®>

	Uso:  rmDUYTube.sh -u URL -a ARCHIVO [-t TITULO]

	Requeridos:
    -u, --url=URL           Url del archivo de video a descargar
    -a, --archivo=ARCHIVO   Nombre del archivo descargado

	Opcionales:
    -t, --titulo=TITULO     Título para el video en YouTube
    -d, --dtmp=DIRECTORIO   Directorio donde se descarga el archivo [tmp]
    -h, --help              Esta ayuda por pantalla

	Ejemplo:
    rmDUYTube.sh -u http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F5395 -a Video_01 -t Video_10

