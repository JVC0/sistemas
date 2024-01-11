#!/bin/bash
#####################################################
#
# Nombre: Sripts.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo cambiar de Farth a celsious
# Entrada: Valores para cambiar
# Salida: valor cambiado
#
# Historial:
#   2024-01-11: version 1
######################################################
dias=$1
horas=$2
minutos=$3
segundos=$4
resultado=$(echo "scale=3; ($dias*86400)+($horas*3600)+($minutos*60)+$segundos"| bc)
echo "$dias días, $horas horas, $minutos minutos y $segundos segundos son $resultado segundos"
