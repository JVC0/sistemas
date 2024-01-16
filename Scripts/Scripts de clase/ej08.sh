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
IMC=$(echo "scale=2; 10000*$peso/$altura" |bc)
if [ $IMC -lt 16 ] 
then 
    echo "Delgadez severa"
elif [ $IMC -gt 15.99 ] && [ $IMC -lt 17 ]
    echo "Delgadez moderada"
elif [ $IMC -gt 16.99 ] && [ $IMC -lt 18.5 ]
    echo "Delgadez leve"
elif [ $IMC -gt 18.49 ] && [ $IMC -lt 25 ]
    echo "Normal"
elif [ $IMC -gt 24.99 ] && [ $IMC -lt 30 ]
    echo "Preobesidad"
elif [ $IMC -gt 29.99 ] && [ $IMC -lt 35 ]
    echo "Obesidad leve"   
elif [ $IMC -gt 1.99 ] && [ $IMC -lt 40 ]
    echo "Obesidad media"
elif [ $IMC -gt 39.99 ]
    echo "Obesidad morbida"
fi

