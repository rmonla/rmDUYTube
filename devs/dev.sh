#!/bin/sh
#

duyURL="http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F539"
# duyURL="http://190.114.222.202/tcs/download/7F6B1451-C3D6-42A8-956E-13D33A6F5395"
duyARCH="video1"
duyDIR="tmps"
duyLOG="logs"

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
	dlog="$duyLOG"
	
	dst="$dtmp/$file"
	log="$dlog/$file.log"

	echo
	echo "wget -O $dst $url"

	echo
	wget -O "$dst" "$url"
	# wget -o "$log" -O "$dst" "$url" >> "$log"
	# wget -v -o "$log" -O "$dst" "$url"

	# wget "-o $log -O $dst $url"
	
	return 0
	# exit 1

}

duy_down

exit 1
