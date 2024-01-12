#!/bin/bash

elem=$1
#if [ "elem" = ""]
#if [ -z "$elem" ]
#if [ ! -n "$elem" ]
then
        echo "ERROR: Debe indicar un elemento"
        read -p "Indique el elemento: " elem

if [ -e "$elem" ]
then
        echo "'$elem' EXISTE"
else
        echo "Lo siento, '$elem' NO existe"
fi

if [ -f "$elem" ]
then
        echo "'$elem' es un FICHERO"
elif [ -d "elem" ]
then    
        echo "'$elem es un DIRECTORIO"
elif [ -h "$elem" ]
then    
        echo "'$elem' es un ENLACE"
else    
        echo "'$elem' es OTRO ELEMENTO"

#Compruebo si esta vacía o no
if[ -s "$elem" ]
then
        echo "'$elem' NO es VACÍO"
else    
        echo "'$elem' es VACÍO"

#COMPROBAR PERMISOS

if [ -r "$elem"]
then
        echo "'$elem' tiene permisos de LECTURA"
else
        echo "'$elem' no tiene permisos de LECTURA"
fi
if [ -w "elem" ] ; then

fi


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