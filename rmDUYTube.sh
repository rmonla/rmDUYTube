#!/bin/sh
#
# Este script es para la ejecución del rmDUYTube.py desde linux.
# 
# <®> Copyright (c) 2018 Ricardo MONLA <®>

rmApp=`basename "$0"`
rmVer="1.0.1"
rmPth="/home/rmonla/rmFiles/rmDocs/DTIC/Scripts/rm_duytb"


exitcode=1
#
##
## <®> Funsiones <®>
##
##########################################################################
# moz_usage()
rm_uso()
{
echo ""
echo "Uso:  ${rmApp} -u URL -a ARCHIVO [-t TITULO]"
echo ""
echo "  Requeridos:"
echo "    -u, --url=URL           Url del archivo de video a descargar."
echo "    -a, --archivo=ARCHIVO   Nombre del archivo descargado."
echo ""
echo "  Opcionales:"
echo "    -t, --titulo=TITULO     Título para el video en YouTube."
echo "    -h, --help              Esta ayuda por pantalla."
echo ""
echo "  Ejemplo:"
echo "    ${rmApp} -u http://190.114.222.202/tcs/download/0D88714D-0490-4D75-BF4A-3126CD5E1A90 -a TSAyGIES_Gestión_C10_24Abr18 -t Clase_10"
echo ""
echo ""
	return 0
}
##########################################################################
rm_msg()
{
	msg=$1
	echo
	echo "$rmApp: $msg"
	echo
	exit 1
}
##########################################################################
rm_run_app()
{
	app=$rmApp
	##
	## Verifica si el script es ejecutable.
	##
	if [ ! -x "$app" ]
	then
		rm_msg "NO tiene permisos para ejecutarce."
	fi
	##
	## Ejecuto el script.
	##
	echo
	echo "App:     $app"
	echo "Url:     $duy_url"
	echo "Archivo: $duy_arch"
	echo "Título:  $duy_tit"
	echo
	
	duy_cmd="python rmDUYTube.py -u $duy_url -o $duy_arch"

	exec "$duy_cmd" ${1+"$@"}
	exit 1
	
	

# cd /home/rmonla/rmFiles/rmDocs/DTIC/Scripts/rm_duytb
# screen python rmDUYTube.py -u http://190.114.222.202/tcs/download/0D88714D-0490-4D75-BF4A-3126CD5E1A90 -o TSAyGIES_Gestión_C10_24Abr18
# screen python rmDUYTube.py -u http://190.114.222.202/tcs/download/034027E7-224E-49CE-8597-8AEDF519AF46 -o TSAyGIES_Gestión_C11_26Abr18


}
##########################################################################
##
## Predetermino argumentos
##
duy_url=""
duy_arch=""
#
##
## Parse the command line
##
while [ $# -gt 0 ]
do
  case $1 in
    -u | --url)
      duy_url=$2;
      if [ "${duy_url}" != "" ]; then
	shift 2
      else
        rm_uso
        rm_msg "-u La URL es requerida."
        exit 1
      fi
      ;;
    -a | --archivo)
      duy_arch=$2;
      if [ "${duy_arch}" != "" ]; then
	shift 2
      else
        rm_uso
        rm_msg "-a El nombre del ARCHIVO de salida es requerido."
        exit 1
      fi
      ;;
    -t | --titulo)
      duy_tit=$2;
      if [ "${duy_tit}" != "" ]; then
	shift 2
      else
        duy_tit=$duy_arch
      fi
      ;;
    -h | --help)
      rm_uso
      exit 1
      ;;
    *)
      break;
      ;;
  esac
done
      
req=0
if [ "${duy_url}" != "" ]; then
	if [ "${duy_arch}" != "" ]; then
		req=1
	fi
fi

if [ "${req}" != 0 ]; then
	# rm_run_app
	rm_run_app ${1+"$@"}
else
	rm_uso
	rm_msg "Faltan parámetros."
	exit 1
fi

# if [ "${duy_url}" != "" or "${duy_arch}" != "" ]


exit $exitcode
