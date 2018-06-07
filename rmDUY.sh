#!/bin/sh
#
#*<®> rmDUY.sh Descarga-Sube-YouTube. <®>*
# 
# Proyecto que descarga un video desde una url 
# y lugo lo sube a tu canal de YouTube.
#
# Requerimientos:
# Este proyecto esta desarrollado para linux y nesecita para funcionar
# tener instalado lo siguiente: 
# 
# 	Módulos de linux:
#    	sudo apt-get install wget
# 
# 	Módulos de python:
#    	pip para instalar paquetes python.
#       	--> sudo apt-get install python-pip
#    	google apis para la subida a youtube.
#       	--> sudo pip install --upgrade oauth2client
#       	--> sudo pip install --upgrade google-api-python-client
#
# Copyright (c) 2016 Ricardo MONLA (rmonla@gmail.com)
#

duyAPP=`basename "$0"`
duyVER="1.0.3"
duyCOP="${duyAPP} v${duyVER} - Copyright (c) 2018 Ricardo MONLA"

#
##
### <®> Funsiones <®>
##
##########################################################################
#
##
### <®> Muestra la forma de uso del script. 
##
duy_uso(){
	echo ""
	echo "${duyCOP}"
	echo ""
	echo "Uso:  ${duyAPP} -u URL -a ARCHIVO [-t TITULO]"
	echo ""
	echo "  Requeridos:"
	echo "    -u, --url=URL           Url del archivo de video a descargar"
	echo "    -a, --archivo=ARCHIVO   Nombre del archivo descargado"
	echo ""
	echo "  Opcionales:"
	echo "    -t, --titulo=TITULO     Título para el video en YouTube"
	echo "    -d, --dtmp=DIRECTORIO   Directorio donde se descarga el archivo [tmps]"
	echo "    -h, --help              Esta ayuda por pantalla"
	echo ""
	echo "  Ejemplo:"
	echo "    ${duyAPP} -u http://190.114.222.202/tcs/download/A8BA7269-F41E-42C1-AD7C-2EEEB558D784 -a Video_01 -t Video_10"
	echo ""
	echo ""
	return 0
}
##########################################################################
#
##
### <®> Muestra por pantalla mensajes. 
##
duy_msj(){
	# $1	Mensaje a mostrar.
	# $2	Muestra uso del script si está en 1.
	# $3	Sale del script si esta en 1.

	##
	## Verifica si muestra el uso del programa.
	##
	if [ $2 = 1 ]; then
		duy_uso
	fi
	##
	## Muestra el mensaje.
	##
	if [ "$1" != "" ] ; then
		echo
		echo "$duyAPP:"
		echo "		 $1"
		echo
	fi 
	##
	## Verifica si sale del programa.
	##
	if [ $3 = 1 ]; then
		exit 1
	else
		return 0
	fi
}
##########################################################################
#
##
### <®> Sale del script
##
duy_exit(){
	# duy_msj "Hasta luego"
	duy_msj "${duyCOP}" 0 0
	
	return 0
	# exit 1
}
##########################################################################
duy_run(){
	clear
	##
	## Verifica si el script es ejecutable.
	##
	if [ ! -x "$duyAPP" ]
	then
		duy_msj "No puede ejecutarce el script --> $duyAPP" 1
	fi
	##
	## Ejecuto el script.
	##
	echo
	echo "App            -> $duyAPP"
	echo "Url        [-u]-> $duyURL"
	echo "Archivo    [-a]-> $duyARCH"
	echo "Título     [-t]-> $duyTIT"
	echo "Directorio [-d]-> $duyDIR"
	
	echo
	duy_down

	duy_up
	echo

	# python rmDUYTube.py -u "$duyURL" -o "$duyARCH" -t "$duyTIT"
	
	duy_exit
	
	exit 1
}
##########################################################################
#
##
### <®> Descarga el archivo desde la url
##
duy_down(){
	dst="$duyDST"
	url="$duyURL"

	# echo
	# echo "wget -O $dst $url"
	echo
	wget -O "$dst" "$url"
	
	return 0
	# exit 1
}
##########################################################################
#
##
### <®> Descarga el archivo desde la url
##
duy_up(){
	file="$duyDST"
	tit="$duyTIT"

	# echo
	# echo "wget -O $dst $url"
	echo
	python rmDUY_UP.py --file="$file" --title="$tit"
	
	# wget -O "$dst" "$url"
	
	return 0
	# exit 1
}
##########################################################################

#
##
### <®> Desarrollo <®>
##
##########################################################################
#
##
### <®> Inicializa Variables
##
# clear
duyURL=""
duyARCH=""
duyTIT=""
duyDIR="tmps"
#
##
### <®> Obtiene argumentos de la línea de comandos
##
while [ $# -gt 0 ]
do
  case $1 in
    -u | --url)
      duyURL=$2;
      if [ "${duyURL}" != "" ]; then
		shift 2
      else
        duy_msj "Falta URL --> -u URL" 1 1
      fi
      ;;
    -a | --archivo)
      duyARCH=$2;
      if [ "${duyARCH}" != "" ]; then
		shift 2
      else
        duy_msj "Falta nombre del ARCHIVO de salida --> -a ARCHIVO" 1 1
      fi
      ;;
    -t | --titulo)
      duyTIT=$2;
      if [ "${duyTIT}" != "" ]; then
		shift 2
      else
        duyTIT=$duyARCH
      fi
      ;;
    -d | --dtmp)
      dtmp=$2;
      if [ -d "${dtmp}" ]; then
		duyDIR=$dtmp
      else
      	duy_msj "Directorio invalido se opta por predeterminado [${duyDIR}]" 0 0
      fi
      shift 2
      ;;
    -h | --help)
      duy_msj "" 1 1
      ;;
    *)
      duy_msj "No se reconoce el parámetro --> $1" 1 1
      break;
      ;;
  esac
done
      

#
##
### <®> Si verifican los requeridos ejecuta el script
##
if [ "${duyTIT}" = "" ]; then
	duyTIT=$duyARCH
fi

duyDST="$duyDIR/$duyARCH"

if [ "${duyURL}" != "" ] || [ "${duyARCH}" != "" ] ; then
	duy_run ${1+"$@"}
else
	duy_msj "Faltan parámetros." 1 1
fi
	
exit 1

