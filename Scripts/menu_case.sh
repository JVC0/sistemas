#!/bin/bash
#####################################################
#
# Nombre: make_exe.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo cambiar de Farth a celsious
# Entrada: Valores para cambiar
# Salida: valor cambiado
#
# Historial:
#   2023-12-19: version 1
######################################################
      
echo       "***************"
echo       "***M E N U*****"
echo       "***************"
echo "a: Mostrar el contenido del directorio"
echo "b: Mostrar el espacio libre de disco"
echo "c: Mostrar los permisos del contenido del directorio"
echo "d: Mostrar memoria libre"
echo  ""
read -p "Introduzco su opcion: " opcion
do
    case "$opcion" in
    
        a|A|1) ls -lh
        ;;

        b|B|2) df -h
        ;;

        c|C|3) stat -c "%a %A %n" *
        ;;

        d|D|4) free
        ;;

        *) echo "ERROR: "$opcion" no es una opcion correcta"
        ;;
    esac
done