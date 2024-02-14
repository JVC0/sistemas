#!/bin/bash
#####################################################
#
# Nombre: ej12.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo Revisar si un valor es un mutiplo
# Entrada: Numer
# Salida: si el numero es un mutiplo de 40  12  53  543636
#
# Historial:
#   2023-01-22: version 1
######################################################
read -p "Introduzca un valor: " numero
for i in 40  12  53  543636
do
resultado=$(($i % $numero))
if [ $resultado -eq 0 ]
then
    echo "El número $i SI es múltiplo de $numero"
else

    echo "El número $i NO es múltiplo de $numero"
fi
done