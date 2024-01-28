#!/bin/bash
#####################################################
#
# Nombre: ej16.sh
# Autor: Joseph Vanegas <josephvanegas48@Gmail.com
#
# Objetivo Poner contrasena 
# Entrada: contrasena y verficacion
# Salida: si la senguna contrasena esta correcta
#
# Historial:
#   2023-01-28: version 1
######################################################
echo "Introduzca su contrasena"
read -s contrasena
echo "Vuelva a introduzir su contrasena"
read -s contrasena2
while true 
do
    if [[ $contrasena = $contrasena2 ]]
    then
        echo "Contrasena acertada"
    break
    else
        echo "La contrasena escrita es incorrecta"
        echo "Vuelva a introduzir su contrasena"
        read -s contrasena2
    fi
done