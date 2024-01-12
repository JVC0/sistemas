#!/bin/bash
#####################################################
#
# Nombre: ej6.sh.sh
 #Autor: Joseph Vanegas <josephvanegas48@Gmail.com>
#
# Objetivo dias horas minutos en segundos
# Entrada: Valores para cambiar
# Salida: valor cambiado
#
# Historial:
#   2024-01-11: version 1
######################################################
seg=$1
dias=$(($seg/86400))
horas=$(($seg%86400/3600))
minutos=$(($seg%86400%3600/60))
segundos=$(($seg%86400%3600%60))


echo $seg segundos son $dias días, $horas horas, $minutos minutos y $segundos segundos.
