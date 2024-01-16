#!/bin/bash
#####################################################
#
# Nombre: ej08.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo: Calcular el IMC
# Entrada: KG y altura en centimetro
# Salida: Si estas ob
#
# Historial:
#   2023-01-16: version 1
######################################################
read -p "Indique su peso en Kg: " peso
read -p "Indique su altura en Centimetros: " altura
IMC=$(echo "scale=2; 10000*$peso/($altura*$altura)" |bc)
if (( $(echo "$IMC < 16" | bc) )); then
    echo "Delgadez severa"
elif (( $(echo "$IMC > 15.99" | bc) )) && (( $(echo "$IMC < 17" | bc) )); then
    echo "Delgadez moderada"
elif (( $(echo "$IMC > 16.99" | bc) )) && (( $(echo "$IMC < 18.5" | bc) )); then
    echo "Delgadez leve"
elif (( $(echo "$IMC > 18.49" | bc) )) && (( $(echo "$IMC < 25" | bc) )); then
    echo "Normal"
elif (( $(echo "$IMC > 24.99" | bc) )) && (( $(echo "$IMC < 30" | bc) )); then
    echo "Preobesidad"
elif (( $(echo "$IMC > 29.99" | bc) )) && (( $(echo "$IMC < 35" | bc) )); then
    echo "Obesidad leve"
elif (( $(echo "$IMC > 1.99" | bc) )) && (( $(echo "$IMC < 40" | bc) )); then
    echo "Obesidad media"
elif (( $(echo "$IMC > 39.99" | bc) )); then
    echo "Obesidad morbida"
fi

#la estructura (()) es mas abieta
#-gt esta echo para numeros enteros
