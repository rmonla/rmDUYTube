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
echo "Uso:  ${rmApp}"
echo ""
echo "  options:"
echo ""
echo "    -u URL           Url del archivo de video a descargar."
echo "    --url URL"
echo ""
echo "    -a ARCHIVO       Nombre del archivo descargado."
echo "    --archivo ARCHIVO"
echo ""
echo "    -a debugger_args     Arguments passed to [debugger]."
echo "    --debugger-args debugger_args"
echo ""
echo "  Examples:"
echo ""
echo "  Run the mozilla-bin binary"
echo ""
echo "    ${cmdname} mozilla-bin"
echo ""
echo "  Debug the mozilla-bin binary in gdb"
echo ""
echo "    ${cmdname} -g mozilla-bin -d gdb"
echo ""
echo "  Run mozilla-bin under valgrind with arguments"
echo ""
echo "    ${cmdname} -g -d valgrind -a '--tool=memcheck --leak-check=full' mozilla-bin"
echo ""
	return 0
}
##########################################################################
# moz_bail()
rm_msg()
{
	msg=$1
	echo
	echo "$rmApp: $msg"
	echo
	exit 1
}
##########################################################################
# moz_run_program()
rm_run_app()
{
	app=$MOZ_PROGRAM
	##
	## Verifica si el script es ejecutable.
	##
	if [ ! -x "$app" ]
	then
		rm_msg "NO se puede ejecutar $app."
	fi
	##
	## Ejecuto el script.
	##
	exec "$app" ${1+"$@"}
	exitcode=$?
}
##########################################################################
##
## Command line arg defaults
##
# moz_debug=0
# moz_debugger=""
# moz_debugger_args=""
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
        echo "-u La URL es requerida."
        exit 1
      fi
      ;;
    -a | --archivo)
      duy_arch=$2;
      if [ "${duy_arch}" != "" ]; then
	shift 2
      else
        echo "-a El ARCHIVO de salida es requerido."
        exit 1
      fi
      ;;
    -o | --output)
      moz_debug=1
      shift
      ;;
    -a | --debugger-args)
      moz_debugger_args=$2;
      if [ "${moz_debugger_args}" != "" ]; then
	shift 2
      else
        echo "-a requires an argument"
        exit 1
      fi
      ;;
    *)
      break;
      ;;
  esac
done
#
##
## Program name given in $1
##
if [ $# -gt 0 ]
then
	MOZ_PROGRAM=$1
	shift
fi
##
## Program not given, try to guess a default
##
if [ -z "$MOZ_PROGRAM" ]
then
	##
	## Try this script's name with '-bin' appended
	##
	if [ -x "$MOZ_DEFAULT_NAME" ]
	then
		MOZ_PROGRAM=$MOZ_DEFAULT_NAME
	##
	## Try mozilla-bin
	## 
	elif [ -x "$MOZ_APPRUNNER_NAME" ]
	then
		MOZ_PROGRAM=$MOZ_APPRUNNER_NAME
	fi
fi
#


cd /home/rmonla/rmFiles/rmDocs/DTIC/Scripts/rm_duytb
screen python rmDUYTube.py -u http://190.114.222.202/tcs/download/0D88714D-0490-4D75-BF4A-3126CD5E1A90 -o TSAyGIES_Gestión_C10_24Abr18
screen python rmDUYTube.py -u http://190.114.222.202/tcs/download/034027E7-224E-49CE-8597-8AEDF519AF46 -o TSAyGIES_Gestión_C11_26Abr18
