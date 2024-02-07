#!/bin/bash
nombre_de_paquete=$1

if [[ -z $# ]]
then
    read -p "Introduzca nombre del paquete que desea instalar: " nombre_de_paquete
fi

echo$((sudo apt update))