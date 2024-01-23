#!/bin/bash

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