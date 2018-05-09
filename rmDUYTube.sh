#!/bin/sh
#
# Este script es para la ejecución del rmDUYTube.py desde linux.
# 
# <®> Copyright (c) 2018 Ricardo MONLA <®>

rmApp=`basename "$0"`
rmVer="1.0.1"
rmPth="/home/rmonla/rmFiles/rmDocs/DTIC/Scripts/rm_duytb"



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



cd /home/rmonla/rmFiles/rmDocs/DTIC/Scripts/rm_duytb
screen python rmDUYTube.py -u http://190.114.222.202/tcs/download/0D88714D-0490-4D75-BF4A-3126CD5E1A90 -o TSAyGIES_Gestión_C10_24Abr18
screen python rmDUYTube.py -u http://190.114.222.202/tcs/download/034027E7-224E-49CE-8597-8AEDF519AF46 -o TSAyGIES_Gestión_C11_26Abr18
