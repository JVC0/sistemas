#!/bin/bash
#####################################################
#
# Nombre: ej14.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo Calcular el numero al quadrado
# Entrada: Dos numeros
# Salida: EL cuadrado del el numero
#
# Historial:
#   2023-01-22: version 1
######################################################
numero1=$1
numero2=$2
  
if [[ $# -lt 1 ]]
then
    read -p "Introduzca su primer numero: " numero1
    read -p "Introduzca su segundo numero: " numero2
fi

((numero1+=1))
numero2=$(($numero2 - 1 ))
for i in `seq $numero1 $numero2`
do
    cuadrado=$(($i*$i))
    echo "El cuadrado del número par $i es $cuadrado"
done