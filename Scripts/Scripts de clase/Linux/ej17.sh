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
euros=$1
interes=$2
anyo=$3

if [[ $# -ne 3 ]]
then
    echo "Error: Debes indicar 3 valores. Ejemplo de uso: $0 euros interes anyos"
    exit 100
fi

for i in `seq 1 $anyo`
do
    ganado=$euros
    euros=$(echo "scale=2; $euros * ( 1 + $interes / 100 )"|bc)
    ganado=$(echo "scale=2; $euros - $ganado"|bc)
    echo "$euros euros (en total has ganado $ganado euros)"
done