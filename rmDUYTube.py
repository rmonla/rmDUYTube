#!/usr/bin/env python
# -*- coding: utf-8 -*-

__proy__ = "rmDUYTube.py"
__ver__  = "1.0.3"
"""
#*<®> DescargaYSubeAYouTube. <®>*
# 
# Proyecto que descarga un video desde una url 
# y lugo lo sube al canal de YouTube de DTIC UTN La Rioja.
#
# Requerimientos:
# Este proyecto esta desarrollado para linux y nesecita para funcionar
# tener instalado los siguientes módulos de python:
#    pip para instalar paquetes python.
#       --> sudo apt-get install python-pip
#    google apis para la subida a youtube.
#       --> sudo pip install --upgrade google-api-python-client
#    wget para la descarga.
#       --> sudo pip install wget
# además el script de ejemplo descargado desde las google apis para youtube
#
# Copyright (c) 2016 Ricardo MONLA (rmonla@gmail.com)
#
"""


como_se_usa = """\

uso: python """ + __proy__ + """ [opciones] -u [URL]


requerido:
  -u --url    Url del archivo de video a descargar.

opciones:
  -o --output FILE|DIR   Nombre o Directorio del archivo descargado.
  -h --help              Muestra ésta descripción.
  --version              Muestra versión del proyecto.

ejemplo:
  python """ + __proy__ + """ -o PruVideo -u http://190.114.222.202/tcs/download/063E3953-C40F-425E-9900-78E6AECAB0FD
"""

version = """\

""" + __proy__ + """ version --> """ + __ver__ + """

"""


#*<®> Desarrollo de Proyecto <®>*

import os

def descargar():
  import wget

  print("Descargando desde --> %s" % opts.url)
  print("")
  opts.fnom = wget.download(opts.url, opts.output)

  print("")
  print("Descargado y guardado --> %s" % opts.fnom)

def subir():
  import time
  import subprocess
  
  
  if not opts.ytb_tit:
    opts.ytb_tit = opts.fnom

  cmd = "python upload_video.py --file=" + opts.fnom + " --title=" + opts.ytb_tit
  time.sleep( 2 )
  
  print("Subiendo a YouTube --> %s" % opts.fnom)
  
  process = subprocess.Popen(cmd.split())

  output, error = process.communicate()

  print("")
  print('Terminados todos los procesos.')


#*<®> Análisis de parámatros <®>*

import sys

if __name__ == "__main__":
  if '-h' in sys.argv or '--help' in sys.argv:
      sys.exit(como_se_usa)
      
  if "--version" in sys.argv:
      sys.exit(version)
  
  from optparse import OptionParser
  parser = OptionParser()
  parser.add_option("-o", "--output", dest="output")
  parser.add_option("-u", "--url",    dest="url")
  parser.add_option("-t", "--ytb_tit", dest="ytb_tit")
  parser.add_option(      "--fnom",   dest="fnom") #Solo uso interno.
  (opts, args) = parser.parse_args()

  if not opts.url:
    print("")
    print('Debe especificar una direccion de descarga (URL).')
    sys.exit(como_se_usa)
  else:
    descargar()
    subir()
