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
#   2024-12-09: version 1
######################################################
dia=$1
mes=$2 
anyo=$3


dia_sem=`date -d $anyo-$mes-$dia +"%A"`
echo "El dia $dia/$mes/$anyo es $dia_sem"