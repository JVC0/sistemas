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

if [ -z $elem ]
then 
    echo "ERROR Debe indicar un elemento"
    read -p "Indique el elemento:" elem

if [ -f "$elem" ] && [ ! -x "$elem" ]
then
    #Le asigno permiso de ejcucion
    chmod u+x $elem
fi


