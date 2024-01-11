#!/bin/bash
#####################################################
#
# Nombre: ej03.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo cambiar de Farth a celsious
# Entrada: Valores para cambiar
# Salida: valor cambiado
#
# Historial:
#   2024-01-08: version 1
#   2024-12-09: version 2
######################################################
gradosC=$1
indec=$2
echo "Has indicado $# argumentos" #numero de argumentos
echo "Los agumenmtos que has indicado son:$@" #texto
echo "Los agumenmtos que has indicado son:$*" #array
echo "estoy en la linea $LINENO,llevo ejecuntado $SECONDS y fui ejecutado por el usuario $USER"

if [ $# -eq 0 ] # -eq =equals
                #-gt = greater then
                #-lt =less than
then
    echo "ERROR: No has indicado argumentos.Debes indica 2 argumentos"
    echo "SINTAXI:$0 <grados celcious > <nume decimales>"
    exit
elif [ $# -eq 1 ]
then
    resultado=$(echo "scale=2; ($gradosC-32)* 5 / 9"| bc)
    echo "($1 - 32) x 5 / 9 = $resultado" 
elif [ $# -eq 2 ]
then
    resultado=$(echo "scale=$indec; ($gradosC-32)* 5 / 9"| bc)
    echo "($1 - 32) x 5 / 9 = $resultado" 
    
elif [ $# -gt 2 ]
then
    echo "Warning as indicado mas de 2 numeros solo se usaran los dos primeros argumentos"
    resultado=$(echo "scale=$indec; ($gradosC-32)* 5 / 9"| bc)
    echo "($1 - 32) x 5 / 9 = $resultado" 
fi


#read-p