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
## <®> Funsiones <®>
##
##########################################################################
# moz_usage()
duy_uso()
{
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
echo "    -h, --help              Esta ayuda por pantalla"
echo ""
echo "  Ejemplo:"
echo "    ${duyAPP} -u http://190.114.222.202/tcs/download/0D88714D-0490-4D75-BF4A-3126CD5E1A90 -a TSAyGIES_Gestión_C10_24Abr18 -t Clase_10"
echo ""
echo ""
	return 0
}
##########################################################################
duy_msg()
{
	msg=$1
	echo
	echo "$duyAPP:"
	echo "		 $msg"
	echo
	exit 1
}
##########################################################################
duy_run()
{
	app=$duyAPP
	##
	## Verifica si el script es ejecutable.
	##
	if [ ! -x "$app" ]
	then
		duy_msg "No puede ejecutarce el script --> $app"
	fi
	##
	## Ejecuto el script.
	##
	echo
	echo "App:     $app"
	echo "Url:     $duyURL"
	echo "Archivo: $duyARCH"
	echo "Título:  $duyTIT"
	echo
	
	python rmDUYTube.py -u "$duyURL" -o "$duyARCH" -t "$duyTIT"
	exit 1

}
##########################################################################
##
## <®> Argumento Predeterminados <®>
##
duyURL=""
duyARCH=""
#
##
## <®> Argumentos de Linea de Comandos <®>
##
while [ $# -gt 0 ]
do
  case $1 in
    -u | --url)
      duyURL=$2;
      if [ "${duyURL}" != "" ]; then
	shift 2
      else
        duy_uso
        duy_msg "Falta URL --> -u URL"
        exit 1
      fi
      ;;
    -a | --archivo)
      duyARCH=$2;
      if [ "${duyARCH}" != "" ]; then
	shift 2
      else
        duy_uso
        duy_msg "Falta nombre del ARCHIVO de salida --> -a ARCHIVO"
        exit 1
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
    -h | --help)
      duy_uso
      exit 1
      ;;
    *)
      duy_uso
      duy_msg "No se reconoce el parámetro --> $1"
      exit 1
      break;
      ;;
  esac
done
      
req=0
if [ "${duyURL}" != "" ]; then
	if [ "${duyARCH}" != "" ]; then
		req=1
	fi
fi

if [ "${req}" != 0 ]; then
	# duy_run
	duy_run ${1+"$@"}
else
	duy_uso
	duy_msg "Faltan parámetros."
	exit 1
fi

exit 1
