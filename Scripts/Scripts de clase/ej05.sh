#!/bin/bash
#####################################################
#
# Nombre: ej05.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo dias horas minutos en segundos
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
    resultado=$("($dias*86400)+($horas*3600)+($minutos*60)+$segundos") 
    echo "$dias días, $horas horas, $minutos minutos y $segundos segundos son $resultado segundos"
