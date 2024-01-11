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
#   2023-12-19: version 1
######################################################

numero1=$1
numero2=$2
if [ "$numero1" -eq = "" ]
then
    read -p "Por favor, introduzca el primer valor:"$numero1
fi
if [ "$numero2" -eq = "" ]
then
    read -p "Por favor, introduzca el primer valor:"$numero2
fi
if [ "$numero1" -eq "$numero2" ]
then
    echo "$numero1 es igual a $numero2"
elif [ "$numero1" -gt "$numero2" ]
then
    echo "$numero1 es major que $numero2"
else
    echo "$numero2 es major que $numero1"

fi