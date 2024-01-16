#!/bin/bash
#####################################################
#
# Nombre: make_exe.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo cambiar de Farth a celsious
# Entrada: Valores para cambiar
# Salida: valor cambiado
#
# Historial:
#   2023-12-19: version 1
######################################################
a=$1
b=$2

if [ $# -ne 2 ]
then
    echo "ERROR, debe indicar DOS valores"
    echo "SINTASIS: $0 <valor1><valor2>"
    exit
fi

select opcion in "Sumar sumando" "Restar" "Multiplicar" "Dividir"
 
 do
    case $opcion in 
        "Sumar sumando")echo "El resultado de $a + $b =$(($a+$b))";;
        "Restar") echo "El resultado de $a - $b =$(($a-$b))";;
        "Multiplicar") echo "El resultado de $a x $b =$(($a*$b))";;
        "Dividir") echo "El resultado de $a / $b =$(($a/$b))";;
        "Salir") break;;
        *) echo "ERROR, "
    esac
done