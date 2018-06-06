#!/bin/sh
#

duyURL="http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F539"
# duyURL="http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F5395"
duyARCH="video1"
duyDIR="tmps"

duyTIT=""

##########################################################################
#
##
### <®> Descarga el archivo desde la url
##
duy_down(){
	url="$duyURL"
	file="$duyARCH"
	dtmp="$duyDIR"
	
	dst="$dtmp/$file"

	# echo
	# echo "wget -O $dst $url"
	echo
	wget -O "$dst" "$url"
	
	return 0
	# exit 1
}

duy_down

exit 1
