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

numero=$1

case $numero in

    "") echo "ERROR.debes indicar un argumento" ;;
    *0|*2|*4|*6|*8) echo "$numero es un numero par";;
    *[13579]) echo "$numero es un numero impar";;
    e) echo "Has indicado un numero irracional" ;;
    *) echo "ERROR ,parce que "$numero" No es un numero";;
esac