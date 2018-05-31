#!/bin/sh
#
# Este script es para la ejecución del rmDUYTube.py desde linux.
# 
# <®> Copyright (c) 2018 Ricardo MONLA <®>

duyAPP=`basename "$0"`
duyVER="1.0.3"
duyCOP="<®> ${duyAPP} v${duyVER} : Copyright (c) 2018 Ricardo MONLA <®>"

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
	echo "    -d, --dtmp=DIRECTORIO   Directorio donde se descarga el archivo [tmp]"
	echo "    -h, --help              Esta ayuda por pantalla"
	echo ""
	echo "  Ejemplo:"
	echo "    ${duyAPP} -u http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F5395 -a Video_01 -t Video_10"
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
### <®> Descarga el archivo desde la url
##
duy_down(){
	url="$duyURL"
	dir="$duyDIR"
	file="$duyARCH"
	dst="$duyDIR/$duyARCH"

	echo "$dst"
	
	echo "App     -> $app"
	echo "Url     -> $duyURL"
	echo "Archivo -> $duyARCH"
	echo "Título  -> $duyTIT"
	echo "duyDIR  -> $duyDIR"
	echo
	
	duyCMD= "wget "
	# wget -O tmp/video1 http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F5395
	# wget http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F539 -e echo Hola
	# wget ‐‐spider http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F5395
	# wget -o log/video1 -O tmp/video1 http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F5395
	# wget –delete-after -O tmp/video1 http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F539
	# wget –delete-after -O tmp/video1 http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F5395
	# –delete-after
	
	python rmDUYTube.py -u "$duyURL" -o "$duyARCH" -t "$duyTIT"
	exit 1

}
##########################################################################
#
##
### <®> Sale del script
##
duy_exit(){
	duy_msj " Hasta luego "
	duy_msj " ${duyCOP} "
	exit 1
}
##########################################################################
duy_run(){
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
	
	python rmDUYTube.py -u "$duyURL" -o "$duyARCH" -t "$duyTIT"
	# duy_exit
	exit 1
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
clear
duyURL=""
duyARCH=""
duyTIT=""
duyDIR="tmp"
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

if [ "${duyURL}" != "" ] || [ "${duyARCH}" != "" ] ; then
	duy_run ${1+"$@"}
else
	duy_msj "Faltan parámetros." 1 1
fi
	
# duy_exit

exit 1

