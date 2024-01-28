#!/bin/bash
#####################################################
#
# Nombre: ej15.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo Generar un triangulo
# Entrada: Dos numeros
# Salida: Rectangulo
#
# Historial:
#   2023-01-28: version 1
######################################################
base=$1
altura=$2

if [[ $# -lt 1 ]]
then
read -p "Introduzca la base: " base
read -p "Introduzca la altura: " altura
fi

if [[ -z $base && -z $altura ]]
then
    altura=4
    base=7
fi

if [[ $# -eq 1 ]]
then
    altura=4
fi
for i in `seq 1 $base`
do
    resultado+=" #"
done
for i in `seq 1 $altura`
do
    echo $resultado
done