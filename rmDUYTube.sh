#!/bin/sh
#
# Este script es para la ejecución del rmDUYTube.py desde linux.
# 
# <®> Copyright (c) 2018 Ricardo MONLA <®>

duyAPP=`basename "$0"`
duyVER="1.0.1"
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
	echo "    -d, --dtmp=DIRECTORIO   Directorio donde se descarga el archivo [tmp/]"
	echo "    -h, --help              Esta ayuda por pantalla"
	echo ""
	echo "  Ejemplo:"
	echo "    ${duyAPP} -u http://190.114.222.202/tcs/download/0D88714D-0490-4D75-BF4A-3126CD5E1A90 -a TSAyGIES_Gestión_C10_24Abr18 -t Clase_10"
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
	echo
	echo "$duyAPP:"
	echo "		 $1"
	echo
	##
	## Verifica si sale del programa.
	##
	if [ $3 = 1 ]; then
		duy_exit
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
	dtmp=$duyDIR
	##
	## Verifica si el script es ejecutable.
	##
	if [ ! -x "$app" ]
	then
		duy_msj "No puede ejecutarce el script --> $app"
	fi
	##
	## Ejecuto el script.
	##
	echo
	echo "App     -> $app"
	echo "Url     -> $duyURL"
	echo "Archivo -> $duyARCH"
	echo "Título  -> $duyTIT"
	echo "duyDIR  -> $duyDIR"
	echo
	
	## python rmDUYTube.py -u "$duyURL" -o "$duyARCH" -t "$duyTIT"
	duy_exit

}
##########################################################################
#
##
### <®> Sale del script
##
duy_exit(){
	duy_msj "<®> Hasta luego <®>"
	duy_msj "<®> ${duyCOP} <®>" 0 1
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
	echo "App     -> $duyAPP"
	echo "Url     -> $duyURL"
	echo "Archivo -> $duyARCH"
	echo "Título  -> $duyTIT"
	echo
	
	# python rmDUYTube.py -u "$duyURL" -o "$duyARCH" -t "$duyTIT"
	duy_exit
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
duyURL=""
duyARCH=""
duyTIT=""
duyDIR="tmp/"
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
      if [ "${dtmp}" != "" ]; then
		duyDIR=$dtmp
		shift 2
      else
      	duy_msj "Directorio invalido se opta por predeterminado"
      fi
      ;;
    -h | --help)
      duy_uso
      duy_exit
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
	
duy_exit
