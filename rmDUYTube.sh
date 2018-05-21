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
duy_msg()
{
	msg=$1
	sale=$2
	uso=$3

	##
	## Verifica si muestra el uso del programa.
	##
	if [ "$uso" == "1" ]; then
		duy_uso
	fi
	##
	## Muestra el mensaje.
	##
	echo
	echo "$duyAPP:"
	echo "		 $msg"
	echo
	##
	## Verifica si sale del programa.
	##
	if [ "$sale" == "1" ]; then
		exit 1
	else
		return 0
	fi
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
		duy_msg "No puede ejecutarce el script --> $app" 1
	fi
	##
	## Ejecuto el script.
	##
	echo
	echo "App     -> $app"
	echo "Url     -> $duyURL"
	echo "Archivo -> $duyARCH"
	echo "Título  -> $duyTIT"
	echo
	
	python rmDUYTube.py -u "$duyURL" -o "$duyARCH" -t "$duyTIT"
	exit 1

}
##########################################################################
##
### <®> duy_down <®>
##		Descarga el archivo desde la url.
##
duy_down()
{
	dtmp=$duyTMP
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
	echo "App     -> $app"
	echo "Url     -> $duyURL"
	echo "Archivo -> $duyARCH"
	echo "Título  -> $duyTIT"
	echo "duyTMP  -> $duyTMP"
	echo
	
	## python rmDUYTube.py -u "$duyURL" -o "$duyARCH" -t "$duyTIT"
	exit 1

}
##########################################################################
##
## <®> Argumentos Predeterminados <®>
##
duyURL=""
duyARCH=""
duyTIT=""
duyTMP="tmp/"
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
        # duy_uso
        duy_msg "Falta URL --> -u URL" 1 1
        # exit 1
      fi
      ;;
    -a | --archivo)
      duyARCH=$2;
      if [ "${duyARCH}" != "" ]; then
	shift 2
      else
        # duy_uso
        duy_msg "Falta nombre del ARCHIVO de salida --> -a ARCHIVO" 1 1
        # exit 1
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
		duyTMP=$dtmp
		shift 2
      else
      	duy_msg "Directorio invalido se opta por predeterminado"
      fi
      ;;
    -h | --help)
      duy_uso
      exit 1
      ;;
    *)
      # duy_uso
      duy_msg "No se reconoce el parámetro --> $1" 1 1
      # exit 1
      break;
      ;;
  esac
done
      
#
##
## <®> Verifica Requeridos <®>
##
req=0
if [ "${duyURL}" = "" ]; then
	req=1
fi
if [ "${duyARCH}" = "" ]; then
	req=1
fi
if [ "${duyTIT}" = "" ]; then
	duyTIT=$duyARCH
fi

if [ "${req}" = 0 ]; then
	duy_run ${1+"$@"}
else
	# duy_uso
	duy_msg "Faltan parámetros." 1 1
	# exit 1
fi

exit 1
