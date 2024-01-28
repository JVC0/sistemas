#!/bin/bash
#####################################################
#
# Nombre: ej17.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo calcular el interes en x anyos
# Entrada: euro interes y anyos
# Salida: el total ganado 
#
# Historial:
#   2023-01-28: version 1
######################################################

num=$@
echo "Se han recibidos $# argumentos: $num"
for i in $num
do
if [[ "$i" -lt 0 ]]
then
    echo "Se ignora el valor $i por ser negativo"
elif [[ $(($i % 2))  -eq 0 ]]
    echo "$i se inserta por el principio porque es PAR"
else
    echo "$i se inseta por el final porque es IMPAR"