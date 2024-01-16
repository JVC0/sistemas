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
read -p "Indique su peso en Kg: " peso
read -p "Indique su altura en Centimetros: " altura
IMC=$(echo "scale=2; 10000*$peso/($altura*$altura)" |bc)
if [ $IMC -lt 16 ] 
then 
    echo "Delgadez severa"
elif [ $(echo "scale=2; $IMC -gt 15.99"|bc) ] && [ $IMC -lt 17 ]
then
    echo "Delgadez moderada"
elif [ $(echo "scale=2; $IMC -gt 16.99"|bc) ] && [ $(echo "scale=2; $IMC -lt 18.5"|bc) ]
then
    echo "Delgadez leve"
elif [ $(echo "scale=2;$IMC -gt 18.49"|bc) ] && [ $IMC -lt 25 ]
then
    echo "Normal"
elif [ $(echo "scale=2;$IMC -gt 24.99"|bc) ] && [ $IMC -lt 30 ]
then
    echo "Preobesidad"
elif [ $(echo "scale=2;$IMC -gt 29.99"|bc) ] && [ $IMC -lt 35 ]
then
    echo "Obesidad leve"   
elif [ $(echo "scale=2;$IMC -gt 1.99"|bc) ] && [ $IMC -lt 40 ]
then
    echo "Obesidad media"
elif [ $(echo "scale=2;$IMC -gt 39.99"|bc) ]
then
    echo "Obesidad morbida"
fi

